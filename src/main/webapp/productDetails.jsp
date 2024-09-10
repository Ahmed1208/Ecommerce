
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link rel="stylesheet" href="css/productDetails.css">
</head>

<body>


    <c:if test="${not empty errorMessage}">
        <div>${requestScope.errorMessage}</div>
    </c:if>


    <c:if test="${not empty product}">

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
                <div>
                    <button type="button" onclick="addToCart()">Add to cart</button>
                </div>
            </form>
        </div>



    </c:if>



</body>
</html>
