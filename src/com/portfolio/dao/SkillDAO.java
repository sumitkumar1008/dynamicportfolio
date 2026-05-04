package com.portfolio.dao;

import com.portfolio.db.DBConnection;
import com.portfolio.model.Skill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO for Skill Operations
public class SkillDAO {
    
    // Get all skills for a user
    public static List<Skill> getSkillsByUser(int userId) {
        String sql = "SELECT * FROM skills WHERE user_id = ?";
        List<Skill> skills = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setUserId(rs.getInt("user_id"));
                skill.setName(rs.getString("name"));
                skill.setLevel(rs.getString("level"));
                skills.add(skill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skills;
    }
    
    // Add a new skill
    public static boolean addSkill(Skill skill) {
        String sql = "INSERT INTO skills (user_id, name, level) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, skill.getUserId());
            pst.setString(2, skill.getName());
            pst.setString(3, skill.getLevel());
            
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete a skill
    public static boolean deleteSkill(int skillId) {
        String sql = "DELETE FROM skills WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setInt(1, skillId);
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
