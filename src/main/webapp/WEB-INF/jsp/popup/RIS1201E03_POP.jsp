<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		    <button class="all__btn fontawesome__btn text__btn">선택</button>
			<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
      </div>
    </main>

    <script>
    function calculateAge(brth) {
	    // 현재 날짜를 생성
	    var currentDate = new Date();

	    // 연, 월, 일 차이 계산
	    var ageInMillis = currentDate - new Date(brth);

	    // 밀리초를 연으로 변환하고 나이 계산
	    var ageInYears = ageInMillis / (365 * 24 * 60 * 60 * 1000);

	    // 소수점 이하 자리를 버리고 정수로 변환
	    var age = Math.floor(ageInYears);
		
	    age += 1;
	    
	    return age;
	}
    
      $(document).ready(function () {
        $("#list1").jqGrid({
        	url: "/popup/RIS1201E03_POP.do",    
 			reordercolNames:true,
 			postData : { type: 'A' },
 			mtype:'POST',
          	datatype: "json",
          	colNames: ["환자ID", "환자명", "성별", "나이", "생년월일"],
          	colModel: [
            	{ name: "ptntId", index: "ptntId", width: 90, align: "center" },
            	{ name: "ptntNm", index: "ptntNm", width: 100, align: "center" },
            	{ name: "gndrDvsn", index: "gndrDvsn", width: 80, align: "center" },
            	{ name: "brth", index: "brth", width: 80, align: "center",
            		formatter: function (cellvalue, options, rowObject) {
			            // 나이를 계산하여 표시
			            var age = calculateAge(cellvalue);
			            return age;
			        }
            	},
            	{ name: "brth", index: "brth", width: 80, align: "center" },
          	],
          	guiStyle: "bootstrap",
          	autowidth: true,
          	height: "91%",
          	rownumbers: true,
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
      function closePopup() {
          // 현재 창을 닫습니다.
          window.close();
      }
    </script>
  </body>
</html>