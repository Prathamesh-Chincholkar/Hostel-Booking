package com.hostel.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostel.model.Admin;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // TODO: Load data for dashboard (bookings, rooms, etc.)
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
    }
}
