package controller;

import model.Product;
import model.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();

        request.setAttribute("productList", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/index.jsp");
        dispatcher.forward(request, response);
    }
}
