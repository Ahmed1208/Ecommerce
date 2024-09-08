<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
    <style>
        .category-button {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
        }
        .category-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Add New Category</h1>

    <h3>Select Parent Category:</h3>
    <div>
        <input type="radio" id="none" name="parentCategory" value="">
        <label for="none">None</label><br>

        <c:forEach var="category" items="${ParentCategories}">
            <input type="radio" id="${category.id}" name="parentCategory" value="${category.id}">
            <label for="${category.id}">
                <button type="button" class="category-button">${category.name}</button>
            </label><br>
        </c:forEach>

</body>
</html>
