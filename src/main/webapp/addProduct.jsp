<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h1>Add New Product</h1>
<form method="post" action="/ecommerce/submitProduct.jsp">
    <label for="productName">Product Name:</label>
    <input type="text" id="productName" name="productName" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description"></textarea><br>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" required><br>

    <label for="price">Price:</label>
    <input type="number" step="0.01" id="price" name="price" required><br>

 <label for="image">Image:</label>
  <input type="file" id="image" name="image" accept="image/*"><br>

    <label for="category">Category:</label>
    <select id="category" name="categoryName" required>
        <c:forEach var="category" items="${subCategories}">
            <option value="${category.name}">${category.name}</option>
        </c:forEach>
    </select><br>

    <button type="submit">Submit</button>
</form>
</body>
</html>
