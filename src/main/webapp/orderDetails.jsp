<%--
  Created by IntelliJ IDEA.
  User: Mohamed Ashraf
  Date: 9/12/2024
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Details</title>
    <style>
        .order-details {
            margin: 30px auto;
            max-width: 900px;
            background-color: #f8fdf4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .order-summary h2 {
            color: #67b168;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .order-info-card {
            background-color: #dff1e1;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #c9e8c9;
            margin-bottom: 20px;
        }

        .order-info-card p {
            margin: 5px 0;
            color: #333;
        }

        .product-list table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .product-list table th, .product-list table td {
            border: 1px solid #e2e2e2;
            padding: 10px;
            text-align: left;
        }

        .product-list img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .total-summary {
            background-color: #f1f8ed;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #cce0bb;
            text-align: right;
        }

        .total-summary p {
            margin: 5px 0;
            font-size: 18px;
        }

        .order-actions {
            text-align: center;
            margin-top: 20px;
        }

        .order-actions .btn-green, .order-actions .btn-orange {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .order-actions .btn-green {
            background-color: #67b168;
            margin-right: 10px;
        }

        .order-actions .btn-orange {
            background-color: #f68b1f;
        }

        .order-actions .btn-green:hover, .order-actions .btn-orange:hover {
            opacity: 0.9;
        }

    </style>
</head>
<body>

<section class="order-details">
    <div class="order-summary">
        <h2>Order Details</h2>
        <div class="order-info-card">
            <p><strong>Order ID:</strong> #${requestScope.order.id}</p>
            <p><strong>Date:</strong> ${requestScope.order.orderDate}</p>
            <p><strong>Total Price:</strong> ${requestScope.order.totalPrice}</p>
            <p><strong>Status:</strong> ${requestScope.order.status}</p>
            <p><strong>Payment Method:</strong> ${requestScope.order.paymentType}</p>

        </div>
    </div>

    <div class="product-list">
        <table>
            <thead>
            <tr>
                <th>Product</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${requestScope.products}">
            <tr>
                <td><img src="${item.product.image}" alt="Product Image"> </td>
                <td>${item.product.productName}</td>
                <td>${item.productQuantity}</td>
                <td>$${item.productPrice}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="total-summary">
        <p><strong>Subtotal:</strong> $${requestScope.order.totalPrice}</p>
        <p><strong>Tax:</strong> $0.00</p>
        <p><strong>Total:</strong> $${requestScope.order.totalPrice}</p>
    </div>

    <div class="order-actions">
        <c:if test="${requestScope.order.status == 'PENDING'}">
            <c:if test="${not empty sessionScope.admin}">
                <button class="btn-green" onclick="window.location.href='/ecommerce/orderDetails?action=approve&orderid=${order.id}'">Ship Order</button>

            </c:if>

            <button class="btn-orange" onclick="window.location.href='/ecommerce/orderDetails?action=cancel&orderid=${order.id}'">Cancel Order</button>
        </c:if>
    </div>

</section>

</body>
</html>
