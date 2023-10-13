<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>촬영실별 통계</title>
<link rel="stylesheet" href="/css/stts/RIS1201Q01.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
</head>
<body>
	<main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
      	<div class="search__options">
          <p class="filter__keyword">조회년도</p>
          <select id="selectYear" class="filter__options filter__year">
            <option value="2023">2023</option>
            <option value="2022">2022</option>
            <option value="2021">2021</option>
            <option value="2020">2020</option>
            <option value="2019">2019</option>
            <option value="2018">2018</option>
            <option value="2017">2017</option>
            <option value="2016">2016</option>
          </select>
        </div>
        
      	<div class="search__options">
          <p class="filter__keyword">촬영구분</p>
          <select id="selectDvsn" class="filter__options">
            <c:forEach items="${risDvsnList}" var="data">
           	  <option value="${data.mddlCd}">${data.mddlKrNm}</option>
           	</c:forEach>
          </select>
        </div>
        
      	<div class="search__options">
          <p class="filter__keyword">촬영실</p>
          <select id="selectRoom" class="filter__options">
            <c:forEach items="${risRoomList}" var="data">
           	  <option value="${data.mddlCd}">${data.mddlKrNm}</option>
           	</c:forEach>
          </select>
        </div>
        <button id="downloadExcel" class="all__btn fontawesome__btn download__icon"></button>
      </section>
		
	  <section class="grid__section">
	      <!-- 그리드 -->
	      <div class="grid__container grid__container-chart">
	        <section class="grid__box">
	          <!-- 그리드 -->
	          <table id="list1" class="grid1"></table>
	        </section>
	      </div>
      </section>
      
      <section class="chart__section">
      	<div class="chart__box1">
      	  <canvas id="chart1"></canvas>
      	</div>
      	<div class="chart__box2">
          <canvas id="chart2"></canvas>
        </div>
      </section>
    </main>
    
    <script>
	  var months = ["january","february","march","april","may","june","july","august","september","october","november","december"];
	  var chart1 = null;
	  var chart2 = null;
	  
	  function drawGrid() {
	    var year = $("#selectYear").val();
	    var dvsn = $("#selectDvsn").val();
	    var room = $("#selectRoom").val();
    	
    	$("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
        $("#list1").jqGrid({
          url: "/stts/getDvsnSttsList.do",
       	  reordercolNames:true,
          postData : { 
	      	  year: year,
	      	  dvsn: dvsn,
	      	  room: room
		  }, // 보낼 파라미터
	      mtype:'POST',	// 전송 타입
          datatype: "json",
          colNames: [
        	  "촬영실", "촬영구분", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "합계",
        	  "1Last", "2Last", "3Last", "4Last", "5Last", "6Last", "7Last", "8Last", "9Last", "10Last", "11Last", "12Last","전년"
          ],
          colModel: [
            { name: "roomNm", 				index: "roomNm", 				width: 100, 	align: "center", sortable: false },
            { name: "dvsnNm", 				index: "dvsnNm", 				width: 200, 	align: "center", sortable: false },
            { name: "january", 				index: "january", 				width: 50, 		align: "center", sortable: false },
            { name: "february", 			index: "february", 				width: 50, 		align: "center", sortable: false },
            { name: "march", 				index: "march", 				width: 50, 		align: "center", sortable: false },
            { name: "april", 				index: "april", 				width: 50, 		align: "center", sortable: false },
            { name: "may", 					index: "may", 					width: 50, 		align: "center", sortable: false },
            { name: "june", 				index: "june", 					width: 50, 		align: "center", sortable: false },
            { name: "july", 				index: "july", 					width: 50, 		align: "center", sortable: false },
            { name: "august", 				index: "august", 				width: 50, 		align: "center", sortable: false },
            { name: "september", 			index: "september", 			width: 50, 		align: "center", sortable: false },
            { name: "october", 				index: "october", 				width: 50, 		align: "center", sortable: false },
            { name: "november", 			index: "november", 				width: 50, 		align: "center", sortable: false },
            { name: "december", 			index: "december", 				width: 50, 		align: "center", sortable: false },
            { name: "total", 				index: "total", 				width: 50, 		align: "center", sortable: false },
            { name: "januaryLastYear", 		index: "januaryLastYear", 		hidden: true },
            { name: "februaryLastYear", 	index: "februaryLastYear", 		hidden: true },
            { name: "marchLastYear", 		index: "marchLastYear", 		hidden: true },
            { name: "aprilLastYear", 		index: "aprilLastYear", 		hidden: true },
            { name: "mayLastYear", 			index: "mayLastYear", 			hidden: true },
            { name: "juneLastYear", 		index: "juneLastYear", 			hidden: true },
            { name: "julyLastYear", 		index: "julyLastYear", 			hidden: true },
            { name: "augustLastYear", 		index: "augustLastYear", 		hidden: true },
            { name: "septemberLastYear", 	index: "septemberLastYear", 	hidden: true },
            { name: "octoberLastYear", 		index: "octoberLastYear", 		hidden: true },
            { name: "novemberLastYear", 	index: "novemberLastYear", 		hidden: true },
            { name: "decemberLastYear", 	index: "decemberLastYear", 		hidden: true },
            { name: "totalLastYear", 		index: "totalLastYear", 		width: 50, 		align: "center", sortable: false }
          ],
          jsonReader: {
   		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
   		    root:'ris1201Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
   		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
   	      },
          autowidth: true,
          height: "94%",
          scroll: true,
          loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때   
  		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
  		  rowNum: 999999,
          rownumbers: true,
          //sortname: "roomNm",
          // sortorder: "asc",
          loadonce: true,
          // viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
          loadComplete: function (data) {
            console.log(data);
            var emptyRecord = '<div class="ui-state-default ui-state-active empty-state" id="load_list1">데이터가 존재하지 않습니다.</div>';
            if (data.ris1201Data.length === 0) {
            	console.log("empty");
            	$(".ui-jqgrid-bdiv").append(emptyRecord);
            }
          }, // loadComplete END
          rowattr: function(rowData, currentObj, rowId) {
              // "소 계"인 행의 배경색 설정
              /* if (rowData.dvsnNm === "소 계") {
                  return {'style': 'background-color: #ccc;'};
              } else if (rowData.roomNm === "총 합") {
            	  return {'style': 'background-color: #999;'};
              }
              
              // 스타일을 지정하지 않는 경우 빈 객체를 반환합니다.
              return {}; */
          },
          onSelectRow: function (rowid) {
            var rowData = $("#list1").getRowData(rowid);
            var year = $("#selectYear").val();
            var lastYear = year - 1;
            var monthlyData = [];
            var lastMonthlyData = [];
            var totalData = {};
            var lastTotalData = {};
            
            for (month of months) {
            	var monthValue = parseInt(rowData[month]);
            	monthlyData.push(monthValue);
            	var lastMonthValue = parseInt(rowData[month + "LastYear"]);
            	lastMonthlyData.push(lastMonthValue);
            }
            
            totalData[year] = parseInt(rowData["total"]);
            lastTotalData[lastYear] = parseInt(rowData["totalLastYear"]);
            
            if (chart1) {
	           	chart1.destroy();
            }
            
            if (chart2) {
	           	chart2.destroy();
            }
            
            var context1 = $('#chart1')[0].getContext('2d');
            var context2 = $('#chart2')[0].getContext('2d');
      	  
    		chart1 = new Chart(context1, {
    			type: 'line', // 차트의 형태
    			data: { // 차트에 들어갈 데이터
    				labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
       	            datasets: [
       	            	{ 
    	   	            	//데이터
    	   	                label: '올해 데이터',
    						data: monthlyData,
    						backgroundColor: 'rgba(255, 99, 132, 0.2)',
    						borderColor: 'rgba(255, 99, 132, 1)',
    						borderWidth: 1
    	   	            },
    	   	         	{ 
    	   	            	//데이터
    	   	                label: '전년도 데이터',
    						data: lastMonthlyData,
    						backgroundColor: 'rgba(54, 162, 235, 0.2)',
    						borderColor: 'rgba(54, 162, 235, 1)',
    						borderWidth: 1
    	   	            }
       	            ]
       	        },
       	        options: {
       	        	maintainAspectRatio: false, // 비율 유지 false, 부모 크기의 100%, 100%로 맞춤
       	        	elements: {
       	        		line: {
       	        			tension: 0.4,
       	        		}
       	        	},
       	            scales: {
       	            	xAxes: [{
       	            		offset: true, // true이면, 양쪽 가장자리에 추가 공간이 추가되고 축이 차트 영역에 맞게 조정
                			ticks: {
                				beginAtZero: true,
                			}
                		}],
       	                yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
       	                }]
       	            }
       	        }
       	    });
    		
    		var labels = [Object.keys(totalData)[0], Object.keys(lastTotalData)[0]];
      	    var values = [Object.values(totalData)[0], Object.values(lastTotalData)[0]];
    		
    		chart2 = new Chart(context2, {
    		    type: 'bar', // 차트의 형태
    		    data: { // 차트에 들어갈 데이터
    	            //x 축
    		        labels: [''],
    		        datasets: [
    		        	{
    		                label: labels[0],
    		                fill: false,
    		                data: [values[0]],
    		                backgroundColor: [
    		                	'rgba(255, 99, 132, 0.2)'
    		                ],
    		                borderColor: [
    		                	'rgba(255, 99, 132, 1)'
    		                ],
    		                borderWidth: 1
    		            },
    		            {
    		            	label: labels[1],
    		                fill: false,
    		                data: [values[1]],
    		                backgroundColor: [
    		                	'rgba(54, 162, 235, 0.2)'
    		                ],
    		                borderColor: [
    		                	'rgba(54, 162, 235, 1)'
    		                ],
    		                borderWidth: 1
    		            }
    		        ]
    		    },
    		    options: {
    		    	maintainAspectRatio: false,
    		        scales: {
       	                yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
       	                }]
    		        }
    		    }
    		});
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
	  
	  function resetPage() {
		  if (chart1) {
          	chart1.destroy();
          }
          
          if (chart2) {
          	chart2.destroy();
          }
          
    	  drawGrid();
	  }
      
      
      $(document).ready(function () {
    	  drawGrid();
      });
      
      $("#selectYear").change(function() {
    	  resetPage(); 
      });
      
      $("#selectDvsn").change(function() {
    	  resetPage(); 
      });
      
      $("#selectRoom").change(function() {
    	  resetPage(); 
      });

      $("#downloadExcel").click(function () {
   	    // jqGrid에서 데이터를 가져오는 코드를 작성합니다.
   	    var gridData = $("#list1").jqGrid("getGridParam", "data");
   	    var year = $("#selectYear").val();

   	    // 헤더를 정의합니다.
   	    var header = ["촬영실별 통계"]; // 제목 행
   	    var columnHeader = ["촬영실", "촬영구분", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월", "합계", "전년"];

   	    // 데이터를 CSV 형식으로 생성합니다.
   	    var csvData = header.join(",") + "\n" + columnHeader.join(",") + "\n"; // 제목 행과 컬럼 제목 행 추가

   	    $.each(gridData, function (index, row) {
   	        var roomNm = row.roomNm;
   	        var dvsnNm = row.dvsnNm;
   	        var january = row.january;
   	        var february = row.february;
   	        var march = row.march;
   	        var april = row.april;
   	        var may = row.may;
   	        var june = row.june;
   	        var july = row.july;
   	        var august = row.august;
   	        var september = row.september;
   	        var october = row.october;
   	        var november = row.november;
   	        var december = row.december;
   	        var total = row.total;
   	        var totalLastYear = row.totalLastYear;

   	        csvData += [roomNm, dvsnNm, january, february, march, april, may, june, july, august, september, october, november, december, total, totalLastYear].join(",") + "\n";
   	    });

   	    // CSV 데이터를 XLSX 형식으로 변환
   	    var workbook = XLSX.utils.book_new();
   	    var ws_name = "DataSheet";
   	    var ws_data = XLSX.utils.aoa_to_sheet(csvData.split('\n').map(row => row.split(',')));

   	    // 제목 행 병합
   	    ws_data["!merges"] = [
   	        { s: { r: 0, c: 0 }, e: { r: 0, c: columnHeader.length - 1 } }
   	    ];
   	    
   		// 헤더(타이틀) 스타일 지정
   	    ws_data["A1"].s = {
		    font: { sz: 18, bold: true }, // 글꼴 크기와 굵게 설정
		    fill: { fgColor: { rgb: "FFFF00" } } // 배경색 지정 (노란색)
		};
   		
   		console.log(ws_data);

   	    XLSX.utils.book_append_sheet(workbook, ws_data, ws_name);

   	    // XLSX 파일 다운로드
   	    XLSX.writeFile(workbook, year + "년도_촬영실별통계.xlsx");
   	  });
    </script>
</body>
</html>