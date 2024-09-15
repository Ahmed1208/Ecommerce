<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Information</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        /* Add a margin-top to ensure content starts below the header */
        .content {
            margin-top: 30px; /* Adjust the value to match the height of your header */
            padding: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            background-color: #ffffff;
            border: 1px solid #4CAF50;
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<jsp:include page="notification.jsp"/>
<div class="content">
    <h2>Admin Information</h2>
    <form action="submitAdmin.jsp" method="post">

        <label>ID:</label>
        <input type="text" name="id" value="${sessionScope.admin.id}" readonly>

        <label>Name:</label>
        <input type="text" id="name" name="name" value="${sessionScope.admin.name}">

        <label>Email:</label>
        <input type="email" id="email" name="email" value="${sessionScope.admin.email}" readonly>

        <label>Password:</label>
        <input type="text" id="password" name="password" value="${sessionScope.admin.password}">

        <label>Gender:</label>
        <input type="text" id="gender" name="gender" value="${sessionScope.admin.gender}" readonly>

        <input type="submit" value="Update">
    </form>

</div>
</body>
</html>
