<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .content {
            margin-top: 80px; /* Adjust this value to match the height of the fixed header */
            padding: 20px;
        }

        h1, legend {
            color: #333;
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

        /* Responsive Styles */
        @media (max-width: 1200px) {
            .content {
                padding: 15px; /* Adjust padding for medium screens */
            }

            input[type="number"], select {
                font-size: 14px; /* Slightly smaller font size */
                padding: 6px; /* Adjust padding */
            }

            button {
                font-size: 14px; /* Slightly smaller button font size */
                padding: 8px 16px; /* Adjust padding */
            }

            table, th, td {
                font-size: 14px; /* Slightly smaller font size for table */
            }
        }

        @media (max-width: 992px) {
            .content {
                padding: 10px; /* Further adjust padding */
            }

            input[type="number"], select {
                font-size: 13px; /* Smaller font size */
                padding: 5px; /* Adjust padding */
            }

            button {
                font-size: 13px; /* Smaller button font size */
                padding: 6px 12px; /* Adjust padding */
            }

            table, th, td {
                font-size: 13px; /* Smaller font size for table */
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 10px; /* Further adjust padding */
            }

            input[type="number"], select {
                font-size: 12px; /* Smaller font size */
                padding: 4px; /* Adjust padding */
            }

            button {
                font-size: 12px; /* Smaller button font size */
                padding: 4px 10px; /* Adjust padding */
            }

            table, th, td {
                font-size: 12px; /* Smaller font size for table */
            }
        }

        @media (max-width: 576px) {
            .content {
                padding: 5px; /* Minimal padding for very small screens */
            }

            input[type="number"], select {
                font-size: 11px; /* Smallest font size */
                padding: 3px; /* Adjust padding */
            }

            button {
                font-size: 11px; /* Smallest button font size */
                padding: 3px 8px; /* Adjust padding */
            }

            table, th, td {
                font-size: 11px; /* Smallest font size for table */
            }
        }
    </style>
</head>
<body>

<div class="content">
    <h1>Users Management</h1>

    <table border="1" style="width:100%; text-align:left; border-collapse:collapse;">
        <thead>
        <tr>
            <th>UserId</th>
            <th>Name</th>
            <th>Balance</th>
            <th>Phone</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="user" items="${requestScope.users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.balance}</td>
                <td>${user.phone}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a id="currPage" class="active rounded">${i}</a> <!-- Current page -->
                </c:when>
                <c:otherwise>
                    <a href="?pageNumber=${i}" class="rounded">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>

</body>
</html>
