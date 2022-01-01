package com.messages.beans.db;

public class Followers {
    private String email;
    private String follower_email;

    public Followers(String follower_email, String email) {
        this.email = email;
        this.follower_email = follower_email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFollower_email() {
        return follower_email;
    }

    public void setFollower_email(String follower_email) {
        this.follower_email = follower_email;
    }
}
