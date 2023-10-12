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
          <input type="text" id="text-input" placeholder="참고할 내용을 입력해주세요." style="width: 100%; height: 100%;" />
        </section>
      </div>
      
      <div class="popup-btn__container">
		    <button onclick="saveAndClosePopup()" class="all__btn fontawesome__btn text__btn">저장</button>
			<button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
      </div>
    </main>

    <script>
	    function saveAndClosePopup() {
	        // 팝업 창에서 입력된 텍스트 가져오기
	        var textValue = document.getElementById("text-input").value;
	
	     	// 부모 창으로 텍스트 값을 전달
            window.opener.receiveTextValue(textValue);
    		
    		// 팝업 팡 닫기
    		window.close();
    	}
	    
	 	// 팝업 창이 열릴 때 초기 데이터를 화면에 표시
        window.onload = function () {
            var initialText = window.opener.getInitialText();
            document.getElementById("text-input").value = initialText;
        }
    
    
      	function closePopup() {
        	  // 현재 창을 닫습니다.
          	window.close();
      	}
    </script>
  </body>
</html>