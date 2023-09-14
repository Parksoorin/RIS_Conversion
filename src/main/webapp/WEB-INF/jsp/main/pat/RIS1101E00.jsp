<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>환자 정보 관리</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/pat/RIS1101E00.css" />
</head>
<body>
	<main class="main__container">
		<!-- 검색 -->
		<section class="search__container">
			<p class="filter__keyword">환자명 :</p>
			<input class="ptntInputClass" />
			<button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
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
					<div class="btn__container">
						<button class="all__btn img__btn fontawesome__btn update__icon">수정</button>
						<button class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
						<button class="all__btn img__btn fontawesome__btn save__icon">저장</button>
					</div>
				</div>

				<!-- 그리드 -->
				<div class="twoGrid__box">
					<table class="tableClass">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<th class="thNeed">환자ID</th>
							<td><input type="text" id="ptntIdInput" class="tdInputClass"
								placeholder="test" maxlength="20"
								style="width: 85%; height: 34%;" readonly="readonly"
								disabled="disabled" /></td>
							<td colspan="2">
								<button class="all__btn text__btn">중복확인</button>
							</td>
						</tr>
						<tr>
							<th class="thNeed">환자명</th>
							<td><input type="text" class="tdInputClass"
								placeholder="test" maxlength="100"
								style="width: 85%; height: 50%;" readonly="r eadonly"
								disabled="disabled" /></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>영문 명</th>
							<td><input type="text" value="HONG" maxlength="20"
								style="width: 85%;" readonly="readonly" disabled="disabled" />
							</td>
							<td><input type="text" value="GIL" maxlength="20"
								style="width: 85%;" readonly="readonly" disabled="disabled" />
							</td>
							<td><input type="text" value="DONG" maxlength="20"
								style="width: 85%;" readonly="readonly" disabled="disabled" />
							</td>
						</tr>
						<tr>
							<th class="thNeed">생년월일</th>
							<td colspan="3"><input type="date" class="dateClass"
								value="2023-09-07" style="width: 28%; height: 50%;"
								readonly="readonly" disabled="disabled" /></td>
						</tr>
						<tr>
							<th class="thNeed">성별</th>
							<td colspan="3"><label><input type="radio"
									name="MF_btn" value="M" onclick="return false">남</label> <label><input
									type="radio" name="MF_btn" value="F" onclick="return false">여</label>

							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td colspan="3"><input id="inputNumId" class="tdInputClass"
								type="text" placeholder="'-'를 제외하고 입력해주세요."
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								maxlength="11" style="width: 28%; height: 50%;"
								readonly="readonly" disabled="disabled" /></td>
						</tr>
						<tr>
							<th class="thNeed">국가</th>
							<td colspan="3"><select style="width: 28%;"
								disabled="disabled">
									<option value="KOR">대한한국</option>
									<option value="USA">미국</option>
									<option value="JPN">일본</option>
									<option value="CHN">중국</option>
									<option value="VNM">베트남</option>
									<option value="PHL">필리핀</option>
									<option value="PER">페루</option>
									<option value="PAK">파키스탄</option>

							</select></td>
						</tr>
						<tr>
							<th>참고내용</th>
							<td colspan="3"><textarea rows="4"
									style="width: 95%; resize: none;" maxlength="999"
									readonly="readonly" disabled="disabled"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</main>

	<script>
		document.getElementById("inputNumId").value = "01012345678";
		
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
		
		$(document).ready(function() {
			$("#list1").jqGrid({
				url: "/pat/RIS1101E00.do",
				reordercolNames:true,
				postData : { type: 'A' },
				mtype:'POST',
				datatype : "json",
				colNames : [ "환자ID", "환자명", "성별", "나이", "생년월일" ],
				colModel : [ 
					{ name : "ptntId", index : "ptntId", width : 90, align : "center" }, 
					{ name : "ptntKrNm",index : "ptntKrNm", width : 100, align : "center" }, 
					{ name : "gndrDvsn", index : "gndrDvsn", width : 150, align : "center",}, 
					{ name : "brth", index : "brth", width : 80, align : "center", 
						formatter: function (cellvalue, options, rowObject) {
				            // 나이를 계산하여 표시
				            var age = calculateAge(cellvalue);
				            return age;
				        }
					}, 
					{ name : "brth", index : "brth", width : 80, align : "center" }, 
				],
				jsonReader: {
	     		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     		    root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
	     	      },

				autowidth : true,
				height : "68%",
				rownumbers : true,
				multiselect : false,
				sortname : "id",
				sortorder : "asc",
				gridview : true, // 선표시 true/false
				viewsortcols : [ true,
						"vertical", true ],
				loadComplete : function(data) {
					console.log(data);
				}, // loadComplete END
				
				onSelectRow : function(rowid) {
					
					console.log("rowId :", rowid);
					
					// 선택한 rowId의 데이터 가져오기
					var selectRowData = jQuery("#list1").getRowData(rowid);
					console.log("selectRowData :", selectRowData)
					
					/*
					var allData = jQuery("#list1").getRowData();
					console.log("allData :" ,allData)
					*/
					
					jQuery.ajax({
						type: 'POST',
						url : "/pat/RIS1101E00Detail.do",
						data : JSON.stringify(selectRowData),
						contentType: "application/json; charset=utf-8",
						dataType: 'json',
						
						success : function (result) {
							const { ptntId, ptntKrNm, ptntEnglNmF, ptntEnglNmM, ptntEnglNmL, brth, gndrDvsn, mobl, ntilCd, ptntNoteText } = result.rows
							
							document.getElementById("ptntIdInput").value = ptntId;
							
							
							console.log(result);
						},
						error : function (error) {
							console.log(error);
						}
					});
				},
				
				onSortCol : function(index,
						idxcol, sortorder) {
					// 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
					// (화살표 css 변경하기 전 Frozen을 풀어주고)
					$("#list1").jqGrid("destroyFrozenColumns");
					var $icons = $(this.grid.headers[idxcol].el).find(">div.ui-jqgrid-sortable>span.s-ico");
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
