<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.entity.User" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>User:Home</h1>
	<% 
        HttpSession sess = request.getSession();
        User user = (User) sess.getAttribute("user");
    %>

    <c:if test="${not empty user}">
        <h1>Name: <%= user.getName() %></h1>
        <h1>Email: <%= user.getEmail() %></h1>
    </c:if>
</body>
</html>