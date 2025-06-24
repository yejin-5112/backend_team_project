package model;

public class Comment {
    private int id;
    private String content;
    private String date;

    public Comment() {}

    public Comment(String content, String date) {
        this.content = content;
        this.date = date;
    }

    // getters/setters 생략 가능
}
