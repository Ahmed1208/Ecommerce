<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Process Product</title>
</head>
<body>
<jsp:useBean id="categoryBean" class="org.example.entity.Category" scope="request"/>
<jsp:setProperty name="categoryBean" property="*"/>

<jsp:forward page="/add-category"/>

</body>
</html>
