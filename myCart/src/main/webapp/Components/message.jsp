<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String msg = (String) session.getAttribute("message");

	if(msg!=null)
	{
		// Print msg
		// out.println(msg);
%>		
		
	<div class="alert alert-success alert-dismissible fade show" role="alert">
	  <strong><%=msg %></strong> 
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
		
<%		
		session.removeAttribute("message");
	}

%>
</body>
</html>