<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 초기화</title>
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
        <p>사용자 현황</p>

        <!-- 버튼 컨테이너 -->
        <div class="btn__container">
        <button onclick="openPopup()" class="all__btn text__btn">비밀번호 초기화</button>
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
        	url: "/RISUSERQ00.do",   // 서버주소 
            reordercolNames:true,
            postData : { type: 'A' }, // 보낼 파라미터
            mtype:'POST',   // 전송 타입
            datatype: "json",
            colNames: ["flag", "사용자ID", "사용자명", "비밀번호", "권한", "시작일", "종료일", "오류횟수"],
            colModel: [
            	{ name: 'flag', index: 'flag', hidden: true },
                { name: "loginId", index: "loginId", width: 120, align: "center" },
                { name: "loginNm", index: "loginNm", width: 120, align: "center" },
                { 
                	name: "loginPwd",
                	index: "loginPwd", 
                	width: 150, 
                	align: "center", 
                	formatter: function (cellValue, options, rowObject) {
                        // cellValue(셀 값)를 숨기고 별표로 표시
                        return "********";
                    },
                    // 편집 가능한 필드로 설정하지 않음
                    editable: false
                },
                { 
                	name: "mddlKrNm", 
                	index: "mddlKrNm", 
                	width: 100, 
                	align: "center", 
                	editable: true,
                	edittype: 'select',
                	editoptions: { value: "Option1:의사; Option2: 방사선사; Option3:슈퍼관리자; Option4:관리자" }
                },
                { 
                	name: "startDate",
                	index: "startDate", 
                	width: 120, 
                	align: "center", 
                	editable: true,
                	editoptions: {type: "date"}
                },
                { 
                	name: "endDate", 
                	index: "endDate",
                	width: 120,
                	align: "center",
                	editable: true,
                	editoptions: {type: "date"}
                },
                { name: "errorCnt", index: "errorCnt", width: 50, align: "center" }
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
	        rownumbers: true,
	        sortname: "id",
	        sortorder: "asc",
	        rownumbers: true,
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
        
        
     	// 그리드1 입력, 삭제
        $("#add-row__btn").on("click", function () {
		    var newRowData = {};
		    var grid = $("#list1");
		    var newRowId = grid.jqGrid("getGridParam", "reccount") + 1;
		    grid.jqGrid("addRowData", newRowId, newRowData, "first");
		    newRowData.flag = 'I';
		    console.log("list1 데이터 : ", newRowData);
		    // 모든 컬럼을 가져옵니다.
		    var allColumns = grid.jqGrid('getGridParam', 'colModel');
		    
		    // errorCnt 컬럼을 제외하고 모든 컬럼을 편집 가능하게 설정합니다.
		    allColumns.forEach(function (column) {
		        if (column.name !== 'errorCnt') {
		            grid.jqGrid('setColProp', column.name, { editable: true });
		        }
		    });
		
		    // 선택한 행을 편집 모드로 진입합니다.
		    grid.jqGrid("editRow", newRowId, {
		        keys: true,  // 엔터 키를 누를 때 저장되도록 설정합니다.
		        focusField: 1  // 수정을 시작할 필드의 인덱스를 설정합니다.
		    });
		});

        $("#delete-row__btn").on("click", function () {
        	var grid = $("#list1");
    	    var selectedRowId = grid.jqGrid('getGridParam', 'selrow');
    	    if (selectedRowId) { 
    	    	grid.jqGrid('delRowData', selectedRowId);
    	    } else { 
    	    	alert('Please select a row to delete.'); 
    	    }
        });
        
        
        // 그리드1 행 수정
        $("#update-row__btn").on("click", function(){
    	var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");
        if (selectedRowId) {    	  	  	
        	// 선택한 행이 있는 경우 편집 모드로 진입
            var grid = $("#list1");
            var rowData = grid.jqGrid('getRowData', selectedRowId);
		    rowData.flag = 'U';
		    console.log("list1 데이터 : ", rowData);
            // 모든 컬럼을 가져옵니다.
            var allColumns = grid.jqGrid('getGridParam', 'colModel');
            
            // 모든 컬럼을 편집 모드에서 제외
            allColumns.forEach(function (column) {
                grid.jqGrid('setColProp', column.name, { editable: false });
            });
            
            // 선택한 컬럼만 편집 모드로 진입
            var selectedColumns = ['mddlKrNm', 'startDate', 'endDate']; // 편집 가능한 컬럼 이름들로 대체
            selectedColumns.forEach(function (columnName) {
                grid.jqGrid('setColProp', columnName, { editable: true });
            });
            
            // 선택한 행을 편집 모드로 진입
            grid.jqGrid('editRow', selectedRowId, {
                keys: true, // 엔터 키를 누를 때 저장되도록 설정
                focusField: 1 // 수정을 시작할 필드의 인덱스를 설정
            });
        } else {
            alert("편집할 행을 먼저 선택하세요.");
        }
    })
        
        /* 
        $("#save-row__btn").click(function () {
		    var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");
		    if (selectedRowId) {
		        // 선택한 행이 있는 경우 편집 모드 종료
		        $("#list1").jqGrid('saveRow', selectedRowId, {
		            url: "/서버에저장할URL",
		            mtype: 'POST', // 전송 타입
		            successfunc: function (response) {
		                // 수정이 성공한 경우
		                alert("수정이 성공하였습니다.");
		                $("#list1").trigger("reloadGrid");
		            },
		            errorfunc: function (rowId, response) {
		                // 수정이 실패한 경우
		                alert("수정에 실패하였습니다.");
		            }
		        });
		    } else {
		        alert("저장할 행을 먼저 선택하세요.");
		    }
		});
        */
        
        
        
	});
    
 	// 팝업 열기
    function openPopup() {
        // 팝업 창에 표시할 URL
        var url = "/pwPopup.do";

        // 팝업 창의 크기와 위치 설정
        var width = 600;
        var height = 300;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;

        // 팝업 창을 열기
        var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

        // 팝업 창이 차단되었을 때 처리
        if (!popup || popup.closed || typeof popup.closed == 'undefined') {
            alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
        }
    }

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
    
    
    </script>
</body>
</html>