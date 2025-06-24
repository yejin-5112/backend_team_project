package controller;

import model.Comment;
import model.CommentDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CommentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        CommentDAO dao = new CommentDAO();

        if ("insert".equals(action)) {
            String content = request.getParameter("content");
            dao.insertComment(new Comment(content, null));
            response.sendRedirect("view/qna.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            CommentDAO dao = new CommentDAO();
            List<Comment> comments = dao.getAllComments();
            request.setAttribute("comments", comments);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/qna_list.jsp");
            dispatcher.forward(request, response);
        }
    }
}
