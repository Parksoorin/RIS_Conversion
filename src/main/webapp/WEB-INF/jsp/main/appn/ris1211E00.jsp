<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title><spring:message code="text_022" text="예약 관리" /></title>
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
        <p class="filter__keyword margin-10"><spring:message code="text_211" text="조회일자" /> </p>
        <input id="date1" type="date" class="margin-10">
        <p class="margin-10"> ~ </p>
        <input id="date2" type="date" class="margin-10">
        <p class="filter__keyword margin-10"><spring:message code="text_145" text="환자명" /> </p>
        <input id="ptntInput" type="text" class="margin-10">
        <button id="ptntListBtn" class="all__btn img__btn img__btn update__btn margin-10 tooltip"><spring:message code="text_142" text="찾기" />
        	<span class="tooltiptext tooltip-top">환자 번호를 팝업창으로 찾을 수 있습니다.</span>
        </button>
        <p class="filter__keyword margin-10"><spring:message code="text_100" text="촬영실구분환자명" /> </p>
        <select id="imagingDivision" class="margin-10">
          <!--  <option>전체</option> -->
            <c:forEach var="item" items="${imagingDivisionPatientList}">
            	<option value="${item.mddlCd}">${item.mddlKrNm}</option>
         	</c:forEach>
        </select>
        <p class="filter__keyword margin-10"><spring:message code="text_104" text="촬영실" /> </p>
        <select id="imagingList" class="margin-10">
          <!--  <option>전체</option>  -->
          <c:forEach var="item" items="${imagingList}">
            	<option value="${item.mddlCd}">${item.mddlKrNm}</option>
         	</c:forEach>
        </select>
        <p class="filter__keyword margin-10"><spring:message code="text_160" text="예약 여부" /></p>
        <input type="radio" value="all" id="appointment-total" class="margin-10" name="appointment-gubun" checked>
        <label for="appointment-total" class="filter__keyword margin-10"><spring:message code="text_161" text="전체" /> </label>
        <input type="radio" value="1" id="appointment-reserved" class="margin-10" name="appointment-gubun" >
        <label for="appointment-reserved" class="filter__keyword margin-10"><spring:message code="button_017" text="예약" /> </label>
        <input type="radio" value="0" id="appointment-unreserved" class="margin-10" name="appointment-gubun" >
        <label for="appointment-unreserved" class="filter__keyword margin-10"><spring:message code="text_162" text="미예약" /> </label>
 		<button class="all__btn img__btn img__btn update__btn margin-10 tooltip"><spring:message code="message_056" text="검색" />
 			<span class="tooltiptext tooltip-top">조회일자, 환자명, 촬영실, 예약여부를 입력받아 예약 현황을 조회할 수 있습니다.</span>
 		</button>
      </section>
      <!-- 그리드 -->
      <div class="grid__container height-35">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
    


      <div class="grid__container main__container-twoGrid height-58">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p><spring:message code="text_143" text="예약" /> <spring:message code="text_098" text="상세정보" /></p>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box color-1 appointment-detail-container">
               <div class="mb-10">
                    <label for="imaging"><spring:message code="text_104" text="촬영실" /> : </label>
                    <select  id="imaging" disabled>
                      <option><spring:message code="text_154" text="처방을 선택하세요" /></option>
                    </select>
                </div>
                <div><spring:message code="text_155" text="처방참고내용" /></div>
                <div>
                  <textarea id="ordrNoteText" disabled></textarea>
                </div>
                <div><spring:message code="text_156" text="예약참고내용" /></div>
                <div>  
                  <textarea id="appnNoteText" disabled></textarea>
                </div>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p><spring:message code="text_125" text="예약일자" /></p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <select  id="appointment-year" disabled>
                 <c:forEach var="item" items="${yearList}">
		          	<option value="${item}">${item}</option>
		          </c:forEach>
              </select>
              <label for="appointment-year">년  </label>
              <select  id="appointment-month" disabled>
                  <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
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
            <p id="appnDateText"></p>
         
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button id="appnBtn" class="all__btn img__btn save__btn tooltip"><spring:message code="button_017" text="예약" />
              	<span class="tooltiptext tooltip-top">환자 정보를 클릭 후 예약을 할 수 있습니다.</span>
              </button>
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
            <p id="appnTimeText"></p>
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button id="appnCancelBtn" class="all__btn img__btn save__btn tooltip"><spring:message code="button_004" text="취소" />
              	<span class="tooltiptext tooltip-top">환자 정보를 클릭 후 예약을 취소할 수 있습니다.</span>
              </button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list3" class="grid1"></table>
            </section>
          </div>
        </div>
      </div>
    </main>

    <script>
    
    let externalChangeCalendar = null;
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
    
    
    
    
    $('#appnBtn').click(function(){
    	
    	    console.log('예약적용버튼 눌림');
	  		
    		var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
    		var selectedRowId2 = $("#list2").jqGrid('getGridParam', 'selrow');
        	
    		if(!selectedRowId){
		  		alert('예약할 처방을 선택해주세요');
		  		return;
		  	}
    		
    		if(!selectedRowId2){
		  		alert('예약할 시간을 선택해주세요');
		  		return;
		  	}
    		
    		
    		
    	    let data = $("#list1").jqGrid("getRowData",selectedRowId );	// 처방 정보 데이터
		  	let data2 = $("#list2").jqGrid("getRowData",selectedRowId2); // 리스트2 예약 시간 데이터
    	    console.log(data);
		  	//console.log(selectedRowId);
		  	console.log(data2);
		  	
		  	var date1 = new Date(data.ordrDate);
		  	var date2 = new Date(data2.exmnDate);
		  	
		  	if(date1>date2){
		  		alert('예약일이 처방일보다 먼저입니다. 다른 날짜를 선택해주세요');
		  		return;
		  	}

		  	if(data.appnDate){
		  		if(!confirm('이미 예약이 생성된 처방입니다. 예약을 변경하시겠습니까?')){
		  			return;
		  		}
		  	}
		  	
		  	console.log('서버실행 ');
    	    
    	   
		  const postData = {
				  'appnNoteText'	:  $('#appnNoteText').val(),	
					'appnDate'	:	data2.exmnDate,
					'appnTime'	:	data2.strtTime + ":00",
					'hsptId'	:	data.hsptId,
					'pkris1211'	:	data.pkris1211
		  };
		  
		  console.log(postData);
		  
		  $.ajax({
      	    url: '/appn/RIS1211E00/ris0211Update.do',
        	    method: 'POST', 
        	    data: JSON.stringify(postData),
        	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        	    success: function(response) {
        	    	console.log('Success', response);
        	    	alert('예약되었습니다');
       				list1Data();
       				list2Data(data2.exmnDate, data.imgnRoomCd);
       				list3Data(data2.exmnDate, data2.strtTime + ":00", data.imgnRoomCd);
       	    		externalChangeCalendar();
        	    	 
        	    },
        	    error: function(error) {
        	        console.error('Error ', error);
        	    }
		  
	  		})
	  		
	  })
	  $('#appnCancelBtn').click(function(){
		  
		  console.log('예약취소버튼 눌림');
		  
		  var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
      	
  		if(!selectedRowId){
		  		alert('취소할 예약을 선택해주세요');
		  		return;
		 	}
  		
  	
  		
  		
  		
  	    let data = $("#list1").jqGrid("getRowData",selectedRowId );	// 처방 정보 데이터
		console.log(data);
		  	
		  	if(!data.appnDate){
		  		alert('예약이 안된 처방입니다.');
		  		return;
		  	}

		
		  	if(!confirm('예약을 정말 취소하시겠습니까?')){
		  			return;
		  	}
		  	
		  	console.log('서버실행 ');
  	    
  	   
		  const postData = {
				  'appnNoteText'	:  null,	
					'appnDate'	:	null,
					'appnTime'	:	null,
					'hsptId'	:	data.hsptId,
					'pkris1211'	:	data.pkris1211
		  };
		  
		  console.log(postData);
		  
		  $.ajax({
    	    url: '/appn/RIS1211E00/ris0211Update.do',
      	    method: 'POST', 
      	    data: JSON.stringify(postData),
      	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
  			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
      	    success: function(response) {
      	    	console.log('Success', response);
      	    	alert('예약이 취소되었습니다.');
     				list1Data();
     				list2Data(data.appnDate, data.imgnRoomCd);
     				list3Data(data.appnDate, data.appnTime, data.imgnRoomCd);
     	    		externalChangeCalendar();
      	    	 
      	    },
      	    error: function(error) {
      	        console.error('Error ', error);
      	    }
		  
	  		})
		  
		  
		  
		  
	  })
	  
    
    
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
    
    const list2Data = (date, imgnRoomCd) => {
	    var postData  = {	
	    	
	    		'hsptId' : 'A001',
	    		'imgnRoomCd' : imgnRoomCd || $('#imaging').val(),
	    		'date' : date
      	};
		reloadGrid1('#list2', postData, '/appn/RIS1211E00/ris0211List2Search.do');
  
  	}
   
    const list3Data = (date, time, imgnRoomCd) => {
	    var postData  = {	
	    		'hsptId' : 'A001',
	    		'imgnRoomCd' : imgnRoomCd || $('#imaging').val(),
	    		'appnDate' : date,
	    		'appnTime' : time
      	};
		reloadGrid1('#list3', postData, '/appn/RIS1211E00/ris0211List3Search.do');
  
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
  
    
 // 총인원을 계산하는 함수
    function calculateTotal(cellValue, options, rowObject) {
      var outpatient = parseInt(rowObject.appnOutpPssbCnt) || 0;
      var inpatient = parseInt(rowObject.appnInptPssbCnt) || 0;
      var emergency = parseInt(rowObject.appnHlxmPssbCnt) || 0;

      var total = outpatient + inpatient + emergency;
      
      return rowObject.appnSum + "/" + total;
    }
 
 
    function outpTotal(cellValue, options, rowObject) {
        var outpatient = parseInt(rowObject.appnOutpPssbCnt) || 0;   
        return rowObject.outpCnt + "/" + outpatient;
      }
      
    function inptTotal(cellValue, options, rowObject) {
        var inpatient = parseInt(rowObject.appnInptPssbCnt) || 0;   
        return rowObject.inptCnt + "/" + inpatient;
      }
    
    function hlxmTotal(cellValue, options, rowObject) {
        var emergency = parseInt(rowObject.appnHlxmPssbCnt) || 0;   
        return rowObject.hlxmCnt + "/" + emergency;
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
        height: '100%', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        header: false, 
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
 //       initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 수정 가능?
        selectable: false, // 달력 일자 드래그 설정가능
        nowIndicator: false, // 현재 시간 마크
        disableDragging: true,
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        // locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        dateClick: function(info) {
      	  //alert('Clicked on: ' + info.dateStr);
      	  //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
      	  //alert('Current view: ' + info.view.type);
			  console.log('aaa');
			  //list3Date = info.dateStr;
			  console.log(info); // info.dateStr   '2023-09-13'
			  list2Data(info.dateStr, "");
	    	
			  
			  $("#appnDateText").text(info.dateStr);
	            $("#appnTimeText").text('');
			  //list3Data(info.dateStr);
      		  
		},
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
         // var title = prompt('Event Title:');
         // if (title) {
         //   calendar.addEvent({
          //    title: title,
          //    start: arg.start,
          //    end: arg.end,
          //    allDay: arg.allDay
          //  })
          //}
          //calendar.unselect()
        },
        
        
        
      });
        
      // 캘린더 랜더링
      
      $("#appointment-year").change(function(){
			  changeCalendar();
		  });
      
	      $("#appointment-month").change(function(){
	    	  changeCalendar();
	      });
	      
	      $('#imaging').change(function() {
	    	  changeCalendar();
	       });
	      
	      const changeCalendar = () => {
	    	  let year = $("#appointment-year").val();
			  let month = $("#appointment-month").val();
			  if(month.length===1){
				  month = '0' + month;
			  }
			  let firstDayOfMonth = year + '-' + month + '-01';
			  console.log(firstDayOfMonth);
			  calendar.gotoDate(firstDayOfMonth);
			  
			  let lastDayOfMonth = new Date(year, month, 0);
			  lastDayOfMonth = year + '-' + month + '-' + lastDayOfMonth.getDate();
			  console.log('월말:', lastDayOfMonth);
			  
			  const postData = {
					  imgnRoomCd : $('#imaging').val(),
					  hsptId : 'A001',
					  startDate : firstDayOfMonth,
					  endDate : lastDayOfMonth
			  }
			  
			  
			  $.ajax({
	        	    url: '/appn/RIS0201E00/risappnCalSearch.do',
	        	    method: 'POST', 
	        	    data: JSON.stringify(postData),
	        	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
	    			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
	        	    success: function(response) {
	        	    	calendar.removeAllEvents();
	        	    	console.log(response);
	        	    	response.forEach(data => {
	        	    		const obj = {
	        	    				title: data.appnCnt + ' / ' + data.total,
	        	    	            start: data.exmnDate
	        	    		}

        	    			console.log(data.appnHoliDate);
	        	    		if(data.appnHoliDate){
	        	    			obj.title = '0 / 0';
	        	    			obj.backgroundColor = 'yellow';
	        	    			obj.borderColor = 'yellow';
	        	    			obj.textColor = 'black';
	        	    		}
	        	    		calendar.addEvent(obj);
	        	    	});
	        	    	
	        	    	console.log(response);
	        	    	//calendar.render();
	        	    	
	        	    },
	        	    error: function(error) {
	        	        console.error('Error ', error);
	        	    }
	        	});
	      }
	      externalChangeCalendar = changeCalendar;
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
          colNames: ["예약", "수납", "환자명", "처방일", "처방코드", "처방명", "진료과", "처방의사", "구분", "희망일", "희망시간", "예약일", "예약시간", "병원아이디-Hidden", "환자아이디-Hidden", "PK값-Hidden", "예약참고내용-Hidden","처방참고내용-Hidden", "촬영환자구분명-Hidden", "촬영실-Hidden"],
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
            { name: "appnNoteText", index: "appnNoteText", width: 80, align: "center" , hidden: true },
            { name: "ordrNoteText", index: "ordrNoteText", width: 80, align: "center" , hidden: true },
            { name: "ordrBdypCd", index: "ordrBdypCd", width: 80, align: "center" , hidden: true },
            { name: "imgnRoomCd", index: "imgnRoomCd", width: 80, align: "center" , hidden: true },
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
        	  console.log('================================');
                
            console.log(rowid);
            let data = $("#list1").jqGrid("getRowData",rowid );
            console.log(data);
            
            
            const postData = {
    				chrc1 : data.ordrBdypCd,
    				hsptId : "A001"
    		};
    		
    		$.ajax({
          	    url: '/appn/getImagingRoom.do',
          	    method: 'POST', 
          	    data: JSON.stringify(postData),
          	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
      			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
          	    success: function(response) {
          	    	console.log(response);
          	    	
          	    	var selectElement = document.querySelector("#imaging");
          	    	selectElement.innerHTML = '';
                    // Populate options using the received JSON data
                    response
                    .imagingList
                    .forEach(function (item) {
                        var option = document.createElement("option");
                        option.value = item.mddlCd;
                        option.textContent = item.mddlKrNm;
                        selectElement.appendChild(option);
                        
                        if(data.imgnRoomCd===item.mddlCd){
                        	$("#imaging").val(item.mddlCd);
                        }
                        
                    });	
          	    },
          	    error: function(error) {
          	        console.error('Error ', error);
          	    }
          	});
            
            
            $('#imaging').prop('disabled', false);
            //$("#imaging").val(valueToSelect);
            // $('#ordrNoteText').prop('disabled', false);
            $('#ordrNoteText').val(data.ordrNoteText);
            $('#appnNoteText').val(data.appnNoteText);
            $('#appnNoteText').prop('disabled', false);
            
            $("#appointment-year").prop('disabled', false);
            $("#appointment-month").prop('disabled', false);
            const { firstDay} = getFirstAndLastDayOfMonth();
            
            $("#appointment-year").val(firstDay.substring(0,4));
            $("#appointment-month").val(firstDay.substring(5,7));
            externalChangeCalendar();
            $("#appnDateText").text(data.appnDate);
            $("#appnTimeText").text(data.appnTime);
            
            
            //if(data.appnDate !== "" && data.appnTime !== ""){
            	list2Data(data.appnDate, data.imgnRoomCd);
            	list3Data(data.appnDate, data.appnTime, data.imgnRoomCd);
            //}
            
            
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
        	// url: '/appn/RIS1211E00/ris0211List2Search.do',
        	mtype: "POST",
            datatype: "json",
            ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            postData : JSON.stringify({
            	'hsptId': 'A001',
            	'imgnRoomCd': 'CT1',
            	'date' : '2022-03-21'
            }),
          colNames: ["예약시간", "총인원", "외래", "입원", "건진", "날짜-hidden", "총예약수-H", "외래예약수-H", "입원예약수-H" , "건진예약수-H" ],
          colModel: [
            { name: "strtTime", index: "strtTime", width: 90, align: "center" },
            { name: "appnOutpPssbCnt", index: "appnOutpPssbCnt", width: 100, align: "center", formatter: calculateTotal },
            {
              name: "appnOutpPssbCnt",
              index: "appnOutpPssbCnt",
              width: 150,
              align: "center", formatter: outpTotal
            },
            { name: "appnInptPssbCnt", index: "appnInptPssbCnt", width: 80, align: "center", formatter: inptTotal },
            { name: "appnHlxmPssbCnt", index: "appnHlxmPssbCnt", width: 80, align: "center", formatter: hlxmTotal},
            { name: "exmnDate", index: "exmnDate", width: 80, align: "center", hidden:true },
            { name: "appnSum", index: "appnSum", width: 80, align: "center", hidden:true },
            { name: "outpCnt", index: "outpCnt", width: 80, align: "center", hidden:true },
            { name: "inptCnt", index: "inptCnt", width: 80, align: "center", hidden:true },
            { name: "hlxmCnt", index: "hlxmCnt", width: 80, align: "center", hidden:true },
            
            
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
            let data = $("#list2").jqGrid("getRowData",rowid );
            console.log(data);
            list3Data(data.exmnDate, data.strtTime, "");
            $("#appnTimeText").text(data.strtTime);
          },
          onSortCol: function (index, idxcol, sortorder) {
            // 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
            // (화살표 css 변경하기 전 Frozen을 풀어주고)
            $("#list2").jqGrid("destroyFrozenColumns");
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
            $("#list2").jqGrid("setFrozenColumns");
            //alert(index+'/'+idxcol+'/'+sortorder);
          },
        });
       

        $("#list3").jqGrid({
        	// url: '/appn/RIS1211E00/ris0211List3Search.do',
        	mtype: "POST",
            datatype: "json",
            ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            postData : JSON.stringify({
            	'hsptId': 'A001',
            	'imgnRoomCd': 'CT1',
            	'appnDate' : '2022-03-21',
            	'appnTime' : '09:00:00'
            }),
          colNames: ["내원구분", "환자ID", "환자명"],
          colModel: [
            { name: "gubun", index: "gubun", width: 90, align: "center" },
            { name: "ptntId", index: "ptntId", width: 100, align: "center" },
            { name: "ptntKrNm", index: "ptntKrNm", width: 80, align: "center" }
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
            $("#list3").jqGrid("destroyFrozenColumns");
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
            $("#list3").jqGrid("setFrozenColumns");
            //alert(index+'/'+idxcol+'/'+sortorder);
          },
        });
      });
    </script>
  </body>
</html>
