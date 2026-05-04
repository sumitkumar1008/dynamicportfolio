<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.portfolio.dao.ProjectDAO" %>
<%@ page import="com.portfolio.model.Project" %>
<%@ page import="java.util.List" %>

<%
    // Get projects from database (using sample user with id=1)
    List<Project> projects = ProjectDAO.getProjectsByUser(1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>My Projects</h2>
            
            <%
                if (projects != null && !projects.isEmpty()) {
                    for (Project project : projects) {
            %>
                <div class="card">
                    <h3><%= project.getTitle() %></h3>
                    <p><%= project.getDescription() %></p>
                    <p><strong>Technologies:</strong> <%= project.getTechStack() %></p>
                </div>
            <%
                    }
                } else {
            %>
                <div class="card">
                    <p>No projects added yet.</p>
                </div>
            <%
                }
            %>
            
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
