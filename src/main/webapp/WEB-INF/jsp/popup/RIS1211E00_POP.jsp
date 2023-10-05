<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 검색</title>
</head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 :</p>
        <input type="text" class="filter__options" placeholder="Enter text to search..."></input>
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
		    <button id="selectBtn" class="all__btn fontawesome__btn text__btn">선택</button>
			<button id="closeBtn" class="all__btn fontawesome__btn text__btn">닫기</button>
      </div>
    </main>

    <script>
      $(document).ready(function () {
    	  
    	  
    	  
    	  $("#list1").jqGrid({
      		url: "/appn/getRis1101List.do",
            reordercolNames:true,
            datatype: "json",
            colNames: ["병원ID", "환자ID", "환자명", "성별", "나이", "생년월일"],
            colModel: [
              { name: "hsptId",			index: "hsptId",		hidden: true },
              { name: "ptntId",			index: "ptntId",		width: 100,		align: "center" },
              { name: "ptntKrNm",		index: "ptntKrNm",		width: 200,		align: "center" },
              { name: "gndrDvsn",		index: "gndrDvsn",		width: 70,		align: "center" },
              { name: "age",			index: "age",			width: 70,		align: "center" },
              { name: "brth",			index: "brth",			width: 100,		align: "center" },
            ],
            jsonReader: {
     		  repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
     		  root:'ris1101Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
     		  records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
     	    },
            autowidth: true,
            height: "90%",
            rownumbers: true,
            gridview: true, // 선표시 true/false
            loadComplete: function (data) {
              console.log(data);
            }, // loadComplete END
            onSelectRow: function (rowid) {
              var rowData = $("#list1").getRowData(rowid);
              
              console.log(rowData);
              
              // selectData(rowData);
            },
          });
      });
      
      
      function selectData(data) {
          window.opener.postMessage(data, '*');
          // 현재 창을 닫습니다.
          window.close();
      }
      
      $("#selectBtn").click(function() {
    	  var grid = $("#list1");
    	  
    	  var selectedRowId = grid.jqGrid("getGridParam", "selrow");
    	  var selectedRowData = grid.jqGrid("getRowData", selectedRowId);
    	  
    	  console.log(selectedRowData);
    	  
    	  selectData(selectedRowData);
      })
      
      $("#closeBtn").click(function() {
    	  window.close();
      });
    </script>
  </body>
</html>