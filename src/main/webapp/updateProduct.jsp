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
        }

        .form-label {
            color: #333;
            font-weight: bold;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
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

        img.img-thumbnail {
            margin-top: 10px;
            border: 2px solid #ff6600;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Update Product</h2>

    <!-- Product Update Form -->
    <form action="updateProduct" method="post">
        <!-- Hidden ID Field -->
        <input type="hidden" class="form-control" id="id" name="id" value="${product.id}" readonly>

        <!-- Product Name -->
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${product.description}</textarea>
        </div>

        <!-- Quantity -->
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" min="0" required>
        </div>

        <!-- Image -->
        <div class="mb-3">
            <label for="image" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*">
            <div class="mt-2">
                <img src="${product.image}" alt="${product.name}" class="img-thumbnail" style="width: 150px; height: auto;">
            </div>
        </div>

        <!-- Price -->
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" class="form-control" id="price" name="price" value="${product.price}" step="0.01" required>
        </div>

        <!-- Buttons -->
        <button type="submit" class="btn btn-primary">Update Product</button>
        <button type="reset" class="btn btn-secondary">Reset</button>
        <a href="productList" class="btn btn-danger">Cancel</a>
    </form>
</div>
</body>
</html>
