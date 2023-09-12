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
</head>
<body>
	<main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
      	<div class="search__options">
          <p class="filter__keyword">조회년도</p>
          <select class="filter__options">
            <option value="">option 1</option>
            <option value="">option 2</option>
          </select>
        </div>
        
      	<div class="search__options">
          <p class="filter__keyword">촬영구분</p>
          <select class="filter__options">
            <option value="">option 1</option>
            <option value="">option 2</option>
          </select>
        </div>
        
      	<div class="search__options">
          <p class="filter__keyword">촬영실</p>
          <select class="filter__options">
            <option value="">option 1</option>
            <option value="">option 2</option>
          </select>
        </div>
        <button class="all__btn img__btn search__btn">검색</button>
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
      $(document).ready(function () {
        $("#list1").jqGrid({
          url: "/stts/RIS1201Q01.do",
       	  reordercolNames:true,
          datatype: "json",
          colNames: ["촬영실", "촬영구분", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "합계"],
          colModel: [
            { name: "roomNm", index: "roomNm", width: 100, align: "center" },
            { name: "imgnNm", index: "imgnNm", width: 100, align: "center" },
            { name: "january", index: "january", width: 80, align: "center" },
            { name: "feburary", index: "feburary", width: 80, align: "center" },
            { name: "march", index: "march", width: 80, align: "center" },
            { name: "april", index: "april", width: 80, align: "center" },
            { name: "may", index: "may", width: 80, align: "center" },
            { name: "june", index: "june", width: 80, align: "center" },
            { name: "july", index: "july", width: 80, align: "center" },
            { name: "august", index: "august", width: 80, align: "center" },
            { name: "september", index: "september", width: 80, align: "center" },
            { name: "october", index: "october", width: 80, align: "center" },
            { name: "november", index: "november", width: 80, align: "center" },
            { name: "december", index: "december", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
          ],
          jsonReader: {
   		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
   		    root:'ris1201Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
   		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
   	      },
          autowidth: true,
          height: "94%",
          autoScroll: true,
          loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
  		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
  		  rowNum: 999999,
          rownumbers: true,
          sortname: "roomNm",
          sortorder: "asc",
          loadonce: true,
          viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
          loadComplete: function (data) {
            console.log(data);
          }, // loadComplete END
          onSelectRow: function (rowid) {
            var rowData = $("#list1").getRowData(rowid);
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
      
      
      // 차트
      var context1 = $('#chart1')[0].getContext('2d');
      var context2 = $('#chart2')[0].getContext('2d');
      
      var chart1 = new Chart(context1, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '1','2','3','4','5','6','7'
            ],
            datasets: [
                { //데이터
                    label: 'test1', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //경계선 굵기
                }
            ]
        },
        options: {
        	maintainAspectRatio: false,
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
      
    var chart2 = new Chart(context2, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '1','2','3','4','5','6','7'
            ],
            datasets: [
                { //데이터
                    label: 'test1', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //경계선 굵기
                }
            ]
        },
        options: {
        	maintainAspectRatio: false,
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
    </script>
</body>
</html>