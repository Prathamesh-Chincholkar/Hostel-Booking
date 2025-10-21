<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%System.out.println("JSP login block executing...");

    // --- LOGIN LOGIC (placed at top before HTML) ---
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    String message = null;
    

    if (email != null && password != null && role != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hostel_booking_system", "root", "Discodisco11*");

            PreparedStatement ps = null;
            if (role.equals("admin")) {
                ps = conn.prepareStatement("SELECT * FROM admins WHERE email=? AND password=?");
            } else {
                ps = conn.prepareStatement("SELECT * FROM students WHERE email=? AND password=?");
            }

            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("userEmail", email);
                session.setAttribute("userRole", role);

                if (role.equals("admin")) {
                    response.sendRedirect("admin-dashboard.jsp");
                } else {
                    response.sendRedirect("student-dashboard.jsp");
                }
                conn.close();
                return; // stop rendering rest of page
            } else {
                message = "Invalid email or password.";
            }
            conn.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Campus Hostel Login</title>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        body {
            background: url('images/campushostel.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .login-box {
            width: 350px;
            margin: 100px auto;
            background-color: rgba(255,255,255,0.85);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        input, select {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #1a252f;
        }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2 align="center">Campus Hostel Login</h2>

        <% if (message != null) { %>
            <p class="error"><%= message %></p>
        <% } %>

        <form action="index.jsp" method="post">
            <label>Email:</label>
            <input type="text" name="email" required>
            
            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Role:</label>
            <select name="role" required>
                <option value="student">Student</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
