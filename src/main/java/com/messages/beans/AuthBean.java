package com.messages.beans;


public class AuthBean {
    private String email;
    private String secter;

    public AuthBean(String email, String secter) {
        this.email = email;
        this.secter = secter;
    }

    public String getEmail() {
        return email;
    }

    public String getSecter() {
        return secter;
    }
}
