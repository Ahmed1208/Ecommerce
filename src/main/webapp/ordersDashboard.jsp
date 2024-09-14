<%--
  Created by IntelliJ IDEA.
  User: yosse
  Date: 9/14/2024
  Time: 3:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
</head>


<%--<jsp:include page="/orders"/>--%>

<table border="1" style="width:100%; text-align:left; border-collapse:collapse;">
    <thead>
    <tr>
        <th>OrderId</th>
        <th>Payment Type</th>
        <th>Total Price</th>
        <th>UserId</th>
    </tr>
    </thead>


    <tbody>
    <c:forEach var="order" items="${requestScope.orders}">

    <tr>
        <td>${order.id}</td>
        <td>${order.paymentType}</td>
        <td>${order.totalPrice}</td>
        <td>${order.user.id}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>


<div>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a id=currPage class="active rounded">${i}</a> <!-- Current page -->
                </c:when>
                <c:otherwise>
                    <a href="?pageNumber=${i}" class="rounded">${i}</a>
                </c:otherwise>

            </c:choose>
        </c:forEach>
</div>



</body>
</html>
