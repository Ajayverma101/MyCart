<%@page import="entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;	
	}
	else
	{
		if(user.getUserType().equals("admin"))
		{
			session.setAttribute("message", "You are not access this page.");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page - MyCart</title>
<%@include file="Components/Common_Css_Js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>
<h1>This is Normal User page.</h1>



<%@include file="Components/Common_modals.jsp" %>
</body>
</html>