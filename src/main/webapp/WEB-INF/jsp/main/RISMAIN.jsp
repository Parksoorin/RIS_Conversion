<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>main page</h1>
	
	<h2>세션 정보</h2>
    
    <p>병원 ID: ${sessionScope.hspt_id}</p>
    <p>사용자 ID: ${sessionScope.login_id}</p>
    <p>사용자 이름: ${sessionScope.login_name}</p>
    <p>사용자 등급: ${sessionScope.user_grade}</p>
</body>
</html>