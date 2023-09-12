<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영상 실시 관리</title>
<link rel="stylesheet" href="/css/jubsu/RIS1201E04.css" />
</head>
<body>
	<main class="main__container">
		<!-- 검색 -->
		<section class="search__container">
			<div class="dateDiv">
				<p class="filter__keyword">조회일자</p>
	
				<input type="date" class="inputDateClass" />
				<p class="inputBetween">~</p>
				<input type="date" class="inputDateClass" />
			</div>
			
			<div class="ptntNmClass">
				<p class="ptntNm">환자명</p>
				<input type="text" class="ptntNmInputClass" />
				<button class="all__btn fontawesome__btn list__icon icon__btn"></button>
			</div>

			<div class="selectClass">
			<p class="filter__keyword">촬영구분</p>
			<select class="filter__options">
				<option value="">전체</option>
				<option value="">일반영상</option>
				<option value="">BMD(골밀도)</option>
				<option value="">CT(전산화단층촬영)</option>
				<option value="">MRI(자기공명영상)</option>
				<option value="">ANGIOGRAPHY(혈관조영)</option>
				<option value="">중재적방사선시술</option>
				<option value="">USG(초음파)</option>
				<option value="">투시조영</option>
				<option value="">핵의학(감마카메라&PET-CT)</option>
				<option value="">조직생검</option>
				<option value="">DUCT(내시경)외 PACS전송</option>
				<option value="">CD COPY</option>
				<option value="">공공의료(이동버스) X-RAY)</option>
				<option value="">공공의료 SONO</option>
				<option value="">외부영상저장/판독의뢰</option>
				<option value="">Mammograpy Bilateral</option>
				<option value="">영상재료</option>
			</select>
			<button class="all__btn img__btn fontawesome__btn search__icon"></button>
			</div>
		</section>

		<div class="grid__container main__container-twoGrid">
			<div class="twoGrid__container ptntGrid">
				<!-- 그리드 타이틀 -->
				<div class="grid__title">
					<p>환자목록</p>

					<!-- 버튼 컨테이너 -->
					<div class="btn__container">
						<p class="statusClass">처방상태</p>
						<select class="statusSelectClass">
							<option>접수</option>
							<option>실시</option>
						</select>
						<p class="roomClass">촬영실</p>
						<select class="roomSelectClass">
							<option>전체</option>
							<option>DR1</option>
							<option>CT실1</option>
							<option>ct2</option>
							<option>MRI실1</option>
							<option>MRI실2</option>
							<option>핵의학과</option>
							<option>감마카메라스캔실1</option>
							<option>감마카메라스캔실2</option>
							<option>PET-CT</option>
							<option>외부영상저장/판독의뢰</option>
							<option>투시조영실1</option>
							<option>초음파진단1</option>
							<option>초음파진단2</option>
							<option>초음파진단3(건진)</option>
							<option>혈관조영실</option>
							<option>중재적시술실</option>
							<option>초음파가이드시술</option>
							<option>골밀도측정실1</option>
							<option>유방영상1</option>
							<option>치아영상실(건진)</option>
							<option>1영상실(일반)</option>
							<option>신우조영실</option>
							<option>이동촬영실(일반)</option>
							<option>테스트</option>
						</select>
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

			<div class="twoGrid__container pacsGrid">
				<!-- 그리드 타이틀 -->
				<div class="grid__title">
				<div class="pacsUserDiv">
					<p>방사선사</p>
					<select class="pacsSelectClass">
						<option>pacsUser1</option>
						<option>pacsUser2</option>
						<option>pacsUser3</option>
						<option>pacsUser4</option>
					</select>
				</div>

					<!-- 버튼 컨테이너 -->
					<div class="btn__container">
						<button class="all__btn img__btn fontawesome__btn fileCheck__icon ">실시</button>
						<button class="all__btn img__btn fontawesome__btn fileXmark__icon ">취소</button>
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
		</div>
	</main>

	<script>
      $(document).ready(function () {
        var mydata = [
          {
            date: "2007-09-01",
            name: "test4",
            id: "id19",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
        ];

        $("#list1").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["환자ID", "환자명", "성별", "나이", "생년월일"],
          colModel: [
            { name: "date", index: "date", width: 90, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
            { name: "id", index: "id", width: 150, align: "center" },
            { name: "product", index: "product", width: 80, align: "center" },
            { name: "amount", index: "amount", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
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
          height: "94%",
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
