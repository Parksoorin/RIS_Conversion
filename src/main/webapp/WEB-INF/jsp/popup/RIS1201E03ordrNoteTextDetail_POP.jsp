<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처방참고내용</title>
</head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">처방참고내용</p>
      </section>

      <!-- 그리드 -->
      <div class="popup-grid__container">
        <section class="grid__box">
          <!-- 그리드 -->
          <input type="text" style="width: 100%; height: 100%;" />
        </section>
      </div>
      
      <div class="popup-btn__container">
		    <button class="all__btn fontawesome__btn text__btn">저장</button>
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