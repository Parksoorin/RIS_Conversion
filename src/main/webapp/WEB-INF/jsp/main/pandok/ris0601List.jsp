<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>영상 판독문구 관리</title>
    <link rel="stylesheet" href="/css/pandok/ris0601List.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <!-- 의사 리스트 -->
      	<div class="search__box docId__search">
          <p class="filter__keyword">의사 :</p>
          <select class="filter__options">
            <option value="">option 1</option>
            <option value="">option 2</option>
          </select>
        </div>
        
        <!-- 검색어 입력 -->
        <div class="search__box keyword__search">
          <p class="filter__keyword">검색어 입력 :</p>
          <input class="filter__options" type="text" />
          <button class="all__btn img__btn search__btn">검색</button>
        </div>
        
        <!-- 촬영구분 -->
      	<div class="search__box docId__search">
          <p class="filter__keyword">촬영구분 :</p>
          <select class="filter__options">
            <option value="">option 1</option>
            <option value="">option 2</option>
          </select>
        </div>
        
        <!-- 공용코드 -->
        <div class="search__box">
          <p class="filter__keyword">공용코드 : </p>
          <input type="checkbox" />
        </div>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>판독정형문</p>
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
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <div class="btn__container">
        	  <button class="all__btn img__btn fontawesom__btn copy__icon">복사</button>
              <button class="all__btn img__btn fontawesom__btn paste__icon">붙여넣기</button>
            </div>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
        	  <button id="refreshBtn" class="all__btn fontawesom__btn rotate__icon"></button>
        	  <button id="insertBtn" class="all__btn img__btn insert__btn">입력</button>
              <button id="updateBtn" class="all__btn img__btn img__btn update__btn">수정</button>
		      <button class="all__btn img__btn delete__btn">삭제</button>
    		  <button class="all__btn img__btn save__btn">저장</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
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
      function setRis0601List() {
    	  $("#list1").jqGrid({
              url: "/pandok/getRis0601List.do",
              reordercolNames:true,
              datatype: "json",
              colNames: ["구분", "의사ID", "정형문 코드", "촬영구분", "판독약어명", "판독내용"],
              colModel: [
                { name: "flag", index: "flag", width: 40, align: "center" },
                { name: "docId", index: "docId", width: 100, align: "left" },
                { name: "tmplCd", index: "tmplCd", width: 100, align: "left" },
                { name: "imgnDvsnCd", index: "imgnDvsnCd", width: 100, align: "left", editable: true },
                { name: "viewAbbrNm", index: "viewAbbrNm", width: 100, align: "left", editable: true },
                { name: "viewText", index: "viewText", hidden: true },
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
      		  emptyrecords: "Nothing to display",  // 데이터 없을때
      		  rowNum: 999999,
              rownumbers: true,
              sortname: "docId",
              sortorder: "asc",
              loadonce: true,
              viewsortcols: [true, "vertical", true],
              loadComplete: function (data) {
            	console.log("test");
                console.log(data);
              }, // loadComplete END
              onSelectRow: function (rowid) {
                var rowData = $("#list1").getRowData(rowid);
                
            	// 판독 내용 disabled
            	$("#viewText").attr("disabled", true);
            	
            	// 판독 내용에 데이터 삽입
                $("#viewText").val(rowData.viewText);
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
      }
    
      $(document).ready(function () {
    	  setRis0601List();
      });
      
      // 새로고침 버튼
      $("#refreshBtn").click(function() {
    	  // 판독 내용 disabled
    	  $("#viewText").attr("disabled", true);
    	  
    	  // 그리드 새로고침
    	  $("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
    	  setRis0601List();
      })
      
      // 수정 버튼
      $("#updateBtn").click(function() {
    	  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
    	  
    	  if (rowId) { // 선택된 행이 있는 경우에만 실행
	    	  // 판독 내용 수정 가능
	    	  $("#viewText").attr("disabled", false);
    	  
    	      // 그리드에서 선택된 행 데이터 수정
    	      $("#list1").jqGrid('editRow', rowId, true);
          } else {
    	      // 선택된 행이 없는 경우 처리할 내용을 추가할 수 있습니다.
    	      alert("행을 먼저 선택하세요.");
    	  }
      });
      
      // 입력 버튼
      $("#insertBtn").click(function() {
		  var grid = $("#list1");
		  var newRowId = (grid.jqGrid('getDataIDs').length + 1).toString(); // 현재 행 개수 + 1로 아이디 생성
		  var newRowData = { id: newRowId, flag: '', docId: '', tmplCd: '', imgnDvsnCd: '', viewAbbrNm: '', viewText: '' }; // 빈 행 데이터 생성
		  
		  grid.jqGrid('addRowData', newRowId, newRowData, 'last'); // 행 추가
		  grid.jqGrid('editRow', newRowId, true); // 편집 모드로 변경
      });
    </script>
  </body>
</html>
