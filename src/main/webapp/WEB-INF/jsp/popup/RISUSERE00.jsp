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

.text__box{
	margin-top:20px;
	margin-left: 80px;
	width: 400px;
}

.p-text {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
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
    height: 35px;
    font-size: 12px;
    border: 2px solid #DBDBDB;
    border-radius: 3px;
}
</style>
  <body>
    <main class="main__container">
      <!-- 그리드 -->
      <div class="pwpopup__container">
        <section class="text__box">
        	<div class="p-text">
	        	<p class="filter__keyword">사용자 ID :</p>
	        	<input type="text" class="filter__options"></input>
        	</div>
          	<div class="p-text">
	        	<p class="filter__keyword">현재 비밀번호 :</p>
	        	<input type="text" class="filter__options"></input>
        	</div>
        	<div class="p-text">
	        	<p class="filter__keyword">변경 비밀번호 :</p>
	        	<input type="text" class="filter__options"></input>
        	</div>
        	<div class="p-text">
	        	<p class="filter__keyword">변경 비밀번호 확인 :</p>
	        	<input type="text" class="filter__options"></input>
        	</div>
        </section>
      </div>
      
      <div class="pwpopup-btn__container">
		    <button class="all__btn fontawesome__btn text__btn">초기화</button>
			<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">취소</button>
      </div>
    </main>

    	<script>
	      	function closePopup() {
	          	// 현재 창을 닫습니다.
	          	window.close();
	      	}
		</script>
  	</body>
</html>