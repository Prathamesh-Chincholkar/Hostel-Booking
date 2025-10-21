package com.hostel.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostel.model.Booking;
import com.hostel.model.Student;
import com.hostel.service.BookingService;

@WebServlet("/bookRoom")
public class BookingServlet extends HttpServlet {
    private final BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Student student = (Student) request.getSession().getAttribute("student");
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        Date checkInDate = Date.valueOf(request.getParameter("checkInDate"));
        Date checkOutDate = Date.valueOf(request.getParameter("checkOutDate"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));

        Booking booking = new Booking();
        booking.setStudentId(student.getStudentId());
        booking.setRoomId(roomId);
        booking.setCheckInDate(checkInDate);
        booking.setCheckOutDate(checkOutDate);
        booking.setAmount(amount);

        boolean success = bookingService.createBooking(booking);
        request.setAttribute("message", success ? "Booking successful!" : "Booking failed!");
        request.getRequestDispatcher("student-dashboard.jsp").forward(request, response);
    }
}
