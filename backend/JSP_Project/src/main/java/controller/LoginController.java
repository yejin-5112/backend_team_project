package controller;

import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        boolean success = dao.login(id, password);

        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", id);
            response.sendRedirect("view/index.jsp");
        } else {
            response.sendRedirect("view/login.jsp?error=1");
        }
    }
}
