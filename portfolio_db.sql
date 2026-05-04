-- Create Portfolio Database
CREATE DATABASE IF NOT EXISTS portfolio_db;
USE portfolio_db;

-- Create Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create About Table
CREATE TABLE about (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    description TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Skills Table
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    level VARCHAR(50) NOT NULL, -- beginner, intermediate, advanced
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Projects Table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    tech_stack VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Education Table
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    degree VARCHAR(100) NOT NULL,
    college VARCHAR(150) NOT NULL,
    graduation_year INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Messages Table
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE
);

-- Insert Sample Data
-- Sample User (password: password123)
INSERT INTO users (username, email, password) 
VALUES ('ayush_raj', 'ayush123@gmail.com', '8d969eef6ecad3c29a3a873fba4c75f2d2c9e4e85268a8b0649f8d1d3d1a5d8f');

SET @user_id = LAST_INSERT_ID();

-- Sample About
INSERT INTO about (user_id, description) 
VALUES (@user_id, 'I am a passionate developer with experience in Java, web development, and database design. I love building scalable applications.');

-- Sample Skills
INSERT INTO skills (user_id, name, level) VALUES 
(@user_id, 'Java', 'advanced'),
(@user_id, 'JavaScript', 'intermediate'),
(@user_id, 'MySQL', 'intermediate'),
(@user_id, 'HTML/CSS', 'advanced');

-- Sample Projects
INSERT INTO projects (user_id, title, description, tech_stack) VALUES 
(@user_id, 'Portfolio Website', 'A dynamic portfolio website built with JSP and MySQL', 'Java, JSP, MySQL, HTML, CSS, JavaScript'),
(@user_id, 'E-Commerce Platform', 'A simple e-commerce platform with user authentication', 'Java, Servlets, JDBC, MySQL');

-- Sample Education
INSERT INTO education (user_id, degree, college, graduation_year) VALUES 
(@user_id, 'Bachelor of Technology', 'ABC University', 2022),
(@user_id, 'Diploma in Web Development', 'XYZ Institute', 2020);

-- Sample Message
INSERT INTO messages (name, email, message) 
VALUES ('Test User', 'test@example.com', 'This is a test message from the contact form.');
