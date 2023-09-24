<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처방 정보 관리</title>
<link rel="stylesheet" href="/css/jubsu/RIS1201E03.css" />
</head>
<body>
	<main class="main__container">
		<!-- 검색 -->
		<section class="search__container">

			<input type="date" class="inputDateClass" />
			<p class="inputBetween">~</p>
			<input type="date" class="inputDateClass" />
			<p class="ptntNm">환자명</p>
			<input type="text" class="ptntNmInputClass" />

			<button onclick="openPopup()" class="all__btn fontawesome__btn list__icon icon_margin"></button>
			<button class="all__btn img__btn fontawesome__btn search__icon"></button>

		</section>

		<div class="grid__container main__container-twoGrid">
			<div class="twoGrid__container recipeGrid">
				<!-- 그리드 타이틀 -->
				<div class="grid__title">
					<p>처방 목록</p>

				</div>
				<!-- 그리드 -->
				<div class="twoGrid__box">
					<section class="grid__box">
						<!-- 그리드 -->
						<table id="list1" class="grid1"></table>
					</section>
				</div>
			</div>

			<div class="threeGrid__container ptntGrid">
				<div class="twoGrid__container threeGrid__container-subcontainer">
					<!-- 그리드 타이틀 -->
					<div class="grid__title">
						<p>환자 기본정보</p>

						<!-- 버튼 컨테이너 -->
						<div class="btn__container">

							<button class="all__btn img__btn fontawesome__btn update__icon">수정</button>
							<button class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
							<button class="all__btn img__btn fontawesome__btn circlePlus__icon">처방추가</button>
							<button class="all__btn img__btn fontawesome__btn save__icon">저장</button>

						</div>
					</div>
					<!-- 그리드 -->
					<div class="twoGrid__box threeGrid__box">
						<section class="grid__box">
							<!-- 그리드 -->
							<div class="twoGrid__box tableBackground">
								<table class="tableClass">
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody class="tbodyClass">
										<tr>
											<th class="thNeed">환자명</th>
											<td><input type="text" class="tableInput"
												disabled="disabled" /></td>
											<th class="thNeed">환자ID</th>
											<td><input type="text" class="tableInput"
												disabled="disabled" /></td>
										</tr>

										<tr>
											<th class="thNeed">처방일</th>
											<td><input type="date" class="tableInput"
												disabled="disabled" /></td>
											<th class="thNeed">내원구분</th>
											<td><select class="selectClass" disabled="disabled">
													<option>외래</option>
													<option>입원</option>
													<option>응급</option>
													<option>검진</option>
											</select></td>
										</tr>

										<tr>
											<th class="thNeed">진료과</th>
											<td><select class="selectClass" disabled="disabled">
													<option>선택</option>
													<option>내과</option>
													<option>정형외과</option>
											</select></td>
											<th class="thNeed">의사정보</th>
											<td><select class="selectClass" disabled="disabled">
													<option>의사정보</option>
													<option>이동준</option>
											</select></td>
										</tr>

										<tr>
											<th>희망일</th>
											<td><input type="date" class="tableInput"
												disabled="disabled" /></td>
											<th>병동/병실</th>
											<td class="tdDisplay"><input type="text"
												class="disuniteInput" disabled="disabled" /> / <input
												type="text" class="disuniteInput" disabled="disabled" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>
					</div>
				</div>

				<div class="twoGrid__container threeGrid__container-subcontainer">
					<!-- 그리드 타이틀 -->
					<div class="grid__title">
						<p>처방 정보 상세</p>
					</div>

					<!-- 그리드 -->
					<div class="twoGrid__box threeGrid__box">
						<section class="grid__box">
							<!-- 그리드 -->
							<table id="list3" class="grid1"></table>
						</section>
					</div>
				</div>
			</div>
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
 			url: "/jubsu/RIS1201E03.do",    
 			reordercolNames:true,
 			postData : { type: 'A' },
 			mtype:'POST',
          	datatype: "json",
          	colNames: ["처방일", "환자ID", "환자명", "성별", "나이", "진료과", "처방의사", "병동", "병실" ],
          	colModel: [
            	{ name: "ordrDate", index: "ordrDate", width: 120, align: "center" },
            	{ name: "ptntId", index: "ptntId", width: 120, align: "center" },
	            { name: "ptntNm", 	index: "ptntNm", width: 80, align: "center" },
	            { name: "gndrDvsn", index: "gndrDvsn", width: 50, align: "center" },
	            { name: "brth", index: "brth", width: 50, align: "center",
	            	formatter: function (cellvalue, options, rowObject) {
			            // 나이를 계산하여 표시
			            var age = calculateAge(cellvalue);
			            return age;
			        }
	            },
	            { name: "trtmDprtCd", index: "trtmDprtCd", width: 80, align: "center" },
	            { name: "mddlKrNm", index: "mddlKrNm", width: 80, align: "center" },
	            { name: "wardCd", index: "wardCd", width: 50, align: "center" },
	            { name: "unitCd", index: "unitCd", width: 50, align: "center" },
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
        
        $("#list3").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["V", "촬영코드", "촬영명", "FIND", "참고내용", "수납", "이동촬영", "응급", "DC", "재촬영"],
          colModel: [
            { name: "date", index: "date", width: 90, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
            { name: "id", index: "id", width: 150, align: "center" },
            { name: "product", index: "product", width: 80, align: "center" },
            { name: "amount", index: "amount", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "85%",
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
      
      
   // 팝업 열기
      function openPopup() {
          // 팝업 창에 표시할 URL
          var url = "/popup/RIS1201E03_POP.do";

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