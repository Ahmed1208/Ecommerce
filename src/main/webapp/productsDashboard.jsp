<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <style>
        /* Base styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        /* Header Styles */
        .header-container {
            margin-top: 80px;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap; /* Allow wrapping for smaller screens */
            background-color: #ffffff; /* Ensure background color for header */
            z-index: 1; /* Ensure header is above other content */
            position: relative;
            overflow: hidden;
        }

        .header-container h1 {
            margin: 0;
            color: #333;
        }

        .buttons-container {
            display: flex;
            gap: 10px;
            flex-wrap: wrap; /* Allow wrapping if needed */
        }

        .add-product-btn, .reset-btn {
            margin: 5px; /* Add margin to buttons for spacing */
        }

        .add-product-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }

        .add-product-btn:hover {
            background-color: #45a049;
        }

        .reset-btn {
            background-color: transparent;
            color: #333;
            padding: 8px 16px;
            border: 1px solid #333;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .reset-btn:hover {
            background-color: #333;
            color: #fff;
        }

        /* Filter Form */
        form {
            margin-top: 20px;
        }

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

        input[type="text"], input[type="number"], select {
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

        /* Table Container */
        .table-container {
            overflow-x: auto; /* Enable horizontal scrolling for table */
            padding: 0 20px; /* Add padding to match header */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            min-width: 800px; /* Ensure table has a minimum width */
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

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-buttons button {
            font-size: 14px;
        }

        .update-btn {
            background-color: #007BFF;
            color: white;
        }

        .update-btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                align-items: flex-start;
            }

            .header-container h1 {
                margin-bottom: 10px;
            }

            .buttons-container {
                gap: 5px; /* Reduced gap for smaller screens */
            }

            .add-product-btn, .reset-btn {
                padding: 8px 15px; /* Smaller padding */
                font-size: 14px; /* Smaller font size */
            }

            table, th, td {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            fieldset {
                padding: 10px;
            }

            input[type="text"], input[type="number"], select {
                width: 100%;
                margin-right: 0;
                margin-bottom: 10px;
            }

            button {
                width: 100%;
                padding: 12px;
            }

            .buttons-container {
                flex-wrap: wrap; /* Allow wrapping if needed */
            }

            .add-product-btn, .reset-btn {
                padding: 8px 12px; /* Smaller padding for very small screens */
                font-size: 12px; /* Smaller font size for very small screens */
            }
        }


    </style>
</head>
<body>
<jsp:include page="notification.jsp"/>
<!-- Header and Add Product Button -->
<div class="header-container">
    <h1>Product Management</h1>
    <div class="buttons-container">
        <a href="/ecommerce/add-category" class="add-product-btn">Add New Category</a>
        <a href="/ecommerce/add-product" class="add-product-btn">Add New Product</a>
        <a href="/ecommerce/admin-products" class="reset-btn">Reset Filter</a>
    </div>
</div>

<!-- Filter Form -->
<form method="get" action="">
    <fieldset>
        <legend>Filter Products</legend>

        <!-- Filter by Min Price -->
        <label for="minPrice">Min Price:</label>
        <input type="number" id="minPrice" name="minPrice" value="${param.minPrice}" step="0.01">

        <!-- Filter by Max Price -->
        <label for="maxPrice">Max Price:</label>
        <input type="number" id="maxPrice" name="maxPrice" value="${param.maxPrice}" step="0.01">

        <!-- Filter by Category -->
        <label for="subcategory">Subcategory:</label>
        <select id="subcategory" name="subCategories">
            <option value="">Select Subcategory</option>
            <c:forEach var="category" items="${ParentCategories}">
                <!-- Nested loop for subcategories -->
                <c:forEach var="subcategory" items="${category.childCategories}">
                    <option value="${subcategory.name}" ${param.subCategories == subcategory.name ? 'selected' : ''}>
                            ${subcategory.name}
                    </option>
                </c:forEach>
            </c:forEach>
        </select>

        <!-- Filter by Product Name -->
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="searchText" value="${param.searchText}">

        <!-- Submit Button -->
        <button type="submit">Filter</button>
    </fieldset>
</form>

<!-- Products Table -->
<!-- Products Table -->
<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th> <!-- New column for buttons -->
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.productName}</td>
                <td>${product.description}</td>
                <td>${product.category.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>
                    <div class="action-buttons">
                        <a href="/ecommerce/update-product?productid=${product.id}&productName=${product.productName}&description=${product.description}&categoryname=${product.category.name}&price=${product.price}&quantity=${product.quantity}">
                            <button type="button" class="update-btn">Update</button>
                        </a>
                        <a href="/ecommerce/delete-product?product=${product.id}">
                            <button type="button" class="delete-btn">Delete</button>
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<div class="pagination">
    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <a id="currPage" class="active">${i}</a> <!-- Current page -->
            </c:when>
            <c:otherwise>
                <a href="?pageNumber=${i}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&subCategories=${param.subCategories}&searchText=${param.searchText}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

</body>
</html>
