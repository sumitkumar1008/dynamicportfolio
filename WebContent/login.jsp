<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>Login</h2>
            
            <%
                String success = (String) request.getAttribute("success");
                String error = (String) request.getAttribute("error");
                
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
            
            <form method="post" action="LoginServlet" onsubmit="return validateLoginForm()">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit">Login</button>
            </form>
            
            <p style="margin-top: 20px;">
                Don't have an account? <a href="register.jsp">Register here</a>
            </p>
            
            <div class="alert alert-info" style="margin-top: 20px;">
                <p><strong>Demo Login Credentials:</strong></p>
                <p>Username: ayush_raj</p>
                <p>Password: password123</p>
            </div>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
