package com.portfolio.servlet;

import com.portfolio.dao.ProjectDAO;
import com.portfolio.model.Project;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// Project CRUD Servlet
@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
    
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
            addProject(request, response, userId);
        } else if ("update".equals(action)) {
            updateProject(request, response);
        } else if ("delete".equals(action)) {
            deleteProject(request, response);
        }
    }
    
    // Add Project
    private void addProject(HttpServletRequest request, HttpServletResponse response, int userId) 
            throws ServletException, IOException {
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String techStack = request.getParameter("techStack");
        
        // Validate
        if (title == null || title.isEmpty() || description == null || description.isEmpty()) {
            request.setAttribute("error", "Title and Description are required!");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }
        
        Project project = new Project();
        project.setUserId(userId);
        project.setTitle(title);
        project.setDescription(description);
        project.setTechStack(techStack != null ? techStack : "");
        
        if (ProjectDAO.addProject(project)) {
            request.setAttribute("success", "Project added successfully!");
        } else {
            request.setAttribute("error", "Failed to add project!");
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
    
    // Update Project
    private void updateProject(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String techStack = request.getParameter("techStack");
        
        Project project = new Project();
        project.setId(projectId);
        project.setTitle(title);
        project.setDescription(description);
        project.setTechStack(techStack);
        
        if (ProjectDAO.updateProject(project)) {
            request.setAttribute("success", "Project updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update project!");
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
    
    // Delete Project
    private void deleteProject(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        
        if (ProjectDAO.deleteProject(projectId)) {
            request.setAttribute("success", "Project deleted successfully!");
        } else {
            request.setAttribute("error", "Failed to delete project!");
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
