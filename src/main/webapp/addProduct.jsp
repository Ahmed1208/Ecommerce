<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }

        h1 {
            color: #4CAF50;
            text-align: center;
        }

        /* Form Styles */
        .form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            max-width: 600px;
            margin: 0 auto; /* Center the form */
            width: 100%; /* Make the form take full width */
            box-sizing: border-box;
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

        input[type="text"], input[type="number"], select, textarea {
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
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Spinner Styles */
        .spinner {
            display: none;
            border: 4px solid #f3f3f3;
            border-radius: 50%;
            border-top: 4px solid #4CAF50;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
            margin-left: 10px;
        }

        /* Keyframes for spinner animation */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Message Styles */
        .message {
            display: none;
            color: green;
            font-size: 16px;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #4CAF50;
            background-color: #e8f5e9;
            border-radius: 4px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        /* Message transition effect */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Divider */
        hr {
            border: 1px solid #ddd;
            margin: 20px 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                margin: 10px;
            }

            .form {
                padding: 15px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                max-width: 100%; /* Take up full width on medium screens */
            }

            button {
                padding: 8px 16px;
                font-size: 14px;
            }

            input[type="text"], input[type="number"], select, textarea {
                padding: 8px;
                font-size: 14px;
            }

            h1 {
                font-size: 24px;
            }
        }

        @media (max-width: 576px) {
            body {
                margin: 5px;
            }

            .form {
                padding: 10px;
                max-width: 100%; /* Take up full width on small screens */
            }

            button {
                padding: 6px 12px;
                font-size: 12px;
            }

            input[type="text"], input[type="number"], select, textarea {
                padding: 6px;
                font-size: 12px;
            }

            h1 {
                font-size: 20px;
            }
        }

    </style>
    <script src="script.js" defer></script>
</head>
<body>

<jsp:include page="notification.jsp"/>

<div class="container">
    <h1>Add New Product</h1>

    <!-- Upload Form -->
    <form id="uploadForm" enctype="multipart/form-data" class="form">
        <div class="form-group">
            <label for="fileInput">Image:</label>
            <input type="file" name="file" id="fileInput">
        </div>
    </form>

    <!-- Product Form -->
    <form id="firstForm" method="post" action="/ecommerce/submitProduct.jsp" class="form">
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
        <div class="form-group" id="fileContainer"></div>

        <button type="submit" class="btn">Submit</button>
    </form>

    <!-- Spinner -->
    <div id="spinner" class="spinner"></div>

    <!-- Message -->
    <div id="message" class="message">Uploaded!</div>
</div>

<script>
    document.getElementById('fileInput').addEventListener('change', function() {
        const spinner = document.getElementById('spinner');
        const message = document.getElementById('message');

        // Show the spinner
        spinner.style.display = 'inline-block';

        // Simulate file upload process
        setTimeout(() => {
            // Hide the spinner after uploading
            spinner.style.display = 'none';

            // Show the success message
            message.style.display = 'block';
        }, 2000); // Simulating a 2-second delay for file upload
    });
    document.getElementById('firstForm').addEventListener('submit', function(event) {
        // Get the values from the inputs
        var quantity = document.getElementById('quantity').value;
        var price = document.getElementById('price').value;

        // Check if either value is negative
        if (quantity < 0 || price < 0) {
            // Prevent form submission
            event.preventDefault();
            // Display alert
            alert('Quantity and Price must be non-negative numbers.');

        }
    });
</script>

</body>
</html>
