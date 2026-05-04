<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>About Me</h2>
            <div class="card">
                <h3>Who I Am</h3>
                <p>
                    I am a passionate full-stack developer with expertise in Java, web development, and database design. 
                    I specialize in building scalable, efficient applications that solve real-world problems.
                </p>
                <p>
                    With a strong foundation in core programming concepts and a drive to constantly learn, 
                    I'm committed to delivering high-quality solutions and contributing to innovative projects.
                </p>
            </div>
            
            <div class="card">
                <h3>My Journey</h3>
                <p>
                    I started my programming journey with a diploma in web development and continued to build my skills 
                    with a Bachelor's degree in Technology. Through hands-on projects and continuous learning, 
                    I've developed expertise in:
                </p>
                <ul style="margin-left: 20px; margin-top: 10px;">
                    <li>Backend development with Java and Servlets</li>
                    <li>Frontend development with HTML, CSS, and JavaScript</li>
                    <li>Database design and SQL optimization</li>
                    <li>RESTful API development</li>
                    <li>User authentication and security</li>
                </ul>
            </div>
            
            <div class="card">
                <h3>What I'm Passionate About</h3>
                <p>
                    I'm passionate about writing clean, maintainable code and solving complex problems. 
                    I believe in continuous learning and staying updated with the latest technologies. 
                    My goal is to create applications that not only work well but also provide excellent user experiences.
                </p>
            </div>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
