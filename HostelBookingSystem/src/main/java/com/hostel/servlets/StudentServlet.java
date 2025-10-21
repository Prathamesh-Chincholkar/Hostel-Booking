package com.hostel.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostel.model.Booking;
import com.hostel.model.Student;
import com.hostel.service.BookingService;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    private final BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        Student student = (Student) request.getSession().getAttribute("student");
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        List<Booking> bookings = bookingService.getBookingsByStudent(student.getStudentId());
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("student-dashboard.jsp").forward(request, response);
    }
}
