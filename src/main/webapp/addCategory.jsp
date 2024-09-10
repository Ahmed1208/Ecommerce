<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
<h1>Add New Category</h1>
<form method="post" action="/ecommerce/submitCategory.jsp">
    <label for="categoryName">Category Name:</label>
    <input type="text" id="categoryName" name="name" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description"></textarea><br>

    <label for="parentCategory">Parent Category:</label>
    <select id="parentCategory" name="parentCategory">
        <option value="">None</option>
        <c:forEach var="category" items="${ParentCategories}">
            <option value="${category.name}">${category.name}</option>
        </c:forEach>
    </select><br>

    <button type="submit">Submit</button>
</form>
</body>
</html>
