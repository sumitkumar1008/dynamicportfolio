package com.portfolio.servlet;

import com.portfolio.dao.SkillDAO;
import com.portfolio.model.Skill;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// Skill CRUD Servlet
@WebServlet("/SkillServlet")
public class SkillServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        // Check if user is logged in
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addSkill(request, response, userId);
        } else if ("delete".equals(action)) {
            deleteSkill(request, response);
        }
    }
    
    // Add Skill
    private void addSkill(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String level = request.getParameter("level");
        
        // Validate
        if (name == null || name.isEmpty() || level == null || level.isEmpty()) {
            request.setAttribute("error", "Skill name and level are required!");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }
        
        Skill skill = new Skill();
        skill.setUserId(userId);
        skill.setName(name);
        skill.setLevel(level);
        
        if (SkillDAO.addSkill(skill)) {
            request.setAttribute("success", "Skill added successfully!");
        } else {
            request.setAttribute("error", "Failed to add skill!");
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
    
    // Delete Skill
    private void deleteSkill(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int skillId = Integer.parseInt(request.getParameter("skillId"));
        
        if (SkillDAO.deleteSkill(skillId)) {
            request.setAttribute("success", "Skill deleted successfully!");
        } else {
            request.setAttribute("error", "Failed to delete skill!");
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
