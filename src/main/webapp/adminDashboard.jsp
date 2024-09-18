<%@ include file="HeaderAdmin.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Header styles */
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .header ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        .header ul li {
            margin: 0 15px;
        }

        .header ul li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-weight: 500;
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .header ul li a:hover,
        .header ul li a.active {
            background-color: #45a049;
            color: white;
            text-decoration: none;
        }

        /* Content section styles */
        .content {
            margin-top: 70px; /* To accommodate the fixed header */
            padding: 30px;
            background-color: #ffffff;
            min-height: calc(100vh - 70px);
        }
    </style>

    <!-- Include jQuery for AJAX functionality -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        // Function to load the content dynamically
        function loadSection(url) {
            $.ajax({
                url: url,
                method: 'GET',
                success: function(data) {
                    // Insert the returned HTML content into the content div
                    $('.content').html(data);
                },
                error: function() {
                    alert("Failed to load content. Please try again.");
                }
            });
        }

        // On document ready, load the default admin info section
        $(document).ready(function() {
            loadSection('/ecommerce/adminInfo.jsp'); // Load admin info by default
        });

        // Event listeners for the navigation links
        $(document).on('click', '.header a', function(e) {
            e.preventDefault();
            const url = $(this).attr('href');
            loadSection(url);
            // Update the active class
            $('.header a').removeClass('active');
            $(this).addClass('active');
        });
    </script>
</head>
<body>

<!-- Header -->
<header class="header">
    <ul>
        <li><a href="/ecommerce/adminInfo.jsp">Admin Information</a></li>
        <li><a href="/ecommerce/orders">Orders</a></li>
        <li><a href="/ecommerce/admin-products">Products</a></li>
        <li><a href="/ecommerce/users">Users</a></li>
    </ul>
</header>

<!-- Content Section -->
<div class="content">
    <!-- Content from AJAX requests will be loaded here -->
</div>

</body>
</html>
