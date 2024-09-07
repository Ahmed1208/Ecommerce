<%@ page import="java.time.LocalDate" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>submit</title>
</head>
<body>

    <jsp:useBean id="userDetailes" class="org.example.entity.User" scope="request"/>
    <jsp:setProperty name="userDetailes" property="*" />

    <jsp:useBean id="address" class="org.example.entity.Address" scope="request"/>
    <jsp:setProperty name="address" property="*" />
    <jsp:setProperty name="address" property="user" value="${requestScope.userDetailes}"/>
    <jsp:setProperty name="userDetailes" property="address" value="${requestScope.address}" />

<%--    <span>${userBean.id}</span>--%>

    <jsp:forward page="/update-user"/>

</body>
</html>
