<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <style>
        /* Content Styles */
        body {
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .header-container {
            margin-top: 80px; /* Increased margin-top to provide more space from the header */
            padding: 0 20px; /* Ensure padding for content */
            display: flex;
            justify-content: space-between; /* Align items to the ends of the container */
            align-items: center; /* Center items vertically */
        }

        .header-container h1 {
            margin: 0;
            color: #333; /* Restore color to match previous design */
        }

        /* Add Product Button */
        .add-product-btn {
            background-color: #4CAF50; /* Green button matching header */
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

        /* Reset Filter Button */
        .reset-btn {
            background-color: transparent; /* Transparent background */
            color: #333; /* Dark text color */
            padding: 8px 16px; /* Consistent padding for links */
            border: 1px solid #333; /* Dark border */
            border-radius: 4px;
            text-decoration: none; /* Remove underline */
            font-size: 16px; /* Adjust font size */
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition */
        }

        .reset-btn:hover {
            background-color: #333; /* Dark background on hover */
            color: #fff; /* White text on hover */
        }

        /* Filter Form */
        form {
            margin-top: 20px; /* Add space between Add Product button and the form */
        }

        fieldset {
            border: 1px solid #4CAF50; /* Green border matching header */
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
            background-color: #4CAF50; /* Green button matching header */
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
            background-color: #4CAF50; /* Green header matching the button */
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
            color: #4CAF50; /* Green for pagination links */
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
            background-color: #007BFF; /* Blue for update button */
            color: white;
        }

        .update-btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            background-color: #dc3545; /* Red for delete button */
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<jsp:include page="notification.jsp"/>
<!-- Header and Add Product Button -->
<div class="header-container">
    <h1>Product Management</h1>
    <div>
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
