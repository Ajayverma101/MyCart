<!-- Check the condtion The User is Login or not [if user not login so can't access this page] -->

<%
	/*Here we check only user is login or not  */
	User user = (User) session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message", "You are not logged in !! Login first to access checkout page.");
		response.sendRedirect("login.jsp");
		return;	
	}
	else
	{
		
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckOut</title>
	<%@include file="Components/Common_Css_Js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>
	<!-- <h1>WELCOME</h1> -->
	
	<div class="container">
		<div class="row ">
			<div class="col-md-7 mt-4">
				<!--Card Details  -->
				<div class="card border-dark mb-3 checkout-body">
					<h2 class="text-center">YOUR SELECTED ITEMS</h2>
					<hr>
					<div class="card-body">
						<div class="cart-body "> 
						<!--This is comes from Script.js 129 line no. [$(".cart-body").html(table)] Here we write {JS ko jha bhi cart-body class mile table ka data yha daal do}  -->
						</div>
					</div>
				</div>
			</div>
		
			
			<div class="col-md-5 mt-4">
				<!--Form Details  -->
				<div class="card border-dark mb-3 checkout-body">
					<h4 class="text-center">YOUR DETAILS FOR ORDER</h4>
					<hr>
					
					<form action="#!">
					  <div class="mb-3 px-5">
					    <label for="email" class="form-label">Email address</label>
					    <input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="email" aria-describedby="emailHelp" style="width: 450px" placeholder="Enter Address">
					  </div>
					  
					   <div class="mb-3 px-5">
					    <label for="name" class="form-label">Enter Name</label>
					    <input value="<%=user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" style="width: 450px" placeholder="Enter Name">
					  </div>
					  
					  <div class="mb-3 px-5">
					    <label for="phone" class="form-label">Enter Mobile </label>
					    <input value="<%=user.getUserPhone() %>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" style="width: 450px" placeholder="Enter Mobile">
					  </div>
					  
						<div class="mb-3 px-5">
							<label for="address" class="form-label">Enter Shipping Address</label>
							<textarea value="<%=user.getUserAddress() %>" name="address" id="address" style="height:150px" type="text-area" class="form-control" placeholder="Enter Address" required="required"></textarea>
						</div>

					  <div class="mb-3 container text-center ">
					  	<button  type="submit" class="btn btn-outline-success ">Order now</button>
					  	<button type="button" class="btn btn-outline-primary" onclick="continueShopping()">Continue Shopping</button>
					  </div>
					  					  
					</form>
					
					
				</div>
			
			</div>
		</div>
	
	</div>
	
	
	
	
	
<%@include file="Components/Common_modals.jsp" %>
</body>
</html>