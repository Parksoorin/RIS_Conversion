<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.main__container{
	padding: 10 10 30 10px;
    width: 100%;
    height: 100%;
    background-color: #fafafa;

}
.search__box {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 90px;
}
.pwpopup__container {
	padding: 10px;
  	width: 100%;
  	height: calc(100% - 20px);
  	background-color: #fff;
  	border: 1px solid #DBDBDB;
  	border-radius: 0 0 5px 5px;
  	margin-bottom: 10px;
}
.pwpopup-btn__container {
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: center;
	margin-bottom: 10px;
}

.filter__options {
    margin-right: 10px;
    padding: 2px;
    width: 200px;
    height: 40px;
    font-size: 12px;
    border: 2px solid #DBDBDB;
    border-radius: 3px;
}
</style>
  	<body>
	    <main class="main__container">
	      <!-- 그리드 -->
	      <div class="pwpopup__container">
	        <section class="search__box">
	          	<p class="filter__keyword">사용자 ID :</p>
	        	<input type="text" class="filter__options" id="inputField"></input>
	        </section>
	      </div>
	      
	      <div class="pwpopup-btn__container">
			    <button class="all__btn fontawesome__btn text__btn" id="pw-reset__btn">초기화</button>
				<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">취소</button>
	      </div>
	    </main>
	
	   	<script>
	      	function closePopup() {
	          	// 현재 창을 닫습니다.
	          	window.close();
	      	}
	      	
	      	// 비밀번호 초기화
	        $("#pw-reset__btn").on("click", function(){
	        	var inputData = {
	        		// 입력 필드의 값을 userId라는 속성으로 객체에 추가
	                userId: document.querySelector("#inputField").value 
	            };
        		$.ajax({
        	        type: 'POST', // HTTP 요청 메서드 (POST 방식으로 전송)
        	        url: '/risuserResetData.do', // 요청할 서버 URL
        	        contentType: 'application/json', // 클라이언트에서 JSON 형식으로 보내기
        	        dataType: 'json', // 서버에서 받을 데이터 타입 (JSON)
        	        data: JSON.stringify(inputData), // 입력 데이터를 JSON 문자열로 변환하여 전송
        	        success: function(result) { // 요청 성공 시 실행되는 함수
        	        	if (result === "success"){
        					alert("비밀번호가 초기화 되었습니다.");
        				} 
        				else if (result === "none") {			
        					alert("없는 정보 입니다.");
        					location.reload();
        				}
        	            // 예: 성공 메시지 표시 또는 페이지 리로드
        	            reloadGrid();
        	        },
        	        error: function(error) { // 요청 실패 시 실행되는 함수
        	            console.log(error);
        	            // 에러 처리 로직 추가
        	        }
        	    });
	        })
		</script>
  	</body>
</html>