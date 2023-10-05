<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>예약 관리</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js" defer></script>
    <link rel="stylesheet" href="/css/appn/appnCommon.css">
    <style>
      .color-1{
        background: #005d92;
      }

      .twoGrid__box .appointment-detail-container{
        padding: 10px;
        color: #fff;
      }

      .appointment-detail-container textarea{
        margin-top: 10px;
        margin-bottom: 10px;
        width: 100%;
        height: 70px;
        overflow: auto;
        resize: none;
      }
      .mb-10{
        margin-bottom: 10px;
      }

    </style>
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword margin-10">조회일자 </p>
        <input id="date1" type="date" class="margin-10">
        <p class="margin-10"> ~ </p>
        <input id="date2" type="date" class="margin-10">
        <p class="filter__keyword margin-10">환자명 </p>
        <input id="ptntInput" type="text" class="margin-10">
        <button id="ptntListBtn" class="all__btn img__btn img__btn update__btn margin-10">찾기</button>
        <p class="filter__keyword margin-10">촬영구분환자명 </p>
        <select id="imagingDivision" class="margin-10">
          <!--  <option>전체</option> -->
            <c:forEach var="item" items="${imagingDivisionPatientList}">
            	<option value="${item.mddlCd}">${item.mddlKrNm}</option>
         	</c:forEach>
        </select>
        <p class="filter__keyword margin-10">촬영실 </p>
        <select id="imagingList" class="margin-10">
          <!--  <option>전체</option>  -->
          <c:forEach var="item" items="${imagingList}">
            	<option value="${item.mddlCd}">${item.mddlKrNm}</option>
         	</c:forEach>
        </select>
        <p class="filter__keyword margin-10">예약 여부 </p>
        <input type="radio" value="all" id="appointment-total" class="margin-10" name="appointment-gubun" checked>
        <label for="appointment-total" class="filter__keyword margin-10">전체 </label>
        <input type="radio" value="1" id="appointment-reserved" class="margin-10" name="appointment-gubun" >
        <label for="appointment-reserved" class="filter__keyword margin-10">예약 </label>
        <input type="radio" value="0" id="appointment-unreserved" class="margin-10" name="appointment-gubun" >
        <label for="appointment-unreserved" class="filter__keyword margin-10">미예약 </label>
 		<button class="all__btn img__btn img__btn update__btn margin-10">검색</button>
      </section>
      <!-- 그리드 -->
      <div class="grid__container height-40">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
    


      <div class="grid__container main__container-twoGrid height-45">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약 상세정보</p>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box color-1 appointment-detail-container">
               <div class="mb-10">
                    <label for="imaging">촬영실 : </label>
                    <select  id="imaging">
                      <option>처방을 선택하세요</option>
                    </select>
                </div>
                <div>처방참고내용</div>
                <div>
                  <textarea></textarea>
                </div>
                <div>예약참고내용</div>
                <div>  
                  <textarea></textarea>
                </div>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약일자</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <select  id="appointment-year">
                <option></option>
              </select>
              <label for="appointment-year">년  </label>
              <select  id="appointment-month">
                <option></option>
              </select>
              <label for="appointment-month">월  </label>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
               <!-- calendar 태그 -->
              <div id='calendar-container'>
                <div id='calendar'></div>
              </div>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          
            <div class="grid__title">
            <p></p>
         
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button class="all__btn img__btn save__btn">예약</button>
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

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p></p>
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button class="all__btn img__btn save__btn">취소</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list3" class="grid3"></table>
            </section>
          </div>
        </div>
      </div>
    </main>

    <script>
    
    
    const init = () => {
        dateInit();
      }

      // 날짜 처리 시작 -------------
      function getFirstAndLastDayOfMonth() {
        const today = new Date();
        const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        const lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        return {
          firstDay: formatDate(firstDayOfMonth),
          lastDay: formatDate(lastDayOfMonth)
        };
      }

      function formatDate(date) {
        console.log(date);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return year + '-' +month + '-' + day;
      }
      
    
    const dateInit = () =>{

        const { firstDay, lastDay } = getFirstAndLastDayOfMonth();
        $('#date1').val(firstDay);
        $('#date2').val(lastDay);
      }
      
    
    
    $('input[name="appointment-gubun"]').change(function() {
        checkedGubun = $('input[name="appointment-gubun"]:checked').val();
        console.log(checkedGubun);
        list1Data();
    });
    
    
    $('#date1').change(function() {
        list1Data();
    });
    $('#date2').change(function() {
        list1Data();
    });
    
    $('#ptntInput').keyup(function(){
    	 list1Data();
    });
    
    $('#imagingList').change(function(){
    	list1Data();
    });
    
    $('#imagingDivision').change(function() {
    	console.log($(this).val());
		const postData = {
				chrc1 : $(this).val(),
				hsptId : "A001"
		};
		 list1Data();
		
		$.ajax({
      	    url: '/appn/getImagingRoom.do',
      	    method: 'POST', 
      	    data: JSON.stringify(postData),
      	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
  			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
      	    success: function(response) {
      	    	console.log(response);
      	    	
      	    	var selectElement = document.querySelector("#imagingList");

                // Clear existing options
                selectElement.innerHTML = '<option value="%">전체</option>';

                // Populate options using the received JSON data
                response
                .imagingList
                .forEach(function (item) {
                    var option = document.createElement("option");
                    option.value = item.mddlCd;
                    option.textContent = item.mddlKrNm;
                    selectElement.appendChild(option);
                });
      	    	
      	    	
      	    },
      	    error: function(error) {
      	        console.error('Error ', error);
      	    }
      	});
    	
     });
    
    
    const list1Data = () => {
	    var postData  = {	
	    		'hsptId': 'A001',
            	'imgnRoomCd': $('#imagingList').val(),
            	'ordrBdypCd' : $('#imagingDivision').val(),	
                'ordrStartDate': $('#date1').val(),
                'ordrEndDate' : $('#date2').val(),
                'ptntKrNm' : $('#ptntInput').val(),
                "ptntId" : $('#ptntInput').val(),
                'ordrPrgrDvsn' : $('input[name="appointment-gubun"]:checked').val(),
       	};
	    console.log(postData);
		reloadGrid1('#list1', postData, '/appn/RIS1211E00/ris0211Search.do');
   
   }
    
    
    const reloadGrid1 = (list, postData, url) => {


        $(list).jqGrid("clearGridData", true);
        $(list).setGridParam({
      	
          datatype	: "json",
          url : url,
          mtype: "POST",
          contentType: 'application/json; charset=utf-8',
          postData	: JSON.stringify(postData),
          loadComplete	: function(data) {
            console.log(data);
          }
        }).trigger("reloadGrid");
    }
    
      $(document).ready(function () {
        var mydata=[];
        init();
        
        
        
        
        
        
        
        
     // 환자 리스트에서 환자를 선택했을 경우
		  // 하위 페이지에서 받은 데이터를 상위 페이지로 가져옴
		  window.addEventListener('message', function(event) {
			  // 선택한 페이지의 오리진 경로가 상위 페이지의 경로가 아닐 때
            if (event.origin !== window.location.origin) return;
			  
			  // 환자 리스트 팝업에서 선택한 데이터
            var selectedData = event.data;
             console.log(selectedData);
            
            // 환자정보 값 업데이트
            $("#ptntInput").val(selectedData.ptntId);
            //$("#ptntAge").val(selectedData.age + "세");
            
            //if (selectedData.gndrDvsn === "M") {
	         //     $("#ptntSex").val("남");              
            //} else {
          	//  $("#ptntSex").val("여");
            //}
            list1Data();
		    //drawGrid1();
        });
        
     // 환자 리스트 팝업 열기
  	  $("#ptntListBtn").click(function() {		  
  	      // 팝업 창에 표시할 URL
  	      var url = "/appn/RIS1211E00_POP.do";
  	
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
  	  });
  	  
        
        
        
        
        $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
        start: '', // 왼쪽 영역 숨기기
        center: '', // 중앙 영역 숨기기
        end: '' // 오른쪽 영역 숨기기
        },
        height: '97%', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        header: false, 
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        events: [
          {
            title: 'All Day Event',
            start: '2021-07-01',
          },
          {
            title: 'Long Event',
            start: '2021-07-07',
            end: '2021-07-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2021-07-11',
            end: '2021-07-13'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T10:30:00',
            end: '2021-07-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2021-07-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2021-07-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2021-07-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2021-07-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/', // 클릭시 해당 url로 이동
            start: '2021-07-28'
          }
        ]
      });
      // 캘린더 랜더링
      calendar.render();
    });

        $("#list1").jqGrid({
        	url: '/appn/RIS1211E00/ris0211Search.do',
        	mtype: "POST",
            datatype: "json",
            ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            postData : JSON.stringify({
            	'hsptId': 'A001',
            	'imgnRoomCd': $('#imagingList').val(),
            	'ordrBdypCd' : $('#imagingDivision').val(),	
                'ordrStartDate': $('#date1').val(),
                'ordrEndDate' : $('#date2').val(),
                'ptntKrNm' : $('#ptntInput').val(),
                "ptntId" : $('#ptntInput').val(),
                'ordrPrgrDvsn' : $('input[name="appointment-gubun"]:checked').val(),
            }),
          colNames: ["예약", "수납", "환자명", "처방일", "처방코드", "처방명", "진료과", "처방의사", "구분", "희망일", "희망시간", "예약일", "예약시간", "병원아이디-Hidden", "환자아이디-Hidden", "PK값-Hidden"],
          colModel: [
        	{ name: "appnYn", index: "appnYn", width: 90, align: "center"},
            { name: "pmntYn", index: "pmntYn", width: 90, align: "center"},
            {
              name: "ptntKrNm",
              index: "ptntKrNm",
              width: 60,
              align: "center"
            },
            { name: "ordrDate", index: "ordrDate", width: 60, align: "center" },
            { name: "ordrCd", index: "ordrCd", width: 60, align: "center" },
            { name: "ordrNm", index: "ordrNm", width: 80, align: "center" },
            { name: "appnTreatment", index: "appnTreatment", width: 80, align: "center"},
            { name: "docNm", index: "docNm", width: 80, align: "center" }, 
            { name: "gubun", index: "gubun", width: 80, align: "center"},
            { name: "dsrdDate", index: "dsrdDate", width: 80, align: "center"  },
            { name: "dsrdTime", index: "dsrdTime", width: 80, align: "center" },
            { name: "appnDate", index: "appnDate", width: 80, align: "center" },
            { name: "appnTime", index: "appnTime", width: 80, align: "center" },
            { name: "hsptId", index: "hsptId", width: 80, align: "center" , hidden: true },
            { name: "ptntId", index: "ptntId", width: 80, align: "center" , hidden: true },
            { name: "pkris1211", index: "pkris1211", width: 80, align: "center" , hidden: true },
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
          colNames: ["예약시간", "총인원", "외래", "입원", "건진" ],
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
       

        $("#list3").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["내원구분", "환자ID", "환자명"],
          colModel: [
            { name: "date", index: "date", width: 90, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
            { name: "product", index: "product", width: 80, align: "center" }
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
      });
    </script>
  </body>
</html>
