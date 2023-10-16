<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>영상 판독문구 관리</title>
    <link rel="stylesheet" href="/css/pandok/RIS0601E00.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <!-- 의사 리스트 -->
        <c:choose>
          <c:when test="${sessionScope.user_grade eq 'S' || sessionScope.user_grade eq 'A'}">
	      	<div class="search__box docId__search">
	          <p class="filter__keyword">의사 :</p>
	          <select id="selectDocId" class="filter__options">
	          	<option value="all">의사 ID를 선택해주세요.</option>
	            <c:forEach items="${risUserData}" var="data">
	           	  <option value="${data.loginId}">${data.loginNm}(${data.loginId})</option>
	           	</c:forEach>
	          </select>
	        </div>
          </c:when>
        </c:choose>
        
        <!-- 검색어 입력 -->
        <div class="search__box keyword__search">
          <p class="filter__keyword">검색어 입력 :</p>
          <input id="filterKeyword" class="filter__options" type="text" />
          <button id="searchBtn" class="all__btn img__btn fontawesome__btn search__icon">검색</button>
        </div>
        
        <!-- 촬영구분 -->
      	<div class="search__box docId__search">
          <p class="filter__keyword">촬영구분 :</p>
          <select id="selectImgnDvsn" class="filter__options">
            <c:forEach items="${ris0102Data}" var="data">
           	  <option value="${data.mddlCd}">${data.mddlKrNm}</option>
           	</c:forEach>
          </select>
        </div>
        
        <!-- 공용코드 -->
        <div class="search__box">
          <p class="filter__keyword">공용코드 : </p>
          <input id="commonCheck" type="checkbox" />
        </div>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 판독정형문 타이틀 -->
          <div class="grid__title">
            <p>판독정형문</p>
            <button id="refreshBtn" class="all__btn fontawesome__btn rotate__icon"></button>
          </div>
          
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 판독내용 타이틀 -->
          <div class="grid__title title__btn">
            <div class="btn__container">
        	  <button id="copyBtn" class="all__btn img__btn fontawesome__btn copy__icon">복사</button>
              <button id="pasteBtn" class="all__btn img__btn fontawesome__btn paste__icon">붙여넣기</button>
            </div>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
        	  <button id="insertBtn" class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
              <button id="updateBtn" class="all__btn img__btn fontawesome__btn update__icon">수정</button>
		      <button id="deleteBtn" class="all__btn img__btn fontawesome__btn delete__icon">삭제</button>
    		  <button id="saveBtn" class="all__btn img__btn fontawesome__btn save__icon">저장</button>
            </div>
          </div>
          
          <!-- 판독내용 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box textarea__box">
              <label for="viewText">판독 내용</label>
              <textarea id="viewText" disabled>판독정형문을 선택해주세요.</textarea>
            </section>
          </div>
        </div>
      </div>
    </main>

    <script>
      var hsptId = "${hspt_id}";
   	  var selectDocId = "${login_id}";
   	  var userGrade = "${user_grade}";
   	  // JSON 형식으로 받은 model 안의 변수를 parse
   	  var ris0102ListForJs = JSON.parse('${ris0102List}');
   	  // 촬영 구분 select 태그로 변환
   	  var selectOption = {};

   	  // jqGrid에서 사용할 ris0102List 생성
   	  for (data of ris0102ListForJs) {
   		  if (data.mddlCd != '%') {
    		  selectOption[data.mddlCd] = data.mddlKrNm;
   		  }
   	  }
   	  
      // 정형문 리스트 출력
      function setRis0601List() {
    	  var selectDocIdValue = $("#selectDocId").val();
    	  // 권한이 관리자일 경우 의사ID 동적 변경
    	  if (selectDocIdValue) {
	    	  selectDocId = selectDocIdValue;
    	  }
    	  
    	  // 공용코드 체크박스 선택 시
    	  if ($("#commonCheck").is(':checked')) {
    		  selectDocId = "COMMON";
    	  } else {
    		  if (selectDocIdValue) {
    	    	  selectDocId = selectDocIdValue;
        	  } else {
	    		  selectDocId = "${login_id}";
        	  }
    	  }
    	  
    	  console.log(selectDocId);
    	  
    	  // 촬영구분
    	  var selectImgnDvsn = $("#selectImgnDvsn").val();
    	  
    	  $("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
    	  $("#list1").jqGrid({
              url: "/pandok/getRis0601List.do",
              reordercolNames:true,
              postData: {
            	  common: 'false',
            	  hsptId: hsptId,
            	  docId: selectDocId,
            	  imgnDvsn: selectImgnDvsn 
              },
              mtype: 'POST',
              datatype: "json",
              colNames: ["구분", "의사ID", "정형문 코드", "촬영구분코드", "촬영구분", "판독약어명", "판독내용"],
              colModel: [
                { name: "flag",       index: "flag",       width: 30,    align: "center", sortable: false },
                { name: "docId",      index: "docId",      width: 60,    align: "left",   sortable: false, hidden: userGrade !== 'S' && userGrade !== 'A' },
                { name: "tmplCd",     index: "tmplCd",     width: 70,    align: "left",   sortable: false, editable: true },
                { name: "imgnDvsnCd", index: "imgnDvsnCd", hidden: true },
                { name: "mddlKrNm",   index: "mddlKrNm",   width: 100,   align: "left",   sortable: false, editable: true, edittype: 'select', editoptions: { value:selectOption } },
                { name: "viewAbbrNm", index: "viewAbbrNm", width: 100,   align: "left",   sortable: false, editable: true },
                { name: "viewText",   index: "viewText",   hidden: true },
              ],
              jsonReader: {
     		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
     		    root:'ris0601Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
     		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
     	      },
              autowidth: true,
              height: "93%",
              autoScroll: true,
              loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
      		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
      		  rowNum: 999999,
              rownumbers: true,
              // sortname: "docId",
              // sortorder: "asc",
              loadonce: true,
              // viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
              loadComplete: function (data) {
    	          console.log(data);
    	          var emptyRecord = '<div class="ui-state-default ui-state-active empty-state" id="load_list1">데이터가 존재하지 않습니다.</div>';
    	          if (data.ris0601Data.length === 0) {
    	          	console.log("empty");
    	          	$(".ui-jqgrid-bdiv").append(emptyRecord);
    	          }
    	      }, // loadComplete END
              onSelectRow: function (rowid) {
                var rowData = $("#list1").getRowData(rowid);
                console.log(rowData);
                
            	// 판독 내용 disabled
            	if (rowData.flag == '입력' || rowData.flag == '수정') {            		
	            	$("#viewText").attr("disabled", false);
            	} else {
            		$("#viewText").attr("disabled", true);
            	}
            	
            	// 판독 내용에 데이터 삽입
                $("#viewText").val(rowData.viewText);
              },
          });
      };
      

      //검색 함수
      function searchInGrid(value) {
      	$("#list1").jqGrid("setGridParam", {
      		datatype: "json", // 데이터 유형을 변경하여 새 데이터로 다시 로드
			page: 1 // 페이지를 처음부터 로드
        }).trigger("reloadGrid");
      	
      	$("#list1").jqGrid("setGridParam", {
      	    beforeProcessing: function(data) {
                // inputValue가 빈 값인 경우 모든 행 보존
      	        if (value === "") {
      	       		// '데이터가 존재하지 않습니다.' 태그 삭제
      	        	$(".empty-state").remove();
      	        	
      	            return;
      	        }
      	 	    
      	        var filteredData = []; // 필터된 데이터
      	        
      	        for (var i = 0; i < data.ris0601Data.length; i++) {
      	            var rowData = data.ris0601Data[i];
      	            var matched = false;
      	            
      	            // rowData의 모든 value 값과 inputValue 비교
      	            for (var key in rowData) {
      					var cellValue = rowData[key];
      					if (cellValue && cellValue.toString().replace(/\s+/g, "").toLowerCase().includes(value)) {
      					    matched = true;
      					    break; // 일치하는 컬럼이 하나라도 있으면 검색 중단
      					}
      	            }
      				
      	            // 일치하는게 있으면 필터된 데이터에 추가
      	            if (matched) {
      	                filteredData.push(rowData);
      	            }
      	        }
      	        
      	        // 필터된 데이터가 있을 경우
      	        if (filteredData) {
      	        	// '데이터가 존재하지 않습니다.' 태그 삭제
      	        	$(".empty-state").remove();
      	        }
      	        
      	        // 그리드의 데이터로 변경
      	        data.ris0601Data = filteredData;
      	    }
      	});
      };
      
      
      // 새로고침 함수
      function refreshPage() {
    	  // 판독 내용 disabled
    	  $("#viewText").attr("disabled", true);
    	  $("#viewText").val("판독정형문을 선택해주세요.");
    	  
    	  // 그리드 새로고침
    	  setRis0601List();
      }
    
      // 페이지 로드 시
      $(document).ready(function () {
    	  setRis0601List();
      });
      
      // 복사 버튼
      $("#copyBtn").click(function() {
		  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
    	  
    	  if (rowId) { // 선택된 행이 있는 경우에만 실행
	    	  var data = $("#viewText").val();
	    	  var t = document.createElement("textarea");
	    	  
	    	  document.body.appendChild(t);
	    	  t.value = data;
	    	  t.select();
	    	  document.execCommand("copy");
	    	  document.body.removeChild(t);
	    	  
	    	  alert("판독 내용이 복사되었습니다.");
    	  } else {
	    	  // 선택된 행이 없는 경우 처리할 내용을 추가할 수 있습니다.
	    	  alert("행을 먼저 선택하세요.");
	  	  }
      });
      
      
      // 붙여넣기 버튼
      $("#pasteBtn").click(function() {
    	  if ($("#viewText").attr("disabled")) {
    		  alert("수정 버튼을 먼저 눌러주세요.");
    	  } else {    		  
	    	  // 클립보드에서 텍스트 가져오기
	    	  navigator.clipboard.readText()
	    	  .then(function(clipboardData) {
	    	  	  // 가져온 데이터를 viewText에 설정
	    	      var selectedRowId = $("#list1").getGridParam("selrow");
	    	  	  
	    	      $("#viewText").val(clipboardData);
	        	  $("#list1").setCell(selectedRowId, "viewText", clipboardData);
	    	  })
	    	  .catch(function(err) {
	    	      alert('클립보드에서 텍스트를 읽어오지 못했습니다.');
	    	  });
    	  }
      });
      
      
      // 새로고침 버튼
      $("#refreshBtn").click(function() {
    	  $("#selectDocId").val("all");
    	  $("#selectImgnDvsn").val("%");
    	  $("#commonCheck").prop("checked", false);
    	  
    	  refreshPage();
      });
      
      
      // 입력 버튼
      $("#insertBtn").click(function() {
    	  // '데이터가 존재하지 않습니다.' 태그 삭제
    	  $(".empty-state").remove();
    	  
		  var grid = $("#list1");
		  var newDocId = "";
		  
		  // 공용 코드일 경우 & 의사 아이디가 선택된 경우(관리자 이상) & 관리자가 아닐 때 & 그 외
		  if ($("#commonCheck").is(":checked")) {
			  newDocId = "COMMON";
		  } else if ($("#selectDocId").val() && $("#selectDocId").val() !== "all") {
			  newDocId = $("#selectDocId").val();
		  } else if (userGrade !== "S" && userGrade !== "U") {
			  newDocId = selectDocId;
		  } else {
			  return alert("의사 ID를 먼저 선택해주세요.");
		  }
		  
		  var newRowId = (grid.jqGrid('getDataIDs').length + 1).toString(); // 현재 행 개수 + 1로 아이디 생성
		  var newRowData = { id: newRowId, flag: '입력', docId: newDocId, tmplCd: '', imgnDvsnCd: '', viewAbbrNm: '', viewText: '' }; // 빈 행 데이터 생성
		  
		  grid.jqGrid('addRowData', newRowId, newRowData, 'last'); // 행 추가
		  grid.jqGrid('setSelection', newRowId);
		  grid.jqGrid('setColProp', 'tmplCd', { editable: true }); // 정형문 코드 수정 가능하게
		  grid.jqGrid('editRow', newRowId, true); // 편집 모드로 변경
		  
		  // 그리드 스크롤을 맨 밑으로
		  var gridContainer = grid.closest(".ui-jqgrid-bdiv");
		  gridContainer.scrollTop(gridContainer[0].scrollHeight);
		  
		  
		  // 판독 내용 수정 설정
		  $("#viewText").attr("disabled", false);
		  $("#viewText").val("");
      });
      
      
      // 수정 버튼
      $("#updateBtn").click(function() {
    	  $("#list1").setColProp('tmplCd', { editable: false });
    	  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
    	  
    	  if (rowId) { // 선택된 행이 있는 경우에만 실행
    		  var rowData = $("#list1").jqGrid('getRowData', rowId);
    	  
	    	  // 판독 내용 수정 가능
	    	  $("#viewText").attr("disabled", false);
    	      
    	  	  if (rowData.flag != '입력') {    	  		  
	    	  	  rowData.flag = '수정';
    	  	  	  $("#list1").jqGrid('setRowData', rowId, rowData);
    	  	  }
    	  	  
    	      // 그리드에서 선택된 행 데이터 수정
    	      $("#list1").jqGrid('editRow', rowId, true);
          } else {
    	      // 선택된 행이 없는 경우 처리할 내용을 추가할 수 있습니다.
    	      alert("행을 먼저 선택하세요.");
    	  }
      });
      
      
      // 삭제 버튼
      $("#deleteBtn").click(function() {
    	  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
   		  var rowData = $("#list1").jqGrid('getRowData', rowId);
    	  var checkDelete = confirm("정말 삭제하시겠습니까?");
    	  
    	  if (checkDelete) {
    		  rowData.flag = '삭제';
	  	  	  $("#list1").jqGrid('setRowData', rowId, rowData);
    	  }
      });
      
      
      // 저장 버튼
      $("#saveBtn").click(function() {
    	  var editCnt = 0;
    	  var rowDatas = $("#list1").getRowData();
    	  var totalRecords = $("#list1").jqGrid("getGridParam", "reccount");
    	  
    	  rowDatas.forEach((rowData) => {
    		  if (rowData.flag !== "") {
    			  editCnt += 1;
    		  }
    	  })
    	  
    	  if (editCnt !== 0) {
	    	  for (var i = 1; i <= totalRecords; i++) {
	    		  console.log("check");
	    		  // 입력 후 수정했을 경우 editable 옵션이 false가 되어 입력이 제대로 되지 않음
	    		  // tmplCd의 editable 옵션 재설정
	    		  $("#list1").setColProp('tmplCd', { editable: true });
	    		  
	    		  // input, select 값들을 모두 값으로 저장
	   			  $("#list1").saveRow(i);
	   			  
	   			  var rowData = $("#list1").getRowData(i);
	   			  var mddlKrNmData = $("#list1").getCell(i, "mddlKrNm");
	   			  var imgnDvsnCdData = Object.keys(selectOption).find(key => selectOption[key] === mddlKrNmData);
	   			  
	   			  // select 태그인 촬영구분에서 촬영구분 코드를 저장
	   			  $("#list1").setCell(i, "imgnDvsnCd", imgnDvsnCdData);
	   			  
	   			  // 데이터가 공백이 있을 경우
	   			  if (!rowData.tmplCd) {
	   				  alert(i + "번째 행 정형문 코드가 비어있습니다.\n정형문 코드를 입력해주세요.");
	   				  $("#list1").editRow(i, true);
	   				  $("#list1").setSelection(i);
	   				  break
	   			  } else if (!rowData.viewText) {
	   				  alert(i + "번째 행 판독 내용이 비어있습니다.\n판독 내용을 입력해주세요.");
	   				  $("#list1").editRow(i, true);
	   				$("#list1").setSelection(i);
	   			  }
	    	  }
	    	  
	    	  rowDatas = $("#list1").getRowData();
	    	  
	    	  $.ajax({
	    		  url: "/pandok/saveRis0601List.do",
	    		  method: "POST",
	    		  contentType: 'application/json', // 클라이언트에서 JSON 형식으로 보내기
	    		  data: JSON.stringify(rowDatas),
	    		  dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
	    		  success: function(data) {
	    		      // 성공적으로 응답을 받았을 때 실행되는 함수
	    		      console.log(data);
	    		      if (data.msg === "중복") {
	    		    	  alert("중복된 데이터가 있습니다.");
	    		    	  
	    		    	  var rowDatas = $("#list1").getRowData();
	    		    	  
	    		    	  for (var i = 0; i < rowDatas.length; i++) {
	    		    		  if (rowDatas[i].flag) {
	    		    			  $("#list1").editRow(i + 1, true);
	    		    		  }
	    		    	  }
	    		      } else if (data.msg === "success") {
	    		    	  alert("총 " + data.cnt + "건의 데이터가 처리되었습니다.");
	    		    	  
	    		    	  refreshPage();
	    		      }
	    		  },
	    		  error: function(xhr, status, error) {
	    		      // 요청 중 오류가 발생했을 때 실행되는 함수
	    		      console.error(error);
	    		  }
	    	  })
    	  } else {
    		  alert("변경 데이터가 없습니다.");
    	  }
      });
      
      
      // 의사 ID 선택
      $("#selectDocId").change(function() {
    	  refreshPage();
      });
      
      // 검색어 입력
      $("#filterKeyword").on("input", function() {
      	var inputValue = $(this).val().replace(/\s+/g, "").toLowerCase();
      	
      	searchInGrid(inputValue);
      });

      // 검색 버튼
      $("#searchBtn").on("click", function() {
      	var inputValue = $("#filterKeyword").val().replace(/\s+/g, "").toLowerCase();
      	
      	searchInGrid(inputValue);
      });
      
      // 촬영구분 선택
      $("#selectImgnDvsn").change(function() {
    	  refreshPage();
      });
      
      // 공용코드
      $("#commonCheck").change(function() {
    	  if ($("#commonCheck").is(":checked")) {    		  
	    	  if (userGrade !== 'S' && userGrade !== 'A') {
	    		  console.log("공용 체크");
	    		  $(".btn__container").css("display", "none");
	    	  }
    	  } else {
    		  $(".btn__container").css("display", "flex");
    	  }
    	  refreshPage();
      })
      
      // 판독 내용 수정 시
      $("#viewText").change(function() {
    	  var selectedRowId = $("#list1").getGridParam("selrow");
    	  var changedViewText = $("#viewText").val();
    	  
    	  $("#list1").setCell(selectedRowId, "viewText", changedViewText);
      })
    </script>
  </body>
</html>
