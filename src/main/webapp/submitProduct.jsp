<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Process Product</title>
</head>
<body>
<jsp:useBean id="productBean" class="org.example.entity.Product" scope="request"/>
<jsp:setProperty name="productBean" property="*"/>

<%--<c:if test="${not empty productBean}">--%>
<%--    <ul>--%>
<%--        <li>Product Name: <span>${productBean.productName}</span></li>--%>
<%--        <li>Product CategoryName: <span>${productBean.categoryName}</span></li>--%>
<%--        <li>Product price: <span>${productBean.price}</span></li>--%>
<%--        <li>Product quantity: <span>${productBean.quantity}</span></li>--%>

<%--    </ul>--%>
<%--</c:if>--%>

<jsp:forward page="/add-product"/>

</body>
</html>
