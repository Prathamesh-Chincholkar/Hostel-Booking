<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Bookings | Campus Hostel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Inter:400,600,700,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      margin: 0;
      background: linear-gradient(140deg, #fcfcfe 45%, #f5f5ff 100%), url('images/campushostel.jpg') center/cover no-repeat fixed;
      font-family: 'Inter', Arial, sans-serif;
      min-height: 100vh;
    }
    .header-bar {
      display: flex; align-items: center; justify-content: space-between;
      padding: 1.25rem 2vw 1.05rem 2vw; background: #fff;
      box-shadow: 0 1.5px 20px #e5e5f25f; border-bottom: 1.5px solid #eceafd;
    }
    .header-brand {font-size:1.9rem;font-weight:800;color:#232150;display:flex;align-items:center;gap:0.7rem;}
    .header-brand .bi {background:#ece7fe;color:#7367f0;font-size:2.1rem;border-radius:7px;padding:0.18em;margin-right:0.13em;}
    .header-links {display:flex;align-items:center;gap:2rem;}
    .navbar-link {font-weight:600;color:#232150;text-decoration:none;font-size:1.12rem;margin-right:0.9em;}
    .nav-btn {background:#7367f0;color:#fff;font-size:1.18rem;font-weight:600;padding:0.7em 1.5em;border-radius:13px;border:none;box-shadow:0 3px 12px #d5cafd42;cursor:pointer;transition:background .16s;}
    .nav-btn:hover {background:#5541c9;}
    .page-title {font-size:2.4rem;font-weight:800;color:#232150;margin:2.2rem 0 0.5rem 2vw;letter-spacing:-0.02em;}
    .subtitle {font-size:1.13rem;color:#5a5a78;margin-left:2vw;margin-bottom:2.2rem;}
    table {
      width: 94%;
      margin: 0 auto;
      border-collapse: collapse;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 3px 15px rgba(0,0,0,0.05);
      overflow: hidden;
    }
    th, td {
      padding: 1rem;
      text-align: left;
      border-bottom: 1px solid #eee;
      font-size: 1rem;
      color: #333;
    }
    th {
      background: #7367f0;
      color: white;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.02em;
    }
    tr:hover {
      background: #f8f8ff;
    }
    .no-bookings {
      text-align: center;
      color: #555;
      font-size: 1.15rem;
      font-weight: 500;
      margin-top: 3rem;
    }
  </style>
</head>
<body>
  <div class="header-bar">
    <span class="header-brand"><i class="bi bi-building"></i> Campus Hostel</span>
    <div class="header-links">
      <a href="student-dashboard.jsp" class="navbar-link">Browse Rooms</a>
      <button class="nav-btn" onclick="window.location.href='logout.jsp'">Logout</button>
    </div>
  </div>

  <div class="page-title">My Bookings</div>
  <div class="subtitle">View all your current and past hostel bookings</div>

  <%
    // --- Database Connection ---
    String dbURL = "jdbc:mysql://localhost:3306/hostel_booking_system";
    String dbUser = "root";
    String dbPass = ""; // change if you set a password

    // --- Retrieve logged-in user info ---
    String studentEmail = (String) session.getAttribute("studentEmail"); // assume this was stored during login

    if (studentEmail == null) {
        out.println("<p class='no-bookings'>Please <a href='login.jsp'>login</a> to view your bookings.</p>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            PreparedStatement ps = conn.prepareStatement(
                "SELECT b.booking_id, r.room_number, r.room_type, b.status, b.booking_date " +
                "FROM bookings b JOIN rooms r ON b.room_id = r.room_id " +
                "JOIN students s ON b.student_id = s.student_id " +
                "WHERE s.email = ?"
            );
            ps.setString(1, studentEmail);
            ResultSet rs = ps.executeQuery();

            boolean hasBookings = false;
  %>

  <table>
    <tr>
      <th>Booking ID</th>
      <th>Room Number</th>
      <th>Type</th>
      <th>Status</th>
      <th>Booking Date</th>
    </tr>

  <%
            while (rs.next()) {
                hasBookings = true;
  %>
    <tr>
      <td><%= rs.getInt("booking_id") %></td>
      <td><%= rs.getString("room_number") %></td>
      <td><%= rs.getString("room_type") %></td>
      <td><%= rs.getString("status") %></td>
      <td><%= rs.getDate("booking_date") %></td>
    </tr>
  <%
            }
            if (!hasBookings) {
                out.println("</table>");
                out.println("<p class='no-bookings'>No bookings found for your account.</p>");
            } else {
                out.println("</table>");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p class='no-bookings'>Error loading bookings: " + e.getMessage() + "</p>");
        }
    }
  %>
</body>
</html>
