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
        <button class="all__btn text__btn">비밀번호 초기화</button>
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
                	name: "userGrade", 
                	index: "userGrade", 
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
                	edittype: 'text', // 편집 모드에서 텍스트 필드로
                	formatter: "date", // 날짜 형식으로 변환,
                	formatoptions: { srcformat: "Y-m-d", newformat: "Y/m/d" }, // 날짜 형식 지정
                	editoptions: {
                        dataInit: function (elem) {
                            $(elem).datepicker({
                                dateFormat: 'yy/mm/dd', // 달력의 날짜 형식 지정
                                showOn: 'button',
                                buttonImage: 'https://jqueryui.com/resources/demos/datepicker/images/calendar.gif', // 달력 아이콘 이미지
                                buttonImageOnly: true
                            });
                        }
                    }
                },
                { 
                	name: "endDate", 
                	index: "endDate",
                	width: 120,
                	align: "center",
                	editable: true,
                	edittype: 'text', // 편집 모드에서 텍스트 필드로
                	formatter: "date", // 날짜 형식으로 변환,
                	formatoptions: { srcformat: "Y-m-d", newformat: "Y/m/d" }, // 날짜 형식 지정
                	editoptions: {
                        dataInit: function (elem) {
                            $(elem).datepicker({
                                dateFormat: 'yy/mm/dd', // 달력의 날짜 형식 지정
                                showOn: 'button',
                                buttonImage: 'https://jqueryui.com/resources/demos/datepicker/images/calendar.gif', // 달력 아이콘 이미지
                                buttonImageOnly: true
                            });
                        }
                    }
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
                $("#list1").jqGrid('editRow', selectedRowId, true);
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
    
    

    
    
    
    </script>
</body>
</html>