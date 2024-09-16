<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }

        h1 {
            text-align: center; /* Centers the text horizontally */
            margin-top: 20px; /* Optionally add margin to give space above the heading */
            color: #4CAF50;
        }

        /* Form Styles */
        .form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            max-width: 600px; /* Limit the width of the form */
            margin: 0 auto; /* Center the form on the page */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
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

        /* Responsive Styles */
        @media (max-width: 768px) {
            body {
                margin: 10px;
            }

            input[type="text"], select, textarea {
                padding: 8px;
                font-size: 14px;
            }

            button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }

        @media (max-width: 576px) {
            body {
                margin: 5px;
            }

            input[type="text"], select, textarea {
                padding: 6px;
                font-size: 12px;
            }

            button {
                padding: 6px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add New Category</h1>

    <!-- Category Form -->
    <form method="post" action="/ecommerce/submitCategory.jsp" class="form">
        <div class="form-group">
            <label for="categoryName">Category Name:</label>
            <input type="text" id="categoryName" name="name" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>
        </div>

        <div class="form-group">
            <label for="parentCategory">Parent Category:</label>
            <select id="parentCategory" name="parentCategory">
                <option value="">None</option>
                <c:forEach var="category" items="${ParentCategories}">
                    <option value="${category.name}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
