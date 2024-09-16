<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Reset Button */
        .reset-btn {
            background-color: transparent;
            color: #333;
            padding: 8px 16px;
            border: 1px solid #333;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .reset-btn:hover {
            background-color: #333;
            color: #fff;
        }

        /* Main Body and Layout */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .content-wrapper {
            padding-top: 50px;
            padding-left: 20px;
            padding-right: 20px;
        }

        h1 {
            color: #333;
        }

        /* Flexbox for header and filter */
        .header-filter {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Filter Form */
        fieldset {
            border: 1px solid #4CAF50;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            background-color: #ffffff;
        }

        label {
            margin-right: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="number"], select {
            padding: 8px;
            margin-right: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Responsive Form */
        @media (max-width: 768px) {
            fieldset {
                display: flex;
                flex-direction: column;
            }
            @media (max-width: 768px) {
                .content-wrapper {
                    padding-top: 120px; /* Increase padding when the screen size is smaller */
                }
            }

            label, input[type="number"], select {
                width: 100%;
                margin-right: 0;
                margin-bottom: 10px;
            }

            input[type="number"], select {
                margin-left: 0;
            }

            /* Ensure both label and input go together on second line */
            label, input, select {
                display: inline-block;
                width: auto;
                flex-basis: 50%;
            }

            input, select {
                width: 48%;
            }
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
            color: #333;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Pagination */
        div.pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        div.pagination a {
            color: #4CAF50;
            padding: 10px 20px;
            margin: 0 5px;
            border: 1px solid #4CAF50;
            border-radius: 4px;
            text-decoration: none;
        }

        div.pagination a.active {
            background-color: #4CAF50;
            color: white;
        }

        div.pagination a:hover {
            background-color: #45a049;
            color: white;
        }
    </style>

</head>
<body>

<div class="content-wrapper">
    <!-- Header and Reset Filter -->
    <div class="header-filter">
        <h1>Order Management</h1>
        <a href="/ecommerce/orders" class="reset-btn">Reset Filter</a>
    </div>

    <!-- Filter Form -->
    <form method="get" action="">
        <fieldset>
            <legend>Filter Orders</legend>

            <label for="minPrice">Min Price:</label>
            <input type="number" id="minPrice" name="minPrice" value="${param.minPrice}" step="0.01">

            <label for="maxPrice">Max Price:</label>
            <input type="number" id="maxPrice" name="maxPrice" value="${param.maxPrice}" step="0.01">

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="">Select</option>
                <option value="PENDING" ${param.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                <option value="SHIPPED" ${param.status == 'SHIPPED' ? 'selected' : ''}>Shipped</option>
                <option value="DELIVERED" ${param.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
                <option value="CANCELED" ${param.status == 'CANCELED' ? 'selected' : ''}>Canceled</option>
            </select>

            <label for="payment">Payment Type:</label>
            <select id="payment" name="payment">
                <option value="">Select</option>
                <option value="CASH" ${param.payment == 'CASH' ? 'selected' : ''}>Cash</option>
                <option value="VISA" ${param.payment == 'VISA' ? 'selected' : ''}>Visa</option>
            </select>

            <button type="submit">Filter</button>
        </fieldset>
    </form>

    <!-- Orders Table -->
    <table>
        <thead>
        <tr>
            <th>OrderId</th>
            <th>Payment Type</th>
            <th>Total Price</th>
            <th>UserId</th>
            <th>Order Date</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${requestScope.orders}">
            <tr onclick="window.location.href='/ecommerce/orderDetails?orderid=${order.id}'">
                <td>${order.id}</td>
                <td>${order.paymentType}</td>
                <td>${order.totalPrice}</td>
                <td>${order.user.id}</td>
                <td>${order.orderDate}</td>
                <td>${order.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a id="currPage" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="?pageNumber=${i}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&status=${param.status}&payment=${param.payment}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>

</body>
</html>
