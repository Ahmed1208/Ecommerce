

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>submit</title>
</head>
<body>

    <jsp:useBean id="userBean" class="org.example.entity.User" scope="request"/>
    <jsp:setProperty name="userBean" property="*" />

<%--    <span>${userBean.id}</span>--%>

    <jsp:forward page="/update-user"/>

</body>
</html>
