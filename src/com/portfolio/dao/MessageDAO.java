package com.portfolio.dao;

import com.portfolio.db.DBConnection;
import com.portfolio.model.Message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// DAO for Message Operations
public class MessageDAO {
    
    // Save a new message
    public static boolean saveMessage(Message message) {
        String sql = "INSERT INTO messages (name, email, message) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, message.getName());
            pst.setString(2, message.getEmail());
            pst.setString(3, message.getMessage());
            
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
