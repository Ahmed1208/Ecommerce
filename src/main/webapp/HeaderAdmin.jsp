<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <style>
        /* Header Styles */
        .header {
            background-color: transparent;
            color: #333;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px; /* Adjust gap between buttons */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            flex-wrap: wrap; /* Allows wrapping of header items if necessary */
            box-sizing: border-box; /* Include padding and border in element’s total width and height */
        }

        .header a {
            color: #333;
            text-decoration: none;
            padding: 8px 16px;
            background-color: transparent;
            border: 1px solid #333;
            border-radius: 4px;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
            flex: 1 1 auto; /* Allow buttons to shrink and grow */
            white-space: nowrap; /* Prevent text wrapping */
        }

        .header a:hover {
            background-color: #333;
            color: #fff;
        }

        /* Logout Button */
        #logout-btn {
            padding: 8px 16px;
            background-color: #007bff; /* A distinct blue color for logout */
            border: 1px solid #0056b3; /* A darker blue border */
            border-radius: 4px;
            font-size: 16px;
            color: #fff; /* White text for contrast */
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
            display: inline-block;
            flex: 1 1 auto; /* Allow logout button to shrink and grow */
        }

        #logout-btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
            color: #fff; /* Keep text color white on hover */
        }

        /* Responsive Styles */
        @media (max-width: 1200px) {
            .header {
                padding: 10px 20px; /* Adjust padding */
            }

            .header a {
                font-size: 14px; /* Slightly smaller text for medium screens */
                padding: 7px 14px; /* Slightly smaller padding */
            }
        }

        @media (max-width: 992px) {
            .header {
                padding: 15px 20px; /* Adjust padding for better spacing */
            }

            .header a {
                font-size: 14px; /* Maintain font size */
                padding: 6px 12px; /* Further reduced padding */
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 15px 10px; /* Adjust padding for smaller screens */
            }

            .header a {
                font-size: 12px; /* Smaller text for small screens */
                padding: 5px 10px; /* Adjust padding */
                min-width: 80px; /* Ensure buttons are still usable */
            }

            #logout-btn {
                font-size: 12px; /* Smaller font size for logout button */
                padding: 5px 10px; /* Adjust padding */
            }
        }

        @media (max-width: 576px) {
            .header {
                padding: 15px 5px; /* Reduce padding for very small screens */
            }

            .header a {
                font-size: 10px; /* Smallest text for very small screens */
                padding: 4px 8px; /* Adjust padding */
                min-width: 70px; /* Ensure buttons are still usable */
            }

            #logout-btn {
                font-size: 10px; /* Smallest font size for logout button */
                padding: 4px 8px; /* Adjust padding */
            }
        }
    </style>
</head>
<body>
<header class="header">
    <a href="/ecommerce/adminInfo.jsp">Admin Information</a>
    <a href="/ecommerce/orders">Orders</a>
    <a href="/ecommerce/admin-products">Products</a>
    <a href="/ecommerce/users">Users</a>

    <!-- Logout Button with ID -->
    <a href="/ecommerce/logout" id="logout-btn" title="Logout">
        Logout
    </a>
</header>
</body>
</html>
