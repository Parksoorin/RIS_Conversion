<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 기준 관리</title>
<link rel="stylesheet" href="/css/appn/appnCommon.css">
</head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">촬영실 </p>
        <select class="filter__options">
          <option value="">전체</option>
          <option value="">option 1</option>
          <option value="">option 2</option>
        </select>
        <p class="filter__keyword">조회일자 </p>
        <input type="date">
        <p class="filter__keyword ma_left_1"> ~</p>
        <input type="date">
        <button id="search-btn" class="all__btn img__btn search__btn ma_left_1">검색</button>
      </section>

      <!-- 그리드 타이틀 -->
      <div class="grid__title">
        <div class="flex line_1">
          <p>예약 예외 목록 </p>
          <button id="reload-btn" class="all__btn text__btn ma_left_1 title_align">갱신</button>
        </div>
        <!-- 버튼 컨테이너 -->
        <div class="btn__container">
        	<button id="update-btn" class="all__btn img__btn update__btn">수정</button>
        	<button id="input-btn" class="all__btn img__btn insert__btn">입력</button>
		    <button id="delete-btn" class="all__btn img__btn delete__btn">삭제</button>
    		<button id="save-btn" class="all__btn img__btn save__btn">저장</button>
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
        $('#search-btn').click(function(){
          console.log('검색 버튼 눌림');
        })

        $('#reload-btn').click(function(){
          console.log('갱신 버튼 눌림');
        })

        $('#input-btn').click(function(){
          console.log('입력 버튼 눌림');
        })

        $('#update-btn').click(function(){
          console.log('수정 버튼 눌림');
        })

        $('#delete-btn').click(function(){
          console.log('삭제 버튼 눌림');
        })

        $('#save-btn').click(function(){
          console.log('저장 버튼 눌림');
        })

        $("#list1").jqGrid({
          url: "/appn/RIS0213E00/ris0213.do",
          reordercolNames : true,
          datatype: "json",
          jsonReader: {
            repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
            root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
            records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
          },     
          colNames: ["구분", "촬영실", "예외일자", "시작시간", "종료시간", "예외사유"],
          colModel: [
            { name: "flag", index: "flag", width: 40, align: "center" },
            { name: "hsptId", index: "hsptId", width: 100, align: "center" },
            {
              name: "strtDate",
              index: "strtDate",
              width: 150,
              align: "center",
            },
            { name: "strtTime", index: "strtTime", width: 80, align: "center" },
            { name: "endTime", index: "endTime", width: 80, align: "center" },
            { name: "appnImpsText", index: "appnImpsText", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: true,
          sortname: "id",
          sortorder: "asc",
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadonce: true,
          loadComplete: function (data) {
            console.log(data);
            console.log('ㅎㅇㅎㅇ');
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