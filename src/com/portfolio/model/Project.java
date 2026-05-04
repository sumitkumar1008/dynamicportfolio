package com.portfolio.model;

// Project Model
public class Project {
    private int id;
    private int userId;
    private String title;
    private String description;
    private String techStack;
    
    // Constructor
    public Project(int id, int userId, String title, String description, String techStack) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.techStack = techStack;
    }
    
    // Empty Constructor
    public Project() {
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
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getTechStack() {
        return techStack;
    }
    
    public void setTechStack(String techStack) {
        this.techStack = techStack;
    }
}
