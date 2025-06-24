<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
  request.setCharacterEncoding("UTF-8");

  String productId = request.getParameter("product_id");
  String name = "";
  String price = "0";
  String description = "";
  String thumbnail = "";

  try {
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/Nomz", "YeonJi", "1111");

    String sql = "SELECT * FROM products WHERE product_id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
      name = rs.getString("name");
      price = rs.getString("price");
      description = rs.getString("description");
      thumbnail = rs.getString("thumbnail");
    }

    rs.close();
    pstmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Nomz Detail Page</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Frontend/common/header.css" />
 <style>
    .section_1 {
      width: 1200px;
      margin: 0 auto;
      padding-top: 60px;
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
      width: 550px;
    }
    .item_text { font-size: 30px; margin-bottom: 5px; }
    .item_price { font-size: 20px; }
    .line { margin-top: 40px; }
    .item_desc { font-size: 14px; margin-top: 5px; }
    .item_wrap {
      margin-top: 120px;
      padding: 20px;
      background-color: #dce5ed;
    }
    .price_wrap {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .count_wrap {
      display: flex;
      border: 1px solid #0b1838;
      width: 100px;
      justify-content: space-between;
    }
    .item_count { width: 50px; text-align: center; }
    .btn_wrap {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }
    .cart_btn, .buy_btn {
      width: 270px;
      background-color: #0b1838;
      color: white;
      text-align: center;
      line-height: 50px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<header>
<a href="<%=request.getContextPath()%>/view/index.jsp">
  <img src="<%=request.getContextPath()%>/Frontend/images/logo_b.png" alt="Nomz" class="logo" style="height: 40px;" />
</a>
  <div class="menu_wrap">
    <div class="menu" onclick="location.href='<%=request.getContextPath()%>/Frontend/addItem.jsp'">ADD MENU</div>
    <div class="menu" onclick="location.href='<%=request.getContextPath()%>/Frontend/login.jsp'">LOGIN</div>
    <div class="menu" onclick="location.href='<%=request.getContextPath()%>/Frontend/qna.jsp'">Q&A</div>
    <div class="menu" onclick="location.href='<%=request.getContextPath()%>/Frontend/profile.jsp'">MY PAGE</div>
    <div class="menu" onclick="location.href='<%=request.getContextPath()%>/Frontend/cart.jsp'">CART</div>
  </div>
</header>

<section class="section_1">
  <img class="item_img" src="<%=request.getContextPath()%>/<%= (thumbnail != null && !thumbnail.isEmpty()) ? thumbnail : "Frontend/images/default.png" %>" alt="<%= name %>">
  <div class="text_wrap">
    <div class="item_text"><%= name %></div>
    <div class="item_price"><%= price %>원</div>
    <div class="line"></div>
    <div class="item_desc"><%= description %></div>

    <div class="item_wrap">
      <div class="price_wrap">
        <div class="count_wrap">
          <div class="minus">▼</div>
          <div class="item_count">1</div>
          <div class="plus">▲</div>
        </div>
        <div class="total" id="productTotal"><%= price %>원</div>
      </div>
    </div>

    <div class="btn_wrap">
      <div class="cart_btn">장바구니</div>
      <div class="buy_btn">구매하기</div>
    </div>
  </div>
</section>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const minusBtn = document.querySelector(".minus");
    const plusBtn = document.querySelector(".plus");
    const countEl = document.querySelector(".item_count");
    const totalEl = document.querySelector("#productTotal");
    const unitPrice = parseInt("<%= price %>");
    let count = 1;

    function updateTotal() {
      totalEl.textContent = (unitPrice * count).toLocaleString() + "원";
    }

    plusBtn.addEventListener("click", () => {
      count++;
      countEl.textContent = count;
      updateTotal();
    });

    minusBtn.addEventListener("click", () => {
      if (count > 1) {
        count--;
        countEl.textContent = count;
        updateTotal();
      }
    });

    document.querySelector(".cart_btn").addEventListener("click", () => {
      const item = {
        name: "<%= name %>",
        price: unitPrice,
        count: count,
        imageUrl: "<%=request.getContextPath()%>/<%= thumbnail %>"
      };
      const cart = JSON.parse(localStorage.getItem("cart") || "[]");
      const existing = cart.find(c => c.name === item.name);
      if (existing) {
        existing.count += item.count;
      } else {
        cart.push(item);
      }
      localStorage.setItem("cart", JSON.stringify(cart));
      alert("장바구니에 추가되었습니다.");
    });

    document.querySelector(".buy_btn").addEventListener("click", () => {
      alert("구매가 완료되었습니다.");
      location.href = "<%=request.getContextPath()%>/Frontend/index.jsp";
    });

    updateTotal();
  });
</script>
</body>
</html>
