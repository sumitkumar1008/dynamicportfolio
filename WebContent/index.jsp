<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <header>
        <h2>Welcome to My Portfolio</h2>
        <p>Full Stack Developer | Java | Web Technologies</p>
    </header>
    
    <main class="container">
        <section>
            <h2>About Me</h2>
            <div class="card">
                <p>
                    I'm a passionate developer with expertise in Java, web development, and database design. 
                    I love creating scalable, user-friendly applications that solve real-world problems.
                </p>
                <p>
                    With a strong foundation in core programming concepts, I'm always eager to learn and 
                    explore new technologies.
                </p>
                <a href="about.jsp" class="btn">Learn More</a>
            </div>
        </section>
        
        <section>
            <h2>Featured Projects</h2>
            <div class="cards-container">
                <div class="card">
                    <h4>E-Commerce Platform</h4>
                    <p>A full-stack e-commerce solution with user authentication and product management.</p>
                    <p><strong>Tech:</strong> Java, JSP, MySQL</p>
                </div>
                <div class="card">
                    <h4>Portfolio Website</h4>
                    <p>Dynamic portfolio website with CRUD operations and user dashboard.</p>
                    <p><strong>Tech:</strong> Java, JSP, MySQL, JavaScript</p>
                </div>
            </div>
            <a href="projects.jsp" class="btn" style="display: block; width: fit-content; margin-top: 20px;">View All Projects</a>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
