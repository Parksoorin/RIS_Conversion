<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    .main__container {
        padding: 10 10 30 10px;
        width: 100%;
        height: 100%;
        background-color: #fafafa;
    }

    .text__box {
        margin-top: 45px;
        margin-left: 110px;
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
        border: 1px solid #DBDBDB;
    }
</style>

<body>
    <main class="main__container">
        <!-- 그리드 -->
        <div class="pwpopup__container">
            <section class="text__box">
                <div class="p-text">
                    <p class="filter__keyword">사용자 ID :</p>
                    <input type="text" class="filter__options" id="loginId"></input>
                </div>
                <div class="p-text">
                    <p class="filter__keyword">현재 비밀번호 :</p>
                    <input type="password" class="filter__options" id="oldLoginPwd"></input>
                </div>
                <div class="p-text">
                    <p class="filter__keyword">변경 비밀번호 :</p>
                    <input type="password" class="filter__options" id="newPwd"></input>
                </div>
                <div class="p-text">
                    <p class="filter__keyword">변경 비밀번호 확인 :</p>
                    <input type="password" class="filter__options" id="newPwd2"></input>
                </div>
            </section>
        </div>

        <div class="pwpopup-btn__container">
            <button class="all__btn fontawesome__btn text__btn" id="reset__btn">변경</button>
            <button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">취소</button>
        </div>
    </main>
    <script>
        function closePopup() {
            // 현재 창을 닫습니다.
            window.close();
        }

        $('#reset__btn').on("click", function () {
            // var hspt_id = $("#session_hspt_id").val();
            var loginId = $('#loginId').val();
            var oldLoginPwd = $('#oldLoginPwd').val();
            var newPwd = $('#newPwd').val();
            var newPwd2 = $('#newPwd2').val();
            var loginPwd = "";

            if (loginId == '' || loginId == null) {
                alert("사용자 정보를 확인하세요.!");
                $("#loginId").focus();
                return;
            }
            if (oldLoginPwd == '') {
                alert("이전 비밀번호를 입력하세요.!");
                $("#oldLoginPwd").focus();
                return;
            }
            if (newPwd != newPwd2) {
                alert("변경할 비밀번호가 상이합니다. 확인 후 다시 입력하세요.!");
                $("#newPwd").focus();
                return;
            }


            // 이전 비밀번호 확인
            $.ajax({
                type: "post",
                url: "/userPasswordChk.do",
                data: {
                    loginId: loginId,
                    loginPwd: oldLoginPwd
                },
                dataType: "json",
                error: function () {
                    alert("[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!!!");
                },
                success: function (data) {
                    if (data.result === "none") {
                        alert("없는 정보 입니다.");
                        location.reload();
                    }
                    else {
                        loginPwd = $("#newPwd2").val();
                        $.ajax({
                            type: "post",
                            url: "/userPasswordChange.do",
                            data: {
                                loginId: loginId,
                                loginPwd: loginPwd
                            },
                            dataType: "json",
                            error: function () {
                                alert("[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!");
                            },
                            success: function (data) {
                                if (data.result === 0) {
                                    alert("없는 정보 입니다.");
                                    location.reload();
                                } else {
                                    alert("정상 처리되었습니다. 다시 로그인하세요.!");
                                    window.close();
                                }
                            }
                        })
                    }
                }
            })
        })
    </script>
</body>

</html>