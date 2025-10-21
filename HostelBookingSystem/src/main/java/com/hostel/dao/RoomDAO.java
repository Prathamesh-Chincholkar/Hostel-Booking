package com.hostel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hostel.model.Room;
import com.hostel.utils.DBConnection;

public class RoomDAO {

    public List<Room> getAvailableRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms WHERE available_beds > 0";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setOccupiedBeds(rs.getInt("occupied_beds"));
                room.setPrice(rs.getBigDecimal("price"));
                room.setHostelName(rs.getString("hostel_name"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Optionally, add other Room management methods (save, update, delete)
}
