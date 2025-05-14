<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome 주문내역</title>
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
            padding: 130px 0 50px;
            margin-left: 50%;
            transform: translateX(-50%);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .text {
            font-size: 40px;
            margin-bottom: 40px;
        }
        .bar {
            width: 100%;
            height: 1px;
            background-color: black;
        }
        .item_wrap {
            width: 100%;
            height: 120px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            border-bottom: 1px solid black;
            font-size: 18px;
        }
        .item_day {
            width: 160px;
        }
        .item_img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid rgba(0, 0, 0, 0.5);
            margin-right: 20px;
        }
        .item_text {
            margin-right: 500px;
        }
        .item_count {
            margin-right: 100px;
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
        <div class="text">주문내역</div>

        <div class="bar"></div>

        <div class="item_wrap">
            <div class="item_day">2025.03.26</div>
            <img src="images/icon_1.png" alt="딸기마카롱" class="item_img">
            <div class="item_text">딸기마카롱</div>
            <div class="item_count">1개</div>
            <div class="item_price">3000원</div>
        </div>

        <div class="item_wrap">
            <div class="item_day">2025.03.26</div>
            <img src="images/icon_1.png" alt="딸기마카롱" class="item_img">
            <div class="item_text">딸기마카롱</div>
            <div class="item_count">1개</div>
            <div class="item_price">3000원</div>
        </div>
    </section>
</body>
</html>
