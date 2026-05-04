<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.portfolio.dao.ProjectDAO, com.portfolio.dao.SkillDAO" %>
<%@ page import="com.portfolio.model.Project, com.portfolio.model.Skill" %>
<%@ page import="java.util.List" %>

<%
    // Check if user is logged in
    Integer userId = (Integer) session.getAttribute("userId");
    String username = (String) session.getAttribute("username");
    
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Get user's projects and skills
    List<Project> projects = ProjectDAO.getProjectsByUser(userId);
    List<Skill> skills = SkillDAO.getSkillsByUser(userId);
    
    String success = (String) request.getAttribute("success");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>Dashboard - Welcome <%= username %></h2>
            
            <%
                if (success != null && !success.isEmpty()) {
            %>
                <div class="alert alert-success"><%= success %></div>
            <%
                }
                if (error != null && !error.isEmpty()) {
            %>
                <div class="alert alert-error"><%= error %></div>
            <%
                }
            %>
            
            <!-- Projects Section -->
            <h3 style="margin-top: 30px;">My Projects</h3>
            
            <div class="card">
                <h4>Add New Project</h4>
                <form method="post" action="ProjectServlet">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="form-group">
                        <label for="title">Project Title</label>
                        <input type="text" id="title" name="title" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="techStack">Technologies Used</label>
                        <input type="text" id="techStack" name="techStack" placeholder="e.g., Java, JSP, MySQL">
                    </div>
                    
                    <button type="submit" class="btn-success">Add Project</button>
                </form>
            </div>
            
            <!-- Projects List -->
            <div class="card">
                <h4>Your Projects</h4>
                <%
                    if (projects != null && !projects.isEmpty()) {
                %>
                    <table>
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Technologies</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Project p : projects) {
                            %>
                                <tr>
                                    <td><%= p.getTitle() %></td>
                                    <td><%= p.getDescription() %></td>
                                    <td><%= p.getTechStack() %></td>
                                    <td>
                                        <form method="post" action="ProjectServlet" style="display: inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="projectId" value="<%= p.getId() %>">
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                <%
                    } else {
                %>
                    <p>No projects yet. Add your first project above!</p>
                <%
                    }
                %>
            </div>
            
            <!-- Skills Section -->
            <h3 style="margin-top: 30px;">My Skills</h3>
            
            <div class="card">
                <h4>Add New Skill</h4>
                <form method="post" action="SkillServlet">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="form-group">
                        <label for="skillName">Skill Name</label>
                        <input type="text" id="skillName" name="name" placeholder="e.g., Java, JavaScript" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="level">Proficiency Level</label>
                        <select id="level" name="level" required>
                            <option value="">-- Select Level --</option>
                            <option value="beginner">Beginner</option>
                            <option value="intermediate">Intermediate</option>
                            <option value="advanced">Advanced</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn-success">Add Skill</button>
                </form>
            </div>
            
            <!-- Skills List -->
            <div class="card">
                <h4>Your Skills</h4>
                <%
                    if (skills != null && !skills.isEmpty()) {
                %>
                    <table>
                        <thead>
                            <tr>
                                <th>Skill</th>
                                <th>Level</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Skill s : skills) {
                            %>
                                <tr>
                                    <td><%= s.getName() %></td>
                                    <td>
                                        <span class="skill-badge <%= s.getLevel().toLowerCase() %>">
                                            <%= s.getLevel() %>
                                        </span>
                                    </td>
                                    <td>
                                        <form method="post" action="SkillServlet" style="display: inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="skillId" value="<%= s.getId() %>">
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                <%
                    } else {
                %>
                    <p>No skills yet. Add your first skill above!</p>
                <%
                    }
                %>
            </div>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
