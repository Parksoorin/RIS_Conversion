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
	      <p class="filter__keyword">구분</p>
	      <input class="pandok__radio" type="radio" id="allView" name="viewYn" value="allView" />
	      <label class="pandok__label" for="allView">전체</label>
	      <input class="pandok__radio" type="radio" id="notView" name="viewYn" value="notView" />
	      <label class="pandok__label" for="notView">미판독</label>
	      <input class="pandok__radio" type="radio" id="doneView" name="viewYn" value="doneView" />
	      <label class="pandok__label" for="doneView">판독</label>
        </div>
      
        <div class="search__box">
          <p class="filter__keyword">촬영일자</p>
          <input type="date" class="filter__options filter__date" />
          <p class="date__connection">~</p>
          <input type="date" class="filter__options filter__date" />
        </div>
        
        <div class="search__box">
          <label class="filter__keyword">촬영구분</label>
          <select id="ris1301" class="filter__options">
            <c:forEach items="${ris0102Data}" var="data">
      	      <option value="${data.mddlCd}">${data.mddlKrNm}</option>
      	    </c:forEach>
          </select>
        </div>
        
        <div class="btn__container search__box">
          <button class="all__btn fontawesome__btn search__icon"></button>
          <button class="all__btn fontawesome__btn rotate__icon"></button>
        </div>
        
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title main__title">
	        <div class="search__container-sub">	        
	          <div class="search__box">
	            <label class="filter__keyword">환자명</label>
	            <input type="text" class="filter__options pat__name" />
	          
                <button onclick="openPopup()" class="all__btn fontawesome__btn list__icon pat__list-icon"></button>
              </div>
              
	          <div class="search__box">
	            <p class="filter__keyword">환자정보</p>
	            <input type="text" class="filter__options pat__age" />
	            <input type="text" class="filter__options pat__sex" />
		      </div>
            </div>
            
	        
	        
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              	<button class="all__btn img__btn fontawesome__btn record__icon">음성녹음</button>
        		<button class="all__btn img__btn fontawesome__btn play__icon">음성듣기</button>
		    	<button class="all__btn img__btn fontawesome__btn download__icon">다운로드</button>
    			<button class="all__btn text__btn">PACS 뷰어 조회</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
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
	              <select class="filter__options">
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
	              <button class="all__btn img__btn fontawesome__btn sub__btn save__icon">임시저장</button>
	        	  <button class="all__btn img__btn fontawesome__btn sub__btn done__icon">판독완료</button>
			      <button class="all__btn img__btn fontawesome__btn sub__btn update__icon">수정</button>
			      <button class="all__btn img__btn fontawesome__btn sub__btn clear__icon">비우기</button>
	    		  <button class="all__btn img__btn fontawesome__btn sub__btn delete__icon">판독취소</button>
	            </div>
	          </div>
	          <!-- 그리드 박스 -->
	          <div class="twoGrid__box">
	          </div>
          </div>
          
          <div class="right__container">
          	  <div class="grid__title">
	            <p>판독이력</p>
	          </div>
	          <!-- 그리드 박스 -->
	          <div class="twoGrid__box">
	          </div>
          </div>
        </div>
      </div>
    </main>

    <script>
	  function drawGrid1() {
	  	$("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
	    $("#list1").jqGrid({
	      url: "/pandok/ris1301List.do",
	      reordercolNames:true,
	      postData : {
	      	
	      }, // 보낼 파라미터
		  mtype:'POST',	// 전송 타입
	      datatype: "json",
	      colNames: [
	    	  "처방FK", "환자ID", "환자명", "처방일", "촬영일자", "촬영명", "내원구분", "진료과", "처방의사", "판독완료", "판독일자", "판독시간", "판독의사", "음성판독여부", "방사선사", "처방상태", "판독내용", "판독이력"
	      ],
	      colModel: [
	    	{ name: "ordrFk", 				index: "ordrFk", 			hidden: true },
	        { name: "ptntId", 				index: "ptntId", 			width: 100, 	align: "center", sortable: false },
	        { name: "ptntNm", 				index: "ptntNm", 			width: 60, 		align: "center", sortable: false },
	        { name: "ordrDate", 			index: "ordrDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "prscDate", 			index: "prscDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "ordrCd", 				index: "ordrCd", 			width: 200, 	align: "center", sortable: false },
	        { name: "vistDvsn", 			index: "vistDvsn", 			width: 60, 		align: "center", sortable: false },
	        { name: "trtmDprtCd", 			index: "trtmDprtCd", 		width: 60, 		align: "center", sortable: false },
	        { name: "ordrDocId", 			index: "ordrDocId", 		width: 60, 		align: "center", sortable: false },
	        { name: "viewYn", 				index: "viewYn", 			width: 50, 		align: "center", sortable: false },
	        { name: "viewDate", 			index: "viewDate", 			width: 80, 		align: "center", sortable: false },
	        { name: "viewTime", 			index: "viewTime", 			width: 60, 		align: "center", sortable: false },
	        { name: "viewDocId", 			index: "viewDocId", 		width: 60, 		align: "center", sortable: false },
	        { name: "voicViewYn", 			index: "voicViewYn", 		width: 70, 		align: "center", sortable: false },
	        { name: "rdlgId", 				index: "rdlgId", 			width: 60, 		align: "center", sortable: false },
	        { name: "ordrPrgrDvsn", 		index: "ordrPrgrDvsn", 		width: 60, 		align: "center", sortable: false },
	        { name: "viewText", 			index: "viewText", 			hidden: true },
	        { name: "viewNoteText", 		index: "viewNoteText", 		hidden: true }
	      ],
	      jsonReader: {
	 		  repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	 		  root:'ris1301Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	 		  records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
	 	  },
	      autowidth: true,
	      height: "85%",
	      scroll: true,
	      loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때   
		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
		  rowNum: 999999,
	      rownumbers: true,
	      loadonce: true,
	      // viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
	      loadComplete: function (data) {
	          console.log(data);
	          var emptyRecord = '<div class="ui-state-default ui-state-active empty-state" id="load_list1">데이터가 존재하지 않습니다.</div>';
	          if (data.ris1301Data.length === 0) {
	          	console.log("empty");
	          	$(".ui-jqgrid-bdiv").append(emptyRecord);
	          }
	      }, // loadComplete END
	      onSelectRow: function (rowid) {
	          var rowData = $("#list1").getRowData(rowid);
	      }
	    });
      };
      
      function drawGrid2() {
    	$("#list2").jqGrid({
    		url: "/pandok/getRis0601List.do",
            reordercolNames:true,
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
          }, // loadComplete END
          onSelectRow: function (rowid) {
            console.log(rowid);
          },
        });
      }
      
	  $(document).ready(function () {
		  drawGrid1();
		  drawGrid2();
	  });
	  
	  // 팝업 열기
	  function openPopup() {
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
	  }
    </script>
  </body>
</html>
