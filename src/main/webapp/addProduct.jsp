<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="styles.css">
    <script src="script.js" defer></script>
</head>
<body>
<div class="container">
    <h1>Add New Product</h1>

    <!-- Product Form -->
    <form id="firstForm" method="post" action="/ecommerce/submitProduct.jsp" class="form" >
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" name="price" required>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <c:forEach var="category" items="${subCategories}">
                    <option value="${category.name}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Hidden file input from the second form will be copied here via JavaScript -->
        <div class="form-group" id="fileContainer">
        </div>

        <button type="submit" class="btn">Submit</button>
    </form>

    <hr>

    <!-- Upload Form -->
    <form id="uploadForm" enctype="multipart/form-data" class="form">
        <div class="form-group">
            <label for="fileInput">Image:</label>
            <input type="file" name="file" id="fileInput">
        </div>
    </form>


    <!-- Spinner -->
    <div id="spinner" class="spinner hidden"></div>

    <!-- Message -->
    <div id="message" class="hidden">Uploaded!</div>
</div>
</body>
</html>
