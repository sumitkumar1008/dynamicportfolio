<!-- Navigation Bar and Header -->
<nav class="navbar">
    <h1>Portfolio</h1>
    <ul class="navbar-links">
        <li><a href="index.jsp" class="<%= request.getRequestURI().contains("index") ? "active" : "" %>">Home</a></li>
        <li><a href="about.jsp" class="<%= request.getRequestURI().contains("about") ? "active" : "" %>">About</a></li>
        <li><a href="skills.jsp" class="<%= request.getRequestURI().contains("skills") ? "active" : "" %>">Skills</a></li>
        <li><a href="projects.jsp" class="<%= request.getRequestURI().contains("projects") ? "active" : "" %>">Projects</a></li>
        <li><a href="education.jsp" class="<%= request.getRequestURI().contains("education") ? "active" : "" %>">Education</a></li>
        <li><a href="contact.jsp" class="<%= request.getRequestURI().contains("contact") ? "active" : "" %>">Contact</a></li>
        
        <!-- Logged in user links -->
        <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId != null) {
        %>
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        <%
            } else {
        %>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        <%
            }
        %>
    </ul>
    <button id="themeToggle" onclick="toggleTheme()">🌙 Dark Mode</button>
</nav>
