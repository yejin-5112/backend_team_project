package model;

import java.sql.*;
import java.util.*;

public class CommentDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public CommentDAO() {
        try {
            conn = DBUtil.getConnection(); // DB 연결
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertComment(Comment comment) {
        String sql = "INSERT INTO comments(content, date) VALUES(?, NOW())";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, comment.getContent());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Comment> getAllComments() {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM comments ORDER BY id DESC";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt("id"));
                c.setContent(rs.getString("content"));
                c.setDate(rs.getString("date"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
