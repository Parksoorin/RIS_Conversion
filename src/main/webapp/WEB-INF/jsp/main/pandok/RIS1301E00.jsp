<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>영상 판독관리</title>
    <link rel="stylesheet" href="/css/pandok/RIS1301E00.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <div class="search__box">
	      <p class="filter__keyword">판독구분</p>
	      <input class="pandok__radio" type="radio" id="allView" name="viewYn" value="allView" checked />
	      <label class="pandok__label" for="allView">전체</label>
	      <input class="pandok__radio" type="radio" id="notView" name="viewYn" value="notView" />
	      <label class="pandok__label" for="notView">미판독</label>
	      <input class="pandok__radio" type="radio" id="doneView" name="viewYn" value="doneView" />
	      <label class="pandok__label" for="doneView">판독</label>
        </div>
      
        <div class="search__box">
          <p class="filter__keyword">촬영일자</p>
          <input id="startDate" type="date" class="filter__options filter__date" />
          <p class="date__connection">~</p>
          <input id="endDate" type="date" class="filter__options filter__date" />
        </div>
        
        <div class="search__box">
          <label class="filter__keyword">촬영구분</label>
          <select id="ris1301Dvsn" class="filter__options">
            <c:forEach items="${ris0102Data}" var="data">
      	      <option value="${data.mddlCd}">${data.mddlKrNm}</option>
      	    </c:forEach>
          </select>
        </div>
        
        <div class="btn__container search__box">
          <button id="searchBtn" class="all__btn fontawesome__btn search__icon"></button>
        </div>
        
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
        
          <!-- 환자정보, 음성판독정보 -->
          <div class="grid__title main__title">
            <!-- 환자 정보 -->
	        <div class="search__container-sub">
	          <div class="pat__container">
		        <div class="search__box">
		          <label class="filter__keyword pat__info-label">환자검색</label>
		          <input id="ptntId" type="text" class="filter__options pat__id" disabled />
		          
	              <button id="ptntListBtn" class="all__btn fontawesome__btn list__icon pat__list-icon"></button>
          		  <button id="refreshBtn" class="all__btn fontawesome__btn rotate__icon"></button>
	            </div>
	              
		        <div class="search__box">
		          <p class="filter__keyword pat__info-label">환자정보</p>
		          <input id="ptntName" type="text" class="filter__options pat__name" disabled />
		          <input id="ptntAge" type="text" class="filter__options pat__age" disabled />
		          <input id="ptntSex" type="text" class="filter__options pat__sex" disabled />
			    </div>
		      </div>
            </div>
            
	        <div class="voic__filter-container">
	          <!-- 음성판독 구분 -->
	          <div class="voic__filter">
	            <p class="filter__keyword">음성판독구분</p>
	            <input class="pandok__radio" type="radio" id="allVoicView" name="voicViewYn" value="allView" checked />
	      		<label class="pandok__label" for="allVoicView">전체</label>
	      		<input class="pandok__radio" type="radio" id="notVoicView" name="voicViewYn" value="notView" />
	      		<label class="pandok__label" for="notVoicView">미판독</label>
	      		<input class="pandok__radio" type="radio" id="doneVoicView" name="voicViewYn" value="doneView" />
	      		<label class="pandok__label" for="doneVoicView">판독</label>
	          </div>
	          
              <!-- 음성판독 버튼 컨테이너 -->
              <div class="btn__container">
                <button id="recordBtn" class="all__btn img__btn fontawesome__btn record__icon">음성녹음</button>
        	    <button class="all__btn img__btn fontawesome__btn play__icon">음성듣기</button>
	  	        <button class="all__btn img__btn fontawesome__btn download__icon">다운로드</button>
      		    <button class="all__btn text__btn">PACS 뷰어 조회</button>
              </div>
	        </div>
          </div>
          
          <!-- 그리드 박스 -->
          <div class="twoGrid__box main__twoGrid-box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container flex__row">
          <div class="left__container">
	        <!-- 그리드 타이틀 -->
	        <div class="grid__title">
	          <p>판독정형문</p>
	
	          <!-- 버튼 컨테이너 -->
	          <div class="search__box search__box-sub">
	            <label class="filter__keyword">촬영구분</label>
	            <select id="ris0601Dvsn" class="filter__options">
	              <c:forEach items="${ris0102Data}" var="data">
		           	<option value="${data.mddlCd}">${data.mddlKrNm}</option>
		          </c:forEach>
	            </select>
	          </div>
	        </div>
	        <!-- 그리드 박스 -->
	        <div class="twoGrid__box">
	          <section class="grid__box">
	            <!-- 그리드 -->
	            <table id="list2" class="grid1"></table>
	          </section>
	        </div>
          </div>
          
          <div class="middle__container">
          	<div class="grid__title">
          	  <p>판독내용</p>
          	  
	          <!-- 버튼 컨테이너 -->
	          <div class="btn__container">
			    <button id="updateBtn" class="all__btn img__btn fontawesome__btn sub__btn update__icon">수정</button>
	            <button id="tempSaveBtn" class="all__btn img__btn fontawesome__btn sub__btn save__icon">임시저장</button>
			    <button id="clearBtn" class="all__btn img__btn fontawesome__btn sub__btn clear__icon">비우기</button>
	        	<button id="saveBtn" class="all__btn img__btn fontawesome__btn sub__btn done__icon">판독완료</button>
	    	    <button id="deleteBtn" class="all__btn img__btn fontawesome__btn sub__btn delete__icon">판독취소</button>
	          </div>
	        </div>
	        
	        <!-- 그리드 박스 -->
	        <div class="twoGrid__box">
	          <textarea id="viewTextArea" class="textarea__box" disabled></textarea>
	        </div>
          </div>
          
          <div class="right__container">
          	<div class="grid__title">
	          <p>판독이력</p>
	        </div>
	        <!-- 그리드 박스 -->
	        <div class="twoGrid__box">
	          <textarea id="viewNoteTextArea" class="textarea__box" disabled></textarea>
	        </div>
          </div>
        </div>
      </div>
    </main>

    <script>
	  function drawGrid1() {
		var viewYn = $("input[name='viewYn']:checked").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var ris1301Dvsn = $("#ris1301Dvsn").val();
		var ptntName = $("#ptntName").prop("value");
		
	  	$("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
	    $("#list1").jqGrid({
	      url: "/pandok/ris1301List.do",
	      reordercolNames:true,
	      postData : {
	    	viewYn: viewYn,
	    	startDate: startDate,
	    	endDate: endDate,
	    	ris1301Dvsn: ris1301Dvsn,
	    	ptntName: ptntName
	      }, // 보낼 파라미터
		  mtype:'POST',	// 전송 타입
	      datatype: "json",
	      colNames: [
	    	  "처방FK", "환자ID", "환자명", "처방일", "촬영일자", "촬영명", "촬영구분코드", "내원구분코드", "내원구분", "진료과코드", "진료과", "처방의사ID", "처방의사", "판독완료", "판독일자", "판독시간", "판독의사ID", "판독의사", "음성판독여부", "방사선사ID", "방사선사", "처방진행구분코드", "처방상태", "판독내용", "판독이력"
	      ],
	      colModel: [
	    	{ name: "ordrFk", 				index: "ordrFk", 			hidden: true },
	        { name: "ptntId", 				index: "ptntId", 			width: 100, 	align: "center", sortable: false },
	        { name: "ptntNm", 				index: "ptntNm", 			width: 60, 		align: "center", sortable: false },
	        { name: "ordrDate", 			index: "ordrDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "prscDate", 			index: "prscDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "ordrNm", 				index: "ordrNm", 			width: 200, 	align: "left", sortable: false },
	        { name: "imgnDvsnCd", 			index: "imgnDvsnCd", 		hidden: true },
	        { name: "vistDvsn", 			index: "vistDvsn", 			hidden: true },
	        { name: "vistDvsnNm", 			index: "vistDvsnNm", 		width: 60, 		align: "center", sortable: false },
	        { name: "trtmDprtCd", 			index: "trtmDprtCd", 		hidden: true },
	        { name: "trtmDprtNm", 			index: "trtmDprtNm", 		width: 60, 		align: "center", sortable: false },
	        { name: "ordrDocId", 			index: "ordrDocId", 		hidden: true },
	        { name: "ordrDocNm", 			index: "ordrDocNm", 		width: 60, 		align: "center", sortable: false },
	        { name: "viewYn", 				index: "viewYn", 			width: 50, 		align: "center", sortable: false },
	        { name: "viewDate", 			index: "viewDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "viewTime", 			index: "viewTime", 			width: 60, 		align: "center", sortable: false },
	        { name: "viewDocId", 			index: "viewDocId", 		hidden: true },
	        { name: "viewDocNm", 			index: "viewDocNm", 		width: 60, 		align: "center", sortable: false },
	        { name: "voicViewYn", 			index: "voicViewYn", 		width: 70, 		align: "center", sortable: false },
	        { name: "rdlgId", 				index: "rdlgId", 			hidden: true },
	        { name: "rdlgNm", 				index: "rdlgNm", 			width: 60, 		align: "center", sortable: false },
	        { name: "ordrPrgrDvsn", 		index: "ordrPrgrDvsn", 		hidden: true },
	        { name: "ordrPrgrKr", 			index: "ordrPrgrKr", 		width: 80, 		align: "left", sortable: false },
	        { name: "viewText", 			index: "viewText", 			hidden: true },
	        { name: "viewNoteText", 		index: "viewNoteText", 		hidden: true }
	      ],
	      jsonReader: {
	 		  repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	 		  root:'ris1301Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	 		  records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
	 	  },
	      autowidth: true,
	      height: "83%",
	      scroll: true,
	      loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때   
		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
		  rowNum: 999999,
	      rownumbers: true,
	      loadonce: true,
	      // viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
	      loadComplete: function (data) {
	          console.log(data);
	          var gridName = this.id;
	          var emptyRecord = '<div class="ui-state-default ui-state-active empty-state" id="load_list1">데이터가 존재하지 않습니다.</div>';
	          
	          if (data.ris1301Data.length === 0) {
	          	var gviewList = $("#gview_" + gridName);
	          	var uiJqgridBdiv = gviewList.find(".ui-jqgrid-bdiv");
	          	
	          	uiJqgridBdiv.append(emptyRecord);
	          }
	      }, // loadComplete END
	      onSelectRow: function (rowid) {
	          var rowData = $("#list1").getRowData(rowid);
	          
	          console.log(rowData);
	          
	          if (rowData.viewYn !== "Y") {
	        	  $("#viewTextArea").attr("disabled", false);
	        	  $("#viewTextArea").attr("readonly", true);
	          } else {
	        	  $("#viewTextArea").attr("disabled", true);
	        	  $("#viewTextArea").attr("readonly", false);
	          }
	          
	          $("#viewTextArea").val(rowData.viewText);
	          $("#viewNoteTextArea").val(rowData.viewNoteText);
	      }
	    });
      };
      
      function drawGrid2() {
    	var ris0601Dvsn = $("#ris0601Dvsn").val();
    	
    	$("#list2").jqGrid("GridUnload");
    	$("#list2").jqGrid({
    	  url: "/pandok/getRis0601List.do",
          reordercolNames:true,
          postData: {
        	  docId: "all",
        	  imgnDvsn: ris0601Dvsn
          },
          mtype: 'POST',
          datatype: "json",
          colNames: ["의사ID", "정형문 코드", "촬영구분", "판독약어명", "판독내용"],
          colModel: [
            { name: "docId",      index: "docId",      hidden: true },
            { name: "tmplCd",     index: "tmplCd",     hidden: true },
            { name: "mddlKrNm",   index: "mddlKrNm",   width: 100,   align: "left" },
            { name: "viewAbbrNm", index: "viewAbbrNm", width: 100,   align: "left" },
            { name: "viewText",   index: "viewText",   width: 200,   align: "left" },
          ],
          jsonReader: {
   		  repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
   		  root:'ris0601Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
   		  records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
   	      },
          autowidth: true,
          height: "85%",
          rownumbers: true,
          gridview: true, // 선표시 true/false
          rowattr: function (rowData, currentObj, rowId) {
        	// 행의 최대 높이 설정(작동 안함)
       	    return { 'class': 'max-height-row' };
       	  },
       	  loadComplete: function (data) {
	          console.log(data);
	          var gridName = this.id;
	          var emptyRecord = '<div class="ui-state-default ui-state-active empty-state" id="load_list1">데이터가 존재하지 않습니다.</div>';
	          
	          if (data.ris0601Data.length === 0) {
	          	var gviewList = $("#gview_" + gridName);
	          	var uiJqgridBdiv = gviewList.find(".ui-jqgrid-bdiv");
	          	
	          	uiJqgridBdiv.append(emptyRecord);
	          }
	      }, // loadComplete END
          onSelectRow: function (rowid) {
            var rowData = $("#list2").getRowData(rowid);
            console.log(rowData);
            var selectedRowId = $("#list1").getGridParam("selrow");
  		    var grid1RowData = $("#list1").getRowData(selectedRowId);
           	var currentText = grid1RowData.viewText;
            
            // 수정 상태일 경우만 판독내용 변경
            if (!($("#viewTextArea").is(":disabled") || $("#viewTextArea").attr("readonly"))) {
            	var updatedText = currentText + '\n' + rowData.viewText;
            	
            	$("#viewTextArea").val(updatedText);
            }
          },
        });
      }
      
	  
	  // 페이지 로드시 
	  $(document).ready(function () {
		  drawGrid1();
		  drawGrid2();
		  
		  // 환자 리스트에서 환자를 선택했을 경우
		  // 하위 페이지에서 받은 데이터를 상위 페이지로 가져옴
		  window.addEventListener('message', function(event) {
			  // 선택한 페이지의 오리진 경로가 상위 페이지의 경로가 아닐 때
              if (event.origin !== window.location.origin) return;
			  
			  // 환자 리스트 팝업에서 선택한 데이터
              var selectedData = event.data;
              // console.log(selectedData);
              
              // 환자정보 값 업데이트
              $("#ptntId").val(selectedData.ptntId);
              $("#ptntName").val(selectedData.ptntKrNm);
              $("#ptntAge").val(selectedData.age + "세");
              
              if (selectedData.gndrDvsn === "M") {
	              $("#ptntSex").val("남");              
              } else {
            	  $("#ptntSex").val("여");
              }
              
              drawGrid1();
          });
	  });
	  
      
	  // 환자 리스트 팝업 열기
	  $("#ptntListBtn").click(function() {		  
	      // 팝업 창에 표시할 URL
	      var url = "/pandok/PatientPopup.do";
	
	      // 팝업 창의 크기와 위치 설정
	      var width = 800;
	      var height = 500;
	      var left = (window.innerWidth - width) / 2;
	      var top = (window.innerHeight - height) / 2;
	
	      // 팝업 창을 열기
	      var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
	
	      // 팝업 창이 차단되었을 때 처리
	      if (!popup || popup.closed || typeof popup.closed == 'undefined') {
	          alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
	      }
	  });
	  
	  
	  // 음성녹음 버튼 팝업 열기
	  $("#recordBtn").click(function() {
		  var url = "/pandok/filePopup.do";
	
	      // 팝업 창의 크기와 위치 설정
	      var width = 800;
	      var height = 300;
	      var left = (window.innerWidth - width) / 2;
	      var top = (window.innerHeight - height) / 2;
	
	      // 팝업 창을 열기
	      var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
	
	      // 팝업 창이 차단되었을 때 처리
	      if (!popup || popup.closed || typeof popup.closed == 'undefined') {
	          alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
	      }
	  })
	  
	  
	  // 판독구분 변경
	  $("input[name='viewYn']").change(function() {
		  drawGrid1();
	  });
	  
	  
	  // 촬영일자 시작일 변경
	  $("#startDate").change(function() {
		  var startDate = $("#startDate").val();
		  var endDate = $("#endDate").val();
		  
		  if (startDate && endDate && startDate >= endDate) {
			  alert("종료일은 시작일보다 늦어야 합니다.");
			  $("#startDate").val("");
		  } else {
			  drawGrid1();
		  }
	  });
	  
	  
	  // 촬영일자 종료일 변경
	  $("#endDate").change(function() {
		  var startDate = $("#startDate").val();
		  var endDate = $("#endDate").val();
		  
		  if (startDate && endDate && startDate >= endDate) {
			  alert("종료일은 시작일보다 늦어야 합니다.");
			  $("#endDate").val("");
		  } else {
			  drawGrid1();
		  }
	  });
	  
	  
	  // ris1301 리스트 촬영구분 변경
	  $("#ris1301Dvsn").change(function() {
		  drawGrid1();
	  });
	  
	  
	  // ris0601 리스트 촬영구분 변경
	  $("#ris0601Dvsn").change(function() {
		  drawGrid2();
	  });
	  
	  
	  // 검색 버튼
	  $("#searchBtn").click(function() {
		  drawGrid1();
	  });
	  
	  
	  // 새로고침 버튼
	  $("#refreshBtn").click(function() {
		  $("#ptntId").val("");
		  $("#ptntName").val("");
		  $("#ptntAge").val("");
		  $("#ptntSex").val("");
		  $("input[name='viewYn']:input[value='allView']").prop('checked', true);
		  $("#startDate").val("");
		  $("#endDate").val("");
		  $("#ris1301Dvsn").val("%");
		  $("#ris0601Dvsn").val("%");
		  
		  drawGrid1();
	  });
	  
	  
	  // 수정 버튼
	  $("#updateBtn").click(function() {
		  var selectedRowId = $("#list1").getGridParam("selrow");
		  var rowData = $("#list1").getRowData(selectedRowId);
		  
		  $("#viewTextArea").prop("disabled", false);
		  $("#viewTextArea").prop("readonly", false);
	  });
	  
	  
	  // 임시저장 버튼
	  $("#tempSaveBtn").click(function() {
		  var selectedRowId = $("#list1").getGridParam("selrow");
		  var rowData = $("#list1").getRowData(selectedRowId);
		  
		  // 처방상태 변경
		  // 판독내용 변경
		  rowData.viewText = $("#viewTextArea").val();
		  $("#list1").setRowData(selectedRowId);
		  
		  console.log(rowData);
		  
		  $.ajax({
    		  url: "/pandok/saveTempRis1301List.do",
    		  method: "POST",
    		  contentType: 'application/json', // 클라이언트에서 JSON 형식으로 보내기
    		  data: JSON.stringify(rowData),
    		  dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
    		  success: function(data) {
    		      // 성공적으로 응답을 받았을 때 실행되는 함수
    		      console.log(data);
    		      alert(data.cnt + '건이 임시저장되었습니다.');
    		      drawGrid1();
    		  },
    		  error: function(xhr, status, error) {
    		      // 요청 중 오류가 발생했을 때 실행되는 함수
    		      console.error(error);
    		  }
    	  })
	  });
	  
	  
	  // 비우기 버튼
	  $("#clearBtn").click(function() {
		  var selectedRowId = $("#list1").getGridParam("selrow");
		  var rowData = $("#list1").getRowData(selectedRowId);
		  
		  $("#viewTextArea").val("");
		  rowData.viewText = "";
		  
		  $("#list1").setRowData(selectedRowId);
	  });
	  
	  
	  // 판독완료 버튼
	  $("#saveBtn").click(function() {
		  // 판독완료 Y로 변경
		  // 판독일자, 판독시간 현재로 변경
		  // 판독의사 변경
		  // 판독이력 추가
	  });
	  
	  
	  // 판독취소 버튼
	  $("#deleteBtn").click(function() {
		  var checkDelete = confirm("정말 판독을 취소하시겠습니까?");
		  
		  if (checkDelete) {
			  // 판독내용 삭제
			  // 판독완료 N으로 변경
			  // 판독일자, 판독시간 삭제
			  // 판독이력 삭제
			  // 방사선사 삭제
			  // 처방상태 실서로 변경
		  }
	  });
    </script>
  </body>
</html>
