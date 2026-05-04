package com.portfolio.servlet;

import com.portfolio.dao.MessageDAO;
import com.portfolio.model.Message;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Contact Form Servlet
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String messageText = request.getParameter("message");
        
        // Basic validation
        if (name == null || name.isEmpty() || 
            email == null || email.isEmpty() || 
            messageText == null || messageText.isEmpty()) {
            
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }
        
        // Validate email format
        if (!email.contains("@")) {
            request.setAttribute("error", "Please enter a valid email!");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }
        
        // Create message object
        Message message = new Message();
        message.setName(name);
        message.setEmail(email);
        message.setMessage(messageText);
        
        // Save to database
        if (MessageDAO.saveMessage(message)) {
            request.setAttribute("success", "Message sent successfully! We'll get back to you soon.");
        } else {
            request.setAttribute("error", "Failed to send message. Please try again.");
        }
        
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}
