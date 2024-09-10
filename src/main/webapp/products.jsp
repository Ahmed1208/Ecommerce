
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery CDN -->

    <style>
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 16px;
            background-color: #fff;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .product-card:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .product-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .product-info {
            padding: 16px;
        }

        .product-name {
            font-size: 1.2em;
            margin: 0;
            color: #333;
        }

        .product-details {
            color: #666;
            font-size: 0.9em;
        }

        .product-meta {
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
        }

        .quantity, .price {
            font-size: 0.9em;
        }

        .add-to-cart-btn {
            display: block;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #0056b3;
        }
    </style>

    <script>
        function addToCart(productId, userId) {
            $.ajax({
                url: '/ecommerce/add-to-cart',  // The URL to handle the request
                type: 'POST',         // Type of the request (POST for adding data)
                data: {
                    id: productId,    // Product ID sent to the server
                    userId: userId    // User ID sent to the server
                },
                success: function(response) {
                    // Handle the response, such as updating the cart count or showing a message
                    alert('Product added to cart successfully!');
                },
                error: function(error) {
                    // Handle the error
                    console.log('Error adding product to cart:', error);
                }
            });
        }

    </script>
</head>

<body>


<c:if test="${not empty errorMessage}">
    <div>${requestScope.errorMessage}</div>
</c:if>


<c:if test="${not empty products}">

    <c:forEach var="product" items="${products}">
        <div class="product-card">
            <div class="product-image">
                <img src="${product.image}" alt="Product Image">
            </div>
            <div class="product-info">
                <h2 class="product-name">${product.productName}</h2>
                <p class="product-details">${product.description}</p>
                <div class="product-meta">
                    <div class="quantity">
                        <span>Quantity: ${product.quantity}</span>
                    </div>
                    <div class="price">
                        <span>${product.price}</span>
                    </div>
                </div>
            </div>
            <form>
                <button type="button" class="add-to-cart-btn" onclick="addToCart('${product.id}', '${sessionScope.user.id}')">Add to cart</button>
            </form>
        </div>
    </c:forEach>



</c:if>



</body>
</html>
