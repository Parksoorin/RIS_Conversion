<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <main class="main__container">
        <!-- 검색 -->
        <section class="search__container">
            <p class="filter__keyword">메뉴그룹 현황</p>
        </section>

        <!-- 그리드 -->
        <div class="popup-grid__container">
            <section class="grid__box">
                <!-- 그리드 -->
                <table id="list1" class="grid1"></table>
            </section>
        </div>

        <div class="popup-btn__container">
            <button class="all__btn fontawesome__btn text__btn">선택</button>
            <button onclick="closePopup()" class="all__btn fontawesome__btn text__btn">닫기</button>
        </div>
    </main>

    <script>
        $(document).ready(function () {
            $("#list1").jqGrid("GridUnload");
            $("#list1").jqGrid({
                datatype: "/RISUSERMENU_POP.do",
                reordercolNames: true,
                postData: { type: 'A' }, // 보낼 파라미터
                mtype: 'POST',   // 전송 타입
                datatype: "json",
                colNames: ["메뉴그룹ID", "메뉴그룹명"],
                colModel: [
                    { name: "menuGroupId", index: "menuGroupId", width: 60, align: "center" },
                    { name: "menuName", index: "menuName", width: 100, align: "center" },
                ],
                jsonReader: 
			  	{
				  	repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
				  	root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
				  	records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
			  	},
                guiStyle: "bootstrap",
                autowidth: true,
                height: "89%",
                rownumbers: true,
                gridview: true, // 선표시 true/false
                loadComplete: function (data) {
                    console.log(data);
                }, // loadComplete END
                onSelectRow: function (rowid) {
                    console.log(rowid);
                },
            });
        });
        function closePopup() {
            // 현재 창을 닫습니다.
            window.close();
        }
    </script>
</body>

</html>