<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.portfolio.dao.EducationDAO" %>
<%@ page import="com.portfolio.model.Education" %>
<%@ page import="java.util.List" %>

<%
    // Get education from database (using sample user with id=1)
    List<Education> educations = EducationDAO.getEducationByUser(1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Education - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>Education</h2>
            
            <%
                if (educations != null && !educations.isEmpty()) {
                    for (Education edu : educations) {
            %>
                <div class="card">
                    <h3><%= edu.getDegree() %></h3>
                    <p><strong>College:</strong> <%= edu.getCollege() %></p>
                    <p><strong>Graduation Year:</strong> <%= edu.getGraduationYear() %></p>
                </div>
            <%
                    }
                } else {
            %>
                <div class="card">
                    <p>No education details added yet.</p>
                </div>
            <%
                }
            %>
            
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
