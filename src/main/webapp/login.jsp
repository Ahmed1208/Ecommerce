<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .login-container {
            width: 350px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
            border-radius: 12px;
        }

        h2 {
            text-align: center;
            color: #28a745;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Style for the role dropdown */
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
        }

        select:focus {
            border-color: #28a745;
            outline: none;
            box-shadow: 0 0 8px rgba(40, 167, 69, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #218838;
        }

        p {
            text-align: center;
            margin-top: 15px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .notification {
            background-color: #f44336; /* Red background */
            color: white; /* White text */
            padding: 15px;
            position: fixed; /* Fixed at the top */
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            display: none; /* Hidden by default */
            border-radius: 5px;
        }



    </style>
</head>
<body>
<%--<jsp:include page="notification.jsp"/>--%>
<c:if test="${not empty requestScope.errorMessage}">
    <div class="notification" id="notification">
            ${requestScope.errorMessage}
    </div>
</c:if>


<div class="login-container" >
    <h2>Login</h2>
    <form id="loginForm" method="post" action="login">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>

        <!-- Role Selection Dropdown -->
<%--        <div class="form-group">--%>
<%--            <label for="role">Role:</label>--%>
<%--            <select id="role" name="role" required>--%>
<%--                <option value="User">User</option>--%>
<%--                <option value="Admin">Admin</option>--%>
<%--            </select>--%>
<%--        </div>--%>

        <div class="form-group">
            <button type="submit" class="btn">Login</button>
        </div>
    </form>
    <p>Don't have an account? <a href="register.jsp">Sign up here</a></p>
</div>

<script src="login.js"></script>
<script>
    window.onload = function() {
        const notification = document.getElementById('notification');
        if (notification) {
            notification.style.display = 'block'; // Show notification
            setTimeout(function() {
                notification.style.display = 'none'; // Hide notification after 5 seconds
            }, 5000);
        }
    };
</script>
</body>
</html>
