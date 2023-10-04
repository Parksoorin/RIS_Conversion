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
			<button id="resumeBtn" class="all__btn fontawesome__btn text__btn">일시정지 해제</button>
			<button id="doneBtn" class="all__btn fontawesome__btn text__btn" disabled>완료</button>
	      </div>
	      
		  <div id="micTestBox" class="mictest__box">
	        <p>마이크 테스트 중입니다..</p>
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
		var isRecordingPaused = false;
		var isRecording = false; // 녹음 중 여부를 추적하는 변수
		var audioElement; // 마이크 테스트를 위한 오디오 요소 추가
		
		
		function testMicrophone() {
			console.log("test");
		    navigator.mediaDevices.getUserMedia({ audio: true })
		        .then(stream => {
		        	// 오디오 요소 생성
		            audioElement = document.createElement('audio');
		            
		            // 오디오 요소에 스트림 설정
		            audioElement.srcObject = stream;

		            // 스트림이 시작되면 오디오 재생 시작
		            audioElement.onloadedmetadata = () => {
		                audioElement.play();
		            };

		            // 마이크 입력을 듣기 위해 오디오 요소를 추가
		            document.body.appendChild(audioElement);

		            console.log("audioElement", audioElement);
		        })
		        .catch(error => {
		            console.error('마이크 테스트 중 오류 발생:', error);
		        });
		}
		
		function stopMicrophoneTest() {
		    if (audioElement) {
	    		console.log("test stop");
		        // 마이크 테스트 중지 및 오디오 요소 삭제
		        audioElement.pause();
		        audioElement.srcObject = null;
		        console.log(audioElement);
		        document.body.removeChild(audioElement);
		    }
		}
	  
		function updateRecordingButtonStyles() {
			if (isRecording) {
				$("#recordBtn").css('background-color', 'red');
				$("#recordBtn").css('color', 'white');
			} else {
				$("#recordBtn").css('background-color', '');
				$("#recordBtn").css('color', '');
			}
		}

		function startRecording() {
			navigator.mediaDevices.getUserMedia({ audio: true })
		        .then(stream => {
		            mediaRecorder = new MediaRecorder(stream);
		            mediaRecorder.ondataavailable = event => {
		                if (event.data.size > 0) {
		                    audioChunks.push(event.data);
		                }
		            };

		            mediaRecorder.onstop = () => {
		                const audioBlob = new Blob(audioChunks, { type: 'audio/wav' });

		                // Blob 데이터를 파일로 저장하고 다운로드하는 링크 생성
		                const audioUrl = URL.createObjectURL(audioBlob);
		                const downloadLink = document.createElement('a');
		                downloadLink.href = audioUrl;
		                downloadLink.download = 'recorded_audio.wav'; // 파일 이름 설정

		                // 녹음된 음성 파일을 다운로드
		                document.body.appendChild(downloadLink);
		                downloadLink.click();
		                document.body.removeChild(downloadLink);

		                // 초기화
		                audioChunks = [];
		                isRecordingPaused = false;
		                isRecording = false;
		                updateRecordingButtonStyles(); // 스타일 업데이트
		            };

		            mediaRecorder.start();
		            isRecording = true;
		            updateRecordingButtonStyles(); // 스타일 업데이트
		            $("#pauseBtn").prop('disabled', false);
		            $("#doneBtn").prop('disabled', false);
		        })
		        .catch(error => {
		            console.error('녹음 권한을 허용해야 합니다.', error);
		        });
		}

		function pauseRecording() {
		    if (mediaRecorder.state === 'recording') {
		        mediaRecorder.pause();
		        isRecordingPaused = true;
		        $("#pauseBtn").prop('disabled', true);
		        $("#resumeBtn").prop('disabled', false);
		    }
		}

		function resumeRecording() {
		    if (isRecordingPaused) {
		        mediaRecorder.resume();
		        isRecordingPaused = false;
		        $("#pauseBtn").prop('disabled', false);
		        $("#resumeBtn").prop('disabled', true);
		    }
		}

		function stopRecording() {
		    if (mediaRecorder.state === 'recording' || isRecordingPaused) {
		        mediaRecorder.stop();
		        isRecording = false;
		        updateRecordingButtonStyles(); // 스타일 업데이트
		        $("#pauseBtn").prop('disabled', true);
		        $("#resumeBtn").prop('disabled', true);
		        $("#doneBtn").prop('disabled', true);
		    }
		}
      
		$("#micTest").change(function() {
			if ($("#micTest").is(':checked')) {
				$("#micTestBox").css('display', 'flex');
				testMicrophone();
			} else {
				console.log("checkbox 해제");
				$("#micTestBox").css('display', 'none');
				stopMicrophoneTest();
			}
		});
		$("#recordBtn").on('click', startRecording);
		$("#pauseBtn").on('click', pauseRecording);
		$("#resumeBtn").on('click', resumeRecording);
		$("#doneBtn").on('click', stopRecording);
      
      
		$("#selectBtn").click(function() {
			var grid = $("#list1");
			var selectedRowId = grid.jqGrid("getGridParam", "selrow");
			var selectedRowData = grid.jqGrid("getRowData", selectedRowId);
    	  
			console.log(selectedRowData);
			
			selectData(selectedRowData);
		});
      
      
		$("#closeBtn").click(function() {
			window.close();
		});
    </script>
  </body>
</html>