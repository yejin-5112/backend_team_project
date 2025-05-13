<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome Home</title>
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
            width: 250px;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .menu {
            font-size: 16px;
            cursor: pointer;
            user-select: none;
        }
        .section_1 {
            width: 100%;
            padding: 130px 0 50px;
            background-color: #fff;
        }
        .item_wrap {
            width: 1200px;
            margin-left: 50%;
            transform: translateX(-50%);
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 30px 25px;
        }
        .item {
            width: 220px;
            height: 260px;
            background-color: #ede1cb;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: transform 0.2s ease;
            cursor: pointer;
        }
        .item_img {
            width: 190px;
            height: 180px;
            border-radius: 15px;
            object-fit: cover;
        }
        .price {
            font-size: 14px;
            font-weight: 700;
            margin-top: 5px;
            margin-left: 5px;
        }
        .item_name {
            font-size: 16px;
            margin-top: 5px;
            margin-left: 5px;
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
                <div class="menu" onclick="location.href='login.jsp'">로그인</div>
                <div class="menu" onclick="location.href='profile.jsp'">마이페이지</div>
                <div class="menu" onclick="location.href='cart.jsp'">장바구니</div>
            </div>
        </div>
    </header>

    <section class="section_1">
        <div class="item_wrap">
            <%
                Connection conn = DBConnect.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                while(rs.next()) {
            %>
            <a href="product.jsp" style="text-decoration: none; color: inherit;">
                <div class="item">
                    <img class="item_img" src="images/icon_1.png">
                    <div class="price"><%=rs.getInt("price")%>원</div>
                    <div class="item_name"><%=rs.getString("name")%></div>
                </div>
            </a>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            %>
        </div>
    </section>
</body>
</html>
