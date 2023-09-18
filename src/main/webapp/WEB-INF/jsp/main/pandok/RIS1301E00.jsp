<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/pandok/RIS1301E00.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 :</p>
        <select class="filter__options">
          <option value="">option 1</option>
          <option value="">option 2</option>
        </select>
        <button class="all__btn img__btn search__btn">검색</button>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title main__title">
            <p>환자정보</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              	<button class="all__btn img__btn img__btn update__btn">수정</button>
        		<button class="all__btn img__btn insert__btn">입력</button>
		    	<button class="all__btn img__btn delete__btn">삭제</button>
    			<button class="all__btn img__btn save__btn">저장</button>
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
	            <div class="btn__container">
	              <label>촬영구분</label>
	              <select>
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
	             	<button class="all__btn img__btn img__btn update__btn">수정</button>
	        		<button class="all__btn img__btn insert__btn">입력</button>
			    	<button class="all__btn img__btn delete__btn">삭제</button>
	    			<button class="all__btn img__btn save__btn">저장</button>
			    	<button class="all__btn text__btn">글자만</button>
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
	  function drawGrid() {
	  	  $("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
	      $("#list1").jqGrid({
	      url: "/stts/getDvsnSttsList.do",
	      reordercolNames:true,
	      postData : {
	      	
	      }, // 보낼 파라미터
		  mtype:'POST',	// 전송 타입
	      datatype: "json",
	      colNames: [
	    	  "환자ID", "환자명", "처방일", "촬영일자", "촬영명", "내원구분", "진료과", "처방의사", "판독완료", "판독일자", "판독시간", "음성판독여부", "방사선사", "처방상태"
	      ],
	      colModel: [
	        { name: "roomNm", 				index: "roomNm", 				width: 100, 	align: "center", sortable: false },
	        { name: "dvsnNm", 				index: "dvsnNm", 				width: 200, 	align: "center", sortable: false },
	        { name: "january", 				index: "january", 				width: 50, 		align: "center", sortable: false },
	        { name: "february", 			index: "february", 				width: 50, 		align: "center", sortable: false },
	        { name: "march", 				index: "march", 				width: 50, 		align: "center", sortable: false },
	        { name: "april", 				index: "april", 				width: 50, 		align: "center", sortable: false },
	        { name: "may", 					index: "may", 					width: 50, 		align: "center", sortable: false },
	        { name: "june", 				index: "june", 					width: 50, 		align: "center", sortable: false },
	        { name: "july", 				index: "july", 					width: 50, 		align: "center", sortable: false },
	        { name: "august", 				index: "august", 				width: 50, 		align: "center", sortable: false },
	        { name: "september", 			index: "september", 			width: 50, 		align: "center", sortable: false },
	        { name: "october", 				index: "october", 				width: 50, 		align: "center", sortable: false },
	        { name: "november", 			index: "november", 				width: 50, 		align: "center", sortable: false },
	        { name: "december", 			index: "december", 				width: 50, 		align: "center", sortable: false },
	        { name: "total", 				index: "total", 				width: 50, 		align: "center", sortable: false },
	        { name: "januaryLastYear", 		index: "januaryLastYear", 		hidden: true },
	        { name: "februaryLastYear", 	index: "februaryLastYear", 		hidden: true },
	        { name: "marchLastYear", 		index: "marchLastYear", 		hidden: true },
	        { name: "aprilLastYear", 		index: "aprilLastYear", 		hidden: true },
	        { name: "mayLastYear", 			index: "mayLastYear", 			hidden: true },
	        { name: "juneLastYear", 		index: "juneLastYear", 			hidden: true },
	        { name: "julyLastYear", 		index: "julyLastYear", 			hidden: true },
	        { name: "augustLastYear", 		index: "augustLastYear", 		hidden: true },
	        { name: "septemberLastYear", 	index: "septemberLastYear", 	hidden: true },
	        { name: "octoberLastYear", 		index: "octoberLastYear", 		hidden: true },
	        { name: "novemberLastYear", 	index: "novemberLastYear", 		hidden: true },
	        { name: "decemberLastYear", 	index: "decemberLastYear", 		hidden: true },
	        { name: "totalLastYear", 		index: "totalLastYear", 		width: 50, 		align: "center", sortable: false }
	      ],
	      jsonReader: {
	 		  repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	 		  root:'ris1301Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	 		  records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
	 	  },
	      autowidth: true,
	      height: "94%",
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
	          if (data.ris1201Data.length === 0) {
	          	console.log("empty");
	          	$(".ui-jqgrid-bdiv").append(emptyRecord);
	          }
	      }, // loadComplete END
	      onSelectRow: function (rowid) {
	          var rowData = $("#list1").getRowData(rowid);
	      }
	    });

        $("#list2").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["날짜", "아이디", "이름", "상품", "가격", "합계"],
          colModel: [
            { name: "date", index: "date", width: 90, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
            {
              name: "id",
              index: "id",
              width: 150,
              align: "center",
            },
            { name: "product", index: "product", width: 80, align: "center" },
            { name: "amount", index: "amount", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "85%",
          rownumbers: true,
          multiselect: true,
          sortname: "id",
          sortorder: "asc",
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
    </script>
  </body>
</html>
