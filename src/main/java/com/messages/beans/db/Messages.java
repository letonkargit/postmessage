package com.messages.beans.db;

import java.util.Date;

public class Messages {
    private String message;
    private String email;
    private Date date;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Messages(String message, String email, Date date) {
        this.message = message;
        this.email = email;
        this.date = date;
    }
}
