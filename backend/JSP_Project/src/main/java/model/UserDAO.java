package model;

import java.sql.*;

public class UserDAO {
    private Connection conn;

    public UserDAO() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/Nomz", "YeonJi", "1111"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 회원가입
    public boolean insertUser(User user) {
        String sql = "INSERT INTO members (name, username, password, phone, birth, address, detail_address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getId()); // id = username
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getBirth());
            pstmt.setString(6, user.getZipcode()); // 주소
            pstmt.setString(7, user.getDetailAddress());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 로그인 확인
    public boolean login(String username, String password) {
        String sql = "SELECT * FROM members WHERE username = ? AND password = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
