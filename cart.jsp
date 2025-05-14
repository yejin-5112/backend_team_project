<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome 장바구니</title>
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
        }
        .item_wrap {
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
        }
        .item_img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 1px solid rgba(0, 0, 0, 0.5);
            margin-right: -400px;
        }
        .item_text {
            font-size: 18px;
            margin-right: -350px;
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
        .item_price {
            width: 90px;
            text-align: right;
            font-size: 18px;
        }
        .bar {
            width: 100%;
            height: 1px;
            background-color: rgba(0, 0, 0, 0.7);
            margin: 10px 0;
        }
        .total {
            width: 100%;
            font-size: 22px;
            text-align: right;
            padding-right: 50px;
        }
        .buy_btn {
            width: 200px;
            height: 50px;
            background-color: #cbcbcb;
            margin-left: 50%;
            transform: translateX(-50%);
            border-radius: 10px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            margin-top: 10px;
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
		    <div class="item_wrap">
		        <img src="images/icon_1.png" alt="딸기마카롱" class="item_img">
		        <div class="item_text">딸기마카롱</div>
		        <div class="count_wrap">
		            <div class="minus">-</div>
		            <div class="item_count">1</div>
		            <div class="plus">+</div>
		        </div>
		        <div class="item_price" data-price="3000">3000원</div>
		    </div>
		    <div class="bar"></div>
		    <div class="item_wrap">
		        <img src="images/icon_1.png" alt="딸기마카롱" class="item_img">
		        <div class="item_text">딸기마카롱</div>
		        <div class="count_wrap">
		            <div class="minus">-</div>
		            <div class="item_count">2</div>
		            <div class="plus">+</div>
		        </div>
		        <div class="item_price" data-price="3000">6000원</div>
		    </div>
		    <div class="bar"></div>
		    <div class="total">총 금액 : 9000원</div>
		    <div class="buy_btn">구매하기</div>
		</section>
		<script>
		    document.addEventListener("DOMContentLoaded", () => {
		        const updateAllTotal = () => {
		            let total = 0;
		            document.querySelectorAll(".item_wrap").forEach(item => {
		                const price = parseInt(item.querySelector(".item_price").dataset.price);
		                const count = parseInt(item.querySelector(".item_count").textContent);
		                const itemTotal = price * count;
		                item.querySelector(".item_price").textContent = itemTotal + "원";
		                total += itemTotal;
		            });
		            document.querySelector(".total").textContent = "총 금액 : " + total + "원";
		        };
		
		        document.querySelectorAll(".plus").forEach(btn => {
		            btn.addEventListener("click", () => {
		                const countEl = btn.previousElementSibling;
		                countEl.textContent = parseInt(countEl.textContent) + 1;
		                updateAllTotal();
		            });
		        });
		
		        document.querySelectorAll(".minus").forEach(btn => {
		            btn.addEventListener("click", () => {
		                const countEl = btn.nextElementSibling;
		                let count = parseInt(countEl.textContent);
		                if (count > 1) {
		                    countEl.textContent = count - 1;
		                    updateAllTotal();
		                }
		            });
		        });
		    });
		</script>
</body>
</html>
