<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>상세보기</title>
		<meta charset="UTF-8">		
		<meta http-equiv="Cache-Control" content="no-Cache" /> <!-- 페이지 내용 캐시X (페이지에 항상 최신 버전의 콘텐츠를 표시하기위함) -->
		<meta http-equiv="Pragma" content="no-Cache" /> <!-- 페이지 캐싱 비활성화 -->
		<meta http-equiv="imagetoolbar" content="no" /> <!-- 이미지 툴바 비활성화(이미지 툴바:이미지 마우스 오른쪽 클릭하면 나타나는 도구모음) -->
		<meta name="robots" content="noindex,nofollow" /> <!-- 이 페이지가 검색결과에 나타지않게함 -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <!-- 뷰포트 설정 : 모바일에서의 웹페이지 표시방식 제어 -->
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />  <!-- 최선 버전의 Internet Explorer로 렌더링 / 브라우저 호환성 문제 방지  -->
		<link rel="stylesheet" type="text/css" href="/css/code/detail.css" />
		<script type="text/javascript" src='/js/jquery/grid/jquery-1.9.0.min.js'></script>
		<script type="text/javascript" src='/js/jquery/grid/jquery.jqGrid.min.js'></script>
		<script type="text/javascript" src='/js/jquery/grid/jquery.jqGrid.src.js'></script>
		<script type="text/javascript" src='/js/jquery/jquery.form.js'></script>
		<script type="text/javascript" src='/js/jquery/jquery.form.min.js'></script>
		<script type="text/javascript" src='/js/jquery/jquery-ui.min.js'></script>
		<script type="text/javascript" src='/js/calendar/datepicker-ko.js'></script>
		<script type="text/javascript" src="/js/jquery/grid/grid.locale-kr.js"></script>
		<script type="text/javascript" src='/js/jqgrid_common.js'></script>
		<script type="text/javascript" src='/js/jquery/common.js'></script>
		<script  type="text/javascript"> /* i18(국제화 및 지역화) 정의 */
			
			
			// 다국어 메세지 지정하는 객체정의.. 추후 i18n관련한 js 파일 include하게되면 아래 내용 삭제예정..(JS로 Include 하는 방법을 모르겠음)			
			var i18n = {"button_011":"상세"
					  , "button_007" :"입력"
					  , "text_076" :"구분"
					  , "text_079" :"대분류 코드"
					  , "text_082" :"대분류 한글명"
					  , "text_083" :"자릿수"
					  , "text_084" :"출력순"
					  , "text_085" :"적용일자"
					  , "text_086" :"불용일자"
					  ,"message_181" : "자료 조회중입니다. 잠시만 기다리세요..."       
					  ,"message_049" : "대분류 코드를 선택해주세요."
					  ,"message_050" : "중분류 코드를 선택해주세요."
					  ,"message_048" : "대분류 코드가 존재하지않습니다."
					  ,"text_081" :  "중분류 코드"
					  ,"text_222" : "중분류 한글명"
					  ,"text_083" : "자릿수"
					  ,"text_084" : "출력순"
					  ,"text_085" : "적용일자"
					  ,"text_086" : "불용일자"
					  ,"message_051" : "중분류 코드가 존재하지않습니다."
					  ,"message_052" : "소분류 코드가 존재하지않습니다."
					  ,"text_080" : "소분류 코드"
					  ,"text_223" : "소분류 코드 명"
					  ,"message_053" : "대분류 코드 항목을 선택해주세요."
					  ,"message_054" : "중분류 코드 항목을 선택해주세요."
					  ,"message_055" : "소분류 코드 항목을 선택해주세요."
					   };
			
			console.log("i18n.button_011 >>>" +i18n.button_011);
		</script>
		
	</head>
	
	<script type="text/javaScript" language="javascript">
	function applpicker(element) {
	    $(element).datepicker({
	        id: 'endDate_datePicker',
	        dateFormat: 'yy-mm-dd',
	        maxDate: new Date(3000, 1, 1),
	        yearRange: 'c-30:c+30',
	        changeYear: true,
	        changeMonth: true,
	        showOn: 'focus',
	       	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	    });
	}
	
	function exprpicker(element) {
	    $(element).datepicker({
	        id: 'endDate_datePicker',
	        dateFormat: 'yy-mm-dd',
	        maxDate: new Date(3000, 1, 1),
	        yearRange: 'c-30:c+30',
	        changeYear: true,
	        changeMonth: true,
	        showOn: 'focus',
	       	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	    });
	}
	
	
	function onlyint(element) {		// 입력시 숫자만 받기
		$(element).keyup(function(){
			var val1 = element.value;
			var num = new Number(val1);
			if(isNaN(num)){
				element.value = '';
			}
			if(num > 20){
				element.value = 20;
			}
		})
	} 
	
	var mddl_rowid = 0;
	var q_lrgc_cd = "";
	var q_mddl_cd = "";
	var q_smll_cd = "";
	var currdate = ""; 
	/* 시작 시 */
	$(document).ready(function(){
		
		currdate = $("#currdate").val(); 
		
		q_lrgc_cd = $("#q_lrgc_cd").val();
		q_mddl_cd = $("#q_mddl_cd").val();
		q_smll_cd = $("#q_smll_cd").val();
		
		var gwidth = $(".grid1").width();
		var gheight = $(".inquiry__result-section").height();
		gwidth = parseInt(gwidth);
		$(".srcArea").attr("style","display:flex;justify-content: space-between;width:calc(100% - 10px);");
		
		var caption1 = "";//"프로그램 등록 현황";
		var caption2 = "";//"프로그램 등록 현황";
		
		var text = '"M"';
		var grid_id = '"list"'
		var text2 = '"S"';
		var grid_id2 = '"list2"'
		
		caption1 += "<div style='text-align:right;'>"+
					"<a href=\'javascript:fn_save("+text+")'\><button class='process__btn2 btn_right  mt3 mr-4 ml-2'>"+
					"<img src='/images/jqgrid/btn_save.png' alt='저장' width='16px' />"+
					"<span>&nbsp;저 장&nbsp;</span></button></a>"+	// 저장
					"<a href=\'javascript:fn_delete("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_delete.png' alt='삭제' width='16px' />"+
					"<span>&nbsp;삭 제&nbsp;</span></button></a>"+ // 행삭제
					"<a href=\'javascript:fn_expr("+text+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/delete.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='삭제' class='icon__img' width='16px'/>"+
					"<span>&nbsp;불 용&nbsp;</span></button></a>"+ // 행불용
					"<a href=\'javascript:fn_edit("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_update.png' alt='수정' width='16px'/>"+
					"<span>&nbsp;수 정&nbsp;</span></button></a>"+ // 행수정
					"<a href=\'javascript:fn_add("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_add.png' alt='추가' width='16px' />"+
					"<span>&nbsp;입 력&nbsp;</span></button></a>"+ // 행추가
					"<a href=\'javascript:fn_viewer("+text+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;상 세&nbsp;</span></button></a>"+ // 상세보기
					"<a href=\'javascript:reloadGrid("+grid_id+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;새로고침&nbsp;</span></button></a>"+ // 새로고침
					"</div>";
					
					
					
		caption2 += "<div style='text-align:right;'>"+
					"<a href=\'javascript:fn_save("+text2+")'\><button class='process__btn2 btn_right mt5 mr-4 ml-2'>"+
					"<img src='/images/jqgrid/btn_save.png' alt='저장' width='16px' />"+
					"<span>&nbsp;저 장&nbsp;</span></button></a>"+ // 저장
					"<a href=\'javascript:fn_delete("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_delete.png' alt='삭제' width='16px' />"+
					"<span>&nbsp;삭 제&nbsp;</span></button></a>"+ // 행삭제
					"<a href=\'javascript:fn_expr("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/delete.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='삭제' class='icon__img' width='16px'/>"+
					"<span>&nbsp;불 용&nbsp;</span></button></a>"+ // 행불용
					"<a href=\'javascript:fn_edit("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_update.png' alt='수정' width='16px'/>"+
					"<span>&nbsp;수 정&nbsp;</span></button></a>"+ // 행수정
					"<a href=\'javascript:fn_add("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_add.png' alt='추가' width='16px' />"+
					"<span>&nbsp;입 력&nbsp;</span></button></a>"+ // 행추가
					"<a href=\'javascript:fn_viewer("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;상 세&nbsp;</span></button></a>"+ // 상세보기
					"<a href=\'javascript:reloadGrid("+grid_id2+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;새로고침&nbsp;</span></button></a>"+ // 새로고침
					"</div>";
		
		
		
		var checkLMS = $("#checkLMS").val();
		var hspt_id = $("#hspt_id").val();
		var lrgc_cd = $("#lrgc_cd").val();
		var mddl_cd = $("#mddl_cd").val();
		
		/* 상세보기 : 대 */
		if(checkLMS == "L"){
			/* 그리드(중분류) */
			$('#list').jqGrid({
					 url: "/json/code/risCodeList.do?checkLMS=M&lrgc_cd="+lrgc_cd+"&hspt_id="+hspt_id,
				     reordercolNames:true, 
				     mtype:'POST', // 전송 타입
				     datatype : "json", // 받는 데이터 형태 
				     colNames:[ i18n.text_076, '병원코드', '대분류 코드',i18n.text_081, i18n.text_222, i18n.text_083, i18n.text_084, i18n.text_085, i18n.text_086], //'구분','중분류 코드', '중분류 한글 명', '자릿수', '출력순', '적용일자', '불용일자'
				     colModel:[
					     { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
					    	 formatter:"select", 
					    	 formatoptions : {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
					    	 edittype:"select", 
					    	 editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}   //"I:입력;U:수정;D:불용;N:--"
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'	, width: 0  , hidden: true}																				,
					     { name: 'lrgc_cd'	  , index: 'lrgc_cd'	, width: 0  , hidden: true}																				,
					     { name: 'mddl_cd'	  , index: 'mddl_cd'	, width: 70 , align:"left" , editable: true , editoptions:{maxlength : $("#lrgc_acph").val()}}		, 
					     { name: 'mddl_kr_nm' , index: 'mddl_kr_nm' , width: 70 , align:"left" , editable: true , editoptions:{maxlength : 100}}							, 
					     { name: 'mddl_acph'  , index: 'mddl_acph'	, width: 50 , align:"center" , editable: true , editoptions:{maxlength : 2, dataInit:onlyint}}			, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'	, width: 50 , align:"center" , editable: true , editoptions:{maxlength : 15, dataInit:onlyint}}			, 
					     { name: 'appl_date'  , index: 'appl_date'	, width: 80 , align:"center" , editable: true , editoptions: {type: "date"}}							, 
					     { name: 'expr_date'  , index: 'expr_date'	, width: 80 , align:"center" , editable: true , editoptions: {type: "date"}}		 
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     //page:'page', // 현재 페이지 currentPage
					     //total:'total', // 총 페이지 수 totalPage
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
				   width : gwidth-10,
				   height: gheight*0.34, //테이블의 세로 크기, Grid의 높이         
				   loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   emptyrecords: "Nothing to display",    
				   rowNum:-1,
			       rownumbers: true,
			       celledit:true,
				   editurl: "clientArray",
				   gridview : true,  // 선표시 true/false         
				   loadComplete: function(data){  

						var ids = $("#list").getDataIDs();
						for(var i in ids){ 
				    		var expr_date = $('#list').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    		
				    	}
						
						
						jQuery('#list2').jqGrid('clearGridData');
						var totcnt  = jQuery("#list").jqGrid("getGridParam","records");
						if(totcnt < 1){
							$("#list > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_051+"<br/></b></td></tr>"); //중분류 코드가 존재하지않습니다.
					 		$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
						}else{
					 		$("#list2 > tbody").append("<tr><td align='center' colspan='11'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_050+"<br/></b></td></tr>");//중분류 코드를 선택해주세요.
						}
						/* 클릭 유지 */
						if(q_mddl_cd != null || q_mddl_cd != ""){
							for(var i in ids){
								var mddl_cd = $('#list').getCell(ids[i], "mddl_cd");
								if(mddl_cd == q_mddl_cd){
									$("#list").jqGrid('setSelection', ids[i], true);	
								}
							  }
						}
					},  
					beforeSelectRow: function (rowid, e) { 
						var ids2 = $("#list2").getDataIDs();
						var iudcheck = 0;
						/* 소분류 행수정시 클릭X */
						for(var i in ids2){
							var iud = $("#list2").getCell(ids2[i], "iud");
							if(iud == "I" || iud == "U" || iud == "D"){
									iudcheck++;
							}
						}
						if(iudcheck > 0){
							return
						}else{
			 				$("#list").jqGrid('setSelection', rowid, true);   
						}
					},
					onSelectRow: function(rowid) {
						var rowObject = $("#list").jqGrid('getRowData',rowid);
						
						q_mddl_cd = rowObject.mddl_cd;
						
						var ids2 = $("#list2").getDataIDs();
						var iudcheck = 0;
						/* 소분류 행수정시 클릭X */
						for(var i in ids2){
							var iud = $("#list2").getCell(ids2[i], "iud");
							if(iud == "I" || iud == "U"  || iud == "D"){
									iudcheck++;
							}
						}
						if(iudcheck == 0){
							jQuery('#list2').jqGrid('clearGridData');
							
							jQuery('#list2').jqGrid('setGridParam', {
				    			url: "/json/code/risCodeList.do",
								postData: {
									checkLMS : "S",
									lrgc_cd : rowObject.lrgc_cd,
									mddl_cd : rowObject.mddl_cd,
								},
									datatype:"json"     
									}).trigger("reloadGrid");
							
							/* jQuery("#list2").jqGrid('setGridParam',{url:"/json/code/risCodeList.do?checkLMS=S&lrgc_cd="+rowObject.lrgc_cd+"&hspt_id="+rowObject.hspt_id+"&mddl_cd="+rowObject.mddl_cd});
							jQuery("#list2").trigger('reloadGrid'); */
							// 소분류 코드 maxlength 중분류 자릿수로 적용
							jQuery("#list2").jqGrid('setColProp', 'smll_cd', { editoptions: { maxlength: rowObject.mddl_acph} });
							checkid = rowid;
						}
			        } 
			}); // 중분류 그리드 END
			
			/* 서브그리드(소분류) */
			$('#list2').jqGrid({
					 url:"/json/code/risCodeList.do",
					 postData : { 
				    	 checkLMS : "S",
				    	 lrgc_cd  : q_lrgc_cd,
				    	 mddl_cd  : q_mddl_cd
					 }, // URL에서 검색 조건으로 가져갈 파라미터
				     reordercolNames:true, 
				     mtype:'POST', // 전송 타입
				     datatype : "json", // 받는 데이터 형태 
				     colNames:[ i18n.text_076, '병원코드', '대분류 코드', '중분류 코드',i18n.text_080, i18n.text_223, i18n.text_084, i18n.text_085, i18n.text_086], // '구분','소분류 코드','소분류 코드 명','출력순', '적용일자', '불용일자'
				     colModel:[
				    	 { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
					    	 formatter:"select", 
					    	 formatoptions :{value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
					    	 edittype:"select", 
					    	 editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"   
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'	, width: 0  , hidden: true}																		  		,
					     { name: 'lrgc_cd'	  , index: 'lrgc_cd'	, width: 0  , hidden: true}																		  		,
					     { name: 'mddl_cd'	  , index: 'mddl_cd'	, width: 0  , hidden: true}																		  		,
					     { name: 'smll_cd'	  , index: 'smll_cd'	, width: 84 , align: "left" , editable: true}										    				, 
					     { name: 'smll_kr_nm' , index: 'smll_kr_nm' , width: 84 , align: "left" , editable: true, editoptions: { maxlength : 100}}				  		, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'  , width: 84 , align: "center" , editable: true, editoptions: { maxlength :15 , dataInit:onlyInt}}   	, 
					     { name: 'appl_date'  , index: 'appl_date'  , width: 84 , align: "center" , editable: true, editoptions: {type: "date"}}							,
						 { name: 'expr_date'  , index: 'expr_date'	, width: 80 , align:"center"  , editable: true, editoptions: {type: "date"}}
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     //page:'page', // 현재 페이지 currentPage
					     //total:'total', // 총 페이지 수 totalPage
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
				   width : gwidth-10,
				   height : gheight*0.34, //테이블의 세로 크기, Grid의 높이         
				   loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   emptyrecords: "Nothing to display",    
				   rowNum:-1, 
			       rownumbers: true,
			       celledit:true,
				   editurl: "clientArray",
				   gridview : true,  // 선표시 true/false         
				   loadComplete: function(data){  
		
						var ids = $("#list2").getDataIDs(); 
						
						for(var i in ids){ 
				    		var expr_date = $('#list2').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list2").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    		
				    	} 
						var totcnt  = jQuery("#list2").jqGrid("getGridParam","records");
						if(totcnt < 1){
							$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
						}
						
						/* 클릭유지 */
						if(q_smll_cd != null || q_smll_cd != ""){
							for(var i in ids){
								var smll_cd = $('#list2').getCell(ids[i], "smll_cd");
								if(smll_cd == q_smll_cd){
									$("#list2").jqGrid('setSelection', ids[i], true);	
								}
							  }
						}
				    	
					},
					beforeSelectRow: function (rowid, e) { 
		 				$("#list2").jqGrid('setSelection', rowid, true);   
					},
					onSelectRow: function(rowid) {
			          	 var rowObject = $("#list2").jqGrid('getRowData',rowid);
			          	 
			          	q_smll_cd = rowObject.smll_cd;
			        } 
			}) // 소분류 그리드 END
		
		/* 상세보기 : 중 */
		}else if(checkLMS == "M"){
			
			/* 그리드(소분류) */
			$('#list2').jqGrid({
					 url: "/json/code/risCodeList.do",
				     reordercolNames:true,
				     postData : {
				    	 checkLMS : "S",
				    	 lrgc_cd : lrgc_cd,
				    	 mddl_cd : mddl_cd,
				     },
				     mtype:'POST', // 전송 타입
				     datatype : "json", // 받는 데이터 형태 
				     colNames:[ i18n.text_076, '병원코드', '대분류 코드', '중분류 코드',i18n.text_080, i18n.text_223, i18n.text_084, i18n.text_085, i18n.text_086], // '구분','소분류 코드','소분류 코드 명','출력순', '적용일자', '불용일자'
				     colModel:[
				    	 { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
				    		 formatter:"select", 
					    	 formatoptions :{value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
					    	 edittype:"select", 
					    	 editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"   
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'	, width: 0  , hidden: true}				  														  	,
					     { name: 'lrgc_cd'	  , index: 'lrgc_cd'	, width: 0  , hidden: true}																		  	,
					     { name: 'mddl_cd'	  , index: 'mddl_cd'	, width: 0  , hidden: true}				  														  	,
					     { name: 'smll_cd'	  , index: 'smll_cd'	, width: 70 , align: "left" , editable: true, editoptions: {maxlength : $("#mddl_acph").val()}}	, 
					     { name: 'smll_kr_nm' , index: 'smll_kr_nm' , width: 70 , align: "left" , editable: true, editoptions: {maxlength : 100}}				  		, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'  , width: 70 , align: "center" , editable: true, editoptions: {maxlength : 15 , dataInit:onlyInt}}	, 
					     { name: 'appl_date'  , index: 'appl_date'  , width: 70 , align: "center" , editable: true, editoptions: {type: "date"}}						, 
					     { name: 'expr_date'  , index: 'expr_date'  , width: 70 , align: "center" , editable: true, editoptions: {type: "date"}}		 
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     //page:'page', // 현재 페이지 currentPage
					     //total:'total', // 총 페이지 수 totalPage
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
				   width : gwidth-10,
				   height: gheight*0.82, //테이블의 세로 크기, Grid의 높이         
				   loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   emptyrecords: "Nothing to display",    
				   rowNum:-1, 
			       rownumbers: true,
			       celledit:true,
				   editurl: "clientArray",
				   gridview : true,  // 선표시 true/false         
				   loadComplete: function(data){  

				       var ids = $("#list2").getDataIDs();
				       
				       for(var i in ids){ 
				    		var expr_date = $('#list2').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list2").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    	} 
				       
					   if((q_smll_cd != null || q_smll_cd != "")){
							$("#list2").jqGrid('setSelection', q_smll_cd, true);
						}
					   /* 데이터가 없을 시 */
					   var totcnt  = jQuery("#list2").jqGrid("getGridParam","records");
					  if(totcnt < 1){
				  		$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
					  }
					  
					  /* 클릭유지 */
					  if(q_smll_cd != null || q_smll_cd != ""){
							for(var i in ids){
								var smll_cd = $('#list2').getCell(ids[i], "smll_cd");
								if(smll_cd == q_smll_cd){
									$("#list2").jqGrid('setSelection', ids[i], true);	
								}
							  }
						}
					   
					}, 
					beforeSelectRow: function (rowid, e) { 
		 				$("#list2").jqGrid('setSelection', rowid, true);   
					},
					onSelectRow: function(rowid) {
			          	 var rowObject = $("#list2").jqGrid('getRowData',rowid);
			          	q_smll_cd = rowObject.smll_cd;
			        } 
			})
		} // if(checkLMS END
	}) // getReady END

	var BrowserChk = "";
	if(BrowserChk == "EXPLORE"){
		$(function(){
		  jQuery("#list").setColProp('appl_date', { editoptions:{maxlength : 10, dataInit : applpicker} });		
		  jQuery("#list").setColProp('expr_date', { editoptions:{maxlength : 10, dataInit : exprpicker} });		
		  jQuery("#list2").setColProp('appl_date', { editoptions:{maxlength : 10, dataInit : applpicker} });		
		  jQuery("#list2").setColProp('expr_date', { editoptions:{maxlength : 10, dataInit : exprpicker} });		
		 });
	}else{
		  jQuery("#list").setColProp('appl_date', { editoptions:{type: "date"} });		
		  jQuery("#list").setColProp('expr_date', { editoptions:{type: "date"} });		
		  jQuery("#list2").setColProp('appl_date', { editoptions:{type: "date"} });		
		  jQuery("#list2").setColProp('expr_date', { editoptions:{type: "date"} });		
	}

	/* 화면 reize */	
	$(window).bind('resize', function() { 
		if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
	    else {
		var gridw = $(window).width()-20;
		fn_resize("list", gridw , '0.7'); 
		fn_resize("list2", gridw , '0.7'); 
	    }
	    }).trigger('resize');


	//행추가			   
	function fn_add(LMS){
		var checkLMS = $("#checkLMS").val(); // 대분류 상세보기 : L, 중분류 상세보기 : M
		
		// 중분류
			var lrgc_cd = $("#lrgc_cd").val();
			var lrgc_acph = $("#lrgc_acph").val();
			var ids = $("#list").getDataIDs();
			var rowid = Math.max.apply(null,ids)+1 // 페이징 처리 시 현 페이지의 Max RowId 값
			var rowData ={iud:"I", lrgc_cd:lrgc_cd, mddl_acph:20,otpt_sqnc:0, appl_date:currdate, expr_date:"3000-01-01"};	// 기본값 셋팅
			if(lrgc_acph == 0 && checkLMS == "L"){	// 자릿수가 0이면 행추가 X
				alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
				return;
			}
			
		// 소분류
			var mddl_cd = $("#mddl_cd").val();
			var mddl_acph = $("#mddl_acph").val();
			var ids2 = $("#list2").getDataIDs();
			var rowid2 = Math.max.apply(null,ids2)+1 // 페이징 처리 시 현 페이지의 Max RowId 값
			var mddlid = "";
			var rowObject = "";
			var mddl_expr_date = "";
			if(checkLMS == "L" && LMS == "S"){
				mddlid = $("#list").getGridParam("selrow");		// 중분류 선택된 rowid
				rowObject = $("#list").jqGrid('getRowData',mddlid);	// 선택된 중분류의 값을 받아오기 위함
				mddl_cd = rowObject.mddl_cd;
				mddl_acph = rowObject.mddl_acph;
				mddl_expr_date = rowObject.expr_date;
				
			}
			/* 상세보기 코드가 불용이면 하위코드에는 행 추가 불가*/
			if(currdate >= $("#expr_date").val()){
				alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
				return
			}
			/* 대분류 상세보기 -> 중분류 코드가 불용이면 하위코드에는 행 추가 불가*/
			if(currdate >= mddl_expr_date && checkLMS == "L" && LMS == "S"){
				alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
				return
			}
		
		
			var rowData2 ={iud:"I", lrgc_cd:lrgc_cd,otpt_sqnc:0, mddl_cd:mddl_cd, appl_date:currdate, expr_date:"3000-01-01"};
		// 중분류
			
			if(LMS == "M"){
				for(var i in ids2){
					var iud = $("#list2").getCell(ids2[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
				}
				
				if(ids.length < 1){
					jQuery('#list').jqGrid('clearGridData');
					rowid = 1;
				}
				
				if($("#list").getGridParam( "selrow" ) == null){
					$("#list").jqGrid("addRowData",rowid,rowData); // 첫 행에 Row 추가
					jQuery('#list').jqGrid('editRow',rowid,false);
				}else{
					$("#list").jqGrid("addRowData",rowid,rowData,'after',$("#list").getGridParam( "selrow" )); //선택된 행 뒤에 Row추가
					jQuery('#list').jqGrid('editRow',rowid,false);
				}
				$("#list").jqGrid('setSelection', rowid, true);
				
			}
			
		// 소분류

			if(LMS == "S"){
				
				for(var i in ids){
					var iud = $("#list").getCell(ids[i], "iud");
					if(iud == "I" || iud == "U"  || iud == "D"){
						alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
				}
				if(mddlid == null && checkLMS == "L"){
					alert(i18n.message_050); //"중분류 코드를 선택해주세요."
					return
				}
				
				if(mddl_acph == 0){
					alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
					return;
				}
				
				
				if(ids2.length < 1){
					jQuery('#list2').jqGrid('clearGridData');
					rowid2 = 1;
				}
				
				if($("#list2").getGridParam( "selrow" ) == null){
					$("#list2").jqGrid("addRowData",rowid2,rowData2); // 첫 행에 Row 추가
					jQuery('#list2').jqGrid('editRow',rowid2,false);
					
				}else{
					$("#list2").jqGrid("addRowData",rowid2,rowData2,'after',$("#list2").getGridParam( "selrow" )); //선택된 행 뒤에 Row추가
					jQuery('#list2').jqGrid('editRow',rowid2,false);
				}
				$("#list2").jqGrid('setSelection', rowid2, true);
				
			}
			
	}

	//행 수정
	function fn_edit(LMS){
		var checkLMS = $("#checkLMS").val();
		// 중분류
		var rowid = $("#list").getGridParam("selrow");
		var ids = $("#list").getDataIDs();
		var mddl_expr_date = $("#list").getCell(rowid, "expr_date");
		// 소분류
		var rowid2 = $("#list2").getGridParam("selrow");
		var ids2 = $("#list2").getDataIDs();
		
		// 중분류
		if(LMS == "M"){
			
			for(var i in ids2){
				var iud = $("#list2").getCell(ids2[i], "iud");
				if(iud == "I" || iud == "U" || iud == "D"){
					alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
					return
				}
			}
			
			if(ids.length < 1){
				alert(i18n.message_019); // "수정할 정보가 존재하지 않습니다."
				return
			}
			
			if(rowid == null || rowid == ""){
				alert(i18n.message_050); // "중분류 코드를 선택해주세요."
				return
			}
			
			var iud = $('#list').getCell(rowid, "iud");
			if(iud != "I" && iud != "D"){
				jQuery("#list").setColProp('mddl_cd', { editable: false });		// 수정불가
				$("#list").jqGrid("setCell",rowid,'iud',"U"); // 첫 행에 Row 추가
				jQuery('#list').editRow(rowid);
				jQuery("#list").setColProp('mddl_cd', { editable: true });		// 다시 수정가능
			}
			
		}
		
		// 소분류
		if(LMS == "S"){
			
			for(var i in ids){
				var iud = $("#list").getCell(ids[i], "iud");
				if(iud == "I" || iud == "U" || iud == "D"){
					alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
					return
				}
			}
			
			if(ids2.length < 1){
				alert(i18n.message_019); // "수정할 정보가 존재하지 않습니다."
				return
			}
			
			if(rowid2 == null || rowid2 == ""){
				alert(i18n.message_196); //"소분류 코드를 선택해주세요."
				return
			}
			
			var iud = $('#list2').getCell(rowid2, "iud");
			
			if(iud != "I" && iud != "D"){
				jQuery("#list2").setColProp('smll_cd', { editable: false });  // 중분류 수정 불가
				$("#list2").jqGrid("setCell",rowid2,'iud',"U"); // 첫 행에 Row 추가
				jQuery('#list2').editRow(rowid2);
				jQuery("#list2").setColProp('smll_cd', { editable: true });	 // 중분류 수정 가능 
			}
		}
		
	}


	// 행 불용
	function fn_expr(LMS){
		var rowid = "";
		// 중분류
		if(LMS == "M"){
			var ids2 = $("#list2").getDataIDs();
			for(var i in ids2){
				var iud = $("#list2").getCell(ids2[i], "iud");
				if(iud == "I" || iud == "U" || iud == "D"){
					alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
					return
				}
			}
			rowid = $("#list").getGridParam("selrow");
			var iud = $('#list').getCell(rowid, "iud");
			if(iud == "I" || iud == "U"){
				return
			}
			$("#list").jqGrid("setCell",rowid,'iud',"D"); // 첫 행에 Row 추가
		// 소분류
		}else if(LMS == "S"){
			var ids = $("#list").getDataIDs();
			for(var i in ids){
				var iud = $("#list").getCell(ids[i], "iud");
				if(iud == "I" || iud == "U" || iud == "D"){
					alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
					return
				}
			}
			rowid = $("#list2").getGridParam("selrow");
			var iud = $('#list2').getCell(rowid, "iud");
			if(iud == "I" || iud == "U"){
				return
			}
			$("#list2").jqGrid("setCell",rowid,'iud',"D"); // 첫 행에 Row 추가
		// 상세 데이터
		}else if(LMS == "D"){
			var checkLMS = $("#checkLMS").val();
			var lrgc_cd = $("#lrgc_cd").val();
			var mddl_cd = $("#mddl_cd").val();
			var smll_cd = $("#smll_cd").val();
			var expr_date = $("#expr_date").val();
			if(confirm(i18n.message_060)){ //"정말 불용 처리 하시겠습니까?"
				$.ajax({
				 		type : "post",
				 		url : "/json/code/risCodeUpdate.do?checkLMS="+checkLMS + "&iud=D&lrgc_cd="+lrgc_cd+"&mddl_cd="+mddl_cd+"&smll_cd="+smll_cd,
				 		async : false,
				 		error : function(){
				 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
				 		},
				 		success : function(data) {
				 			if(data.error_code == "0"){
				 				alert(i18n.message_061); //"불용 처리가 완료 되었습니다."
				 				location.reload();
				 				return
				 			}
				 		}
				 	});
			}
		}
	}

	// 행 저장
	function fn_save(LMS){
		var iudCntS = 0; // 등록/수정 성공갯수
		var codeCheck = "";
		var nscdCheck = new Array(); // 저장전에 중복되는 코드 골라내기
		// 중분류
			var ids = $("#list").getDataIDs();
		
		// 소분류
			var ids2 = $("#list2").getDataIDs();
		
		
		// 중분류
			if(LMS == "M"){
				
				for(var i in ids2){
					var iud = $('#list2').getCell(ids2[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
						
				}
				for(var i in ids){
					
					$("#list").jqGrid('saveRow',ids[i]);
					var iud = $('#list').getCell(ids[i], "iud");
					var lrgc_cd = $('#list').getCell(ids[i], "lrgc_cd");
					var mddl_cd = $('#list').getCell(ids[i], "mddl_cd");
					var mddl_kr_nm = $('#list').getCell(ids[i], "mddl_kr_nm");
					var mddl_acph = $('#list').getCell(ids[i], "mddl_acph");
					var otpt_sqnc = $('#list').getCell(ids[i], "otpt_sqnc");
					var appl_date = $('#list').getCell(ids[i], "appl_date");
					var expr_date = $('#list').getCell(ids[i], "expr_date");
					
					if(nscdCheck.length > 0 && iud == "I"){
						for(var z = 0; z < nscdCheck.length;z++){
							if(mddl_cd == nscdCheck[z]){
								jQuery('#list').jqGrid('editRow',ids[i] ,false);
		 		 				alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
		 		 				$("#list").jqGrid('setSelection', ids[i], true);
								return
							}
						}
					}
					
					if((mddl_cd == null || mddl_cd == '') || (mddl_kr_nm == null  || mddl_kr_nm == '') || (mddl_acph == null  || mddl_acph == '')
							|| (otpt_sqnc == null  || otpt_sqnc == '') || (appl_date == null  || appl_date == '') || (expr_date == null  || expr_date == '')){
							if(iud == "I"){
								jQuery('#list').jqGrid('editRow',ids[i],false);
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list").setColProp('mddl_cd', { editable: false });
								$("#list").jqGrid("setCell",ids[i],'iud',"U"); // 첫 행에 Row 추가
								jQuery('#list').editRow(ids[i]);
								jQuery("#list").setColProp('mddl_cd', { editable: true });
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}
						
						/* 적용일자 > 불용일자 일 경우 */
						}else if(expr_date < appl_date){
							if(iud == "I"){
								$("#list").jqGrid("setCell",ids[i],'expr_date',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list').jqGrid('editRow',ids[i],false);
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list").setColProp('mddl_cd', { editable: false });
								$("#list").jqGrid("setCell",ids[i],'iud',"U"); 
								$("#list").jqGrid("setCell",ids[i],'expr_date',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list').editRow(ids[i]);
								jQuery("#list").setColProp('mddl_cd', { editable: true });
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}
						}
						
					if(iud == "I"){
						jQuery('#list').jqGrid('editRow',ids[i],false);
						fn_reset()
						
						document.savefrm.lrgc_cd.value =lrgc_cd;
						document.savefrm.mddl_cd.value =mddl_cd;
						document.savefrm.mddl_kr_nm.value =mddl_kr_nm;
						document.savefrm.mddl_acph.value =mddl_acph;
						document.savefrm.otpt_sqnc.value =otpt_sqnc;
						document.savefrm.appl_date.value =appl_date;
						document.savefrm.expr_date.value =expr_date;
						
						var authok = $("form[name='savefrm']").serialize();
						
						$.ajax({
			 		 		type : "post",
			 		 		url : "/json/code/risCodeInsert.do?checkLMS="+LMS+"&codeCheck=Y",
			 		 		data : authok,
			 		 		async : false,
			 		 		error : function(){
			 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
			 		 		},
			 		 		success : function(data) {
			 		 			if(data.error_code == "8"){
			 		 				jQuery('#list').jqGrid('editRow',ids[i] ,false);
			 		 				alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
			 		 				codeCheck = "N"
			 		 				$("#list").jqGrid('setSelection', ids[i], true);
			 		 			}
			 		 		}
			 		 	});
						if(codeCheck == "N"){
							return;
						}else{
							nscdCheck.push(mddl_cd)
						}
					}else if(iud == "U"){
						jQuery("#list").setColProp('mddl_cd', { editable: false });
						jQuery('#list').editRow(ids[i]);
						jQuery("#list").setColProp('mddl_cd', { editable: true });
					}
				}// for end
				
				for(var i in ids){
					$("#list").jqGrid('saveRow',ids[i]);
					var iud = $('#list').getCell(ids[i], "iud");
					var lrgc_cd = $('#list').getCell(ids[i], "lrgc_cd");
					var mddl_cd = $('#list').getCell(ids[i], "mddl_cd");
					var mddl_kr_nm = $('#list').getCell(ids[i], "mddl_kr_nm");
					var mddl_acph = $('#list').getCell(ids[i], "mddl_acph");
					var otpt_sqnc = $('#list').getCell(ids[i], "otpt_sqnc");
					var appl_date = $('#list').getCell(ids[i], "appl_date");
					var expr_date = $('#list').getCell(ids[i], "expr_date");
					
					fn_reset()
					
					document.savefrm.iud.value 			=iud;
					document.savefrm.lrgc_cd.value 		=lrgc_cd;
					document.savefrm.mddl_cd.value 		=mddl_cd;
					document.savefrm.mddl_kr_nm.value 	=mddl_kr_nm;
					document.savefrm.mddl_acph.value	=mddl_acph;
					document.savefrm.otpt_sqnc.value 	=otpt_sqnc;
					document.savefrm.appl_date.value 	=appl_date;
					document.savefrm.expr_date.value 	=expr_date;
					
					var authok = $("form[name='savefrm']").serialize();
					
					if(iud == "I"){
						$.ajax({
			 		 		type : "post",
			 		 		url : "/json/code/risCodeInsert.do?checkLMS="+LMS,
			 		 		data : authok,
			 		 		async : false,
			 		 		error : function(){
			 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
			 		 		},
			 		 		success : function(data) {
			 		 			if(data.error_code == "0"){
			 		 				$("#list").jqGrid("setCell",ids[i],'iud'," ");
			 		 				iudCntS++;
			 		 			}else{
			 		 				jQuery('#list').jqGrid('editRow',ids[i] ,false);
			 		 				alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
			 		 				$("#list").jqGrid('setSelection', ids[i], true);
			 		 			}
			 		 		}
			 		 	});
						
					}else if(iud == "U" || iud == "D"){
						
						$.ajax({
			 		 		type : "post",
			 		 		url : "/json/code/risCodeUpdate.do?searchstatus=V&checkLMS="+LMS,
			 		 		data : authok,
			 		 		async : false,
			 		 		error : function(){
			 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
			 		 		},
			 		 		success : function(data) {
			 		 			if(data.error_code == "0"){
				 		 			$("#list").jqGrid("setCell",ids[i],'iud'," ");
				 		 			iudCntS++;
			 		 			}
			 		 		}
			 		 	});
					}else{
						// 중분류 삭제
					}
				}// For END
				if(iudCntS < 1){
					alert(i18n.message_065); //"변경할 정보가 없습니다."
				}else{
					alert(i18n.message_025.replace("X",iudCntS)); //"총 " + iudCntS +"건이 처리되었습니다."
					jQuery("#list").trigger("reloadGrid");
				}
			}
		
		// 소분류
			if(LMS == "S"){
				
				for(var i in ids){
					var iud = $('#list').getCell(ids[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						alert(i18n.message_058); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
						
				}
				
				for(var i in ids2){
					$("#list2").jqGrid('saveRow',ids2[i]);
					var iud = $('#list2').getCell(ids2[i], "iud");
					var lrgc_cd = $('#list2').getCell(ids2[i], "lrgc_cd");
					var mddl_cd = $('#list2').getCell(ids2[i], "mddl_cd");
					var smll_cd = $('#list2').getCell(ids2[i], "smll_cd");
					var smll_kr_nm = $('#list2').getCell(ids2[i], "smll_kr_nm");
					var otpt_sqnc = $('#list2').getCell(ids2[i], "otpt_sqnc");
					var appl_date = $('#list2').getCell(ids2[i], "appl_date");
					var expr_date = $('#list2').getCell(ids2[i], "expr_date");
					if(nscdCheck.length > 0 && iud == "I"){
						for(var z = 0; z < nscdCheck.length;z++){
							if(smll_cd == nscdCheck[z]){
								jQuery('#list2').jqGrid('editRow',ids2[i] ,false);
		 		 				alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
		 		 				$("#list2").jqGrid('setSelection', ids2[i], true);
								return
							}
						}
					}
					
					if((smll_cd == null || smll_cd == '') || (smll_kr_nm == null  || smll_kr_nm == '')
							||(otpt_sqnc == null  || otpt_sqnc == '') || (appl_date == null  || appl_date == '') || (expr_date == null  || expr_date == '')){
							if(iud == "I"){
								jQuery('#list2').jqGrid('editRow',ids2[i],false);
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return;
							}else if(iud =="U"){
								jQuery("#list2").setColProp('smll_cd', { editable: false });
								jQuery('#list2').editRow(ids2[i]);
								jQuery("#list2").setColProp('smll_cd', { editable: true });
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return;
							}
						
						}else if(expr_date < appl_date){
							if(iud == "I"){
								$("#list2").jqGrid("setCell",ids2[i],'expr_date',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list2').jqGrid('editRow',ids2[i],false);
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list2").setColProp('smll_cd', { editable: false });
								$("#list2").jqGrid("setCell",ids2[i],'iud',"U"); 
								$("#list2").jqGrid("setCell",ids2[i],'expr_date',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list2').editRow(ids2[i]);
								jQuery("#list2").setColProp('smll_cd', { editable: true });
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return
							}
						}
						if(iud == "I"){
							jQuery('#list2').jqGrid('editRow',ids2[i],false);
							fn_reset();
							
							document.savefrm.lrgc_cd.value =lrgc_cd;
							document.savefrm.mddl_cd.value =mddl_cd;
							document.savefrm.smll_cd.value =smll_cd;
							document.savefrm.smll_kr_nm.value =smll_kr_nm;
							document.savefrm.otpt_sqnc.value =otpt_sqnc;
							document.savefrm.appl_date.value =appl_date;
							document.savefrm.expr_date.value =expr_date;
							
							var authok = $("form[name='savefrm']").serialize();
							
							$.ajax({
				 		 		type : "post",
				 		 		url : "/json/code/risCodeInsert.do?checkLMS="+LMS+"&codeCheck=Y",
				 		 		data : authok,
				 		 		async : false,
				 		 		error : function(){
				 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
				 		 		},
				 		 		success : function(data) {
				 		 			if(data.error_code == "8"){
				 		 				jQuery('#list').jqGrid('editRow',ids2[i] ,false);
				 		 				alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
				 		 				codeCheck = "N"
				 		 				$("#list").jqGrid('setSelection', ids2[i], true);
				 		 			}
				 		 		}
				 		 	});
							if(codeCheck == "N"){
								return;
							}else{
								nscdCheck.push(smll_cd)
							}
						}else if(iud == "U"){
							jQuery("#list2").setColProp('smll_cd', { editable: false });
							jQuery('#list2').editRow(ids2[i]);
							jQuery("#list2").setColProp('smll_cd', { editable: true });
						}
					
				}// for end
				for(var i in ids2){
					$("#list2").jqGrid('saveRow',ids2[i]);
					var iud = $('#list2').getCell(ids2[i], "iud");
					var lrgc_cd = $('#list2').getCell(ids2[i], "lrgc_cd");
					var mddl_cd = $('#list2').getCell(ids2[i], "mddl_cd");
					var smll_cd = $('#list2').getCell(ids2[i], "smll_cd");
					var smll_kr_nm = $('#list2').getCell(ids2[i], "smll_kr_nm");
					var otpt_sqnc = $('#list2').getCell(ids2[i], "otpt_sqnc");
					var appl_date = $('#list2').getCell(ids2[i], "appl_date");
					var expr_date = $('#list2').getCell(ids2[i], "expr_date");
					
						fn_reset();
						
						document.savefrm.iud.value 			=	iud;
						document.savefrm.lrgc_cd.value 		=	lrgc_cd;
						document.savefrm.mddl_cd.value 		=	mddl_cd;
						document.savefrm.smll_cd.value 		=	smll_cd;
						document.savefrm.smll_kr_nm.value 	=	smll_kr_nm;
						document.savefrm.otpt_sqnc.value 	=	otpt_sqnc;
						document.savefrm.appl_date.value 	=	appl_date;
						document.savefrm.expr_date.value 	=	expr_date;
						
						var authok = $("form[name='savefrm']").serialize();
						
						if(iud == "I"){
							
							$.ajax({
				 		 		type : "post",
				 		 		url : "/json/code/risCodeInsert.do?checkLMS="+LMS,
				 		 		data : authok,
				 		 		async : false,
				 		 		error : function(){
				 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
				 		 		},
				 		 		success : function(data) {
				 		 			if(data.error_code == "0"){
				 		 				$("#list2").jqGrid("setCell",ids2[i],'iud'," ");
				 		 				iudCntS++;
				 		 			}
				 		 		}
				 		 	});
							
						}else if(iud == "U" || iud == "D"){
							
							$.ajax({
				 		 		type : "post",
				 		 		url : "/json/code/risCodeUpdate.do?use_yn=N&checkLMS="+LMS,
				 		 		data : authok,
				 		 		async : false,
				 		 		error : function(){
				 		 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
				 		 		},
				 		 		success : function(data) {
				 		 			if(data.error_code == "0"){
					 		 			$("#list2").jqGrid("setCell",ids2[i],'iud'," ");
					 		 			iudCntS++;
				 		 			}
				 		 		}
				 		 	});
						}
				}// For END
				if(iudCntS < 1){
					alert(i18n.message_065); //"변경할 정보가 없습니다."
				}else{
					alert(i18n.message_025.replace("X",iudCntS)); //"총 " + iudCntS +"건이 처리되었습니다."
					jQuery("#list2").trigger("reloadGrid");
				}
			}
	}

	//초기화
	function fn_reset(){
		
	    document.savefrm.iud.value						="";
	    
	    document.savefrm.lrgc_cd.value					="";
	    
		document.savefrm.mddl_cd.value					="";
		document.savefrm.mddl_kr_nm.value				="";
		document.savefrm.mddl_acph.value				="";
		
		document.savefrm.smll_cd.value					="";
		document.savefrm.smll_kr_nm.value				="";
		
		document.savefrm.otpt_sqnc.value				="";
		document.savefrm.appl_date.value				="";
		document.savefrm.appl_date.value				="";
		document.savefrm.expr_date.value				="";
	    
	}

	//행 삭제
	function fn_delete(LMS){
		var iudcnt = 0;	// 등록,수정중인 행 갯수
		var q_user_id = $("#q_user_id").val();
		
		// 중분류	
			var rowid = $("#list").getGridParam( "selrow" );
			var ids = $("#list").getDataIDs();
			var iud = $("#list").getCell(rowid, "iud");
			if(LMS == "M" || LMS == "D"){
				for(var i in ids){
					var iudIU = $("#list").getCell(ids[i], "iud");
					if(iudIU == "I" || iudIU == "U"){
						iudcnt++;
					}
				}
			}
		
		// 소분류
			var rowid2 = $("#list2").getGridParam( "selrow" );
			var ids2 = $("#list2").getDataIDs();
			var iud2 = $("#list2").getCell(rowid2, "iud");
		
			if(LMS == "S" || LMS == "D"){
				for(var i in ids2){
					var iudIU = $("#list2").getCell(ids2[i], "iud");
					if(iudIU == "I" || iudIU == "U"){
						iudcnt++;
					}
				}
			}
		
		// 상세보기 삭제	
			if(LMS == "D"){
				if(iudcnt > 0 ){
					alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
					return
				}
				if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"
					
					var checkLMS = $("#checkLMS").val();
					var lrgc_cd = $("#lrgc_cd").val();
					var mddl_cd = $("#mddl_cd").val();
					var smll_cd = $("#smll_cd").val();
					var expr_date = $("#expr_date").val();
					
					$.ajax({
				 		type : "post",
				 		url : "/json/code/risCodeDelete.do?checkLMS="+checkLMS+"&lrgc_cd="+lrgc_cd+"&mddl_cd="+mddl_cd+"&smll_cd="+smll_cd+"&currdate="+currdate+"&q_user_id="+q_user_id,
				 		error : function(){
				 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
				 		},
				 		success : function(data) {
				 			if(data.error_code == "0"){
				 				alert(i18n.message_067); //"삭제가 완료 되었습니다."
				 				fn_query();
				 				//location.reload();
				 				return
				 			}else{
				 				alert(i18n.message_068); //"하위코드가 존재합니다.\n하위코드 삭제 후 다시 시도해주세요."
				 				return
				 			}
				 		}
				 	});
				}else{
					return
				}
			}	
			
		// 중분류
			if(LMS == "M"){
				
				for(var i in ids2){
					var iudIU = $("#list2").getCell(ids2[i], "iud");
					if(iudIU == "I" || iudIU == "U"){
						alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
				}
				
				if(rowid == null || rowid == ""){
					alert(i18n.message_050); //"중분류 코드를 선택해주세요."
					return
				}
				
				if(iudcnt < 1){
					
					var expr_date = $('#list').getCell(rowid, "expr_date");
					
					
					if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"
						fn_reset();
						
						document.savefrm.lrgc_cd.value  = $('#list').getCell(rowid, "lrgc_cd");
						document.savefrm.mddl_cd.value  = $('#list').getCell(rowid, "mddl_cd");
						document.savefrm.checkLMS.value = LMS;
						
						var authok = $("form[name='savefrm']").serialize();
						
						$.ajax({
					 		type : "post",
					 		url : "/json/code/risCodeDelete.do",
					 		data : authok,
					 		error : function(){
					 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
					 		},
					 		success : function(data) {
					 			if(data.error_code == "0"){
					 				alert(i18n.message_067); //"삭제가 완료 되었습니다."
					 				jQuery("#list").trigger("reloadGrid");
					 			}else{
					 				alert(i18n.message_068); //"하위코드가 존재합니다.\n하위코드 삭제 후 다시 시도해주세요."
					 			}
					 		}
					 	});
					}else{
						return
					}
					
				}else{
					
					if(iud == "I"){
						$("#list").jqGrid("delRowData", rowid); // 행 삭제
						jQuery('#list').jqGrid('editRow',rowid,false);
						
						for(var i in ids){
							if(rowid == ids[i]){
								if(i == 0){
									i = 2;
								}
								if(ids.length != 1){
									$("#list").jqGrid('setSelection', ids[(parseInt(i)-1)], true);  
								}
							}
						}
						
						if(ids.length == 1){
							$("#list > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_051+"<br/></b></td></tr>"); //중분류 코드가 존재하지않습니다.
						}
					}else{
						alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
					}
					
				}
			}
		
		// 소분류	
			if(LMS == "S"){
				
				for(var i in ids){
					var iudIU = $("#list").getCell(ids[i], "iud");
					if(iudIU == "I" || iudIU == "U"){
						alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
						return
					}
				}
				
				if(rowid2 == null || rowid2 == ""){
					alert(i18n.message_196); //"소분류 코드를 선택해주세요."
					return
				}
				
				if(iudcnt < 1){
					
					var expr_date = $('#list2').getCell(rowid2, "expr_date");
					
					
					
					
					if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"
						
						fn_reset();
						document.savefrm.lrgc_cd.value  = $('#list2').getCell(rowid2, "lrgc_cd");
						document.savefrm.mddl_cd.value  = $('#list2').getCell(rowid2, "mddl_cd");
						document.savefrm.smll_cd.value  = $('#list2').getCell(rowid2, "smll_cd");
						document.savefrm.checkLMS.value = LMS;
						
						var authok = $("form[name='savefrm']").serialize();
					
						$.ajax({
					 		type : "post",
					 		url : "/json/code/risCodeDelete.do",
					 		data : authok,
					 		error : function(){
					 			alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
					 		},
					 		success : function(data) {
					 			if(data.error_code == "0"){
					 				alert(i18n.message_067); //"삭제가 완료 되었습니다."
					 				jQuery("#list2").trigger("reloadGrid");
					 			}
					 		}
					 	});
					}else{
						return
					}
					
				}else{
					
					if(iud2 == "I"){
						$("#list2").jqGrid("delRowData", rowid2); // 행 삭제
						jQuery('#list2').jqGrid('editRow',rowid2,false);
						
						for(var i in ids2){
							if(rowid2 == ids2[i]){
								if(i == 0){
									i = 2;
								}
								if(ids2.length != 1){
									$("#list2").jqGrid('setSelection', ids2[(parseInt(i)-1)], true);  
								}
							}
						}
						
						if(ids2.length == 1){
							$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
						}
					}else{
						alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
					}
					
				}
			}
		
		
	}


	/* 수정페이지 이동 */
	function fn_update(){
		var iudcnt = 0;	// 등록,수정 행 갯수
		
		var ids = $("#list").getDataIDs();
		var ids2 = $("#list2").getDataIDs();

		for(var i in ids){
			var iud = $("#list").getCell(ids[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}
		for(var i in ids2){
			var iud = $("#list2").getCell(ids2[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}
		if(iudcnt > 0 ){
			if(confirm(i18n.message_069)){ //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
				document.regfrm.action = "/code/risCodeUpdate.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
			    document.regfrm.submit();
			}else{
				return;
			}
			
		}else{
			document.regfrm.action = "/code/risCodeUpdate.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
		    document.regfrm.submit();
		}
	}


	/* 상세보기 */
	function fn_viewer(LMS,view){
		var iudcnt = 0;
		// 중분류
		var ids = $("#list").getDataIDs();
		var rowid = $("#list").getGridParam( "selrow" );
		var mddl_cd_iud = $("#list").getCell(rowid, "iud");

		if(mddl_cd_iud == "I"){
			return
		}

		for(var i in ids){
			var iud = $("#list").getCell(ids[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}
			
		if(rowid == null && LMS == "M" && view != "V"){
			alert(i18n.message_050); //"중분류 코드를 선택해주세요."
			return
		}
		// 소분류
		var ids2 = $("#list2").getDataIDs();
		var rowid2 = $("#list2").getGridParam( "selrow" );
		
		var smll_cd_iud = $("#list2").getCell(rowid2, "iud");

		if(smll_cd_iud == "I" || smll_cd_iud == "U" || iud == "D"){
			return
		}
		
		for(var i in ids2){
			var iud = $("#list2").getCell(ids2[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}

		if(rowid2 == null && LMS == "S"){
			alert(i18n.message_196); //"소분류 코드를 선택해주세요."
			return
		}
		if(iudcnt > 0 ){
			if(confirm(i18n.message_069)){ //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
				iudcnt = 0;
			}
		}
		if(iudcnt < 1){
			// 대분류
				if(LMS == "L"){
						document.regfrm.checkLMS.value =LMS;
						document.regfrm.action = "/code/risCodeView.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
					    document.regfrm.submit();
				}
			// 중분류
				if(LMS == "M"){
						
					if(view == "V"){
						document.regfrm.checkLMS.value =LMS;
						document.regfrm.action = "/code/risCodeView.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
					    document.regfrm.submit();
					}else{
						var lrgc_cd = $('#list').getCell(rowid, "lrgc_cd");
						var mddl_cd = $('#list').getCell(rowid, "mddl_cd");
						
						fn_reset();
						
						document.savefrm.checkLMS.value =LMS;
						document.savefrm.lrgc_cd.value =lrgc_cd;
						document.savefrm.mddl_cd.value =mddl_cd;
						
						document.savefrm.action = "/code/risCodeView.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
					    document.savefrm.submit();
						
					}
				}
			// 소분류
				if(LMS == "S"){
					    
						var lrgc_cd = $('#list2').getCell(rowid2, "lrgc_cd");
						var mddl_cd = $('#list2').getCell(rowid2, "mddl_cd");
						var smll_cd = $('#list2').getCell(rowid2, "smll_cd");
				
						fn_reset();
						
						document.savefrm.checkLMS.value =LMS;
						document.savefrm.lrgc_cd.value =lrgc_cd;
						document.savefrm.mddl_cd.value =mddl_cd;
						document.savefrm.smll_cd.value =smll_cd;
						
						document.savefrm.action = "/code/risCodeView.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
					    document.savefrm.submit();
				}
		}
	}		 

	/* 목록(돌아가기) */
	function fn_query(){
	var iudcnt = 0;
		
		var ids = $("#list").getDataIDs();
		var ids2 = $("#list2").getDataIDs();

		for(var i in ids){
			var iud = $("#list").getCell(ids[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}
		for(var i in ids2){
			var iud = $("#list2").getCell(ids2[i], "iud");
			if(iud == "I" || iud == "U" || iud == "D"){
				iudcnt++;
			}
		}
		if(iudcnt > 0 ){
			if(confirm(i18n.message_069)){  //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
				document.regfrm.action = "/code/risCodeList.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
			    document.regfrm.submit();
			}else{
				return;
			}
			
		}else{
			document.regfrm.action = "/code/risCodeList.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
		    document.regfrm.submit();
		}
	}
	</script>
	<!-- <style type="">
	tr{border: 1px solid black;}
	td{border: 1px solid black;}
	input:read-only, textarea:read-only {
	  background-color: #ccc;
	}
	</style> -->
	<style>
	.ui-datepicker{ font-size: 11px; width: 200px; }
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
	.ui-jqgrid .ui-jqgrid-titlebar{
		padding-top: 0em;
	}
	textarea {
	      width: 100%;
	      resize: none;
	      line-height: 1.6;
	    }
	td {
		text-overflow : ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	</style>


	<script type="text/javascript"> 

	$(document).ready(function(){
		if($("#session").val() == '' ||$("#session").val() == null){
			//alert(i18n.message_012); //"로그인 후 이용해 주세요!"
			document.chkfrm.action = "/index.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
		   	document.chkfrm.submit();
		   	return;
		}
	 	$.ajax({
		     type: "post",
	         url: "/json/com/getSydsate.do", 
		 	 async : false, 
	         dataType : "json", 
	         success : function(data) {        
	         	 
	         }
		 });
		 
	}); 
	</script>
	</head>
	<body>
	<form id="chkfrm" name="chkfrm" method="post"> 
		<input type="hidden" name="session" id="session" value=""/>
	</form> 
		<div id="wrap" >
			<div id="header">
				






	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	 

	<!-- <link rel="stylesheet" type="text/css" href="/css/base.css" />  -->
	<!-- <link rel="stylesheet" type="text/css" href="/css/button.css"/> -->

	  <script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/grid/jquery-1.9.0.min.js'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/grid/jquery.jqGrid.min.js'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/grid/jquery.jqGrid.src.js'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/jquery.form.js;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/jquery.form.min.js;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/jquery-ui.min.js;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96'></script> 
	<script type="text/javascript" src='http://192.168.0.77:8081/js/calendar/datepicker-ko.js'></script>
	<script type="text/javascript" src="http://192.168.0.77:8081/js/jquery/grid/grid.locale-kr.js"></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jqgrid_common.js'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/common.js'></script> 


	<!-- 	<link rel="stylesheet" type="text/css" href="/css/risstyle.css" /> -->


	<!-- 	<link rel="stylesheet" type="text/css" href="/css/risstyle1.css" /> -->


	<!-- 	<link rel="stylesheet" type="text/css" href="/css/risstyle2.css" /> -->

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<!--  <link
	      rel="stylesheet"
	      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	      crossorigin="anonymous"
	 />  -->
	<!-- <link rel="stylesheet" type="text/css" href="/css/hwict.jquery-ui.css"/> -->
	<!-- <link rel="stylesheet" type="text/css" href="/css/hwict.ui.jqgrid.css"/> 
	<link rel="stylesheet" type="text/css" href="/css/ui.multiselect.css"/>   -->
	 
	<!-- <link rel="stylesheet" type="text/css" href="/css/hwict.css" /> -->
	  <link rel="stylesheet" type="text/css" href="http://192.168.0.77:8081/css/risstyle.css" />
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jqgrid_common.js'></script>
	<script type="text/javascript" src='http://192.168.0.77:8081/js/jquery/common.js'></script>
	<meta http-equiv="Cache-Control" content="no-Cache" /> 
	<meta http-equiv="Pragma" content="no-Cache" /> 
	<meta http-equiv="imagetoolbar" content="no" /> 
	<meta name="robots" content="noindex,nofollow" />  



	<style>
	.header__menu h1{
		font-size:25px;
	}
	.header__menu h1 sapn{
		font-size:12px;
	}
	</style>

	<script>
	var i18n = JSON.parse('null');
	if(i18n == null){
		//alert(i18n.message_012); //"로그인 후 이용해주세요"
		document.chkfrm.action = "/index.do;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96";
	   	document.chkfrm.submit();
	}
	</script>
	<script type="text/javascript">
	    function fnPwdChange(){ 
			var popupwidth = '510';
			var popupheight = '170'; 
			var url = "";  

			url = "/popup/pwdchange.do";
			 		
		 	var LeftPosition = (screen.width-popupwidth)/2;
			var TopPosition  = (screen.height-popupheight)/2;

			var oPopup = window.open(url,"비밀번호변경","width="+popupwidth+",height="+popupheight+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
			if(oPopup){oPopup.focus();}
		   
	    }
	   
		function setLangGubun(gubun){		
			document.loginfrm.lang_gubun.value = gubun;		 
			document.loginfrm.submit(); 
		}
		
	 </script>
	 </head> 
	<form name="loginfrm" action="http://192.168.0.77:8081/com/LangGubunAct.do" method="post">
	<input type="hidden" value="" name="hspt_id" id="hspt_id"/>
	<input type="hidden" value="" name="hspt_nm" id="hspt_nm"/>   
	<input type="hidden"  name="login_id" id="login_id"  value=""/> 
	<input type="hidden"  name="lang_gubun" id="lang_gubun"  value=""/>   
	</form>

	 <div id="layout" class="no-flex-layout">
	      <div class="header__flex">
	        <header class="header__menu"><div stlye="font-size:20pt;">
	          <a href="http://192.168.0.77:8081/com/UserMenuMake.do" class="header__logo-link"> <!-- style="color: rgb(113 121 127)" -->
	          	<!-- <img src="/images/main/logo.png" alt="로고" style="height:60px; float:left;" /> -->
	          	RIS
	<!--           	<img src="/images/main/logo2.png" alt="로고" style="height:80px;" /> -->
	          </a>
	          
	          </div>
	          <ul class="oneDepth__menu-items">
	            <li class="oneDepth__menu-item">Menu
	              <img src="http://192.168.0.77:8081/images/jqgrid/btn_li.png" alt="li" style="margin-left:10px;" />
	              <ul class="twoDepth__menu-items">
	                <li class="twoDepth__menu-item">
	                  <a href="http://192.168.0.77:8081/com/UserMenuMake.do" class="bookmark__item-link"><img src="http://192.168.0.77:8081/images/icons/icon_li.png" alt="li" />Reload menu</a>
	                </li>
	                <li class="twoDepth__menu-item">
	                  <a href="http://192.168.0.77:8081/com/loginOut.do" class="bookmark__item-link"><img src="http://192.168.0.77:8081/images/icons/icon_li.png" alt="li" />Logout</a>
	                </li> 
	              </ul>
	            </li> 
	             <!-- 사용자 메뉴 생성 처리(로그인정보 기준) -->
	              
			</ui> 
	        </header>
	        <header class="header__bookmark">
	          <ul class="bookmark__items">
	          	<!-- 사용자 즐겨찾기 메뉴 생성 start --> 
	           
	            <!-- 사용자 즐겨찾기 메뉴 생성 END --> 
	          </ul>
	         <!--  <div class="header_bt" style="display:flex; margin-left:auto; margin-right:10px;"> style="display:flex;" 
	          <button class="process__btn2" onclick="openFullscreen()" style="margin-right:10px;">전체화면 전환</button>
	          <button class="process__btn2" onclick="exitFullscreen()">전체화면 종료</button>
	          </div> -->
	          <div class="header_user"> <!-- style="display:contents" --> <!-- style="display:flex;" -->
	          	
	          
	          </div> 
	        </header> 
	  
	  </div>
	</div>

	<!-- Mirrored from 192.168.0.77:8081/code/risCodeView.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 31 Aug 2023 08:15:58 GMT -->
	</html>
	 		
			</div>
			<div id="contents">
				
	<form commandName="VO" id="savefrm" name="savefrm" method="post">
		<input type="hidden" name="iud"      	  value=""/>  
		<input type="hidden" name="checkLMS"      value=""/>  
		<input type="hidden" name="lrgc_cd"       value=""/>  
		<input type="hidden" name="mddl_cd"       value=""/>  
		<input type="hidden" name="smll_cd"       value=""/>  
		<input type="hidden" name="mddl_kr_nm"    value=""/>  
		<input type="hidden" name="mddl_acph"     value=""/>  
		<input type="hidden" name="smll_kr_nm"    value=""/>  
		<input type="hidden" name="otpt_sqnc"     value=""/>  
		<input type="hidden" name="appl_date"     value=""/>  
		<input type="hidden" name="expr_date"     value=""/>
		<input type="hidden" name="currdate" value=""/>
		<input type="hidden" name="q_user_id" id="q_user_id" value=""/>  
	</form>


		<!-- Main 화면 영역  Start -->
		
		<!-- 검색영역 설정 Start --> 
		<div class="inquiry__page-flex mt5">
			<section class="inquiry__search-section">
	        <!-- 검색조건 영역 Start -->
				<div class="inquiry__search-flex" style="justify-content:space-between;"> <!-- 1 Row -->
					<div class="box__flex">
						<a href="javascript:fn_query()" class="ml-2">
							<button class="process__btn">
							<img src="http://192.168.0.77:8081/images/icons/white/process.png" class='mr-1' alt="삭제 " class="icon__img" width="22px"/>
	<!-- 						<span class="box__label">목록</span> -->
							<span class="box__label">List</span>
							</button>
						</a>
									   
						
					</div>
					<div class="box__flex">
						<a href="javascript:fn_update();" class="ml-2">
							<button class="process__btn">
							<img src='http://192.168.0.77:8081/images/jqgrid/btn_modify.png' class='mr-1' alt='수정' />
	<!-- 						<span class="box__label">수정</span> -->
							<span>correction</span>
							</button>
						</a>
						<a href="javascript:fn_expr('D');" class="ml-2">
							<button class="process__btn">
							<img src="http://192.168.0.77:8081/images/jqgrid/btn_x_w.png" class='mr-1' alt="불용" />
	<!-- 						<span class="box__label">불용</span> -->
							<span>Disused</span>
							</button>
						</a>
						<a href="javascript:fn_delete('D');" class="ml-2">
							<button class="process__btn">
							<img src='http://192.168.0.77:8081/images/jqgrid/btn_delete_w.png' class='mr-1' />
	<!-- 						<span class="box__label">삭제</span> -->
							<span>delete</span>
							</button>
						</a>
					</div>
				</div>
	        <!-- 검색조건 영역 End -->
	    	</section>  
			<!-- 검색영역 설정 End -->
			
			<!-- Data 영역설정 Start -->		   	
	    	<section class="inquiry__result-section mt5">
			    
			    <div class="fl-L grid1 mx-1" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
			    <form commandName="VO" id="regfrm" name="regfrm" method="post">
				<input type="hidden" name="currdate" id="currdate" value=""/>
				<input type="hidden" name="q_user_id" id="q_user_id" value=""/>
				<input type="hidden" name="checkLMS" id="checkLMS" value=""/>
				<input type="hidden" name="hspt_id" id="hspt_id" value=""/>
				<input type="hidden" name="lrgc_cd" id="lrgc_cd" value=""/>
				<input type="hidden" name="lrgc_acph" id="lrgc_acph" value=""/>
				<input type="hidden" name="expr_date" id="expr_date" value=""/>
				<input type="hidden" name="q_smll_cd" id="q_smll_cd" value=""/>
				<input type="hidden" name="q_mddl_cd" id="q_mddl_cd" value=""/>
				<input type="hidden" name="q_lrgc_cd" id="q_lrgc_cd" value=""/>
				
				
		           	<table class="table table-hover table-dark" style="width:100%;table-layout: fixed;">
						<colgroup>
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
					    	<col width="10%"/>   
						</colgroup>
						<tbody>
		 	          		
		 	          		
		               		
		                   	<tr>
		                       	<th colspan="2">

		                       		

		                       		

		                       		
		                       	</th>
		                       	<td colspan="4">
		                       		
		                       		
		                       		
		                       	</td>
		                   		<th colspan="2">

		                   			
		                   			

		                       		
		                       		

		                       		
								</th>
		                       	<td colspan="2">
		                       		
		                       		
		                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2">자릿수</th> -->
		                   		<th colspan="2">The number of digits</th>
		                       	<td colspan="4">
		                       		
		                       		
		                       		
		                       	</td>
	<!-- 	                       	<th colspan="2">출력순</th> -->
		                       	<th colspan="2">Print order</th>
		                       	<td colspan="2">
									                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2">적용일자</th> -->
		                   		<th colspan="2">Effective date</th>
		                       	<td colspan="4">
		                       		
		                       	</td>
	<!-- 	                       	<th colspan="2">불용일자</th> -->
		                       	<th colspan="2">Disused date</th>
		                       	<td colspan="2">
									                       		
		                       	</td>
							</tr>
							
		                   
							
		                   	<tr>
	<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값1</th> -->
		                   		<th colspan="2" style="vertical-align: middle;">Text value1</th>
		                       	<td colspan="4">
		                       		<textarea rows="3" cols="1000" readonly="readonly" style="width: 100%;"></textarea>
		                       	</td>
	<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값1</th> -->
		                       	<th colspan="2" style="vertical-align: middle;">Numeric value1</th>
		                       	<td colspan="2" style="vertical-align: middle;">
									                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값2</th> -->
		                   		<th colspan="2" style="vertical-align: middle;">Text value2</th>
		                       	<td colspan="4">
		                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
		                       	</td>
	<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값2</th> -->
		                       	<th colspan="2" style="vertical-align: middle;">Numeric value2</th>
		                       	<td colspan="2" style="vertical-align: middle;">
									                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값3</th> -->
		                   		<th colspan="2" style="vertical-align: middle;">Text value3</th>
		                       	<td colspan="4" style="vertical-align: middle;">
		                       		<textarea rows="3" cols="0" readonly="readonly" style="width: 100%;"></textarea>
		                       	</td>
	<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값3</th> -->
		                       	<th colspan="2" style="vertical-align: middle;">Numeric value3</th>
		                       	<td colspan="2" style="vertical-align: middle;">
									                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값4</th> -->
		                   		<th colspan="2" style="vertical-align: middle;">Text value4</th>
		                       	<td colspan="4">
		                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
		                       	</td>
	<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값4</th> -->
		                       	<th colspan="2" style="vertical-align: middle;">Numeric value4</th>
		                       	<td colspan="2" style="vertical-align: middle;">
									                       		
		                       	</td>
							</tr>
		                   	<tr>
	<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값5</th> -->
		                   		<th colspan="2" style="vertical-align: middle;">Text value5</th>
		                       	<td colspan="4">
		                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
		                       	</td>
	<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값5</th> -->
		                       	<th colspan="2" style="vertical-align: middle;">Numeric value5</th>
		                       	<td colspan="2" style="vertical-align: middle;">
									                       		
		                       	</td>
							</tr>
						</tbody>
					</table>
					<br/>
			</form>
			    
			    <!-- 두개 Grid 처리(좌측,우측) -->
			    
			       	      
			    </div>   	
			    <div class="fl-R grid2" align="center" style="width:50%"> <!-- width은 화면에 맞춰서 조절 -->
			    	
					<table id="list"></table>
					
			       	<table id="list2"></table>
			   	</div>    
			    
			    
			</section>
	        <!-- Data 영역설정 End --> 
	        
		    <!-- 버튼 영역 Start(하단) --> 
			<!-- <section class="inquiry__btn-section mt5">
		        <div class="inquiry__btn-left">
		          <a href=""><button class="process__btn"><img src="/images/icons/white/download.png" alt="" width="18px" /><span>엑셀다운</span></button></a>
		        </div>
		        <div class="inquiry__btn-right">
		          <a href=""><button class="process__btn"><img src="/images/icons/white/inquiry.png" alt="" width="18px" /><span>&nbsp;조 회&nbsp;</span></button></a>
		          <a href=""><button class="process__btn"><img src="/images/icons/white/close.png" alt="" width="18px" /><span>&nbsp;닫 기&nbsp;</span></button></a>
		        </div>
		    </section>  -->
		    <!-- 버튼 영역 End -->
		</div>



			</div>
			<div id="bottom" >
	        	
	        </div>
		</div> 

	  	
	</body>
	</html> 