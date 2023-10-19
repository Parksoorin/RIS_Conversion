<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 기능 권한 관리</title>
<link rel="stylesheet" type="text/css" href="/css/com/com.css" />
</head>
<body>
<main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">사용자 명 :</p>
        <input type="text" class="filter__options" id="search" placeholder="Enter text to search..."></input>
        <button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
      </section>

      <!-- 그리드 타이틀 -->
      <div class="grid__title">
        <p>프로그램 기능 권한 관리</p>

        <!-- 버튼 컨테이너 -->
        <div class="btn__container">
        	<button class="all__btn img__btn fontawesome__btn update__icon" id="update-row__btn">수정</button>
        	<button class="all__btn img__btn fontawesome__btn insert__icon" id="add-row__btn">입력</button>
		    <button class="all__btn img__btn fontawesome__btn delete__icon" id="delete-row__btn">삭제</button>
    		<button class="all__btn img__btn fontawesome__btn save__icon" id="save__btn">저장</button>
        </div>
      </div>
      <!-- 그리드 -->
      <div class="grid__container">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
    </main>

    <script>
      $(document).ready(function () {
        $("#list1").jqGrid({
        	url: "/RISBTNE00.do",   // 서버주소 
        	reordercolNames:true,
            postData : { type: 'A' }, // 보낼 파라미터
            mtype:'POST',   // 전송 타입
            datatype: "json",
          colNames: ["구분", "사용자명", "프로그램명", "기능명", "사용"],
          colModel: [
            { name: "dataGubun", index: "dataGubun", width: 50, align: "center" },
            { name: "mddlKrNm", index: "mddlKrNm", width: 100, align: "center" },
            { name: "pgrmName", index: "pgrmName", width: 100, align: "center" },
            { name: "pgrmBtn", index: "pgrmBtn", width: 100, align: "center" },
            { 
                name: "useYn", 
                index: "useYn", 
                width: 50, 
                align: "center",
                editable: true,
                edittype: 'checkbox', // 체크박스로 설정
                editoptions: { value: 'Y:N' } // 체크 시 'Y', 언체크 시 'N' 값으로 저장
            },
          ],
          jsonReader: 
		  	{
			  	repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
			  	root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
			  	records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
		  	},
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          multiselect: true,
          sortname: "id",
          sortorder: "asc",
          rownumbers: true,
          rowNum: 999, // 페이징 해제
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadComplete: function (data) {
            console.log(data);
          }, // loadComplete END
          onSelectRow: function (rowid) {
            console.log(rowid);
          },
          onSortCol: function (index, idxcol, sortorder) {
            // 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
            // (화살표 css 변경하기 전 Frozen을 풀어주고)
            $("#list1").jqGrid("destroyFrozenColumns");
            var $icons = $(this.grid.headers[idxcol].el).find(
              ">div.ui-jqgrid-sortable>span.s-ico"
            );
            if (this.p.sortorder === "asc") {
              //$icons.find('>span.ui-icon-asc').show();
              $icons.find(">span.ui-icon-asc")[0].style.display = "";
              $icons.find(">span.ui-icon-asc")[0].style.marginTop = "1px";
              $icons.find(">span.ui-icon-desc").hide();
            } else {
              //$icons.find('>span.ui-icon-desc').show();
              $icons.find(">span.ui-icon-desc")[0].style.display = "";
              $icons.find(">span.ui-icon-asc").hide();
            }
            // (화살표 css 변경 후 Frozen을 다시 설정)
            $("#list1").jqGrid("setFrozenColumns");
            //alert(index+'/'+idxcol+'/'+sortorder);
          },
        });
    });
        
        
 	// 그리드1 입력, 삭제
    $("#add-row__btn").on("click", function () {
    	var newRowData = {};
    	var grid = $("#list1");
	    var newRowId = grid.jqGrid("getGridParam", "reccount") + 1;
	    grid.jqGrid("addRowData", newRowId, newRowData, "first");
	    newRowData.flag = 'I';
    });
    $("#delete-row__btn").on("click", function () {
    	var grid = $("#list1");
	    var selectedRowId = grid.jqGrid('getGridParam', 'selrow');
	    if (selectedRowId) { grid.jqGrid('delRowData', selectedRowId);
	    } else { alert('Please select a row to delete.'); }
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

 	// 그리드1 행 수정
    $("#update-row__btn").on("click", function(){
    	var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");
        if (selectedRowId) {    	  	  	
            // 선택한 행이 있는 경우 편집 모드로 진입
            $("#list1").jqGrid('editRow', selectedRowId, true);
        } else {
            alert("편집할 행을 먼저 선택하세요.");
        }
    })
    
  	// list1 검색
  	$("#search").on("input", function() {
  		var inputValue = $(this).val().replace(/\s+/g, "").toLowerCase();
  		
  		searchGrid(inputValue, "list1");
  	});  
    </script>
</body>
</html>