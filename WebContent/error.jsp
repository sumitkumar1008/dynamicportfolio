<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - My Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="container">
        <section>
            <h2>Oops! Something went wrong</h2>
            <div class="alert alert-error">
                <p>Error Code: <%= request.getAttribute("javax.servlet.error.status_code") %></p>
                <p>Message: <%= request.getAttribute("javax.servlet.error.message") %></p>
            </div>
            <p>The page you're looking for is not available or an error occurred.</p>
            <a href="index.jsp" class="btn">Go Back Home</a>
        </section>
    </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
