<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>공통코드관리 new</title>
		<meta charset="UTF-8">		
		<meta http-equiv="Cache-Control" content="no-Cache" /> <!-- 페이지 내용 캐시X (페이지에 항상 최신 버전의 콘텐츠를 표시하기위함) -->
		<meta http-equiv="Pragma" content="no-Cache" /> <!-- 페이지 캐싱 비활성화 -->
		<meta http-equiv="imagetoolbar" content="no" /> <!-- 이미지 툴바 비활성화(이미지 툴바:이미지 마우스 오른쪽 클릭하면 나타나는 도구모음) -->
		<meta name="robots" content="noindex,nofollow" /> <!-- 이 페이지가 검색결과에 나타지않게함 -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <!-- 뷰포트 설정 : 모바일에서의 웹페이지 표시방식 제어 -->
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />  <!-- 최선 버전의 Internet Explorer로 렌더링 / 브라우저 호환성 문제 방지  -->
		<link rel="stylesheet" type="text/css" href="/css/risstyle2.css" />
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
					  , "text_082" :"대분류 한글 명"
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
	
	<!-------------- 로그인 form (사용자에게 보이지않는 입력필드 폼데이터로 전송) ------------------->
	<form name="loginform" action="" method="post">
		<input type="hidden" value="" name="" id=""/>
		<input type="hidden" value="" name="" id=""/>
		<input type="hidden"  name="" id=""  value=""/>
		<input type="hidden"  name="" id=""  value=""/>
	</form>
	<!--  --------------------------------------------------------------------------->
	
        <!------------------------------------ header.2 - 북마크 ----------------------------------------------------->
        <header class="header_bookmark">
          <ul class="bookmark_items">          	
          </ul>    
          <div class="header_user">
          <select id="lang_gubun" name ="lang_gubun" onchange="javascript:setLangGubun(this.value);">
         			<option value="KR" selected>KOR</option>
         			<option value="EN" >ENG</option>
         	</select>&nbsp;&nbsp;&nbsp;
            <span>사용자 : 관리자</span>
            &nbsp;
            <a href="javascript:fnPwdChange();" class="header_btn"><img src="/images/jqgrid/btn_key.png" alt="비밀번호 변경"/></a>
          </div>
        </header>
        
        <!------------------------------------ header.2 - 북마크 END ----------------------------------------------------->
  </div>
</div>
</html>
		</div>		
<div id="contents">


<!----------------------------------- 상세보기 -> 목록으로 왔을때 select 데이터 유지? --------------------------------------------->
<form id="returnfrm" name="returnfrm" method="post">
<input type="hidden" name="" id="" value=""/>
<input type="hidden" name="" id="" value=""/>
<input type="hidden" name="" id="" value=""/>
<input type="hidden" name="" id="" value=""/>
<input type="hidden" name="currdate" id="currdate" value="2023-09-04"/> <!-- 현재 날짜를 나타내는 입력필드 -->
</form>
<!----------------------------------------------------------------------------------------------------------------------->

	<!--------------------------------- 검색 영역 --------------------------------------------------->
	<div class="searchPage_flex" style="overflow-y:auto;">
    	<section class="in_search-section">
    	
        <!-----------------------------검색창------------------------------------->
     		<div class="in_search-flex">
     			<div class="box__flex">
     				<label class="box__label">검색어 입력&nbsp;:&nbsp;</label>
     				<input type="text" id="searchKeyword" value="" onkeydown="enter()"/>
     				<div class="searchBtn_left">
     					<a href="">
     						<button class="process__btn">
     							<img src="/images/jqgrid/btn_search2.png" class='mr-1' alt="조회" />
     						</button>
     					</a>
   					</div>
				</div>
		<!-----------------------------검색창 END------------------------------------->	
			</div>
    	</section>
	<!--------------------------------- 검색 영역 END --------------------------------------------------->
	
	
		<!-- Data 영역설정 Start -->
    	<section class="inquiry__result-section mt5">
		    <!-- 두개 Grid 처리(좌측,우측) -->
		    <div class="fl-L grid1" align="center" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
			    <form id="lrgc_listForm" name="lrgc_listForm" action="/code/risCodeList.do" method="post" onsubmit="return false">
					<input type="hidden" name="checkLMS" id="checkLMS" value="L" />
					<input type="hidden" name="hspt_id" id="hspt_id" value="" />
					<input type="hidden" name="lrgc_cd" id="lrgc_cd" value="" />
				</form>
				<div class="srcArea">
					<div class="box__flex">
<!-- 						<span style="font-weight:bold;">대분류 코드</span> -->
						<span style="font-weight:bold;">대분류 코드</span>
						<a href='javascript:fn_viewer("L")' class="ml-2">
							<button class='process__btn2'>
								<img src='/images/jqgrid/btn_eye_w.png' alt='상세보기' />
<!-- 								<span>상세</span> -->
								<span>상세</span>
							</button>
						</a>
					</div>
					<div class="box__flex">
						<a href='/code/risCodeInsert.do' class="ml-2">
							<button class='process__btn2'>
								<img src='/images/jqgrid/btn_add_w.png' alt='추가' />
<!-- 								<span>입력</span> -->
								<span>입력</span>
							</button>
						</a>
					</div>
				</div>
		       	<table id="list1"></table>
		    </div>
		    <div class="fl-R grid2" align="center" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
		    	<form id="mddl_listForm" name="mddl_listForm" action="/code/risCodeList.do" method="post">
					<input type="hidden" name="checkLMS" value="M" />
					<input type="hidden" name="hspt_id"  value="" />
					<input type="hidden" name="lrgc_cd"  value="" />
					<input type="hidden" name="mddl_cd"  value="" />
				</form>
				<div class="srcArea">
					<div class="box__flex">
<!-- 						<span style="font-weight:bold;height:24px;">중분류 코드</span> -->
						<span style="font-weight:bold;height:24px;">중분류 코드</span>
<!-- 						<a href='javascript:fn_viewer("M")' class="ml-2"> -->
<!-- 							<button class='process__btn2'> -->
<!-- 								<img src='/images/jqgrid/btn_eye_w.png' alt='상세 보기'/> -->
<!-- 								<span>상세</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
					</div>
					<div class="box__flex">
					</div>
				</div>
		       	<table id="list2"></table>
		       	<form id="smll_listForm" name="smll_listForm" action="/code/risCodeList.do" method="post">
					<input type="hidden" name="checkLMS" value="S" />
					<input type="hidden" name="hspt_id"  value="" />
					<input type="hidden" name="lrgc_cd"  value="" />
					<input type="hidden" name="mddl_cd"  value="" />
					<input type="hidden" name="smll_cd"  value="" />
				</form>
				<div class="srcArea mt5">
					<div class="box__flex">
<!-- 						<span style="font-weight:bold;height:24px;">소분류 코드</span> -->
						<span style="font-weight:bold;height:24px;">소분류 코드</span>
<!-- 						<a href='javascript:fn_viewer("S")' class="ml-2"> -->
<!-- 							<button class='process__btn2'> -->
<!-- 								<img src='/images/jqgrid/btn_eye_w.png' alt='상세 보기' /> -->
<!-- 								<span>상세</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
					</div>
					<div class="box__flex">
					</div>
				</div>
		       	<table id="list3"></table>
		   	</div>
		</section>
	</div>
		</div>
		<div id="bottom" >
        </div>
	</div>
	
	<script type="text/javaScript" language="javascript"> 
		var q_hspt_id = "";
		var q_lrgc_cd = "";
		var q_mddl_cd = "";
		var q_smll_cd = "";
		var currdate  = "";
		
		 /*  Main Grid  */
		 $(document).ready(function(){
		 	/* 상세 보기 이동시  클릭된 행의 번호 및 데이터를 받기 위해 */
			q_hspt_id = $("#q_hspt_id").val();	
			q_lrgc_cd = $("#q_lrgc_cd").val();
			q_mddl_cd = $("#q_mddl_cd").val();
			q_smll_cd = $("#q_smll_cd").val();
			currdate = $("#currdate").val(); 
			 
			var gwidth1 = $(".grid1").width();
			var gwidth2 = $(".grid2").width(); // 중,소
			var gheight = $(".inquiry__result-section").height();
			$(".srcArea").attr("style","display:flex;justify-content: space-between;width:calc(100% - 10px);");
			
			
			// grid가 3개인 경우 width 정의(아직 코딩이 안되어 있음.)	
			// 	var gwidth1 = $(".grid1").width();
			// 	var gwidth2 = $(".grid2").width();
			// 	var gwidth3 = $(".grid3").width();
			
			var caption1 = "";
			var caption2 = "";
			var caption3 = "";
			var grid_id = '"list1"';
			
			var textL = '"L"';
			var textM = '"M"';
			var textS = '"S"';
			
			// 대분류 		  		
			caption1 += "<div class='inquiry__btn-right'>"+
						"<a href=\'javascript:fn_viewer("+textL+")'\><button class='process__btn2'>"+
						"<img src='../images/icons/white/look.png;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB' alt='조회 아이콘' class='icon__img' width='16px'/>"+
				  		"<span style='top:-1px;'>&nbsp;"+i18n.button_011+"&nbsp;</span></button></a>"+ //상세
						"<a href='/code/risCodeInsert.do'><button class='process__btn2'>"+
						"<img src='/images/jqgrid/btn_add.png' alt='추가' width='16px' />"+
						"<span style='top:-1px;''>&nbsp;"+i18n.button_007+"&nbsp;</span></button></a>"+ //입력
						/* "<a href=\'javascript:reloadGridtest("+grid_id+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
						"<img src='../images/icons/white/look.png;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB' alt='조회 아이콘' class='icon__img' width='16px'/>"+
						"<span>&nbsp;새로고침&nbsp;</span></button></a>"+ */
						"</div>";
			// 중분류		  		
			caption2 += "<div class='inquiry__btn-right'>"+
						"<a href=\'javascript:fn_viewer("+textM+")'\><button class='process__btn2'>"+
						"<img src='../images/icons/white/look.png;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB' alt='조회 아이콘' class='icon__img' width='16px'/>"+
				  		"<span style='top:-1px;'>&nbsp;상&nbsp;&nbsp;세&nbsp;</span></button></a></div>"; // 상세보기
			// 소분류		  		
			caption3 += "<div class='inquiry__btn-right'>"+
						"<a href=\'javascript:fn_viewer("+textS+")'\><button class='process__btn2'>"+
						"<img src='../images/icons/white/look.png;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB' alt='조회 아이콘' class='icon__img' width='16px'/>"+
				  		"<span style='top:-1px;'>&nbsp;상&nbsp;&nbsp;세&nbsp;</span></button></a></div>"; // 상세보기
			 
			/* 대분류 코드  */
			$('#list1').jqGrid({
				     url: "/json/code/risCodeList.do;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB?checkLMS=L",	// 서버주소 
				     reordercolNames:true,
				     postData : { 
				    	 search_cd:"D",								// 검색을 위한 값
					     search_lrgc_cd:$("#searchKeyword").val()	// 검색 값
					 }, // URL에서 검색 조건으로 가져갈 파라미터
				     mtype:'POST',	// 전송 타입
				     datatype : "json",	// 받는 데이터 형태 
				     colNames:[i18n.text_076,'병원코드', i18n.text_079, i18n.text_082, i18n.text_083, i18n.text_084, i18n.text_085, i18n.text_086],	//'구분','대분류 코드', '대분류 한글 명', '자릿수', '출력순', '적용일자', '불용일자'
				     colModel:[
				    	 { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center", hidden: true,
					    	 formatter:"select", 
					    	 formatoptions :{value:"N:불용"},
					    	 edittype:"select", 
					    	 editoptions: {value:"N:불용"}   
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'    , width: 0     , hidden: true}					,
					     { name: 'lrgc_cd'	  , index: 'lrgc_cd'	, width: '80'  , align: "left" , key : true}	, 
					     { name: 'lrgc_kr_nm' , index: 'lrgc_kr_nm' , width: '120' , align: "left"}				, 
					     { name: 'lrgc_acph'  , index: 'lrgc_acph'  , width: '45'  , align: "center"}				, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'  , width: '45'  , align: "center"}				, 
					     { name: 'appl_date'  , index: 'appl_date'  , width: '70'  , align: "center"}				, 
					     { name: 'expr_date'  , index: 'expr_date'  , width: '70'  , align: "center"}		 
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
			   	   width : gwidth1-10,
				   height: gheight*0.8, //테이블의 세로 크기, Grid의 높이         
				   loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   emptyrecords: "Nothing to display", 
				   rowNum:-1, 
			       rownumbers: true,         
				   gridview : true,  // 선표시 true/false         
				   loadComplete: function(data){  
				       var ids = $("#list1").getDataIDs();
				       
				       for(var i in ids){ 
				    		var expr_date = $('#list1').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list1").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    		
				    	}
				       
				       	/* 첫 화면에 중,소분류 데이터 */
						jQuery('#list2').jqGrid('clearGridData');
						jQuery('#list3').jqGrid('clearGridData');
						$("#list2 > tbody").append("<tr><td align='center' colspan='11'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_049+"<br/></b></td></tr>");//대분류 코드를 선택해주세요.
						$("#list3 > tbody").append("<tr><td align='center' colspan='11'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_050+"<br/></b></td></tr>");//중분류 코드를 선택해주세요.
						
		    			/* 데이터가 없을 시 */
						var totcnt  = jQuery("#list1").jqGrid("getGridParam","records");
						if(totcnt < 1){
							$("#list1 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_048+"<br/></b></td></tr>"); //대분류 코드가 존재하지않습니다.
						}
						
						// 목록으로 돌아올때 다시 select
						if(q_lrgc_cd != null || q_lrgc_cd != ""){
							$("#list1").jqGrid('setSelection', q_lrgc_cd, true);
						}
						
						
					},	// loadComplete END   
					onSelectRow: function(rowid) {
			          	 var rowObject = $("#list1").jqGrid('getRowData',rowid);
			          	 
			          	$("#lrgc_listForm input[name='hspt_id']").attr("value",rowObject.hspt_id);
			          	$("#lrgc_listForm input[name='lrgc_cd']").attr("value",rowObject.lrgc_cd);
		
			          	jQuery('#list2').jqGrid('clearGridData');
			    		jQuery('#list3').jqGrid('clearGridData');
			    		
			    		jQuery('#list2').jqGrid('setGridParam', {
			    			url: "/json/code/risCodeList.do",
							postData: {
								checkLMS : "M",
								lrgc_cd : rowObject.lrgc_cd,
							},
								datatype:"json"     
								}).trigger("reloadGrid");
			    		
			    		$("#list3 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_050+"<br/></b></td></tr>"); //중분류 코드를 선택해주세요.
			    		
					}
			
			})
			
			/* 서브그리드(중분류) */
			$('#list2').jqGrid({
					url:"/json/code/risCodeList.do",
					postData : { 
				    	 checkLMS : "M",
				    	 lrgc_cd  : q_lrgc_cd
					 }, // URL에서 검색 조건으로 가져갈 파라미터
				     reordercolNames:true, 
				     mtype:'POST', // 전송 타입
				     datatype : "json", // 받는 데이터 형태 
				     colNames:['구분', '병원코드', '대분류 코드',i18n.text_081, i18n.text_222, i18n.text_083, i18n.text_084, i18n.text_085, i18n.text_086], //'중분류 코드', '중분류 한글 명', '자릿수', '출력순', '적용일자', '불용일자'		     
				     colModel:[
				    	 { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center", hidden: true,
					    	 formatter:"select", 
					    	 formatoptions :{value:"N:불용"},
					    	 edittype:"select", 
					    	 editoptions: {value:"N:불용"}   
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'    , width: 0   , hidden: true}				,
					     { name: 'lrgc_cd' 	  , index: 'lrgc_cd'	, width: 0   , hidden: true}				,
					     { name: 'mddl_cd'	  , index: 'mddl_cd'	, width: '80' , align: "left" , key: true}	, 
					     { name: 'mddl_kr_nm' , index: 'mddl_kr_nm' , width: '120' , align: "left"}				, 
					     { name: 'mddl_acph'  , index: 'mddl_acph'  , width: '45'  , align: "center"}				, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'  , width: '45'  , align: "center"}				, 
					     { name: 'appl_date'  , index: 'appl_date'  , width: '70'  , align: "center"}				, 
					     { name: 'expr_date'  , index: 'expr_date'  , width: '70'  , align: "center"}		 
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     //page:'page', // 현재 페이지 currentPage
					     //total:'total', // 총 페이지 수 totalPage
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
				   	width : gwidth2-10,
				   	height: gheight*0.333, //테이블의 세로 크기, Grid의 높이         
				   	loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   	emptyrecords: "Nothing to display",     
				   	rowNum:-1, 
			       	rownumbers: true,         
				   	gridview : true,  // 선표시 true/false         
				   	loadComplete: function(data){ 
				       var ids = $("#list2").getDataIDs();
				       for(var i in ids){ 
				    		var expr_date = $('#list2').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list2").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    	}
					   /* 데이터가 없을 시 */
					   var totcnt  = jQuery("#list2").jqGrid("getGridParam","records");
					  if(totcnt < 1){
						jQuery('#list3').jqGrid('clearGridData');
				  		$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_051+"<br/></b></td></tr>"); //중분류 코드가 존재하지않습니다.
				  		$("#list3 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
					  }
						
					  // 목록으로 돌아올때 다시 select
					  var rowid = $("#list1").getGridParam("selrow");
					  var lrgc_cd = $("#list1").getCell(rowid, "lrgc_cd");
					  
						if((q_mddl_cd != null || q_mddl_cd != "")&&(lrgc_cd == q_lrgc_cd)){
							$("#list2").jqGrid('setSelection', q_mddl_cd, true);
						}
					   
					},   
					onSelectRow: function(rowid) {
			          	 var rowObject = $("#list2").jqGrid('getRowData',rowid);
			          	$("#mddl_listForm input[name='hspt_id']").attr("value",rowObject.hspt_id);
			          	$("#mddl_listForm input[name='lrgc_cd']").attr("value",rowObject.lrgc_cd);
			          	$("#mddl_listForm input[name='mddl_cd']").attr("value",rowObject.mddl_cd);
		    			jQuery('#list3').jqGrid('clearGridData');
		    			
		    			jQuery('#list3').jqGrid('setGridParam', {
			    			url: "/json/code/risCodeList.do",
							postData: {
								checkLMS : "S",
								lrgc_cd : rowObject.lrgc_cd,
								mddl_cd : rowObject.mddl_cd,
							},
								datatype:"json"     
								}).trigger("reloadGrid");
		    			
			        } 
			})
			
			
			/* 서브그리드(소분류) */
			$('#list3').jqGrid({
					 url:"/json/code/risCodeList.do",
					 postData : { 
				    	 checkLMS : "S",
				    	 lrgc_cd  : q_lrgc_cd,
				    	 mddl_cd  : q_mddl_cd
					 }, // URL에서 검색 조건으로 가져갈 파라미터
				     reordercolNames:true, 
				     mtype:'POST', // 전송 타입
				     datatype : "json", // 받는 데이터 형태 
				     colNames:['구분', '병원코드', '대분류 코드', '중분류 코드', i18n.text_080, i18n.text_223, i18n.text_084, i18n.text_085, i18n.text_086], //'소분류 코드','소분류 코드 명','출력순', '적용일자', '불용일자'
				     colModel:[
				    	 { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center", hidden: true,
					    	 formatter:"select", 
					    	 formatoptions :{value:"N:불용"},
					    	 edittype:"select", 
					    	 editoptions: {value:"N:불용"}   
					    	 },
					     { name: 'hspt_id'	  , index: 'hspt_id'	, width: 0   , hidden: true}				,
					     { name: 'lrgc_cd'	  , index: 'lrgc_cd'	, width: 0   , hidden: true}				,
					     { name: 'mddl_cd'    , index: 'mddl_cd'	, width: 0   , hidden: true}				,
		//			     { name: 'lrgc_kr_nm' , index: 'lrgc_kr_nm' , width: 0   , hidden: true}				,
		//			     { name: 'mddl_kr_nm' , index: 'mddl_kr_nm' , width: 0   , hidden: true}				,
					     { name: 'smll_cd'	  , index: 'smll_cd'	, width: '80' , align: "left" , key: true}	, 
					     { name: 'smll_kr_nm' , index: 'smll_kr_nm' , width: '100' , align: "left"}				, 
					     { name: 'otpt_sqnc'  , index: 'otpt_sqnc'  , width: '45'  , align: "center"}				, 
					     { name: 'appl_date'  , index: 'appl_date'  , width: '70' , align: "center"}				, 
					     { name: 'expr_date'  , index: 'expr_date'  , width: '70' , align: "center"}		 
					     ], //서버에서 받은 데이터 설정
				     jsonReader: {
					     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
					     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
					     //page:'page', // 현재 페이지 currentPage
					     //total:'total', // 총 페이지 수 totalPage
					     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
				     },
				   width : gwidth2-10,
				   height: gheight*0.333,         
				   loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."       
				   emptyrecords: "Nothing to display",    
				   rowNum:-1, 
			       rownumbers: true,         
				   gridview : true,  // 선표시 true/false         \
				   loadComplete: function(data){  
		
				       var ids = $("#list3").getDataIDs(); 
					   
				       for(var i in ids){ 
				    		var expr_date = $('#list3').getCell(ids[i], "expr_date");
				    		if(expr_date <= currdate){
				    			$("#list3").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
				    		}
				    		
				    	}
				       
					   /* 데이터가 없을 시 */
					   var totcnt  = jQuery("#list3").jqGrid("getGridParam","records");
					  if(totcnt < 1){
				  		$("#list3 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
					  }
				    	
					  var rowid = $("#list2").getGridParam("selrow");
					  var mddl_cd = $("#list2").getCell(rowid, "mddl_cd");
					  
						if((q_smll_cd != null || q_smll_cd != "")&&(mddl_cd == q_mddl_cd)){
							$("#list3").jqGrid('setSelection', q_smll_cd, true);
						}
					  
					},   
					onSelectRow: function(rowid) {
			          	 var rowObject = $("#list3").jqGrid('getRowData',rowid);
			          	$("#smll_listForm input[name='hspt_id']").attr("value",rowObject.hspt_id);
			          	$("#smll_listForm input[name='lrgc_cd']").attr("value",rowObject.lrgc_cd);
			          	$("#smll_listForm input[name='mddl_cd']").attr("value",rowObject.mddl_cd);
			          	$("#smll_listForm input[name='smll_cd']").attr("value",rowObject.smll_cd);
			        } 
			})
			$("#searchKeyword").focus(); // 화면 시작 시 검색 창 포커스
		});
		
		 /* 화면 reize */	
		 $(window).bind('resize', function() { 
			 if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
		     else {	
			 var gridw = $(window).width()-20;
				//fn_resize("list1", gridw , '0.48'); 
				//fn_resize("list2", gridw , '0.48'); 
				//fn_resize("list3", gridw , '0.48'); 
		     }
		     }).trigger('resize');
		 
		/* 상세보기 */
		function fn_viewer(code){
			/* 대분류 */
			if(code == 'L'){
				 var rowid = $("#list1").getGridParam("selrow");
				 var rowObject = $("#list1").jqGrid('getRowData',rowid);
				 if(rowid < 1 ){
					 alert(i18n.message_053); //"대분류 코드 항목을 선택해주세요."
					 return
				 }else{
		    		 document.lrgc_listForm.action = "/code/risCodeView.do;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB";
		                document.lrgc_listForm.submit();
				 }
				 
			/* 중분류 */
			}else if(code == 'M'){
				 var rowid = $("#list2").getGridParam("selrow");
				 var rowObject = $("#list2").jqGrid('getRowData',rowid);
				 if(rowid < 1 ){
					 alert(i18n.message_054) //"중분류 코드 항목을 선택해주세요."
					 return
				 }else{
		    		 document.mddl_listForm.action = "/code/risCodeView.do;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB";
		                document.mddl_listForm.submit();
				 }
				 
			/* 소분류 */
			}else{
				 var rowid = $("#list3").getGridParam("selrow");
				 var rowObject = $("#list3").jqGrid('getRowData',rowid);
				 if(rowid < 1 ){
					 alert(i18n.message_055) //"소분류 코드 항목을 선택해주세요."
					 return
				 }else{
		    		 document.smll_listForm.action = "/code/risCodeView.do;jsessionid=3BBDAA78392728D1FD9809F7B6BE85CB";
		             document.smll_listForm.submit();
				 }
			}
		}
			
		/* 조회(검색) */
		function fn_egov_selectGrid(){
			$("#list1").clearGridData();    // 이전 데이터 삭제
		   	$("#list2").clearGridData();
		   	$("#list3").clearGridData();
		   	
			q_hspt_id = "";
			q_lrgc_cd = "";
			q_mddl_cd = "";
			q_smll_cd = "";
		   	/* 병원코드, 대분류코드, 대분류 한글명, 대분류 영어명 */
		   	jQuery('#list1').jqGrid('setGridParam', {         
		   		postData: {             
		   			search_cd: "D",              
		   			search_lrgc_cd:$("#searchKeyword").val() 
		   			},         
		   			datatype:"json"     
		   			}).trigger("reloadGrid");
		}
			
		/* 엔터키 검색  */
		function enter(){
			if(window.event.keyCode==13){
					fn_egov_selectGrid();	// 조회(검색)
			}
		}
		
	</script>
</body>
</html>