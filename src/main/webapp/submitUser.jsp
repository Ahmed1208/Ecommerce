<%@ page import="java.time.LocalDate" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>submit</title>
</head>
<body>

    <jsp:useBean id="userBean" class="org.example.entity.User" scope="request"/>
    <jsp:setProperty name="userBean" property="*" />

    <%
        // Manually handle the password field
        String date = request.getParameter("dateOfBirth");
        if (date != null && !date.isEmpty()) {
            userBean.setDateOfBirth(LocalDate.parse(date));
        }
    %>

<%--    <span>${userBean.id}</span>--%>

    <jsp:forward page="/update-user"/>

</body>
</html>
