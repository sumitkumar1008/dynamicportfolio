package com.portfolio.model;

// Message Model
public class Message {
    private int id;
    private String name;
    private String email;
    private String message;
    private boolean isRead;
    
    // Constructor
    public Message(int id, String name, String email, String message, boolean isRead) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.isRead = isRead;
    }
    
    // Empty Constructor
    public Message() {
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public boolean isRead() {
        return isRead;
    }
    
    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }
}
