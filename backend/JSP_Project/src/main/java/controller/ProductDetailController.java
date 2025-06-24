package controller;

import model.Product;
import model.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("product_id");
        if (idParam == null) {
            response.sendRedirect("products"); // 목록으로 되돌리기
            return;
        }

        int productId = Integer.parseInt(idParam);
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (product == null) {
            response.sendRedirect("products");
        } else {
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/detail.jsp");
            dispatcher.forward(request, response);
        }
    }
}
