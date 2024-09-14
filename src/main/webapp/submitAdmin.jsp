<%--
  Created by IntelliJ IDEA.
  User: yosse
  Date: 9/14/2024
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<jsp:useBean id="adminBean" class="org.example.entity.Admin" scope="request"/>
<jsp:setProperty name="adminBean" property="*" />
<jsp:forward page="/adminDashboard"/>

</body>
</html>
