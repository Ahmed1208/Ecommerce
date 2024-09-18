
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Process Product</title>
</head>
<body>
<jsp:useBean id="productBean" class="org.example.entity.Product" scope="request"/>
<jsp:setProperty name="productBean" property="*"/>
<%
    // Get the current time in milliseconds
    long currentTime = System.currentTimeMillis();

    // Get the file name from the request
    String fileName = request.getParameter("file");
    if(fileName == null || fileName.isEmpty())
        fileName = "default.jpeg";

    // Construct the new value with the current time appended to the file name
    String imagePath = "uploads\\"  + fileName;
%>
<jsp:setProperty name="productBean" property="image" value="<%= imagePath %>" />
<%--<jsp:setProperty name="productBean" property="productName" value="${requestScope.getPart(\"productName\")}"/>--%>


<%--<c:if test="${not empty productBean}">--%>
<%--    <ul>--%>
<%--        <li>Product Name: <span>${productBean.productName}</span></li>--%>
<%--        <li>Product CategoryName: <span>${productBean.categoryName}</span></li>--%>
        <span>Product price: ${productBean.category.name}</span><br>
        <span>Product price:   ${productBean.price}</span>
        <span>Product price: <%= request.getParameter("file")%></span>

<%--        <li>Product quantity: <span>${productBean.quantity}</span></li>--%>

<%--    </ul>--%>
<%--</c:if>--%>

<%--<%--%>
<%--    // Prepare upload path--%>
<%--    String uploadPath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\webapps\\ecommerce\\uploads";--%>
<%--    File uploadDir = new File(uploadPath);--%>
<%--    if (!uploadDir.exists()) {--%>
<%--        uploadDir.mkdir();--%>
<%--    }--%>

<%--    // Get file part and process it--%>
<%--    Part filePart = request.getPart("image");--%>
<%--    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();--%>
<%--    File file = new File(uploadPath + File.separator + fileName);--%>
<%--    filePart.write(file.getAbsolutePath());--%>

<%--    System.out.println("uploaded suceefully");--%>
<%--%>--%>

<jsp:forward page="/add-product"/>

</body>
</html>
