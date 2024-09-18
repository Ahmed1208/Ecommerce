<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #ff6600; /* Orange theme */
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-label {
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            margin-bottom: 20px;
        }

        .form-control:focus {
            border-color: #ff6600;
            box-shadow: 0 0 5px rgba(255, 102, 0, 0.5);
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            margin-right: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #ff6600;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e65c00;
        }

        .btn-secondary {
            background-color: #ccc;
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #b3b3b3;
        }

        .btn-danger {
            background-color: #333;
            color: white;
        }

        .btn-danger:hover {
            background-color: #222;
        }

        select.form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Product</h2>

    <!-- Product Update Form -->
    <form action="update-product" method="post" >
        <!-- Hidden ID Field -->
        <input type="hidden" class="form-control" id="id" name="id" value="${requestScope.productid}" readonly>

        <!-- Product Name -->
        <label for="productName" class="form-label">Product Name</label>
        <input type="text" class="form-control" id="productName" name="productName" value="${requestScope.productName}" required>

        <!-- Description -->
        <label for="description" class="form-label">Description</label>
        <textarea class="form-control" id="description" name="description" rows="3" required>${requestScope.description}</textarea>

        <!-- Category Name -->
        <label for="subcategory" class="form-label">Category Name</label>
        <select id="subcategory" name="subCategories" class="form-control">
            <option value="">Select Subcategory</option>
            <c:forEach var="category" items="${ParentCategories}">
                <c:forEach var="subcategory" items="${category.childCategories}">
                    <option value="${subcategory.name}" ${requestScope.categoryname == subcategory.name ? 'selected' : ''}>
                            ${subcategory.name}
                    </option>
                </c:forEach>
            </c:forEach>
        </select>

        <!-- Quantity -->
        <label for="quantity" class="form-label">Quantity</label>
        <input type="number" class="form-control" id="quantity" name="quantity" value="${requestScope.quantity}" min="0" required>

        <!-- Price -->
        <label for="price" class="form-label">Price</label>
        <input type="number" class="form-control" id="price" name="price" value="${requestScope.price}" step="0.01" required>

        <!-- Buttons -->
        <button type="submit" class="btn btn-primary">Update Product</button>
        <button type="reset" class="btn btn-secondary">Reset</button>
        <a href="productList" class="btn btn-danger">Cancel</a>
    </form>
</div>
</body>
</html>
