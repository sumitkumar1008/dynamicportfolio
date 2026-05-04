<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.portfolio.dao.SkillDAO" %>
<%@ page import="com.portfolio.model.Skill" %>
<%@ page import="java.util.List" %>

<%
    // Get skills from database (using sample user with id=1)
    // In real app, you would use logged-in user's id
    List<Skill> skills = SkillDAO.getSkillsByUser(1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skills - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>My Skills</h2>
            
            <div class="card">
                <h3>Technical Skills</h3>
                <div class="skills-container">
                    <%
                        if (skills != null && !skills.isEmpty()) {
                            for (Skill skill : skills) {
                    %>
                        <span class="skill-badge <%= skill.getLevel().toLowerCase() %>">
                            <%= skill.getName() %> - <%= skill.getLevel() %>
                        </span>
                    <%
                            }
                        } else {
                    %>
                        <p>No skills added yet.</p>
                    <%
                        }
                    %>
                </div>
            </div>
            
            <div class="card">
                <h3>Proficiency Levels</h3>
                <p><strong>Beginner:</strong> Foundation knowledge, starting to build projects</p>
                <p><strong>Intermediate:</strong> Solid understanding, can build real-world applications</p>
                <p><strong>Advanced:</strong> Mastered skill, can mentor others and solve complex problems</p>
            </div>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
