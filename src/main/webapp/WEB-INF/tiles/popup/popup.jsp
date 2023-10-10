<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<tiles:insertAttribute name="header" />
</head>
<body>
	<div id="wrap" class="wrap">
		<div id="header">
		</div>
		<div id="contents">
		<tiles:insertAttribute name="content" />	
		<%-- <tiles:insertAttribute name="foot" /> --%>
		</div>
	</div>
</body>

<script>
	// 팝업 창 로드 시 세션 정보 없으면 로그인 페이지로 리다이렉트
	$(function() {
		var hsptId = "${hspt_id}";
		var loginId = "${login_id}";
		var loginName = "${login_name}";
		var userGrade = "${user_grade}";
		console.log(loginName);
		
		if (!loginId) {
			window.location.href = "/?hspt_id=A001";
		}
	})
</script>