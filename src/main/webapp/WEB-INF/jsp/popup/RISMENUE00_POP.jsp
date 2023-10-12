<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <main class="main__container">
        <!-- 검색 -->
      	<section class="search__container">
	        <p class="filter__keyword">검색어 :</p>
	        <input type="text" class="filter__options" id="search" placeholder="Enter text to search..."></input>
	        <button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
      	</section>

        <!-- 그리드 -->
        <div class="popup-grid__container">
            <section class="grid__box">
                <!-- 그리드 -->
                <table id="list1" class="grid1"></table>
            </section>
        </div>

        <div class="popup-btn__container">
            <button onclick="selvalue()" class="all__btn fontawesome__btn text__btn">선택</button>
            <button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
        </div>
    </main>

    <script>
        $(document).ready(function () {
        	var hsptId = "${hspt_id}";
            $("#list1").jqGrid("GridUnload");
            $("#list1").jqGrid({
                datatype: "/RISMENUE00_POP.do",
                reordercolNames: true,
                postData: { hsptId: hsptId }, // 보낼 파라미터
                mtype: 'POST',   // 전송 타입
                datatype: "json",
                colNames: ["hsptId", "프로그램ID", "프로그램명"],
                colModel: [
                	{ name: "hsptId", index: "hsptId", hidden: true},
                    { name: "pgrmId", index: "pgrmId", width: 60, align: "center" },
                    { name: "pgrmName", index: "pgrmName", width: 100, align: "center"}
                ],
                jsonReader: 
			  	{
				  	repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
				  	root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
				  	records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
			  	},
                guiStyle: "bootstrap",
                autowidth: true,
                height: "89%",
                rownumbers: true,
                gridview: true, // 선표시 true/false
                loadComplete: function (data) {
                    console.log(data);
                }, // loadComplete END
                onSelectRow: function (rowid) {
                    console.log(rowid);
                },
            });
        });
        
     	// 검색 기능
    	const searchGrid = function(value, grid) {
    		// searchGrid 함수는 검색어(value)와 데이터 그리드(grid)의 ID를 인수로 받고,
    		// 데이터 그리드를 검색어로 필터링하고 새로 고침하는 역할을 한다.			
    		$("#" + grid).jqGrid("setGridParam", {
    			datatype: "json", 
    			page: 1
    		}).trigger("reloadGrid");
    		// 파라미터를 설정하고, 새로고침하여 페이지를 1로 설정하고, 데이터 타입을 JSON으로 변경한다.
    		
    		$("#" + grid).jqGrid("setGridParam", {
    			// beforeProcessing 은 데이터를 처리하기 전에 호출되며, 데이터 그리드를 필터링한다.
    			beforeProcessing: function(data) {
    				if (value === "") {
    					return;
    				}
    				var filteredData = [];
    				for (var i = 0; i < data.rows.length; i++) {
    					var rowData = data.rows[i];
    					var matched = false;
    					for (var key in rowData) {
    						var cellValue = rowData[key];
    						if (cellValue && cellValue.toString().replace(/\s+/g, "").toLowerCase().includes(value)) {
    							matched = true;
    							break;
    						}
    					}
    					if (matched) {
    						filteredData.push(rowData);
    					}
    				}
    				data.rows = filteredData;
    			}
    		});	
    	};
    	// list1 검색
    	$("#search").on("input", function() {
    		var inputValue = $(this).val().replace(/\s+/g, "").toLowerCase();
    		
    		searchGrid(inputValue, "list1");
    	});
        
      	// 선택한 정보를 리턴(메인화면으로)
        function selvalue() {
        	// 현재 선택된 행의 ID를 가져옵니다.
            var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
            
            // 선택된 행의 데이터를 가져옵니다.
            var rowData = $("#list1").jqGrid('getRowData', selectedRowId);
            
            // 선택한 데이터를 부모 창의 함수로 전달합니다.
            // 수정된 부분: opener.parent.ReturnMenuValue 대신 opener.ReturnMenuValue를 사용합니다.
    		opener.ReturnSelValue(rowData.pgrmId, rowData.pgrmName);
            window.close();
        }
	
      	// 닫기
        function closePopup() {
            // 현재 창을 닫습니다.
            window.close();
        }
    </script>
</body>

</html>