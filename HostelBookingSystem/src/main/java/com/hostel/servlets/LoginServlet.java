package com.hostel.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostel.model.Admin;
import com.hostel.model.Student;
import com.hostel.service.AdminService;
import com.hostel.service.StudentService;

public class LoginServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    private final StudentService studentService = new StudentService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String userType = request.getParameter("userType"); // "admin" or "student"
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(userType)) {
            Admin admin = adminService.login(username, password);
            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                response.sendRedirect("admin-dashboard.jsp");
                return;
            }
        } else { // student login
            Student student = studentService.login(username, password);
            if (student != null) {
                request.getSession().setAttribute("student", student);
                response.sendRedirect("student-dashboard.jsp");
                return;
            }
        }
        request.setAttribute("error", "Invalid credentials!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
