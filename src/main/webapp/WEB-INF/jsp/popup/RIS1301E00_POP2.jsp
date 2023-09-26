<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>음성녹음</title>
    <link rel="stylesheet" href="/css/pandok/RIS1301E00_POPUP2.css" />
  </head>
  <body>
    <main class="main__container">
      <section class="popup-grid__container">
        <!-- 타이틀 -->
        <div class="grid__title">
          <p>음성파일 업로드</p>
          
          <div class="mictest__container">
            <label for="micTest">Mic TEST</label>
            <input id="micTest" type="checkbox" />
          </div>
        </div>
        
        <!-- 파일 선택 박스 -->
        <div class="file__container">
          <input class="fileupload__box" type="file" accept="audio/*" />
          <hr />
          <div class="popup-btn__container">
	        <button id="recordBtn" class="all__btn fontawesome__btn text__btn">녹음</button>
			<button id="pauseBtn" class="all__btn fontawesome__btn text__btn">일시정지</button>
			<button id="restartBtn" class="all__btn fontawesome__btn text__btn">일시정지 해제</button>
			<button id="doneBtn" class="all__btn fontawesome__btn text__btn" disabled>완료</button>
	      </div>
        </div>
      </section>
      
      <div class="popup-btn__container">
        <button id="tempSaveBtn" class="all__btn fontawesome__btn text__btn">임시저장</button>
		<button id="saveBtn" class="all__btn fontawesome__btn text__btn">저장</button>
		<button id="closeBtn" class="all__btn fontawesome__btn text__btn">닫기</button>
      </div>
    </main>

    <script>
	  var mediaRecorder;
	  var audioChunks = [];
	  
	  async function startRecording() {
	      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
	
	      mediaRecorder = new MediaRecorder(stream);
	      mediaRecorder.ondataavailable = event => {
	          if (event.data.size > 0) {
	              audioChunks.push(event.data);
	          }
	      };
	
	      mediaRecorder.onstop = () => {
	          const audioBlob = new Blob(audioChunks, { type: 'audio/wav' });
	          const audioUrl = URL.createObjectURL(audioBlob);
	          const audio = new Audio(audioUrl);
	          audio.controls = true;
	          document.body.appendChild(audio);
	      };
	
	      mediaRecorder.start();
	      startRecordingButton.disabled = true;
	      stopRecordingButton.disabled = false;
	  };
      
      function selectData(data) {
          window.opener.postMessage(data, '*');
          // 현재 창을 닫습니다.
          window.close();
      };
      
      $("#selectBtn").click(function() {
    	  var grid = $("#list1");
    	  
    	  var selectedRowId = grid.jqGrid("getGridParam", "selrow");
    	  var selectedRowData = grid.jqGrid("getRowData", selectedRowId);
    	  
    	  console.log(selectedRowData);
    	  
    	  selectData(selectedRowData);
      })
      
      $("#closeBtn").click(function() {
    	  window.close();
      });
    </script>
  </body>
</html>