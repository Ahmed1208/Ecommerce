<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <style>
        /* Header Styles */
        .header {
            background-color: transparent; /* Transparent background */
            color: #333; /* Dark text color */
            padding: 15px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: center;
            gap: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* Subtle shadow for depth */
        }

        .header a {
            color: #333; /* Dark text color */
            text-decoration: none;
            padding: 10px 20px;
            background-color: transparent; /* Transparent background */
            border: 1px solid #333; /* Dark border */
            border-radius: 4px;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition */
        }

        .header a:hover {
            background-color: #333; /* Dark background on hover */
            color: #fff; /* White text on hover */
        }
    </style>
</head>
<body>
<header class="header">
    <a href="/ecommerce/adminInfo.jsp">Admin Information</a>
    <a href="/ecommerce/orders">Orders</a>
    <a href="/ecommerce/admin-products">Products</a>
    <a href="/ecommerce/users">Users</a>
</header>
</body>
</html>
