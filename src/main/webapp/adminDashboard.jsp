<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        /* Reset margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif; /* Use the same font as Fruitables */
            background-color: #f5f5f5;
            color: #333;
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 250px;
            background-color: #4CAF50; /* Green color matching the theme */
            padding-top: 30px;
            color: white;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 20px 0;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px;
            display: block;
            text-align: center;
            transition: background-color 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #388E3C; /* Darker green on hover */
        }

        /* Content Area */
        .content {
            flex: 1;
            padding: 30px;
            background-color: #ffffff;
            overflow-y: auto;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #4CAF50; /* Green headings */
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            margin-top: 10px;
            color: #333;
        }

        form input {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        form button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            font-size: 16px;
        }

        form button:hover {
            background-color: #388E3C;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Section display control */
        .dashboard-section {
            display: none;
        }

        #user-info, #order-history {
            display: block; /* Initially show User Info */
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }

        input[readonly] {
            background-color: #f0f0f0; /* Light gray background */
            color: #555; /* Dark gray text */
            border: 1px solid #ccc; /* Light border */
            cursor: not-allowed; /* Show a "not-allowed" cursor */
            opacity: 0.7; /* Slight transparency */
        }

        input[readonly]:focus {
            outline: none; /* Remove focus outline */
        }

    </style>
</head>
<body>

<jsp:include page="notification.jsp"/>


<div class="dashboard-container">
    <!-- Left Navigation -->
    <nav class="sidebar">
        <ul>
            <li><a href="javascript:void(0)" onclick="showSection('user-info')">User Information</a></li>
            <li><a href="javascript:void(0)" onclick="showSection('order-history')">Order History</a></li>
            <li><a href="javascript:void(0)" onclick="showSection('balancelogs-history')">Balance Logs History</a></li>
        </ul>
    </nav>




    <!-- Content Section -->
    <div class="content">
        <!-- User Info Section -->
        <section id="user-info" class="dashboard-section">
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

        </section>

        <!-- Order History Section -->
        <section id="order-history" class="dashboard-section" style="display:none;">
            <h2>Order History</h2>
            <table>
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <script>console.log("i'm here outside : "+${sessionScope.user.id})</script>
                <c:forEach var="order" items="${sessionScope.user.orders}">
                    <tr>
                        <script>console.log("i'm here inside")</script>
                        <td>${order.id}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>

        <!-- Balance Logs History Section -->
        <section id="balancelogs-history" class="dashboard-section" style="display:none;">
            <h2>Balance Logs History</h2>
            <table>
                <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Amount</th>
                    <th>Payment_Type</th>
                </tr>
                </thead>
                <tbody>
                <script>console.log("i'm here outside : "+${sessionScope.user.id})</script>
                <c:forEach var="log" items="${sessionScope.user.balanceLogs}">
                    <tr>
                        <script>console.log("i'm here inside")</script>
                        <td>${log.id}</td>
                        <td>${log.amount}</td>
                        <td>${log.paymentType}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </div>
</div>

<script>
    // Function to toggle between User Info and Order History
    function showSection(sectionId) {
        // Hide all sections
        document.querySelectorAll('.dashboard-section').forEach(section => {
            section.style.display = 'none';
        });
        // Display the selected section
        document.getElementById(sectionId).style.display = 'block';
    }
</script>
</body>
</html>
