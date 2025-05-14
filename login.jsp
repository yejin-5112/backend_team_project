<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome login</title>
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
            padding: 380px 300px 300px 300px;
            margin-left: 50%;
            transform: translateX(-50%);
        }
        form {
            width: 100%;
            height: 100%;
            background-color: #d4d4d4;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 40px;
            padding: 40px;
        }
        .text {
            font-size: 40px;
            margin-bottom: 50px;
        }
        input {
            width: 100%;
            height: 40px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid gray;
            padding: 10px;
            font-size: 16px;
        }
        .btn_wrap {
            width: 320px;
            height: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        button {
            margin-top: 10px;
            width: 150px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid gray;
            font-size: 20px;
            cursor: pointer;
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
        <form method="post" action="login_ok.jsp">
            <div class="text">로그인</div>
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="password" placeholder="비밀번호" required>
            <div class="btn_wrap">
                <button type="submit">로그인</button>
                <button type="button" onclick="location.href='register.jsp'">회원가입</button>
            </div>
        </form>
    </section>
</body>
</html>
