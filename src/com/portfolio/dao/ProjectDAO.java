package com.portfolio.dao;

import com.portfolio.db.DBConnection;
import com.portfolio.model.Project;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO for Project Operations
public class ProjectDAO {
    
    // Get all projects for a user
    public static List<Project> getProjectsByUser(int userId) {
        String sql = "SELECT * FROM projects WHERE user_id = ?";
        List<Project> projects = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                Project project = new Project();
                project.setId(rs.getInt("id"));
                project.setUserId(rs.getInt("user_id"));
                project.setTitle(rs.getString("title"));
                project.setDescription(rs.getString("description"));
                project.setTechStack(rs.getString("tech_stack"));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
    
    // Add a new project
    public static boolean addProject(Project project) {
        String sql = "INSERT INTO projects (user_id, title, description, tech_stack) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, project.getUserId());
            pst.setString(2, project.getTitle());
            pst.setString(3, project.getDescription());
            pst.setString(4, project.getTechStack());
            
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Update a project
    public static boolean updateProject(Project project) {
        String sql = "UPDATE projects SET title = ?, description = ?, tech_stack = ? WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, project.getTitle());
            pst.setString(2, project.getDescription());
            pst.setString(3, project.getTechStack());
            pst.setInt(4, project.getId());
            
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete a project
    public static boolean deleteProject(int projectId) {
        String sql = "DELETE FROM projects WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, projectId);
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
