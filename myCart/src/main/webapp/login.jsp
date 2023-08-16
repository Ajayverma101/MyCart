<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login - MyCart</title>
	<%@include file="Components/Common_Css_Js.jsp" %>
</head>
<body class="bg-color">
<%@include file="Components/navbar.jsp" %>

	<div class="bg-color">

	<div class="container-fluid ">
		<div class="row mt-1">
			<div class="col-md-5 offset-md-4">
			
				
				<div class="card mt-1">
					<div class="card-header text-center custom-bg text-white">
					<img alt="Error" src="img/login.png" style="max-width:100px">
				<!-- 		<h3>Login here</h3>	 -->				
					</div>
<%@include file="Components/message.jsp" %>

		<div class="card-body px-4">
		<form action="loginServlet" method="post">

			  
			  <div class="mb-3">
			    <label for="email" class="form-label">User Email</label>
			    <input name="useremail" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">   
			  </div>
			  
			  <div class="mb-3">
			    <label for="password" class="form-label">User Password</label>
			    <input name="userpassword" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">   
			  </div>
			  
			  
			  <div class="container text-center">
			  <a href="register.jsp" style="text-decoration: none; ">if not register please click here</a><br><br>
			   	<button type="submit" class="btn custom-bg text-white">Login</button>
			   	<button type="reset" class="btn custom-bg text-white">Reset</button>
			  </div>
			  
		  </form>
		</div>



					<!-- <div class="card-footer">
					</div> -->
				
				</div>
			
			</div>
		</div>
	</div>

</div>



<%@include file="Components/Common_modals.jsp" %>
</body>
</html>