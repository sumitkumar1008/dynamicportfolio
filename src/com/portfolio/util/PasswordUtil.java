package com.portfolio.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

// Simple Password Hashing using SHA-256
public class PasswordUtil {
    
    // Hash password using SHA-256
    public static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException | java.io.UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Verify password by comparing hashes
    public static boolean verifyPassword(String enteredPassword, String storedHash) {
        String enteredHash = hashPassword(enteredPassword);
        return enteredHash != null && enteredHash.equals(storedHash);
    }
}
