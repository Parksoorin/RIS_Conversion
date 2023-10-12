<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="all__header">
    <div class="header__flex">
        <img src="/images/logo2.png" class="logo-img" />

        <ul>
            <li class="main__menu-items">
                업무메뉴
                <div class="sub__menu-item">
                    <a href="/RISMAIN.do">메뉴재생성</a>
                    <a href="/logout.do">로그아웃</a>
                </div>
            </li>
             <c:forEach var="menu" items="${sessionScope.menuList}">
    		<fmt:parseNumber var="menuInt" type="number" value="${menu.menuId}" />
		
			<c:if test="${menuInt % 10 == 0}">
				<li class="main__menu-items">
                	${menu.menuName} 
					<div class="sub__menu-item">
			               
						<c:forEach var="menu2" items="${sessionScope.menuList}">
							<c:if test="${not empty menu2.upperMenuId && menu.menuId == menu2.upperMenuId}">
									<a href="${menu2.pgrmUrl} "> ${menu2.menuName} </a>
							</c:if>	
						</c:forEach>
			    	</div>
				</li>
			</c:if>
			</c:forEach>
        </ul>
    </div>
    
    <!-- 언어, 유저 정보 -->
    <div class="header__user">
   		<c:set var="lang" value="${sessionScope.lang}" />
        <select class="sel" name="lang">
		    <c:choose>
		        <c:when test="${lang eq 'KR'}">
		            <option value="KR" selected>KOR</option>
		            <option value="EN">ENG</option>
		        </c:when>	
		        <c:when test="${lang eq 'EN'}">
		            <option value="KR">KOR</option>
		            <option value="EN" selected>ENG</option>
		        </c:when>
		        <c:otherwise>
		            <option value="KR">KOR</option>
		            <option value="EN">ENG</option>
		        </c:otherwise>
		    </c:choose>
		</select>

        <p class="user"><spring:message code="text_231" text="사용자" />:
            <span id="userName">${sessionScope.login_name}</span>
        </p>
        <img src="/images/icons/icon-key2.png" class="key-img" />
    </div>
</div>

<script>
	// $(document).ready(function() {})과 같음
	
	 $('.sel').change(function() {
        var selectedValue = $(this).val(); // 선택된 값을 가져옵니다.
		console.log(selectedValue);
        // AJAX 요청을 보냅니다.
        $.ajax({
            url: '/util/locale.do', // 서버의 URL을 여기에 입력하세요.
            type: 'POST', // GET 또는 POST 중 선택하세요.
            dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
            data: JSON.stringify({ lang: selectedValue }), // 선택된 값을 서버에 보냅니다.
            success: function(response) {
                // AJAX 요청이 성공적으로 완료된 경우 실행할 코드를 여기에 추가합니다.
            	console.log(response);
            	location.reload();
            },
            error: function(error) {
                // AJAX 요청이 실패한 경우 실행할 코드를 여기에 추가합니다.
            }
        });
    });
	
	$(function() {
		var hsptId = "${hspt_id}";
		var loginId = "${login_id}";
		var loginName = "${login_name}";
		var userGrade = "${user_grade}";
		var menuList = "${menuList}";
		console.log(loginName);
		
		if (!menuList) {
			window.location.href = "/?hspt_id=A001";
		}	
	})
</script>