<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>Get In Touch</h2>
            
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
            
            <form method="post" action="ContactServlet" onsubmit="return validateContactForm()">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" required></textarea>
                </div>
                
                <button type="submit">Send Message</button>
            </form>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
