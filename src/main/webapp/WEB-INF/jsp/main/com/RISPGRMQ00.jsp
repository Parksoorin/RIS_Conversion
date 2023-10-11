<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 등록 현황</title>
<link rel="stylesheet" type="text/css" href="/css/com/com.css" />
</head>
<body>
<main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 입력 :</p>
        <input type="text" class="filter__options" id="search" placeholder="Enter text to search..."></input>
        <button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
      </section>

      <!-- 그리드 타이틀 -->
      <div class="grid__title">
        <p>프로그램 등록 현황</p>

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
    	var hsptId = "${hspt_id}";
        $("#list1").jqGrid({
        	url: "/RISPGRMQ00.do",   // 서버주소 
        	reordercolNames:true,
            postData : { hsptId: hsptId }, // 보낼 파라미터
            mtype:'POST',   // 전송 타입
            datatype: "json",
       		colNames: ["flag", "hsptId", "시스템ID", "프로그램ID", "프로그램명", "프로그램 URL", "화면유형", "호출방식", "사용", "완료"],
       		colModel: [
       			{ name: 'flag', index: 'flag', hidden: true },
       			{ name: 'hsptId', index: 'hsptId', hidden: true },
	          	{ 
	          		name: "systemName",
	          		index: "systemName", 
	          		width: 100, 
	          		align: "center", 
	          		editable: true,
                	edittype: 'select',
                	editoptions: { value: "선택:선택;진단검사:진단검사;영상의학:영상의학" }
	          	},
	            { name: "pgrmId", index: "pgrmId", width: 100, align: "center", editable: true },
	            { name: "pgrmName", index: "pgrmName", width: 150, align: "center", editable: true },
	            { name: "pgrmUrl", index: "pgrmUrl", width: 200, align: "center", editable: true },
	            { 
	            	name: "pgrmType", 
	            	index: "pgrmType", 
	            	width: 80, 
	            	align: "center",
	            	editable: true,
                	edittype: 'select',
                	editoptions: { value: "M:메뉴; W:등록; Q:조회" }
	            },
	            { 
	            	name: "pgrmInfo",
	            	index: "pgrmInfo", 
	            	width: 80, 
	            	align: "center", 
	            	editable: true,
                	edittype: 'select',
                	editoptions: { value: "M:메인화면; P:팝업화면; Z:메뉴헤더" }
	            },
	            { 
	                name: "useYn", 
	                index: "useYn", 
	                width: 50, 
	                align: "center",
	                editable: true,
	                edittype: 'checkbox', // 체크박스로 설정
	                editoptions: { value: 'Y:N' } // 체크 시 'Y', 언체크 시 'N' 값으로 저장
	            },
	            { 
	            	name: "endYn",
	            	index: "endYn", 
	            	width: 50, 
	            	align: "center",
	                editable: true,
	                edittype: 'checkbox', // 체크박스로 설정
	                editoptions: { value: 'Y:N' } // 체크 시 'Y', 언체크 시 'N' 값으로 저장
	            }
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
          	rowNum: 999, // 페이징 해제
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
    });
    
    
 	// 그리드1 행 수정
    $("#update-row__btn").on("click", function () {
	    var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");
	    if (selectedRowId) {
	        // 선택한 행이 있는 경우 편집 모드로 진입
	        var grid = $("#list1");
	        var rowData = grid.jqGrid('getRowData', selectedRowId);
		    rowData.flag = 'U';
		    grid.jqGrid('setRowData', selectedRowId, rowData);
		    console.log("list1 데이터 : ", rowData);
	        // 모든 컬럼을 가져옵니다.
	        var allColumns = grid.jqGrid('getGridParam', 'colModel');
	        
	     	// 모든 컬럼을 편집 모드에서 제외
	        allColumns.forEach(function (column) {
	            grid.jqGrid('setColProp', column.name, { editable: false });
	        });
	        
	        // systemId와 pgrmId 컬럼을 제외하고 모든 컬럼을 편집 가능하게 설정합니다.
	        allColumns.forEach(function (column) {
	            var columnName = column.name;
	            if (columnName !== 'systemId' && columnName !== 'pgrmId') {
	                grid.jqGrid('setColProp', columnName, { editable: true });
	            }
	        });
	        
	        // 선택한 행을 편집 모드로 진입합니다.
	        grid.jqGrid('editRow', selectedRowId, {
	            keys: true, // 엔터 키를 누를 때 저장되도록 설정
	            focusField: 1 // 수정을 시작할 필드의 인덱스를 설정
	        });
	    } else {
	        alert("편집할 행을 먼저 선택하세요.");
	    }
	});

    
 	// 그리드1 입력
    $("#add-row__btn").on("click", function () {
    	var hsptId = "${hspt_id}";
    	var newRowData = {};
    	var grid = $("#list1");
	    var newRowId = grid.jqGrid("getGridParam", "reccount") + 1;
	    newRowData.flag = 'I';
	    newRowData.hsptId = hsptId;
	    grid.jqGrid("addRowData", newRowId, newRowData, "first");
	   
	    
	    
	    // 모든 열을 편집 가능하게 설정합니다.
	    var allColumns = grid.jqGrid('getGridParam', 'colModel');
	    for (var i = 0; i < allColumns.length; i++) {
	        grid.jqGrid('setColProp', allColumns[i].name, { editable: true });
	    }

	    // 선택한 행을 편집 모드로 진입합니다.
	    grid.jqGrid("editRow", newRowId, {
	        keys: true,  // 엔터 키를 누를 때 저장되도록 설정합니다.
	        focusField: 1  // 수정을 시작할 필드의 인덱스를 설정합니다.
	    });
    });  
 	
 	// 그리드1 삭제
    $("#delete-row__btn").click(function(){
    	var rowid  = $("#list1").jqGrid('getGridParam', 'selrow' );  // 선택한 열의 아이디값
    	if(confirm("삭제시 메뉴도 같이 삭제됩니다. 해당 프로그램 정보를 삭제하시겠습니까?") == true){
    		$("#list1").jqGrid('delRowData', rowid);
            alert("삭제되었습니다");
        }
        else{
            return ;
        }
    	/* var grid = $('#list1');
	    var selectedRowId = grid.jqGrid('getGridParam', 'selrow');
	    var rowData = grid.jqGrid('getRowData', selectedRowId);
		grid.jqGrid('setRowData', selectedRowId, rowData); */
	});
 	
 	// 저장
	$("#save__btn").click(function (){
		var totalRows = $("#list1").jqGrid('getGridParam', 'records');
	    for (var i = 1; i <= totalRows; i++) {
	    	// 나머지 코드는 그대로 두고 loginPwd 값을 설정한 후 saveRow 호출
	        $("#list1").jqGrid('saveRow', i, false, 'clientArray');
	        let data = $("#list1").jqGrid("getRowData", i);

	        /* if (data.flag === 'U' || data.flag === 'I') {
	            if (data.loginId === '' || data.loginNm === '' || data.loginPwd === ''
	                || data.userGrade === '' || data.appnImpsText === ''
	                || data.startDate === '' || data.endDate === '') {
	                alert('미입력 사항이 있습니다.');
	                return;
	            }
	        } */
	    }
		var list1Data = $("#list1").getRowData();
	    console.log(list1Data);
	    $.ajax({
	        type: 'post',
	        url: '/rispgrmSavaData.do',
	        contentType: 'application/json',
	        dataType: 'json',
	        data: JSON.stringify(list1Data),
	        success: function (result) {
	            console.log(result);
	            reloadGrid();
	        },
	        error: function (error) {
	            console.log(error)
	        }
	    });
	})
 	
 	
    
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