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
          <input id="voiceFileInput" class="fileupload__box" type="file" accept="audio/*" name="localFile" />
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
		var loginId = "${login_id}";
		var rowData = {};
		
		// 마이크 테스트 함수
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
		
		// 마이크 테스트 중지 함수
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
	    
		// 녹음 중 여부에 따라 버튼 스타일 변경 함수
		function updateRecordingButtonStyles() {
			if (isRecording) {
				$("#recordBtn").css('background-color', 'red');
				$("#recordBtn").css('color', 'white');
			} else {
				$("#recordBtn").css('background-color', '');
				$("#recordBtn").css('color', '');
			}
		}

		// 녹음 함수
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

		// 일시정지 함수
		function pauseRecording() {
		    if (mediaRecorder.state === 'recording') {
		        mediaRecorder.pause();
		        isRecordingPaused = true;
		        $("#pauseBtn").prop('disabled', true);
		        $("#resumeBtn").prop('disabled', false);
		    }
		}

		// 일시정지 해제 함수
		function resumeRecording() {
		    if (isRecordingPaused) {
		        mediaRecorder.resume();
		        isRecordingPaused = false;
		        $("#pauseBtn").prop('disabled', false);
		        $("#resumeBtn").prop('disabled', true);
		    }
		}

		// 완료 함수
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
		
		// 완료 함수
		function selectData(data) {
			window.opener.postMessage(data, '*');
			// 현재 창을 닫습니다.
			window.close();
		}

		$(document).ready(function () {
			// 현재 URL 가져오기
			var currentURL = window.location.href;
			// URL 객체 생성
			var url = new URL(currentURL);
			// url searchParams 값 가져오기
			var urlSearchParams = url.searchParams;
			
			// 모든 파라미터와 값을 가져오기
			urlSearchParams.forEach(function (value, key) {
			    rowData[key] = value;
			});
			
			console.log(rowData);
		})
      
		// 마이크 테스트 체크박스 변경 시
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
		// 녹음 버튼 클릭
		$("#recordBtn").on('click', startRecording);
		// 일시정지 버튼 클릭
		$("#pauseBtn").on('click', pauseRecording);
		// 일시정지 해제 버튼 클릭
		$("#resumeBtn").on('click', resumeRecording);
		// 완료 버튼 클릭
		$("#doneBtn").on('click', stopRecording);
      
      
		// 임시저장 버튼 클릭
		$("#tempSaveBtn").click(function() {
			console.log(rowData);
			
			var voiceFileInput = $("#voiceFileInput")[0];
			
			if (voiceFileInput.files.length > 0) {
				var selectedFile = voiceFileInput.files[0];
				var formData = new FormData();
				
				rowData["viewText"] = '';
				rowData["mdfcId"] = loginId;
				rowData["voicViewYn"] = 'Y';
				
				formData.append("temp", "true");
				formData.append("localFile", selectedFile);
				formData.append("ptntId", rowData["ptntId"]);
				
				
				// 파일 저장
				$.ajax({
					url: "/pandok/fileUpload.do",
					method: "POST",
					data: formData,
					contentType: false, // 컨텐츠 타입을 false로 설정
				    processData: false,  // FormData를 변환하지 않도록 설정
					dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
					success: function(data) {
					    // 성공적으로 응답을 받았을 때 실행되는 함수
					    console.log(data);
					    alert(data.cnt + '건의 음성파일이 업로드되었습니다.');
					    rowData["voicViewFileNm"] = data.voicViewFileNm;
					    rowData["voicViewDrtrNm"] = data.voicViewDrtrNm;
					    rowData["voicFileNm"] = data.voicFileNm;
					    
					 	// 데이터베이스 업데이트
						$.ajax({
							url: "/pandok/saveTempRis1301List.do",
							method: "POST",
							contentType: 'application/json', // 클라이언트에서 JSON 형식으로 보내기
							data: JSON.stringify(rowData),
							dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
							success: function(data) {
							    // 성공적으로 응답을 받았을 때 실행되는 함수
							    console.log(data);
							    alert(data.cnt + '건이 임시저장되었습니다.');
							    selectData(data);
							},
							error: function(xhr, status, error) {
							    // 요청 중 오류가 발생했을 때 실행되는 함수
							    console.error(error);
							}
						})
					},
					error: function(xhr, status, error) {
					    // 요청 중 오류가 발생했을 때 실행되는 함수
					    console.error(error);
					}
				})
			} else {
				alert("파일을 선택하세요.");
			}
		});
		
		
		// 저장 버튼 클릭
		$("#saveBtn").click(function() {
			console.log(rowData);
			
			var voiceFileInput = $("#voiceFileInput")[0];
			
			if (voiceFileInput.files.length > 0) {
				var selectedFile = voiceFileInput.files[0];
				var formData = new FormData();
				
				rowData["viewText"] = '';
				rowData["mdfcId"] = loginId;
				rowData["voicViewYn"] = 'Y';
				
				formData.append("temp", "false");
				formData.append("localFile", selectedFile);
				formData.append("ptntId", rowData["ptntId"]);
				
				
				// 파일 저장
				$.ajax({
					url: "/pandok/fileUpload.do",
					method: "POST",
					data: formData,
					contentType: false, // 컨텐츠 타입을 false로 설정
				    processData: false,  // FormData를 변환하지 않도록 설정
					dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
					success: function(data) {
					    // 성공적으로 응답을 받았을 때 실행되는 함수
					    console.log(data);
					    alert(data.cnt + '건의 음성파일이 업로드되었습니다.');
					    rowData["voicViewFileNm"] = data.voicViewFileNm;
					    rowData["voicViewDrtrNm"] = data.voicViewDrtrNm;
					    rowData["voicFileNm"] = data.voicFileNm;
					    
					 	// 데이터베이스 업데이트
						$.ajax({
							url: "/pandok/voiceRis1301List.do",
							method: "POST",
							contentType: 'application/json', // 클라이언트에서 JSON 형식으로 보내기
							data: JSON.stringify(rowData),
							dataType: "json", // 응답 데이터 형식 (JSON, XML, HTML 등)
							success: function(data) {
							    // 성공적으로 응답을 받았을 때 실행되는 함수
							    console.log(data);
							    alert(data.cnt + '건이 저장되었습니다.');
							    selectData(data);
							},
							error: function(xhr, status, error) {
							    // 요청 중 오류가 발생했을 때 실행되는 함수
							    console.error(error);
							}
						})
					},
					error: function(xhr, status, error) {
					    // 요청 중 오류가 발생했을 때 실행되는 함수
					    console.error(error);
					}
				})
			} else {
				alert("파일을 선택하세요.");
			}
		});
		
		
		// 닫기 버튼 클릭
		$("#closeBtn").click(function() {
			window.close();
		});
    </script>
  </body>
</html>