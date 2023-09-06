<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/patientSearch.css" />
</head>
<body>
	<main class="main__container">
		<!-- 검색 -->
		<section class="search__container">
			<p class="filter__keyword">검색어 :</p>
				<input />
			<button class="search__btn">검색</button>
		</section>

		<div class="grid__container main__container-twoGrid">
			<div class="twoGrid__container">
				<!-- 그리드 타이틀 -->
				<div class="grid__title">
					<p>환자정보 목록</p>
				</div>

				<!-- 그리드 -->
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
					<p>환자 상세정보</p>
				</div>

				<!-- 그리드 -->
				<div class="twoGrid__box">
					<table class="tableClass">
						<tr>
							<th>환자ID</th>
							<td>
								<input type="text" />
								
							</td>
						</tr>
						<tr>
							<th>환자명</th>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<th>영문 명</th>
							<td>
								<input type="text" />
								<input type="text" />
								<input type="text" />
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<th>성별</th>
							
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<th>국가</th>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<th>참고내용</th>
							<td>
								<input type="text" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</main>

	<script>
      $(document).ready(function () {
        var mydata = [
          {
            date: "2007-10-01",
            name: "test",
            id: "id",
            product: "상품1",
            amount: "10.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id9",
            product: "상품2",
            amount: "30.00",
          },
          {
            date: "2007-10-01",
            name: "test",
            id: "id10",
            product: "상품2",
            amount: "10.00",
          },
          {
            date: "2007-10-02",
            name: "test2",
            id: "id11",
            product: "상품2",
            amount: "20.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id12",
            product: "상품2",
            amount: "30.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id13",
            product: "상품2",
            amount: "10.00",
          },
          {
            date: "2007-10-05",
            name: "test2",
            id: "id14",
            product: "상품2",
            amount: "20.00",
          },
          {
            date: "2007-09-06",
            name: "test3",
            id: "id15",
            product: "상품2",
            amount: "30.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id16",
            product: "상품2",
            amount: "10.00",
          },
          {
            date: "2007-10-03",
            name: "test2",
            id: "id17",
            product: "상품2",
            amount: "20.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id18",
            product: "상품2",
            amount: "30.00",
          },
          {
            date: "2007-09-01",
            name: "test4",
            id: "id19",
            product: "상품2",
            amount: "30.00",
          },
        ];

        $("#list1").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["환자ID", "환자명", "성별", "나이", "생년월일"],
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
          ],
          
          autowidth: true,
          height: "68%",
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
      });
    </script>
</body>
</html>
