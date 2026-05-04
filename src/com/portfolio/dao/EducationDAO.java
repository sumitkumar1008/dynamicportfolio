package com.portfolio.dao;

import com.portfolio.db.DBConnection;
import com.portfolio.model.Education;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO for Education Operations
public class EducationDAO {
    
    // Get all education for a user
    public static List<Education> getEducationByUser(int userId) {
        String sql = "SELECT * FROM education WHERE user_id = ?";
        List<Education> educations = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                Education edu = new Education();
                edu.setId(rs.getInt("id"));
                edu.setUserId(rs.getInt("user_id"));
                edu.setDegree(rs.getString("degree"));
                edu.setCollege(rs.getString("college"));
                edu.setGraduationYear(rs.getInt("graduation_year"));
                educations.add(edu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educations;
    }
    
    // Add education
    public static boolean addEducation(Education education) {
        String sql = "INSERT INTO education (user_id, degree, college, graduation_year) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, education.getUserId());
            pst.setString(2, education.getDegree());
            pst.setString(3, education.getCollege());
            pst.setInt(4, education.getGraduationYear());
            
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
