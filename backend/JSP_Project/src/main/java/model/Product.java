package model;

public class Product {
    private int productId;
    private String name;
    private int price;
    private int stock;
    private String description;
    private String thumbnail;

    // 기본 생성자 (필수)
    public Product() {}

    // 전체 필드를 받는 생성자 (이게 꼭 필요!)
    public Product(int productId, String name, int price, int stock, String description, String thumbnail) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.thumbnail = thumbnail;
    }

    // Getter & Setter 생략 없이 모두 넣어주세요
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getThumbnail() { return thumbnail; }
    public void setThumbnail(String thumbnail) { this.thumbnail = thumbnail; }
}
