<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome 상세페이지</title>
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
            height: 780px;
            background-color: #fff;
            margin-left: 50%;
            transform: translateX(-50%);
            padding: 180px 0 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .item_img {
            width: 500px;
            height: 500px;
            object-fit: cover;
            border: 2px solid rgba(0, 0, 0, 0.5);
        }
        .text_wrap {
            position: relative;
            width: 650px;
            height: 500px;
            background-color: #fff;
        }
        .item_text {
            font-size: 50px;
            margin-bottom: 5px;
        }
        .item_price {
            font-size: 22px;
            font-weight: 700;
        }
        .item_wrap {
            position: absolute;
            bottom: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: 50px;
        }
        .item_text_2 {
            font-size: 18px;
        }
        .count_wrap {
            width: 80px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-right: 200px;
            user-select: none;
        }
        .minus, .plus {
            width: 25px;
            height: 25px;
            background-color: lightgray;
            border: 1px solid darkgray;
            border-radius: 5px;
            font-size: 30px;
            text-align: center;
            line-height: 25px;
            font-weight: 300;
            cursor: pointer;
        }
        .item_count {
        		width: 20px;
        		text-align: center;
            font-size: 18px;
        }
        .total {
        		width: 90px;
        		text-align: right;
            font-size: 18px;
        }
        .btn_wrap {
            position: absolute;
            bottom: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: 60px;
        }
        .cart_btn, .buy_btn {
            width: 300px;
            height: 100%;
            background-color: lightgray;
            border-radius: 10px;
            font-size: 30px;
            text-align: center;
            line-height: 60px;
            cursor: pointer;
            user-select: none;
        }
        .section_2 {
            border-top: 2px solid rgba(0, 0, 0, 0.7);
            width: 1200px;
            padding: 30px 50px;
            margin-left: 50%;
            transform: translateX(-50%);
        }
        .title {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }
        .bar {
            width: 100%;
            height: 1px;
            background-color: rgba(0, 0, 0, 0.6);
        }
        .review_wrap {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
            padding: 0 20px;
        }
        .profile_img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
            user-select: none;
        }
        .review_text_wrap {
            width: 90px;
            height: 35px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .feedback {
            font-size: 16px;
        }
        .id {
            font-size: 14px;
        }
        .review_text {
            width: 900px;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(0, 0, 0, 0.3);
            font-size: 16px;
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
        <img src="images/icon_1.png" alt="딸기마카롱" class="item_img">
        <div class="text_wrap">
            <div class="item_text">딸기마카롱</div>
            <div class="item_price">3000원</div>

            <div class="item_wrap">
                <div class="item_text_2">딸기마카롱</div>
                <div class="count_wrap">
                    <div class="minus">-</div>
                    <div class="item_count">1</div>
                    <div class="plus">+</div>
                </div>
                <div class="total">3000원</div>
            </div>

            <div class="btn_wrap">
                <div class="cart_btn">장바구니</div>
                <div class="buy_btn">구매하기</div>
            </div>
        </div>
    </section>

    <section class="section_2">
        <div class="title">리뷰</div>
        <div class="bar"></div>

        <div class="review_wrap">
            <img src="images/profile.jpg" alt="mango 프로필" class="profile_img">
            <div class="review_text_wrap">
                <div class="feedback">만족해요</div>
                <div class="id">mango</div>
            </div>
            <div class="review_text">리뷰 내용</div>
        </div>

        <div class="bar"></div>

        <div class="review_wrap">
            <img src="images/profile.jpg" alt="oreo 프로필" class="profile_img">
            <div class="review_text_wrap">
                <div class="feedback">별로예요</div>
                <div class="id">oreo</div>
            </div>
            <div class="review_text">리뷰 내용</div>
        </div>

        <div class="bar"></div>
    </section>
    
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            document.querySelectorAll(".plus").forEach(btn => {
                btn.addEventListener("click", () => {
                    const count = btn.previousElementSibling;
                    const newCount = parseInt(count.textContent) + 1;
                    count.textContent = newCount;
                    updateTotal(btn.closest(".text_wrap"), newCount);
                });
            });

            document.querySelectorAll(".minus").forEach(btn => {
                btn.addEventListener("click", () => {
                    const count = btn.nextElementSibling;
                    let current = parseInt(count.textContent);
                    if (current > 1) {
                        current -= 1;
                        count.textContent = current;
                        updateTotal(btn.closest(".text_wrap"), current);
                    }
                });
            });

            function updateTotal(wrapper, count) {
                const priceText = wrapper.querySelector(".item_price").textContent;
                const unitPrice = parseInt(priceText.replace("원", ""));
                const total = wrapper.querySelector(".total");
                total.textContent = (unitPrice * count) + "원";
            }
        });
    </script>
    
</body>
</html>
