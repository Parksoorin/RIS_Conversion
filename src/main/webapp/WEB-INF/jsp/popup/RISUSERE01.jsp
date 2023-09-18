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
</style>
  <body>
    <main class="main__container">
      <!-- 그리드 -->
      <div class="pwpopup__container">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
      
      <div class="pwpopup-btn__container">
		    <button class="all__btn fontawesome__btn text__btn">선택</button>
			<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
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