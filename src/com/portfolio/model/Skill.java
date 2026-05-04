package com.portfolio.model;

// Skill Model
public class Skill {
    private int id;
    private int userId;
    private String name;
    private String level;
    
    // Constructor
    public Skill(int id, int userId, String name, String level) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.level = level;
    }
    
    // Empty Constructor
    public Skill() {
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getLevel() {
        return level;
    }
    
    public void setLevel(String level) {
        this.level = level;
    }
}
