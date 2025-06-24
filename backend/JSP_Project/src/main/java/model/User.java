package model;

public class User {
    private String id;
    private String password;
    private String name;
    private String phone;
    private String birth;
    private String zipcode;
    private String detailAddress;

    public User(String id, String password, String name, String phone, String birth, String zipcode, String detailAddress) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.birth = birth;
        this.zipcode = zipcode;
        this.detailAddress = detailAddress;
    }

    
    public String getId() { return id; }
    public String getPassword() { return password; }
    public String getName() { return name; }
    public String getPhone() { return phone; }
    public String getBirth() { return birth; }
    public String getZipcode() { return zipcode; }
    public String getDetailAddress() { return detailAddress; }
}
