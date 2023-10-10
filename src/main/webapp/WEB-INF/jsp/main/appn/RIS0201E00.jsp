<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js" defer></script>
    <link rel="stylesheet" href="/css/appn/appnCommon.css">
    
    <title>예약 기준 관리</title>
    <style>
    
	  .ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button {
	    	text-align: center;
	  }
	
	  
      .select {
          display: flex;
          padding: 15px 10px;
      }
      .select input[type=radio]{
          display: none;
      }
      .select input[type=radio]+label{
          display: inline-block;
          cursor: pointer;
          height: 24px;
          width: 60px;
          border: 1px solid #333;
          line-height: 24px;
          text-align: center;
          font-weight:bold;
          font-size:13px;
      }
      .select input[type=radio]+label{
          background-color: #fff;
          color: #333;
      }
      .select input[type=radio]:checked+label{
          background-color: #333;
          color: #fff;
      }

      .grid__title__custom {
        padding: 0 20px;
        height: 100px;
        font-size: 14px;
        font-weight: bold;
        background-color: #f1f1f1;
        border: 1px solid #dbdbdb;
        border-bottom: 0;
      }
      .grid__title__flex{
        display: flex;
        align-items: center;
        justify-content: space-between;
        
      }

      .center {
        display: flex;
        justify-content: center;
      }

      .bold-text{
        font-weight: 700;
        font-size: 1.2em;
      }
      
      .input-box{
      	width : 50px !important;
      }
    	
       .mr-5{
       	margin-right: 5px;
       }
       .mr-10{
       	margin-right: 10px;
       }
       .mr-15{
       	margin-right: 15px;
       }
       .mr-20{
       	margin-right: 20px;
       }
       .mr-25{
       	margin-right: 25px;
       }
       .mr-30{
       	margin-right: 30px;
       }
       .mr-35{
       	margin-right: 35px;
       }
       
       .mr-40{
       	margin-right: 40px;
       }
      
    </style>
  </head>
  <body>
    <main class="main__container">
    	<div>
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">촬영실 </p>
        <select id="imgnRoom" class="filter__options">
          <c:forEach var="item" items="${imagingList}">
          	<c:if test="${item.mddlKrNm ne '전체'}">
		    <option value="${item.mddlCd}">${item.mddlKrNm}</option>
          	</c:if>
            
          </c:forEach>

          <!-- <option value="">전체</option>
          <option value="">option 1</option>
          <option value="">option 2</option> -->
        </select>
        <p class="filter__keyword">예약일자 </p>
        <input id="date1" type="date">
        <p class="filter__keyword ma_left_1"> ~</p>
        <input id="date2" type="date">
        <button id="search-btn" class="all__btn img__btn search__btn ma_left_1 tooltip">검색
        	<span class="tooltiptext tooltip-top">촬영실을 선택하여 시작일 ~ 종료일로 예약 현황을 조회할 수 있습니다.</span>
        </button>
        <button id="appn-apply-btn" class="all__btn img__btn search__btn ma_left_1 tooltip">예약기준 적용
        	<span class="tooltiptext tooltip-top">촬영실, 시작일~종료일을 입력받아 월요일~일요일의 예약 기준을 적용합니다.</span>
        </button>
        <button id="appn-delete-btn" class="all__btn img__btn search__btn ma_left_1 tooltip">예약기준 삭제
        	<span class="tooltiptext tooltip-top">촬영실, 시작일~종료일을 입력받아 해당 기간의 예약 기준을 삭제합니다.</span>
        </button>
		</div>
      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <div class="form__container padding-5">
              <div class="flex height-fix-50">
                <div class="width-20">시간 설정</div>
                <div class="flex width-80 flex-end">
                  <div class="margin-10">* 생성구분 </div>
                  <label for="new-create" class="margin-10">새로 생성</label>
                  <input type="radio" id="new-create" class="margin-10" name="create-gubun" checked>
                  <label for="addition-create" class="margin-10">추가 생성 </label>
                  <input class="margin-10"  type="radio" id="addition-create" name="create-gubun">
                  <button id="rule-btn" class="all__btn img__btn update__btn top-25 margin-10 tooltip">기준 생성 
                  	<span class="tooltiptext tooltip-top"><div>새로 생성 : 기존 예약 기준을 삭제 후 새로운 예약 기준을 적용합니다.</div><div>추가 생성 : 기존 예약 기준에 예약 기준을 추가합니다.</div></span>
                  </button>
                </div>
              </div>
              <div class="height-fix-50 flex ">
                  <label for="start-time" class="mr-5">시작시간</label>
                  <input type="text" id="start-time" class="input-box input-box-custom mr-5"  maxlength="5">
                  <label for="end-time" class="mr-5">종료시간</label>
                  <input type="text" id="end-time" class="input-box input-box-custom mr-5 "  maxlength="5">
                  <label for="interval" class="mr-10">간격</label>
                  <input type="text" id="interval" class="input-box input-box-custom mr-5 "  maxlength="2">
                  <p class="mr-10">분</p>
                  <p class="mr-5">휴게시간 </p>
                  <input type="text" id="rest-start-time" class="input-box input-box-custom mr-15 "  maxlength="5">
                  <p class="mr-15"> ~ </p>
                  <input type="text" id="rest-end-time" class="input-box input-box-custom "  maxlength="5">
              </div>
              <div class="height-fix-50 flex ">
                <label for="out-patient" class="mr-35">외래</label>
                <input type="text" id="out-patient" class="input-box  input-box-custom mr-5 "  maxlength="5">
                <label for="in-patient" class="mr-35">입원</label>
                <input type="text" id="in-patient" class="input-box  input-box-custom mr-5 "  maxlength="5">
                <label for="health-examination" class="mr-10">건진</label>
                <input type="text" id="health-examination" class="input-box  input-box-custom mr-35"  maxlength="5">
                <input type="checkbox" id="week-batch" class="height-md input-box-custom mr-5">
                <label for="week-batch">월 ~ 금 일괄적용</label>
              </div>
            </div>
          
          <!-- 그리드 타이틀 -->
          <div class="grid__title__custom">
            <div class="select">
              <input type="radio" id="monday" name="week" checked><label for="monday" >월</label>
              <input type="radio" id="tuesday" name="week"><label for="tuesday">화</label>
              <input type="radio" id="wednesday" name="week"><label for="wednesday">수</label>
              <input type="radio" id="thursday" name="week"><label for="thursday">목</label>
              <input type="radio" id="friday" name="week"><label for="friday">금</label>
              <input type="radio" id="saturday" name="week"><label for="saturday">토</label>
              <input type="radio" id="sunday" name="week"><label for="sunday">일</label>
            </div>
            <div class="grid__title__flex">
              <div class="flex">
                <p class="line-height-50 margin-10">요일설정</p>
                <button id="reload-btn" class="all__btn img__btn update__btn top-25">갱신</button>
              </div>
              
              <!-- 버튼 컨테이너 -->
              <div class="btn__container">
                <button id="update-btn" class="all__btn img__btn update__btn">수정</button>
                <button id="input-btn" class="all__btn img__btn insert__btn">입력</button>
                <button id="delete-btn" class="all__btn img__btn delete__btn">삭제</button>
                <button id="save-btn" class="all__btn img__btn save__btn">저장</button>
              </div>
           </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box height-65">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          
           <!-- calendar 태그 -->
          <div id='calendar-container '>
            <div class="btn__container center bold-text">
              <select  id="appointment-year">
             	 <c:forEach var="item" items="${yearList}">
		          	<option value="${item}">${item}</option>
		          </c:forEach>
              </select>
              <label for="appointment-year">년  </label>
              <select  id="appointment-month">
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
            <div id='calendar'></div>
          </div>
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약 변동 내역</p>

        
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box__custom">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list2" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <button id="reload-btn2" class="all__btn img__btn update__btn">갱신</button>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button id="update-btn2" class="all__btn img__btn update__btn">수정</button>
              <button id="input-btn2" class="all__btn img__btn insert__btn">입력</button>
              <button id="delete-btn2" class="all__btn img__btn delete__btn">삭제</button>
              <button id="save-btn2" class="all__btn img__btn save__btn">저장</button>
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
    let list3Date='0000-00-00';
    let rowIdcList1 = -1;
    let rowIdcList2 = -1;
    let rowIdcList3 = -1;
    let selectOption;
    let imgnRoomCode = 'CT1';
    let checkedWeek = 'monday';
    const init = () => {
        dateInit();
        formValidate();
        
      }
    
    const formValidate = () => {
    	formatTimeInput('#start-time');
        formatTimeInput('#end-time');
        formatTimeInput('#rest-start-time');
        formatTimeInput('#rest-end-time');
        allowOnlyNumbers('#interval');
        allowOnlyNumbers('#out-patient');
        allowOnlyNumbers('#in-patient');
        allowOnlyNumbers('#health-examination');
    }
    
    
    $('#imgnRoom').change(function() {
    	imgnRoomCode  = $(this).val();
		list1Data();
      
     });
    
    $('input[name="week"]').change(function() {
        checkedWeek = $('input[name="week"]:checked').attr('id');
        list1Data();
    });
    
    
   const list1Data = () => {
	    var postData  = {	
				'wkdy' : checkedWeek,
       			'imgnRoomCd' : $('#imgnRoom').val()
       	};
	    console.log(checkedWeek);
		reloadGrid1('#list1', postData, '/appn/RIS0201E00/ris0210Search.do');
   
   }
    
   const list2Data = (date) => {
	    var postData  = {	
	    	
	    		'hsptId' : 'A001',
	    		'imgnRoomCd' : $('#imgnRoom').val(),
	    		'date' : date
      	};
		reloadGrid1('#list2', postData, '/appn/RIS0201E00/risChangeSelect.do');
  
  }
   
   const list3Data = (date) => {
	    var postData  = {	
	    		'hsptId' : 'A001',
	    		'imgnRoomCd' : $('#imgnRoom').val(),
	    		'exmnDate' : date
      	};
		reloadGrid1('#list3', postData, '/appn/RIS0201E00/ris0211Search.do');
  
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
      
      
      const dateValidateCheck = () => {
      	var strtDate = $('#date1').val();
          var endDate = $('#date2').val();
			
          var date1 = new Date(strtDate);
          var date2 = new Date(endDate);
          console.log(date1);
          console.log(date2);
          
      	if(date1 > date2){
      		alert('예약 종료일은 예약 시작일 보다 높을 수 없습니다. 다시 선택해주세요. ');
      		return false;
      	}
      	return true;
      }
      
      const timeCheck = (time) => {
    	  	var parts = time.split(':');
    	    var hours = parseInt(parts[0], 10);
    	    var minutes = parseInt(parts[1], 10);

    	    // 시간이 00:00에서 23:59 사이에 있는지 확인합니다
    	    if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
    	        return false;
    	    }
    	    return true;
      }
      
      const timeValidateCheck = (startTime, endTime) => {
      
    	  var regex = /^([01]\d|2[0-3]):([0-5]\d)$/; 
    	    if (!(regex.test(startTime)&&(regex.test(endTime)) && timeCheck(startTime) && timeCheck(endTime))) {
    	        return false;
    	    }

    	  if(startTime.length<5 || endTime.length<5){
    		  return false;
    	  }
            
            let timeArray1 = startTime.split(":");
            let timeArray2 = endTime.split(":");
            let newTime1 = new Date();
            let newTime2 = new Date();
            newTime1.setHours(Number(timeArray1[0]));
            newTime1.setMinutes(Number(timeArray1[1]));
            newTime2.setHours(Number(timeArray2[0]));
            newTime2.setMinutes(Number(timeArray2[1]));
              
            console.log(newTime1);
            console.log(newTime2);
            
        	if(newTime1 > newTime2){
        		return false;
        	}
        	return true;
        }
      
      
      function clearInput(elem){
    	  $(elem).val('');
      }
      
      function formatTimeInput(elem) {
          $(elem).on('input', function () {
              var inputValue = $(this).val();

                  var formattedValue = inputValue.slice(0, 2);

                  if (inputValue.length >= 2) {
                      formattedValue += ':' + inputValue.slice(3, 5);

                      if (inputValue.length > 5) {
                          formattedValue += ':' + inputValue.slice(6, 8);
                      }
                  }
                  $(this).val(formattedValue);
          });
      }
      
      function allowOnlyNumbers(elem) {
    	    $(elem).on('input', function() {
    	        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    	    });
    	}

      $("#date1").change(function(){
          if(dateValidateCheck() ){
   			return;
   	    }
      });

   	 $("#date2").change(function(){
          if(dateValidateCheck() ){
   			return;
   	    }
       });
      
      const dateInit = () =>{

        const { firstDay, lastDay } = getFirstAndLastDayOfMonth();
        $('#date1').val(firstDay);
        $('#date2').val(lastDay);
        calendarSet();
      }
      
     
      
      // 날짜 처리 끝 -------------
    
      // 유틸 함수
      
      const isSelectedFunction = (rowIdc) => {
      	if(rowIdc==-1){
      		alert('행을 먼저 선택해주세요.');
      		return false;
      	}
      	return true;
      }
      
      const getSelectRowData = (list, status, rowIdc) => {
      		
    	  
    	  	if(!isSelectedFunction()) return;
    	  	var cellValue = $(list).jqGrid("getCell", rowIdc, 'flag');
    	  	console.log(cellValue);
    	  	if(cellValue==='입력') {
    	  	  	$(list).jqGrid("setCell", rowIdc, 'flag', '입력');
    	  		return false;
    	  	}
    	  	
    	  	$(list).jqGrid("setCell", rowIdc, 'flag', status);
      
      	return true;
      }
      

    // list : 리스트 종류 #list1, #list2, #list3
    // postData : 서버로 보낼 객체 {'' : ''} 값으로 지정
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
      
     
    
      const calendarSet = () => {
    	  const date = $('#date1').val();
         	let year = date.substring(0, 4);
         	let month = date.substring(5, 7);
          	if(month.substring(0, 1) === '0'){
          		month = month.substring(1);
          	}
         	
         	console.log(year);
          	console.log(month);
          	
          	$('#appointment-year').val(year); 
          	$('#appointment-month').val(month) ;   
      }
    
      $(document).ready(function () {
    	  init();
    	  
    	 
    	  
    	  // 클릭 이벤트 처리 
		  // 9월 25일 처리할 것
          
		  // 캘린더 날짜 매핑
		 

          $('#reload-btn').click(function(){
  	         console.log('갱신 버튼 눌림');
  	       	 list1Data();
          })
          
          $('#reload-btn2').click(function(){
  	         console.log('갱신 버튼 눌림');
  	       	 list3Data(list3Date);
          })

          $('#input-btn').click(function(){
            	
            	var rowId = $("#list1").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
            	var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
            	console.log(rowId);
            	var data = {
            		    flag: '',
            		    imgnRoomCd : $('#imgnRoom').val(),
            		    wkdy : checkedWeek
            		};
            	
            	
            	if (!selectedRowId) {
            		$("#list1").jqGrid("addRowData", rowId+1, data, 'last');
      	    
            	} else {
            		$("#list1").jqGrid("addRowData", rowId +1, data, 'after', selectedRowId);
            		
            	}
            	$("#list1").jqGrid('editRow',rowId+1,{keys : true });	
    
         	     rowIdcList1  = rowId+1;
         		$("#"+rowIdcList1 +"_appnOutpPssbCnt").focus();
            	
  	    	getSelectRowData('#list1','입력', rowId+1);
  	      	   
          })
          
           $('#input-btn2').click(function(){
            	
            	var rowId = $("#list3").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
            
            	var selectedRowId = $("#list3").jqGrid('getGridParam', 'selrow');
            	
            	var data = {
            		    flag: '',
            		    imgnRoomCd : $('#imgnRoom').val(),
            		    hsptId : 'A001',
            		    exmnDate : list3Date,
            		};
            	
            	
            	if (!selectedRowId) {
            		$("#list3").jqGrid("addRowData", rowId+1, data, 'last');
      	    
            	} else {
            		$("#list3").jqGrid("addRowData", rowId +1, data, 'after', selectedRowId);
            		
            	}
            	$("#list3").jqGrid('editRow',rowId+1,{keys : true });	
    
         	     rowIdcList3  = rowId+1;
         		$("#"+rowIdcList3 +"_appnOutpPssbCnt").focus();
            	
  	    	getSelectRowData('#list3','입력', rowIdcList3);
  	      	   
          })

          $('#update-btn').click(function(){
  	        console.log('수정 버튼 눌림');
  	        
  	      var selectedRowIds = $("#list1").jqGrid('getGridParam', 'selarrrow');
		  console.log(selectedRowIds);
		  selectedRowIds.forEach(function(rowId) {
	  	        var data = $("#list1").jqGrid('getRowData', rowId);
	  	        if(data.flag =='삭제'){
	  	            data.flag = '수정'; 
	  	        }
	  	        if (!getSelectRowData('#list1', '수정', rowId)) return;
	  	        $("#list1").jqGrid('editRow', rowId, { keys : true });
	  	        $('#' + rowId + '_' + 'strtTime').attr('disabled', true);
	  	        $('#' + rowId + '_' + 'endTime').attr('disabled', true);
	  	        $("#" + rowId + "_appnOutpPssbCnt").focus();
	  	    });
  	  
  	    })
  	    
  	     $('#update-btn2').click(function(){
  	        console.log('수정 버튼 눌림');
  	        
  	      var selectedRowIds = $("#list3").jqGrid('getGridParam', 'selarrrow');
		  console.log(selectedRowIds);
		  selectedRowIds.forEach(function(rowId) {
			  let data = $("#list3").jqGrid("getRowData",rowId );
	          	if(data.flag =='삭제'){
	  				data.flag = '수정'; 
	          	}
	          	if (!getSelectRowData('#list3', '수정', rowId)) return;
	  	        $("#list3").jqGrid('editRow',rowId,{keys : true });	
	  	        $('#' + rowId + '_' + 'strtTime').attr('disabled', true);
	  	      	$('#' + rowId + '_' + 'endTime').attr('disabled', true);
	  	    	$("#"+rowId+"_appnOutpPssbCnt").focus();  
			  
			  
		  })
  	        
  	        
  	        

  	    })

          $('#delete-btn').click(function(){
          	console.log('삭제 버튼 눌림');
          	
	          	var selectedRowIds = $("#list1").jqGrid('getGridParam', 'selarrrow');
	          
	          	var rows = selectedRowIds.length;
	          	

	          	for(var i = rows - 1; i>=0; i--){	
	          		let data = $("#list1").jqGrid("getRowData",selectedRowIds[i]);
	          		console.log(data);
	          		
	          		
	          		if(data.flag ==='입력'){
	          			$('#list1').jqGrid('delRowData', selectedRowIds[i] );
	              		continue;
	              	}
	              	
	              	
	              	
	              	if(!getSelectRowData('#list1','삭제', selectedRowIds[i])) continue;	   
	          	}
          })
          
           $('#delete-btn2').click(function(){
          	console.log('삭제 버튼 눌림');
          	
          	var selectedRowIds = $("#list3").jqGrid('getGridParam', 'selarrrow');
	          
          	var rows = selectedRowIds.length;
          	

          	for(var i = rows - 1; i>=0; i--){	
          		let data = $("#list3").jqGrid("getRowData",selectedRowIds[i]);
          		console.log(data);
          		
          		
          		if(data.flag ==='입력'){
          			$('#list3').jqGrid('delRowData', selectedRowIds[i] );
              		continue;
              	}
              	
              	
              	
              	if(!getSelectRowData('#list3','삭제', selectedRowIds[i])) continue;	   
          	}

          })

          $('#save-btn').click(function(){
            console.log('저장 버튼 눌림');
            var totalRows = $("#list1").jqGrid('getGridParam', 'records');
            console.log(totalRows + "번째");
            
          
            // selectOption[data.mddlCd] = data.mddlKrNm; 저장을 할 때 
            for (var i = 1; i <= totalRows; i++) {
        		  	  
          	  
  	        	  $("#list1").jqGrid('saveRow',i, false, 'clientArray');    
  	      		  	  
  	        	  let data = $("#list1").jqGrid("getRowData",i);
  	        	  
  	        	  
  	        	  if(data.flag === '입력' || data.flag ==='수정'){
  		  		  	  if(data.appnOutpPssbCnt==='' || data.appnInptPssbCnt === '' || data.appnHlxmPssbCnt === ''){
  		  		  		  $("#list1").jqGrid('editRow',i,{keys : true });	
  		  		  		  alert(i + '행 미입력 사항이 있습니다.');
  		  		  		  return;
  		  		  	  }	  
  	        	  }	  
          	}
          
            var list = $("#list1").getRowData();
      	  	console.log(list);          
            $.ajax({
          	    url: '/appn/RIS0201E00/ris0210.do',
          	    method: 'POST', 
          	    data: JSON.stringify(list),
          	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
      			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
          	    success: function(response) {
          	    	alert(response + '건이 처리되었습니다.');

          	    	list1Data();
          	    },
          	    error: function(error) {
          	        console.error('Error ', error);
          	    }
          	});
          })
          
          
          
          
          $('#save-btn2').click(function(){
            console.log('저장 버튼 눌림');
            var totalRows = $("#list3").jqGrid('getGridParam', 'records');
            console.log(totalRows + "번째");
            
          
            // selectOption[data.mddlCd] = data.mddlKrNm; 저장을 할 때 
            for (var i = 1; i <= totalRows; i++) {
        		  	  
          	  
  	        	  $("#list3").jqGrid('saveRow',i, false, 'clientArray');    
  	      		  	  
  	        	  let data = $("#list3").jqGrid("getRowData",i);
  	        	  
  	        	  
  	        	  if(data.flag === '입력' || data.flag ==='수정'){
  		  		  	  if(data.appnOutpPssbCnt==='' || data.appnInptPssbCnt === '' || data.appnHlxmPssbCnt === ''){
  		  		  		  $("#list3").jqGrid('editRow',i,{keys : true });	
  		  		  		  alert(i + '행 미입력 사항이 있습니다.');
  		  		  		  return;
  		  		  	  }	  
  	        	  }	  
          	}
          
            var list = $("#list3").getRowData();
      	  	console.log(list);          
            $.ajax({
          	    url: '/appn/RIS0201E00/ris0211.do',
          	    method: 'POST', 
          	    data: JSON.stringify(list),
          	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
      			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
          	    success: function(response) {
          	    	alert(response + '건이 처리되었습니다.');

          	    	list3Data(list3Date);
          	    	changeCalendar();
          	    },
          	    error: function(error) {
          	        console.error('Error ', error);
          	    }
          	});
          })
          // -----------------------------------
    	  
    	  
    	  
    	  $('#rule-btn').click(function(){
          	console.log('기준 생성 버튼 눌림');
          	let gubun = $("input[name='create-gubun']:checked").attr('id');	// new-create, addition-create
          	let startTime = $('#start-time').val();
          	let endTime = $('#end-time').val();
          	let interval = $('#interval').val();
          	let restStartTime = $('#rest-start-time').val();
          	let restEndTime = $('#rest-end-time').val();
          	let outPatient = $('#out-patient').val();
          	let inPatient = $('#in-patient').val();
          	let healthExamination = $('#health-examination').val();
          	let weekBatch = $('#week-batch').prop('checked');
          	let dayOfWeek = checkedWeek;
          	let imgnRoomCd = imgnRoomCode;
          	
          	console.log(gubun);
          	console.log(startTime);
          	console.log(endTime);
          	console.log(interval);
          	console.log(restStartTime);
          	console.log(restEndTime);
          	console.log(outPatient);
          	console.log(inPatient);
          	console.log(healthExamination);
          	console.log(weekBatch);
          	console.log(dayOfWeek);
          	console.log(imgnRoomCd);
          	
          	
          	if(!(gubun && startTime && endTime && interval && restStartTime && restEndTime && outPatient && inPatient && healthExamination)){
          		alert('미입력 사항이 있습니다.');
          		return;
          	}
          	
          	if(interval>=60){
          		alert('유효하지 않은 간격입니다.');
          		return;
          	}
          	
          	if(!(timeValidateCheck(startTime, endTime)&& timeValidateCheck(restStartTime, restEndTime))){
          		alert('시간 입력이 잘못되었습니다');
          		return;
          	}
          	
          	const postData = {
          			"gubun" : gubun,
          			"startTime" : startTime,
          			"endTime" : endTime,
		          	"interval" : interval,
		          	"restStartTime" : restStartTime,
		          	"restEndTime" : restEndTime,
		          	"outPatient" : outPatient,
		          	"inPatient" : inPatient,
		          	"healthExamination" : healthExamination,
		          	"weekBatch" : weekBatch,
		          	"dayOfWeek" : dayOfWeek,
		          	"imgnRoomCd" : imgnRoomCd,
          	}
          	
          	
          	
          	
          	// /appn/RIS0201E00/form/ris0210.do	
          	var jsonData = JSON.stringify(postData);
			console.log(postData);
          	$.ajax({
          	    url: '/appn/RIS0201E00/form/ris0210.do',
          	    type: 'POST',
          	    contentType: 'application/json',
          	    data: jsonData,
          	    success: function(response) {
          	    	
          	    	if(response === 'duplicate'){
          	    		alert('기존의 예약기준과 겹쳐 생성할 수 없습니다.');
          	    		return;
          	    	}
          	    	
          	    	list1Data();
          	        console.log('성공적으로 서버에 요청을 보냈습니다.');
          	        console.log('응답 데이터:', response);
          	        
          	      	clearInput('#start-time');
          	    	clearInput('#end-time');
          	    	clearInput('#interval');
          	    	clearInput('#rest-start-time');
          	    	clearInput('#rest-end-time');
          	    	clearInput('#out-patient');
          	    	clearInput('#in-patient');
                	clearInput('#health-examination');
                	clearInput('#week-batch');
          	    
          	    },
          	    error: function(xhr, status, error) {
          	        console.error('서버 요청 중 에러가 발생했습니다.');
          	        console.error('에러 상태:', status);
          	        console.error('에러 내용:', error);
          	    }
          	});
          })
          
        

       
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '70%', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
              start: '', // 왼쪽 영역 숨기기
              center: '', // 중앙 영역 숨기기
              end: '' // 오른쪽 영역 숨기기
          },
        header : false,
        
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: $('#date1').val(), // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 수정 가능?
        selectable: false, // 달력 일자 드래그 설정가능
        disableDragging: true,
        eventStartEditable: false,
        nowIndicator: false, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        //locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
 
        // 클릭이 되면 list2, list3 렌더링
        dateClick: function(info) {
        	  //alert('Clicked on: ' + info.dateStr);
        	  //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
        	  //alert('Current view: ' + info.view.type);
			  console.log('aaa');
			  list3Date = info.dateStr;
			  console.log(info); // info.dateStr   '2023-09-13'
			  list2Data(info.dateStr);
  	    	
			  list3Data(info.dateStr);
        		  
		},
		viewDidMount: function(info) {
			 console.log('뷰 렌더링이 완료되었습니다.');
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
					  imgnRoomCd : $('#imgnRoom').val(),
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
		},
		
        // 이벤트 
        // events: event
      });
      // 캘린더 랜더링
      calendar.render();
      
      // 예약기준적용
	  
	  $('#appn-apply-btn').click(function(){
		  
		  console.log('예약적용버튼 눌림');
	  		
		  const postData = {
				  hsptId : 'A001',
				  imgnRoomCd : $('#imgnRoom').val(),
				  strtDate : $('#date1').val(),
				  endDate : $('#date2').val()
		  };
		  
		  $.ajax({
        	    url: '/appn/RIS0201E00/ris0211DateApply.do',
          	    method: 'POST', 
          	    data: JSON.stringify(postData),
          	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
      			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
          	    success: function(response) {
          	    	console.log('Success', response);	
          	    	
          	    	if(response===0){
          	    		alert("이미 적용된 예약기준이 있습니다. 필요시 삭제후 적용하시기 바랍니다.");
          	    	} else{
          	        	calendarSet();
          	        	changeCalendar();
          	    	} 
          	    	
          	    	
          	    	
          	    },
          	    error: function(error) {
          	        console.error('Error ', error);
          	    }
		  
	  		})
	  })
	  
	  
	  $('#appn-delete-btn').click(function(){
		  
		  console.log('예약기준삭제 눌림');
	  		
		  if(!confirm('해당 기간의 예약시간을 삭제하시겠습니까?')){
			  return;
		  }
		  
		  
		  const postData = {
				  hsptId : 'A001',
				  imgnRoomCd : $('#imgnRoom').val(),
				  strtDate : $('#date1').val(),
				  endDate : $('#date2').val()
		  };
		  
		  
		  
		  $.ajax({
        	    url: '/appn/RIS0201E00/ris0211DeleteByDate.do',
          	    method: 'POST', 
          	    data: JSON.stringify(postData),
          	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
      			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
          	    success: function(response) {
          	    	console.log('Success', response);	
          	    	alert("삭제되었습니다.");
                	calendarSet();
                	changeCalendar();

          	    	
          	    	
          	    },
          	    error: function(error) {
          	        console.error('Error ', error);
          	    }
		  
	  		})
	  })
	  
      
      // 캘린더 날짜 매핑 
      $('#search-btn').click(function(){
        	console.log('검색 버튼 눌림'); 
        	if(!dateValidateCheck()){
        		alert('유효하지 않은 날짜입니다.');	
        	}
        	calendarSet();
        	changeCalendar();
		  })
		  
		  
		  $("#appointment-year").change(function(){
			  changeCalendar();
		  });
      
	      $("#appointment-month").change(function(){
	    	  changeCalendar();
	      });
	      
	      $('#imgnRoom').change(function() {
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
					  imgnRoomCd : $('#imgnRoom').val(),
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
	      
    

        $("#list1").jqGrid({
        	url: '/appn/RIS0201E00/ris0210Search.do',
        	mtype: "POST",
            datatype: "json",
            ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            postData : JSON.stringify({
                'wkdy': checkedWeek,
                'imgnRoomCd': $('#imgnRoom').val(),
                'hsptId': 'A001'
            }),
          
          jsonReader: {
              repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
              root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
              records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
            },     
          colNames: ["구분", "시작", "종료", "외래", "입원", "건진", "병원아이디-Hidden", "촬영실코드-Hidden", "요일-Hidden"],
          colModel: [
        	{ name: "flag", index: "flag", width: 40, align: "center" },
            { name: "strtTime", index: "strtTime", width: 90, align: "center", editable:true, edittype:'text', editoptions: {type: "time"} },
            { name: "endTime", index: "endTime", width: 90, align: "center", editable:true, edittype:'text', editoptions: {type: "time"} },
            {
              name: "appnOutpPssbCnt",
              index: "appnOutpPssbCnt",
              width: 60,
              align: "center",
              editable:true, edittype:'text'
            },
            { name: "appnInptPssbCnt", index: "appnInptPssbCnt", width: 60, align: "center", editable:true, edittype:'text'  },
            { name: "appnHlxmPssbCnt", index: "appnHlxmPssbCnt", width: 60, align: "center", editable:true, edittype:'text' },
            { name: "hsptId", index: "hsptId", width: 80, align: "center", hidden: true  },
            { name: "imgnRoomCd", index: "imgnRoomCd", width: 80, align: "center" , hidden: true },
            { name: "wkdy", index: "wkdy", width: 80, align: "center" , hidden: true },
            
          ],
          
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: true,
          loadonce: true,
          sortname: "id",
          sortorder: "asc",
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadComplete: function (data) {
            console.log(data);
          }, // loadComplete END
          onSelectRow: function (rowid) {
            console.log(rowid);
            rowIdcList1 = rowid;
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
        	url: '/appn/RIS0201E00/risChangeSelect.do',
        	ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            mtype: "POST",
            datatype: "json",
            postData : JSON.stringify({
          	 	'date' : '0000-00-00',
               'imgnRoomCd' : $('#imgnRoom').val(),
               'hsptId' : 'A001'
              }),
          colNames: ["예외구분", "적용일자", "변동사유"],
          colModel: [
            { name: "gubun", index: "gubun", width: 100, align: "center" },
            { name: "date", index: "date", width: 100, align: "center" },
            {
              name: "text",
              index: "text",
              width: 200,
              align: "center",
            },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "80%",
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
            rowIdcList2 = rowid;
            
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
        	url: '/appn/RIS0201E00/ris0211Search.do',
        	ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
            mtype: "POST",
            datatype: "json",
            postData : JSON.stringify({
          	 	'exmnDate' : '0000-00-00',
               'imgnRoomCd' : $('#imgnRoom').val(),
               'hsptId' : 'A001'
              }),
          colNames: ["구분", "시작", "종료", "외래", "입원", "건진", "병원아이디-Hidden", "촬영실코드-Hidden", "날짜-Hidden"],
          colModel: [
            { name: "flag", index: "flag", width: 90, align: "center" },
            { name: "strtTime", index: "strtTime", width: 100, align: "center", editable:true, edittype:'text', editoptions: {type: "time"} },
            {
              name: "endTime",
              index: "endTime",
              width: 100,
              align: "center",
              editable:true, edittype:'text', editoptions: {type: "time"}
            },
            { name: "appnOutpPssbCnt", index: "appnOutpPssbCnt", width: 80, align: "center",  editable:true, edittype:'text'},
            { name: "appnInptPssbCnt", index: "appnInptPssbCnt", width: 80, align: "center", editable:true, edittype:'text' },
            { name: "appnHlxmPssbCnt", index: "appnHlxmPssbCnt", width: 80, align: "center", editable:true, edittype:'text' },
            { name: "hsptId", index: "hsptId", width: 80, align: "center" , hidden: true },
            { name: "imgnRoomCd", index: "imgnRoomCd", width: 80, align: "center" , hidden: true },
            { name: "exmnDate", index: "exmnDate", width: 80, align: "center" , hidden: true },
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
            rowIdcList3 = rowid;
            
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
