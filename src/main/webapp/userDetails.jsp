
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .data-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 400px;
            margin: 0 auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .data-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .data-item {
            margin-bottom: 15px;
        }
        .data-item label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
        }
        .data-item span {
            color: #333;
        }
    </style>
</head>
<body>

    <form method="post" action="user-details">
        <BR> User ID: <INPUT TYPE=TEXT name="userId">
        <BR> <INPUT TYPE=SUBMIT VALUE=Submit>
    </form>


    <c:if test="${not empty user}">
        <h2>User Information</h2>
        <div class="data-container">
            <form method="post" action="/ecommerce/submitUser.jsp">

                <!-- ID -->
                <div class="data-item">
                    <label>ID:</label>
                    <span>${requestScope.user.id}</span>
                    <INPUT TYPE="hidden" name="id" value="${requestScope.user.id}">
                </div>

                <!-- Name -->
                <div class="data-item">
                    <label>Name:</label>
                    <INPUT TYPE="text" name="name" value="${requestScope.user.name}">
                </div>
                <!-- Email -->
                <div class="data-item">
                    <label>Email:</label>
                    <INPUT TYPE="email" name="email" value="${requestScope.user.email}">
                </div>

                <!-- Password (Masked) -->
                <div class="data-item">
                    <label>Password:</label>
                    <INPUT TYPE="text" name="password" value="${requestScope.user.password}" required>
                </div>

                <!-- Phone Number -->
                <div class="data-item">
                    <label>Phone Number:</label>
                    <INPUT TYPE="text" name="phone" value="${requestScope.user.phone}">
                </div>

                <!-- Date of Birth -->
                <div class="data-item">
                    <label>Date of Birth:</label>
<%--                    <span>${requestScope.user.dateOfBirth}</span>--%>
                    <INPUT TYPE="date" name="dateOfBirth" value="${requestScope.user.dateOfBirth}">
                </div>

                <!-- Balance -->
                <div class="data-item">
                    <label>Balance:</label>
                    <INPUT TYPE="text" name="balance" value="${requestScope.user.balance}">
                </div>

                <!-- Gender -->
                <div class="data-item">
                    <label>Gender:</label>
                    <INPUT TYPE="text" name="gender" value="${requestScope.user.gender}">
                </div>

                <BR> <INPUT type="submit" value="Update">

            </form>
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div>${requestScope.errorMessage}</div>
    </c:if>

</body>
</html>
