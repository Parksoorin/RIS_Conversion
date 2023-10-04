<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴일 기준 관리</title>
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
        <p class="filter__keyword">조회일자 </p>
        <input id="date1" type="date">
        <p class="filter__keyword ma_left_1"> ~</p>
        <input id="date2" type="date">
        <button id="search-btn" class="all__btn img__btn search__btn ma_left_1">검색</button>
      </section>
      
      <!-- 그리드 타이틀 -->
      <div class="grid__title">
        <div class="flex line_1">
          <p>휴일 목록 </p>
          <button id="reload-btn" class="all__btn text__btn ma_left_1 title_align">갱신</button>
        </div>
        <!-- 버튼 컨테이너 -->
        <div class="btn__container">
        	<button id="update-btn" class="all__btn img__btn update__btn">수정</button>
        	<button id="input-btn" class="all__btn img__btn insert__btn">입력</button>
		    <button id="delete-btn" class="all__btn img__btn delete__btn">삭제</button>
    		<button id="save-btn" class="all__btn img__btn save__btn">저장</button>
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
      
    
   
      var reloadGrid = () => {
      	var strtDate = $('#date1').val();
          var endDate = $('#date2').val();
          var postData  = {'strtDate' : strtDate , 'endDate' : endDate };

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
    
    
      $(document).ready(function () {
       
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
            	
            	var data = {
            		    flag: '',
            		    hldyText: ''
            		};
            	
            	
            	if (!selectedRowId) {
            		$("#list1").jqGrid("addRowData", rowId+1, data, 'last');
      	    
            	} else {
            		$("#list1").jqGrid("addRowData", rowId +1, data, 'after', selectedRowId);
            		
            	}
            	$("#list1").jqGrid('editRow',rowId+1,{keys : true });	
         		$("#list1").jqGrid('resetSelection');
         	    $("#list1").jqGrid('setSelection', rowId+1, true);
         		rowIdc = rowId+1;
         		$("#"+rowIdc+"_hldyText").focus();
            	
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
  	        $('#' + rowIdc + '_' + 'hldyDate').attr('disabled', true);
  	    	$("#list1").jqGrid('setSelection', rowIdc, true);
  	    	$("#"+rowIdc+"_hldyText").focus();

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
  		  		  	  if(data.hldyText==='' || data.hldyText === ''){
  		  		  		  $("#list1").jqGrid('editRow',i,{keys : true });	
  		  		  		  alert(i + '행 미입력 사항이 있습니다.');
  		  		  		  return;
  		  		  	  }	  
  	        	  }	  
          	}
          
            var list = $("#list1").getRowData();
      	  	console.log(list);          
            $.ajax({
          	    url: '/appn/RIS0212E00/ris0212.do',
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
          url: '/appn/RIS0212E00/ris0212Search.do',
          mtype: "POST",
          postData : {
             strtDate : $('#date1').val(),
             endDate : $('#date2').val(),
          },    
          datatype: "json",
          
          jsonReader: {
            repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
            root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
            records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
          },    
          colNames: ["구분", "휴일 일자", "휴일 내용", "병원ID-Hidden"],
          colModel: [
            { name: "flag", index: "flag", width: 40, align: "center" },
            { name: "hldyDate", index: "hldyDate", width: 100, align: "center", editable:true, editoptions: {type: "date"}},
            {
              name: "hldyText",
              index: "hldyText",
              width: 150,
              align: "center",
              editable:true
            },
            { name: "hsptId", index: "hsptId", editoptions: { defaultValue: 'A001'}, hidden: true }
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: false,
          cellsubmit : 'clientArray',
          sortname: "id",
          sortorder: "asc",
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadComplete: function (data) {
            console.log(data);
          }, // loadComplete END
          onSelectRow: function (rowid) {
            console.log(rowid);
            rowIdc = rowid;
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