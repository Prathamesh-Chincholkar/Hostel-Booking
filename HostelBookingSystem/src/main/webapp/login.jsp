<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hostel Login</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <h2>Login</h2>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <form action="login" method="post">
        <label>User Type:</label>
        <select name="userType">
            <option value="admin">Admin</option>
            <option value="student">Student</option>
        </select><br>
        <label>Username/Email:</label>
        <input type="text" name="username" required/><br>
        <label>Password:</label>
        <input type="password" name="password" required/><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
