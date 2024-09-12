
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Test pagination</title>
</head>
<body>


<!-- Display products -->
<ul>
    <c:forEach var="product" items="${products}">
        <li>${product.productName}</li>
    </c:forEach>
</ul>

<!-- Pagination controls -->
<div>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <span>${i}</span> <!-- Current page -->
            </c:when>
            <c:otherwise>
                <a href="all-products?pageNumber=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

</body>
</html>
