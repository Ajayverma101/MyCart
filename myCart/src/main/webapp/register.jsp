<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
	<%@include file="Components/Common_Css_Js.jsp" %>
</head>
<body class="bg-color">
<%@include file="Components/navbar.jsp" %>
	
	<div class="container-fluid bg-color">
		<div class="row mt-1">
		<div class="col-md-5 offset-md-4">
					
	<%@include file="Components/message.jsp" %>
	
			<div class="card mt-1">
			
			<div class="card-header custom-bg">
				<div class="container text-center text-white">
				<img alt="Error" src="img/signup1.png" style="max-width:100px">
				<!-- <h4 class="text-center my-2">Sign up here !!</h4> -->
			</div>			
			</div>
			
			
		<div class="card-body px-4">
		<form action="RegisterServlet" method="post">
			
				
			  <div class="mb-3">
			    <label for="name" class="form-label">User Name</label>
			    <input name="username" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">   
			  </div>
			  
			  <div class="mb-3">
			    <label for="email" class="form-label">User Email</label>
			    <input name="useremail" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">   
			  </div>
			  
			  <div class="mb-3">
			    <label for="password" class="form-label">User Password</label>
			    <input name="userpassword" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">   
			  </div>
			  
			  <div class="mb-3">
			    <label for="phone" class="form-label">User Phone</label>
			    <input name="userphone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone">   
			  </div>
			  
			  <div class="mb-3">
			    <label for=address class="form-label">User Address</label>
			    <textarea name="useraddress" style="height:120px" class="form-control" placeholder="Enter Your Address " ></textarea>   
			  </div>
			  
			  <div class="container text-center">
			   	<button type="submit" class="btn custom-bg text-white">Register</button>
			   	<button type="reset" class="btn custom-bg text-white">Reset</button>
			  </div>
			  
			  </form>
			</div>
			
			</div>
			
		</div>
	</div>
	
	</div>


<%@include file="Components/Common_modals.jsp" %>
</body>
</html>