package model;

import java.sql.*;
import java.util.*;

public class ProductDAO {

    private Connection getConnection() throws Exception {
        String url = "jdbc:mariadb://localhost:3306/Nomz";
        String username = "YeonJi";
        String password = "1111";
        Class.forName("org.mariadb.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }

    // 전체 상품 조회
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("product_id"),
                    rs.getString("name"),
                    rs.getInt("price"),
                    rs.getInt("stock"),
                    rs.getString("description"),
                    rs.getString("thumbnail")
                );
                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    // 특정 상품 조회
    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE product_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new Product(
                    rs.getInt("product_id"),
                    rs.getString("name"),
                    rs.getInt("price"),
                    rs.getInt("stock"),
                    rs.getString("description"),
                    rs.getString("thumbnail")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
}
