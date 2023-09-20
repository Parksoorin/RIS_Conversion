<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js' />"></script>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
</head>
<style>	
</style>
<body>
	<div id="All">
        <div id="left">
            <div id="loginbox">
                <div class='text'>로그인</div>
                <div class="idpw">
                    <input type="text" name="userid" class="outlined-basic" placeholder="ID" id="loginID">
                    <input type="password" name="passwd" class="outlined-basic" placeholder="PW" id="loginPW">
                    <div class="checkbox">
                        <div><input type="checkbox" id="idck"><label for="idck"> 아이디 저장</label></div>
                        <div><a onclick="openPopup()" class="pwlink">비밀번호 변경</a></div>
                    </div>
                </div>
                <div class="btnbox">
                    <button class="login__btn" id="loginBtn">로그인</button>
                </div>
            </div>
        </div>
        <div id="backimg"></div>
    </div>
</body>  
<script>
	$('#loginBtn').on("click", function(){
		var id = $('#loginId').val();
		var password = $('#loginPw').val();
		
		$.ajax({
			type : "post",
			url : "/login.do",
			data: {
				id: id,
				password: password
			},
			dataType: "json",
			error: function(){
				alert("에러발생");
			},
			success: function(data){
				console.log(data);
				if (data.result === "success"){
					alert("로그인 성공");
					location.href="http://localhost:8080/oneGrid.do";
				} 
				else if (data.result === "none") {			
					alert("없는 정보 입니다.");
					location.reload();
				}
			}
		})
	})

	// 팝업 열기
    function openPopup() {
        // 팝업 창에 표시할 URL
        var url = "/RISUSERE00.do";

        // 팝업 창의 크기와 위치 설정
        var width = 600;
        var height = 300;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;

        // 팝업 창을 열기
        var popup = window.open(url, "팝업 창", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

        // 팝업 창이 차단되었을 때 처리
        if (!popup || popup.closed || typeof popup.closed == 'undefined') {
            alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제해주세요.");
        }
    }

</script>
</html>





