<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find</title>
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
		    <button onclick="selvalue()" class="all__btn fontawesome__btn text__btn">선택</button>
			<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
      </div>
    </main>

    <script>
      $(document).ready(function () {
        $("#list1").jqGrid({
        	url: "/popup/RIS1201E03Detail_POP.do",   
 			reordercolNames:true,
 			postData : { type: 'B' },
 			mtype:'POST',
          	datatype: "json",
          	colNames: ["pk", "촬영코드", "촬영명", "촬영실", "촬영구분"],
          	colModel: [
          		{ name: "pkris1201", index: "pkris1201", width: 120, align: "center", hidden: true },
            	{ name: "imgnCd", index: "imgnCd", width: 100, align: "center" },
            	{ name: "ordrNm", index: "ordrNm", width: 80, align: "center" },
            	{ name: "mddlKrNmOne", index: "mddlKrNmOne", width: 80, align: "center" },
            	{ name: "mddlKrNmTwo", index: "mddlKrNmTwo", width: 80, align: "center" },
          	],
          	guiStyle: "bootstrap",
          	autowidth: true,
          	height: "91%",
          	rownumbers: true,
          	rowNum: 9999,
          	multiselect: false,
          	sortname: "id",
          	sortorder: "asc",
          	gridview: true, // 선표시 true/false
          	viewsortcols: [true, "vertical", true],
          	loadComplete: function (data) {
            	console.log(data);
          	}, // loadComplete END
          	onSelectRow: function (rowid) {
            	console.log(rowid);
            	
            	// 선택한 rowId의 데이터 가져오기
            	var selectRowData = jQuery("#list1").getRowData(rowid);
            	console.log(selectRowData);
            	
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
      
      
   	  // 선택한 정보를 리턴(메인화면으로)
      function selvalue() {
      	  // 현재 선택된 행의 ID를 가져옵니다.
          var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
          
          // 선택된 행의 데이터를 가져옵니다.
          var rowData = $("#list1").jqGrid('getRowData', selectedRowId);
          
          // 선택한 데이터를 부모 창의 함수로 전달합니다.
          // 수정된 부분: opener.parent.ReturnMenuValue 대신 opener.ReturnMenuValue를 사용합니다.
  		  opener.ReturnSelValue(rowData.imgnCd, rowData.ordrNm);
          	window.close();
      }
      
      
      
      
      function closePopup() {
          // 현재 창을 닫습니다.
          window.close();
      }
    </script>
  </body>
</html>