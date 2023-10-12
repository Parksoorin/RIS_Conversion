<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="text_020" text="예외 기준 관리" /></title>
<link rel="stylesheet" href="/css/appn/appnCommon.css">
<style>
	.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button {
    text-align: center;
    }
</style>
</head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword"><spring:message code="text_104" text="촬영실" /> </p>
        <select id="imgnRoom" class="filter__options">
          <c:forEach var="item" items="${imagingList}">
            <option value="${item.mddlCd}">${item.mddlKrNm}</option>
          </c:forEach>

          <!-- <option value="">전체</option>
          <option value="">option 1</option>
          <option value="">option 2</option> -->
        </select>
        <p class="filter__keyword"><spring:message code="text_211" text="조회일자" /> </p>
        <input id="date1" type="date">
        <p class="filter__keyword ma_left_1"> ~</p>
        <input id="date2" type="date">
        <button id="search-btn" class="all__btn img__btn search__btn ma_left_1 tooltip"><spring:message code="text_054" text="검색" />
        		<span class="tooltiptext tooltip-top">촬영실을 선택하여 시작일 ~ 종료일로 예약 예외 목록을 조회할 수 있습니다.</span>
        </button>
      </section>

      <!-- 그리드 타이틀 -->
      <div class="grid__title">
        <div class="flex line_1">
          <p><spring:message code="text_212" text="예약예외목록" /> </p>
          <button id="reload-btn" class="all__btn text__btn ma_left_1 title_align"><spring:message code="button_014" text="갱신" /></button>
        </div>
        <!-- 버튼 컨테이너 -->
        <div class="btn__container">
        
        	<c:choose>
				    <c:when test="${sessionScope.user_grade eq 'S' || sessionScope.user_grade eq 'A' || sessionScope.user_grade eq 'D'}">
						<button id="update-btn" class="all__btn img__btn update__btn"><spring:message code="text_214" text="수정" /></button>
			        	<button id="input-btn" class="all__btn img__btn insert__btn"><spring:message code="text_213" text="입력" /></button>
					    <button id="delete-btn" class="all__btn img__btn delete__btn"><spring:message code="text_215" text="삭제" /></button>
			    		<button id="save-btn" class="all__btn img__btn save__btn"><spring:message code="button_008" text="저장" /></button>
				    </c:when>
				    <c:otherwise>
				        <!-- 다른 경우 처리할 코드 -->
				    </c:otherwise>
				</c:choose>
        	</div>
      </div>
      <!-- 그리드 -->
      <div class="grid__container">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
    </main>

    <script>

      let rowIdc = -1;
      let selectOption;
      const init = () => {
          dateInit();
          dataInit();
          
        }
      
      function isValidDate(dateString) {
    	    var regex = /^\d{4}-\d{2}-\d{2}$/;
    	    if(!regex.test(dateString)) return false;

    	    var parts = dateString.split("-");
    	    var year = parseInt(parts[0], 10);
    	    var month = parseInt(parts[1], 10);
    	    var day = parseInt(parts[2], 10);

    	    if (month < 1 || month > 12) return false;

    	    var lastDayOfMonth = new Date(year, month, 0).getDate();
    	    if (day < 1 || day > lastDayOfMonth) return false;

    	    return true;
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
            
            if (!( isValidDate(strtDate)  &&  isValidDate(endDate)) ) {
        		alert('유효한 날짜 형식이 아닙니다');
        		return false;
        	} 
            
        	if(date1 > date2){
        		alert('조회 종료일은 조회 시작일 보다 높을 수 없습니다. 다시 선택해주세요. ');
        		return false;
        	}
        	return true;
        }

        

        $("#date1").change(function(){
            if(dateValidateCheck() ){
     			reloadGrid();
     	    }
        });

     	 $("#date2").change(function(){
            if(dateValidateCheck() ){
     			reloadGrid();
     	    }
         });
        
        const dateInit = () =>{

          const { firstDay, lastDay } = getFirstAndLastDayOfMonth();
          $('#date1').val(firstDay);
          $('#date2').val(lastDay);
        }
        
        const dataInit =  () => {
        	  var imagingList = JSON.parse('${jsonImagingList}');
	       	  selectOption = {};
	       	  
	       	  for (data of imagingList) {
	       		selectOption[data.mddlCd] = data.mddlKrNm;
	       	  }
      	    console.log(selectOption);    
        }
        
        // 날짜 처리 끝 -------------
      
        // 유틸 함수
        
        const isSelectedFunction = () => {
        	if(rowIdc==-1){
        		alert('행을 먼저 선택해주세요.');
        		return false;
        	}
        	return true;
        }
        
        const getSelectRowData = (status) => {
        	if(!isSelectedFunction()) return;
	      	let data = $("#list1").jqGrid("getRowData",rowIdc);
	      	
	      	if(data.flag == '입력' || data.flag == '수정' || data.flag == '삭제'){
	      		alert(rowIdc + '행은 이미 ' + data.flag + '상태입니다.');
	      		return false;
	      	}
	      	data.flag = status;
	      	$('#list1').setRowData(rowIdc, data);
        	return true;
        }
        
        function getImageOptions() {
            return imagingOptions;
        }
        
        function formatTimeInput(elem) {
            $(elem).on('input', function () {
                var inputValue = $(this).val();

                    var formattedValue = inputValue.slice(0, 2);

                    if (inputValue.length > 2) {
                        formattedValue += ':' + inputValue.slice(3, 5);

                        if (inputValue.length > 5) {
                            formattedValue += ':' + inputValue.slice(6, 8);
                        }
                    }
                    $(this).val(formattedValue);
            });
        }
        
        
        
        function formatDateInput(elem) {
            $(elem).on('input', function () {
                var inputValue = $(this).val();

                    var formattedValue = inputValue.slice(0, 4);

                    if (inputValue.length > 4) {
                        formattedValue += '-' + inputValue.slice(5, 7);

                        if (inputValue.length > 7) {
                            formattedValue += '-' + inputValue.slice(8, 10);
                        }
                    }
                    $(this).val(formattedValue);
            });
        }
        
        var reloadGrid = () => {
        	var strtDate = $('#date1').val();
            var endDate = $('#date2').val();
            var imgnRoomCd = $('#imgnRoom').val();
            var postData  = {'strtDate' : strtDate , 'endDate' : endDate, 'imgnRoomCd' :  imgnRoomCd };

            $("#list1").jqGrid("clearGridData", true);
            $("#list1").setGridParam({
              datatype	: "json",
              postData	: postData,
              loadComplete	: function(data) {
                console.log(data);
              }
            }).trigger("reloadGrid");
        }
        
        // 입력 수정 여부 체크
        const isInputUpdate = () => {
        	var totalRows = $("#list1").jqGrid('getGridParam', 'records');
    
            for (var i = 1; i <= totalRows; i++) {
            	  let data = $("#list1").jqGrid("getRowData",i);
  	        	  if(data.flag === '입력' || data.flag ==='수정'){
  		  		  	  return true;	  
  	        	  }
          	}
            return false;
        }
        var dateConvert = () => {
      	  const now = new Date();
      	  const year = now.getFullYear();
      	  const month = String(now.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해줍니다.
      	  const day = String(now.getDate()).padStart(2, '0');
      	  const hours = String(now.getHours()).padStart(2, '0');
      	  const minutes = String(now.getMinutes()).padStart(2, '0');
      	  const seconds = String(now.getSeconds()).padStart(2, '0');
  		  console.log(year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds);
  		  return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
        }
        
      $(document).ready(function () {

    	  var hsptId = "${hspt_id}";
    	  var loginId = "${login_id}";
    	  var loginName = "${login_name}";
    	  var userGrade = "${user_grade}";
    	  console.log(loginId);
        init();

        
      
        // 클릭 이벤트 처리 

        $('#search-btn').click(function(){
        	console.log('검색 버튼 눌림');  
        	
        	if(dateValidateCheck()){
        		reloadGrid();
        	}
        })

        $('#reload-btn').click(function(){
	         console.log('갱신 버튼 눌림');
	         reloadGrid();
        })

        $('#input-btn').click(function(){
          	console.log('입력 버튼 눌림');
          	
          	var rowId = $("#list1").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
          	var selectedRowId = $("#list1").jqGrid('getGridParam', 'selrow');
          	
          	if (!selectedRowId) {
          		$("#list1").jqGrid("addRowData", rowId+1, data, 'last');
    	    
          	} else {
          		$("#list1").jqGrid("addRowData", rowId +1, data, 'after', selectedRowId);
          		
          	}
          	$("#list1").jqGrid('editRow',rowId+1,{keys : true });	
       		$("#list1").jqGrid('resetSelection');
       	    $("#list1").jqGrid('setSelection', rowId+1, true);
       		rowIdc = rowId+1;
       		$("#"+rowIdc+"_mddlKrNm").focus();
          	
	    	getSelectRowData('입력');
	      	
           
		       
        })

        $('#update-btn').click(function(){
	        console.log('수정 버튼 눌림');
	        
	        let data = $("#list1").jqGrid("getRowData",rowIdc);
        	if(data.flag =='삭제'){
				data.flag = '수정'; 
        	}

        	if (!getSelectRowData('수정')) return;

	       
	        $("#list1").jqGrid('editRow',rowIdc,{keys : true });	
	        $('#' + rowIdc + '_' + 'strtDate').attr('disabled', true);
	    	$('#' + rowIdc + '_' + 'strtTime').attr('disabled', true);
	    	$('#' + rowIdc+ '_' + 'endTime').attr('disabled', true);
	    	$('#' + rowIdc + '_mddlKrNm').attr('disabled', true);
	    	$("#list1").jqGrid('setSelection', rowIdc, true);
	    	$("#"+rowIdc+"_appnImpsText").focus();

	    })

        $('#delete-btn').click(function(){
        	console.log('삭제 버튼 눌림');
        	
			let data = $("#list1").jqGrid("getRowData",rowIdc);
        	if(data.flag =='입력'){
				$("#list1").jqGrid("delRowData", rowIdc); 
        		return;
        	}
        	
        	if(isInputUpdate()) {
        		alert('저장 완료 후 삭제해주세요.');
        		return;
        	};
        	
        	if(!getSelectRowData('삭제')) return;
        	
        	
        	
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
		  		  	  if(data.strtDate==='' || data.mddlKrNm === ''|| data.strtTime === ''
		  		  			  || data.endTime==='' || data.appnImpsText===''){
		  		  		  $("#list1").jqGrid('editRow',i,{keys : true });	
		  		  		  alert(i + '행 미입력 사항이 있습니다.');
		  		  		  return;
		  		  	  }	  
	        	  }
	        	
	        	  
	        	  
	        	
	        	  data.imgnRoomCd = Object.keys(selectOption).find(key => selectOption[key] === data.mddlKrNm);
	        	  console.log('test----------');
	        	  console.log(data.imgnRoomCd);
	  	      	  $('#list1').setRowData(i, data);
	  	      	  
	  	        if(data.flag === '입력'){

  	  	        	$("#list1").jqGrid('editCell', i, "rgstId", true); // 2행, "Name" 열을 편집 모드로 변경
  	  	      		  $("#list1").jqGrid('editCell', i, "rgstDttm", true); // 2행, "Name" 열을 편집 모드로 변경
	  	  	        $("#list1").jqGrid('setCell',  i, "rgstId", loginId); // 값을 변경
	  	  		    $("#list1").jqGrid('setCell',  i, "rgstDttm", dateConvert()); // 값을 변경
	  	  	        $("#list1").jqGrid('saveCell', i, "rgstId"); // 현재 편집 중인 셀을 저장
	  	  	 		   $("#list1").jqGrid('saveCell', i, "rgstDttm");
  	        	  }
  	        	  
  	        	if(data.flag === '수정'){
	        		 
	  	        	$("#list1").jqGrid('editCell', i, "mdfcId", true); // 2행, "Name" 열을 편집 모드로 변경
	  	      		$("#list1").jqGrid('editCell', i, "mdfcDttm", true); // 2행, "Name" 열을 편집 모드로 변경
	  	  	        $("#list1").jqGrid('setCell',  i, "mdfcId", loginId); // 값을 변경
	  	  		    $("#list1").jqGrid('setCell',  i, "mdfcDttm", dateConvert()); // 값을 변경
	  	  	        $("#list1").jqGrid('saveCell', i, "mdfcId"); // 현재 편집 중인 셀을 저장
	  	  	 		$("#list1").jqGrid('saveCell', i, "mdfcDttm");
	        	  }  
        	  
        	  
      		  	  
        	}
        
          var list = $("#list1").getRowData();
    	  console.log(list);          
          $.ajax({
        	    url: '/appn/RIS0213E00/ris0213.do',
        	    method: 'POST', 
        	    data: JSON.stringify(list),
        	    dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        	    success: function(response) {
        	    	alert(response + '건이 처리되었습니다.');
        	    	
        	    	
        	    	reloadGrid();
        	    },
        	    error: function(error) {
        	        console.error('Error ', error);
        	    }
        	});
          
          
        })
        
        
        

        $("#list1").jqGrid({
          url: "/appn/RIS0213E00/ris0213Search.do",
          reordercolNames : true,
          mtype: "POST",
          postData : {
        	
             strtDate : $('#date1').val(),
             endDate : $('#date2').val(),
             imgnRoomCd : $('#imgnRoom').val()
            
            },    
            datatype: "json",
          jsonReader: {
            repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
            root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
            records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
          },     
          colNames: ["구분", "촬영실", "예외일자", "시작시간", "종료시간", "예외사유", "병원ID-Hidden", "촬영실코드-Hidden", "등록아이디", "등록한날짜", "수정한아이디", "수정한날짜"],
          colModel: [
            { name: "flag", index: "flag", width: 40, align: "center" },
            { name: "mddlKrNm", index: "mddlKrNm", width: 100, align: "center",  editable:true, edittype: 'select',  editoptions: { value:selectOption } },	
            {
              name: "strtDate",
              index: "strtDate",
              width: 150,
              align: "center",
              editable:true, 
              editoptions: {type: "date"}
            },
            { name: "strtTime", index: "strtTime", width: 80, align: "center", editable:true, edittype:'text',  editoptions: {type: "time"}},
            { name: "endTime", index: "endTime", width: 80, align: "center", editable:true, edittype:'text', editoptions: {type: "time"} },
            { name: "appnImpsText", index: "appnImpsText", width: 80, align: "center", editable:true, edittype:'text' },
            { name: "hsptId", index: "hsptId", editoptions: { defaultValue: 'A001'}, hidden: true },
            { name : "imgnRoomCd", index: "imgnRoomCd", editoptions: {defaultValue: 'CT1'}, hidden:true },
            { name: "rgstId", index: "rgstId", hidden: true },
            { name: "rgstDttm", index: "rgstDttm", hidden: true },
            { name: "mdfcId", index: "mdfcId", hidden: true },
            { name: "mdfcDttm", index: "mdfcDttm", hidden: true },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: false,
          cellEdit: false,
          cellsubmit : 'clientArray',
          sortname: "id",
          sortorder: "asc",
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadonce: true,
          loadComplete: function (data) {
            console.log(data);
            console.log('ㅎㅇㅎㅇ');
          }, // loadComplete END
          afterEditCell: function(rowid, cellname, value, iRow, iCol){
        	  
        	  $("#" + iRow + "_" + cellname).blur(function(e){
        		 //$("#list1").jqGrid("saveCell", iRow, iCol); 
        	  	console.log('gddd');
        	  });
          }
          
          ,
          onSelectRow: function (rowid) {
        	  rowIdc = rowid;
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