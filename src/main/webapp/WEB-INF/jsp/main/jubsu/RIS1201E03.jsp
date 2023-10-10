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

			<input type="date" id="startDateInput" class="inputDateClass" />
			<p class="inputBetween">~</p>
			<input type="date" id="endDateInput" class="inputDateClass" />
			<p class="ptntNm">환자명</p>
			<input type="text" id="inputKeyword" class="ptntNmInputClass" />

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

							<button id="inputUpdate" class="all__btn img__btn fontawesome__btn update__icon">수정</button>
							<button id="inputInsert" class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
							<button id="inputListPlus" class="all__btn img__btn fontawesome__btn circlePlus__icon">처방추가</button>
							<button id="ris1201DataSave" class="all__btn img__btn fontawesome__btn save__icon">저장</button>

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
											<td><input type="text" id="ptntKrNmInput" class="tableInput"
												disabled="disabled" /></td>
											<th class="thNeed">환자ID</th>
											<td><input type="text" id="ptntIdInput" class="tableInput"
												disabled="disabled" /></td>
										</tr>

										<tr>
											<th class="thNeed">처방일</th>
											<td><input type="date" id="ordrDateInput" class="tableInput"
												disabled="disabled" /></td>
											<th class="thNeed">내원구분</th>
											<td><select id="vistDvsnInput" class="selectClass" disabled="disabled">
													<option>외래</option>
													<option>입원</option>
													<option>응급</option>
													<option>검진</option>
											</select></td>
										</tr>

										<tr>
											<th class="thNeed">진료과</th>
											<td><select id="trtmDprtCdInput" class="selectClass" disabled="disabled">
													<option>선택</option>
													<option>내과</option>
													<option>정형외과</option>
											</select></td>
											<th class="thNeed">의사정보</th>
											<td><select id="mddlKrNmInput" class="selectClass" disabled="disabled">
													<option>의사정보</option>
													<option>이동준</option>
											</select></td>
										</tr>

										<tr>
											<th>희망일</th>
											<td><input type="date" id="dsrdDateInput" class="tableInput"
												disabled="disabled" /></td>
											<th>병동/병실</th>
											<td class="tdDisplay"><input type="text" id="wardCdInput"
												class="disuniteInput" disabled="disabled" /> / <input
												type="text" id="unitCdInput" class="disuniteInput" disabled="disabled" /></td>
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
	
		var mydata = [];		

      $(document).ready(function () {
    	$("#list1").jqGrid("GridUnload");
        $("#list1").jqGrid({
 			url: "/jubsu/RIS1201E03.do",    
 			reordercolNames:true,
 			postData : { type: 'A' },
 			mtype:'POST',
          	datatype: "json",
          	colNames: ["pk", "hsptId", "처방일", "환자ID", "환자명", "성별", "나이", "진료과", "처방의사", "병동", "병실" ],
          	colModel: [
            	{ name: "pkris1201", index: "pkris1201", width: 120, align: "center", hidden: true },
            	{ name: "hsptId", index: "hsptId", width: 120, align: "center", hidden: true },
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
	            { name: "trtmDprtCd", index: "trtmDprtCd", width: 80, align: "center",
	            	formatter: function (cellvalue, options, rowObject) {
	            		// trtmDprtCd의 값이 'IM'이면 내과, 'OS'이면 '외과'로 변환하기
	            		if (cellvalue === 'IM') {
	            			return '내과';
	            		} else if (cellvalue === 'OS') {
	            			return '정형외과';
	            		} else {
	            			return callvalue;
	            		}
	            	}	
	            },
	            { name: "mddlKrNm", index: "mddlKrNm", width: 80, align: "center" },
	            { name: "wardCd", index: "wardCd", width: 50, align: "center" },
	            { name: "unitCd", index: "unitCd", width: 50, align: "center" },
	          ],
          jsonReader: {
     		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
     		    root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
     		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
     	      },
          	guiStyle: "bootstrap",
          	autowidth: true,
          	height: "94%",
          	autoheight : true,
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
      	      
      	      	var selectRowData = jQuery("#list1").getRowData(rowid);
          		
      	      	// 환자 기본정보 데이터
      	      	$("#ptntKrNmInput").val(selectRowData.ptntNm);
              	$("#ptntIdInput").val(selectRowData.ptntId);
              	$("#ordrDateInput").val(selectRowData.ordrDate);
              	$("#vistDvsnInput").val(selectRowData.vistDvsn);
              	$("#trtmDprtCdInput").val(selectRowData.trtmDprtCd);
              	$("#mddlKrNmInput").val(selectRowData.mddlKrNm);
              	$("#dsrdDateInput").val(selectRowData.dsrdDate);
              	$("#wardCdInput").val(selectRowData.wardCd);
              	$("#unitCdInput").val(selectRowData.unitCd);
      	      
				console.log("list1selectRowData : ", selectRowData);
				
              	rislist(selectRowData);
              	
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

          console.log("popup : ", popup);
          
          // 팝업 창이 차단되었을 때 처리
          if (!popup || popup.closed || typeof popup.closed == 'undefined') {
              alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
          }
      }
   
   		function rislist(selectRowData) {
   		// list3 그리는 부분
    	jQuery.ajax({
			type: 'POST',
			url : "/jubsu/RIS1201E03Detail.do",
			data : JSON.stringify(selectRowData),
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
    		
			success : function (result) {
				
				console.log("list3 Data : ", result.rows);
				
				$("#list3").jqGrid("GridUnload");
				
				$("#list3").jqGrid({
		        	data: result.rows,
		          	datatype: "local",
		          	colNames: ["flag", "pk", "V", "촬영코드", "촬영명", "FIND", "참고내용", "수납", "이동촬영", "응급", "DC", "재촬영"],
		          	colModel: [
		          		{ name: "flag", index: "flag", width: 50, align: "center", hidden: true },
		          		{ name: "pkris1201", index: "pkris1201", width: 120, align: "center", hidden: true },
		            	{ name: "elctTrtmYn", index: "elctTrtmYn", width: 50, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } },
		            	{ name: "imgnCd", index: "imgnCd", width: 80, align: "center" },
		            	{ name: "ordrNm", index: "ordrNm", width: 250, align: "center", editable: true, edittype: "text"  },
		            	{ name: "exmnNoteText", index: "exmnNoteText", width: 70, align: "center" },
		            	{ name: "ordrNoteText", index: "ordrNoteText", width: 70, align: "center" },
		            	{ name: "pmntYn", index: "pmntYn", width: 50, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } },
		            	{ name: "prtbImgnYn", index: "prtbImgnYn", width: 70, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } },
		            	{ name: "emrgYn", index: "emrgYn", width: 50, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } },
		            	{ name: "dcYn", index: "dcYn", width: 50, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } },
		            	{ name: "retkYn", index: "retkYn", width: 50, align: "center", editable: true, // 편집 가능하도록 설정
		                    edittype: "checkbox", // 체크박스 형태로 설정
		                    editoptions: {
		                        value: "Y:N", // 체크박스 값 설정 (체크됐을 때와 체크 안됐을 때의 값)
		                        defaultValue: "N" // 기본값 설정 (체크 안됐을 때)
		                    } }, 
		          	],
		          	guiStyle: "bootstrap",
		          	autowidth: true,
		          	height: "85%",
		          	rownumbers: true,
		          	rowNum: 9999,
		          	multiselect: true,
		          	sortname: "id",
		          	sortorder: "asc",
		          	cellEdit: true,
		          	cellsubmit : 'clientArray',
		          	loadonce: true,
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
			},
			error : function (error) {
				console.log("error : ", error);
			}
		});
   
   		}
   
   
   
   // 검색 기능
  	const searchGrid = function(startDate, endDate, keyword, grid) {
	  	// searchGrid 함수는 검색어(value)와 데이터 그리드(grid)의 ID를 인수로 받고,
	  	// 데이터 그리드를 검색어로 필터링하고 새로 고침하는 역할을 한다.			
	  	$("#" + grid).jqGrid("setGridParam", {
	  		datatype: "json", 
	  		page: 1
	  	}).trigger("reloadGrid");
	  	// 파라미터를 설정하고, 새로고침하여 페이지를 1로 설정하고, 데이터 타입을 JSON으로 변경한다.
	  			
	  	$("#" + grid).jqGrid("setGridParam", {
	  	// beforeProcessing 은 데이터를 처리하기 전에 호출되며, 데이터 그리드를 필터링한다.
	  	beforeProcessing: function(data) {
  			var filteredData = [];
  					
  			for (var i = 0; i < data.rows.length; i++) {
  				var rowData = data.rows[i];
  				var matched = false;
  						
	  			// 검색어와 일치하는지 확인
	  			if(keyword) {
	  				for (var key in rowData) {
	  					var cellValue = rowData[key];
	  							
	  					if (cellValue && cellValue.toString().replace(/\s+/g, "").toLowerCase().includes(keyword)) {
	  						matched = true;
	  						break;
	  					}
	  				}
	  			} else {
	  				// 검색어가 비어 있을 때 모든 데이터를 포함
	  				matched = true;
	  			}
	  			
  				// 날짜 범위 내에 있는지 확인
                  if (startDate && endDate) {
                      var dateCellValue = rowData.ordrDate; // 날짜가 있는 열의 이름을 지정해야 합니다.
                      if (dateCellValue) {
                      	
                          var dateValue = new Date(dateCellValue);
                          
                          if (dateValue >= startDate && dateValue <= endDate) {
                        	  console.log(dateValue >= startDate, dateValue <= endDate);
                              matched = true;
                          } else {
                        	  matched = false;
                          }
                      }
                  } 
  			
		  			
		  			if (matched) {
  						filteredData.push(rowData);
  					}
  				}
  			
  			
  				data.rows = filteredData;
  			}
  		});	
  	};

  		
  	// date input 값 변경 이벤트 처리
  	$(".inputDateClass").on("change", function() {
  	    var startDate = new Date($("#startDateInput").val());
  	    var endDate = new Date($("#endDateInput").val());
  	    var keyword = $("#inputKeyword").val().replace(/\s+/g, "").toLowerCase();

  	    searchGrid(startDate, endDate, keyword, "list1");
  	});
  		
  	// list1 검색
  	$("#inputKeyword").on("input", function() {
  		var startDate = new Date($("#startDateInput").val());
  	    var endDate = new Date($("#endDateInput").val());
  	    var keyword = $(this).val().replace(/\s+/g, "").toLowerCase();

  	    searchGrid(startDate, endDate, keyword, "list1");
  	});
   
  	
 	// flag를 선언
	var flag;
	
  	// 수정 버튼 이벤트
  	document.getElementById("inputUpdate").addEventListener("click", function () {
  		
  		flag = "U";
  		
  		var listDatas = $("#list3").jqGrid("getRowData");
  		
  		// 모든 요소에 flag 속성 추가
  	  	for (var i = 0; i < listDatas.length; i++) {
  			listDatas[i].flag = flag;
  			var rowId = i + 1;
  			
  	  	$("#list3").jqGrid("setRowData", rowId, listDatas[i]);
  	  	}
  		
  		
  		
  		// 처방일
  		var ordrDateInputElement = document.getElementById("ordrDateInput");
  		// 내원구분
  		var vistDvsnInputElement = document.getElementById("vistDvsnInput");
  		// 진료과
  		var trtmDprtCdInputElement = document.getElementById("trtmDprtCdInput");
  		// 의사정보
  		var mddlKrNmInputElement = document.getElementById("mddlKrNmInput");
  		// 희망일
  		var dsrdDateInputElement = document.getElementById("dsrdDateInput");
  		// 병동,병실
  		var wardCdInputElement = document.getElementById("wardCdInput");
  		var unitCdInputElement = document.getElementById("unitCdInput");
  		
  		// disabled 해제
  		ordrDateInputElement.disabled = false;
  		vistDvsnInputElement.disabled = false;
  		trtmDprtCdInputElement.disabled = false;
  		mddlKrNmInputElement.disabled = false;
  		dsrdDateInputElement.disabled = false;
  		wardCdInputElement.disabled = false;
  		unitCdInputElement.disabled = false;
  		
  		
  		
  	});
  	
  	
  	// 입력 버튼 이벤트
  	document.getElementById("inputInsert").addEventListener("click", function () {
  		
  		flag = "I";
  		
  		// 환자명
  		var ptntKrNmInputElement = document.getElementById("ptntKrNmInput");
  		// 환자ID
  		var ptntIdInputElement = document.getElementById("ptntIdInput");
  		// 처방일
  		var ordrDateInputElement = document.getElementById("ordrDateInput");
  		// 내원구분
  		var vistDvsnInputElement = document.getElementById("vistDvsnInput");
  		// 진료과
  		var trtmDprtCdInputElement = document.getElementById("trtmDprtCdInput");
  		// 의사정보
  		var mddlKrNmInputElement = document.getElementById("mddlKrNmInput");
  		// 희망일
  		var dsrdDateInputElement = document.getElementById("dsrdDateInput");
  		// 병동,병실
  		var wardCdInputElement = document.getElementById("wardCdInput");
  		var unitCdInputElement = document.getElementById("unitCdInput");
  		
  		// disabled 해제
  		ptntKrNmInputElement.disabled = false;
  		ptntIdInputElement.disabled = false;
  		ordrDateInputElement.disabled = false;
  		vistDvsnInputElement.disabled = false;
  		trtmDprtCdInputElement.disabled = false;
  		mddlKrNmInputElement.disabled = false;
  		dsrdDateInputElement.disabled = false;
  		wardCdInputElement.disabled = false;
  		unitCdInputElement.disabled = false;
  		

  	});
  	
  	
  	// 처방추가 버튼 이벤트
	$("#inputListPlus").on("click", function () {

	    // 빈 객체 생성
	    var newRowData = {
	        elctTrtmYn: "", // 예시: 촬영 코드
	        imgnCd: "",    // 예시: 촬영명
	        ordrNm: "",    // 예시: FIND
	        exmnNoteText: "",
	        ordrNoteText: "",
	        pmntYn: "",
	        prtbImgnYn: "",
	        emrgYn: "",
	        dcYn: "",
	        retkYn: "",
	    };
	    
	    // list3 요소를 변수에 저장
	    var grid = $("#list3");
	    // list1 요소의 현재 선택된 행의 ID를 가져옴
	    var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");
	    // grid에서 선택한 행의 데이터를 가져온다.
	    var rowData = grid.jqGrid('getRowData', selectedRowId);
	    // 새 행을 추가하기 위한 새 행의 ID 계산
	    var newRowId = grid.jqGrid("getGridParam", "reccount") + 1;
	    // 생성한 객체에 flag 속성 추가 및 값 부여
	    newRowData.flag = 'I';
	    
	    // 그리드에 새 행 추가
	    // newRowId는 새 행의 ID, newRowData는 새 행의 데이터
	    // first는 새 행을 그리드의 맨 위에 추가하도록 지정
	    grid.jqGrid("addRowData", newRowId, newRowData, "first");
	    
	 	// 모든 컬럼을 가져옵니다.
	    var allColumns = grid.jqGrid('getGridParam', 'colModel');
	    
	    // errorCnt 컬럼을 제외하고 모든 컬럼을 편집 가능하게 설정합니다.
	    allColumns.forEach(function (column) {
	            grid.jqGrid('setColProp', column.name, { editable: true });
	    });
	    
	    // 선택한 행을 편집 모드로 진입
	    grid.jqGrid("editRow", newRowId, {
	    	// 엔터 키를 누를 때 저장되도록 설정
	    	keys: true,
	    });
	    
	    // 새로 추가한 행의 exmnNoteText 컬럼에 HTML 버튼을 추가한다.
	    // 버튼을 클릭하면 openPopUp() 함수가 호출되며 팝업 창이 열린다.
	    grid.jqGrid('setRowData', newRowId, { "exmnNoteText": '<button class="all__btn fontawesome__btn list__icon" onclick="openPopUp()"></button>' });
	    grid.jqGrid('setRowData', newRowId, { "ordrNoteText": '<button class="all__btn fontawesome__btn list__icon" onclick="openordrNoteTextPopUp()"></button>' });

	});

  	
  	
	// 처방정보 팝업 열기
    function openPopUp() {
        // 팝업 창에 표시할 URL
        var url = "/popup/RIS1201E03Detail_POP.do";

        console.log("url :", url);
        
        // 팝업 창의 크기와 위치 설정
        var width = 800;
        var height = 400;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;

        // 팝업 창을 열기
        var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

        console.log("popup : ", popup);
        
        // 팝업 창이 차단되었을 때 처리
        if (!popup || popup.closed || typeof popup.closed == 'undefined') {
            alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
        }
    }
	
	
	function openordrNoteTextPopUp() {
		// 팝업 창에 표시할 URL
        var url = "/popup/RIS1201E03ordrNoteTextDetail_POP.do";

        console.log("url :", url);
        
        // 팝업 창의 크기와 위치 설정
        var width = 800;
        var height = 400;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;

        // 팝업 창을 열기
        var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

        console.log("popup : ", popup);
        
        // 팝업 창이 차단되었을 때 처리
        if (!popup || popup.closed || typeof popup.closed == 'undefined') {
            alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
        }
	}
	
	
  	// 저장버튼 이벤트
  	document.getElementById("ris1201DataSave").addEventListener("click", function() {

  		// list3 데이터 가져오기
		var listDatas = $("#list3").jqGrid("getRowData");
 
		listDatas.forEach(listData =>{
			
			console.log("sendData :", JSON.stringify(listData))
		
		
			$.ajax({
				type: 'POST',
				url: "/jubsu/RIS1201E03UpdateInsert.do",
				data: JSON.stringify(listData),
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				success: function (result) {
					console.log("데이터 전송 성공: ", result);
				},
				error: function (error) {
		    		console.log("데이터 전송 실패: ", error);
		    	}
			});
		})
  	});




  	
		
    </script>
</body>
</html>