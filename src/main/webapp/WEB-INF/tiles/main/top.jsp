<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
            <li class="main__menu-items">
                기준정보관리
                <div class="sub__menu-item">
                    <a href="/RIS0101E00.do">공통코드관리</a>
                    <a href="/RIS0109E00.do">기준정보 입력관리</a>
                    <a href="#">촬영실 관리</a>
                    <a href="/RIS0102E00.do?hsptId=A001&lrgcCd=IMGN_EQPM_CD">촬영실 장비관리</a>
                    <a href="/RIS0201E00.do">촬영코드 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                메뉴관리
                <div class="sub__menu-item">
                    <a href="/RISUSERQ00.do">사용자 관리</a>
                    <a href="/RISPRGMQ00.do">프로그램정보 관리</a>
                    <a href="/RISMENUE00.do">메뉴정보 관리</a>
                    <a href="/RISUSERMENU.do">사용자별 메뉴관리</a>
                    <a href="/RISBTNE00.do">프로그램 기능 권한 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                예약스케줄관리
                <div class="sub__menu-item">
                    <a href="/appn/RIS0201E00.do">예약기준관리</a>
                    <a href="/appn/RIS0213E00.do">예외 기준 관리</a>
                    <a href="/appn/RIS0212E00.do">휴일 기준관리</a>
                    <a href="/appn/RIS1211E00.do">예약 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                환자관리
                <div class="sub__menu-item">
                    <a href="/pat/RIS1101E00.do">환자정보 관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                접수관리
                <div class="sub__menu-item">
                    <a href="/jubsu/RIS1201E00.do">영상 접수관리</a>
                    <a href="#">CD 접수관리</a>
                    <a href="/jubsu/RIS1201E02.do">이동촬영 접수</a>
                    <a href="/jubsu/RIS1201E03.do">처방 정보 관리</a>
                    <a href="/jubsu/RIS1201E04.do">영상 실시 관리</a>
                    <a href="#">워크리스트</a>
                </div>
            </li>
            <li class="main__menu-items">
                판독관리
                <div class="sub__menu-item">
                    <a href="/pandok/ris0601List.do">영상 판독문구 관리</a>
                    <a href="/pandok/ris1301List.do">영상 판독관리</a>
                </div>
            </li>
            <li class="main__menu-items">
                각종 통계현황
                <div class="sub__menu-item">
                    <a href="/stts/RisImgnStts.do">촬영실별 통계</a>
                    <a href="/stts/RisEqpmStts.do">장비별 통계</a>
                    <a href="/stts/RisViewDocStts.do">판독의별 통계</a>
                </div>
            </li>
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
		console.log(loginName);
		
		if (!loginId) {
			window.location.href = "/?hspt_id=A001";
		}
		
		
		
	})
</script>