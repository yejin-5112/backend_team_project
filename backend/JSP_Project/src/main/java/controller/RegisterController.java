package controller;

import model.User;
import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String birth = request.getParameter("birth");
        String zipcode = request.getParameter("zipcode");
        String detailAddress = request.getParameter("detailAddress");

        User user = new User(id, password, name, phone, birth, zipcode, detailAddress);
        UserDAO dao = new UserDAO();
        boolean result = dao.insertUser(user);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/view/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/register.jsp?error=1");
        }

    }
}
