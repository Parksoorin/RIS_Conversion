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
		
<div id="contents">


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
	
	
    	<section class="inquiry__result-section mt5">
	
		    <div class="fl-L grid1" align="center" style="width:50%;"> 		   
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
		    
	</script>
</body>
</html>