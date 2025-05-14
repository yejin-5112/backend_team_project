<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome 회원가입</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            background-color: #fff;
            border-bottom: 2px solid rgba(0, 0, 0, 0.7);
            z-index: 9;
        }
        .header_wrap {
            margin-left: 50%;
            transform: translateX(-50%);
            width: 1200px;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            width: 150px;
            cursor: pointer;
            user-select: none;
        }
        .logo_img {
            width: 150px;
        }
        .menu_wrap {
            width: 350px;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .menu {
        		width: 70px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            user-select: none;
        }
        .section_1 {
            width: 1200px;
            height: 100vh;
            padding: 180px 300px 100px 300px;
            margin-left: 50%;
            transform: translateX(-50%);
        }
        form {
            width: 600px;
            height: 750px;
            background-color: #e4e4e4;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 40px;
            padding: 40px;
        }
        .form-group {
            width: 100%;
            height: 50px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .text {
            font-size: 40px;
            margin-bottom: 50px;
        }
        label {
            width: 150px;
            text-align: center;
            font-size: 18px;
        }
        input {
            width: 270px;
            height: 40px;
            border-radius: 5px;
            border: 1px solid gray;
            padding: 10px;
            font-size: 16px;
            margin-right: 100px;
        }
        .sub_btn {
            width: 90px;
            height: 40px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid gray;
            cursor: pointer;
            margin: 0px 0px 0px -90px;
            user-select: none;
        }
        button {
            margin-top: 10px;
            width: 150px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid gray;
            font-size: 20px;
            cursor: pointer;
            background-color: white;
            user-select: none;
        }
    </style>
</head>
<body>
    <header>
        <div class="header_wrap">
            <div class="logo" onclick="location.href='home.jsp'">
                <img class="logo_img" src="images/logo.png" alt="Logo">
            </div>
            <div class="menu_wrap">
            		<div class="menu" class="add_item">상품 추가</div>
                <div class="menu" onclick="location.href='login.jsp'">로그인</div>
                <div class="menu" onclick="location.href='profile.jsp'">마이페이지</div>
                <div class="menu" onclick="location.href='cart.jsp'">장바구니</div>
            </div>
        </div>
    </header>

    <section class="section_1">
        <form method="post" action="register_ok.jsp">
            <div class="text">회원가입</div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="실명을 입력해주세요" required>
            </div>
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="소문자, 숫자 (6자~12자)" minlength="6" maxlength="12" required>
                <button class="sub_btn" type="button" onclick="checkDuplicate()">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="소문자, 숫자, (@,!,$) (8자~16자)" minlength="8" maxlength="16" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" name="phone" placeholder="01012345678" required>
            </div>
            <div class="form-group">
                <label for="birth">생년월일</label>
                <input type="text" id="birth" name="birth" placeholder="YYMMDD" maxlength="6" required>
            </div>
            <div class="form-group">
                <label for="zipcode">주소</label>
                <input type="text" id="zipcode" name="zipcode" placeholder="주소 검색" readonly>
                <button class="sub_btn" type="button" onclick="searchAddress()">주소 검색</button>
            </div>
            <div class="form-group">
                <label for="detailAddress">상세 주소</label>
                <input type="text" id="detailAddress" name="detailAddress" placeholder="건물명, 동/호수 등의 상세주소 입력" required>
            </div>
            <button type="submit" class="submit-btn">회원가입</button>
        </form>
    </section>
    
    <script>
        function checkDuplicate() {
            const id = document.getElementById("id").value.trim();
            if (!id) {
                alert("아이디를 입력해주세요.");
                return;
            }

            fetch("check_id.jsp?id=" + encodeURIComponent(id))
                .then(response => response.text())
                .then(data => {
                    const result = data.trim();
                    if (result === "EXISTS") {
                        alert("이미 사용 중인 아이디입니다.");
                    } else if (result === "AVAILABLE") {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("오류가 발생했습니다.");
                    }
                })
                .catch(error => {
                    console.error("오류 발생:", error);
                    alert("서버 요청 중 문제가 발생했습니다.");
                });
        }

        document.querySelector("form").addEventListener("submit", function(event) {
            const pw = document.getElementById("password").value;
            const confirmPw = document.getElementById("confirm-password").value;

            if (pw !== confirmPw) {
                alert("비밀번호가 일치하지 않습니다.");
                event.preventDefault();
            }
        });

        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("zipcode").value = data.roadAddress || data.jibunAddress;
                }
            }).open();
        }
    </script>
</body>
</html>
