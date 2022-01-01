package com.messages.beans;

public class User {
    private String name;
    private String email;
    private String lastpm;

    public User(String name, String email, String lastpm) {
        this.name = name;
        this.email = email;
        this.lastpm = lastpm;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getLastpm() {
        return lastpm;
    }
}
