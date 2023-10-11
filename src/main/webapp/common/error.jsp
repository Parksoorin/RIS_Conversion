<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<title>한울아이씨티 - 404</title>
<style>
	div {
		color : #68BAF2;
		font-weight : 700;
		
	}
	
	.big-font {
		font-size: 30px
	}
	
	.small-font {
		font-size: 20px
	}
	
	.flex {
		display : flex;
	}
	
	.box{
		width : 50%;
		height : 98vh;
	}
	
	.img{
		width: 100%;
	    height: 98vh;
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-image: url("../images/puzzle.jpg");
	}
	
	.mb-50{
		margin-bottom : 50px;
	}
	.mb-25{
		margin-bottom : 25px;
	}
	.small-box{
		margin : 0 auto;
		top : 50%;
		transform : translateY(50%);
		width: 70%;
		height : 50%;
	}

</style>
</head>
<body>
	<div class="flex">
		<div class="box center">
			<div class="small-box">
				<div class="mb-50 big-font">HWICT</div>
				<div class="big-font">404</div>
				<div class="mb-50 big-font">Page Not Fount</div>
				<div class="small-font mb-25">The Page you visited has an invalid or deleted address.(C)</div>
				<div class="small-font mb-25">방문하신 페이지는 주소가 잘못되었거나 삭제된 페이지입니다.</div>
				<div class="small-font"><a href="#" onclick='history.back();'>이전 페이지로 돌아가기</a></div>
			</div>
		</div>
		<div class="box img">
			
		</div>
	</div>

</body>
</html>