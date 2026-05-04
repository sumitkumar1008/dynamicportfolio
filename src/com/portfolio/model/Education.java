package com.portfolio.model;

// Education Model
public class Education {
    private int id;
    private int userId;
    private String degree;
    private String college;
    private int graduationYear;
    
    // Constructor
    public Education(int id, int userId, String degree, String college, int graduationYear) {
        this.id = id;
        this.userId = userId;
        this.degree = degree;
        this.college = college;
        this.graduationYear = graduationYear;
    }
    
    // Empty Constructor
    public Education() {
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
    
    public String getDegree() {
        return degree;
    }
    
    public void setDegree(String degree) {
        this.degree = degree;
    }
    
    public String getCollege() {
        return college;
    }
    
    public void setCollege(String college) {
        this.college = college;
    }
    
    public int getGraduationYear() {
        return graduationYear;
    }
    
    public void setGraduationYear(int graduationYear) {
        this.graduationYear = graduationYear;
    }
}
