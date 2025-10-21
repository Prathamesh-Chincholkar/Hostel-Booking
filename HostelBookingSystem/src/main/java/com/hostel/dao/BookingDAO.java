package com.hostel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hostel.model.Booking;
import com.hostel.utils.DBConnection;

public class BookingDAO {

    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (student_id, room_id, check_in_date, check_out_date, amount, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, booking.getStudentId());
            ps.setInt(2, booking.getRoomId());
            ps.setDate(3, booking.getCheckInDate());
            ps.setDate(4, booking.getCheckOutDate());
            ps.setBigDecimal(5, booking.getAmount());
            ps.setString(6, booking.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getBookingsByStudent(int studentId) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE student_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("booking_id"));
                b.setStudentId(rs.getInt("student_id"));
                b.setRoomId(rs.getInt("room_id"));
                b.setCheckInDate(rs.getDate("check_in_date"));
                b.setCheckOutDate(rs.getDate("check_out_date"));
                b.setAmount(rs.getBigDecimal("amount"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingId(rs.getInt("booking_id"));
                b.setStudentId(rs.getInt("student_id"));
                b.setRoomId(rs.getInt("room_id"));
                b.setCheckInDate(rs.getDate("check_in_date"));
                b.setCheckOutDate(rs.getDate("check_out_date"));
                b.setAmount(rs.getBigDecimal("amount"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
