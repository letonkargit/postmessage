package com.messages.beans.db;

public class MessageUser {
    public MessageUser(String email, String secter, String name) {
        this.email = email;
        this.secter = secter;
        this.name = name;
    }

    private String email;
    private String secter;
    private String name;

    public String getSecter() {
        return secter;
    }

    public void setSecter(String secter) {
        this.secter = secter;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
