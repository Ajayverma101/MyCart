<%@page import="java.util.Map"%>
<%@page import="helper.UserProductSize"%>
<%@page import="entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.factoryProvider"%>
<%@page import="dao.CategoryDao"%>
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
		if(user.getUserType().equals("normal"))
		{
			session.setAttribute("message", "You are not admin ! Do not access this page.");
			response.sendRedirect("login.jsp");
			return;
		}
	}
	
%>


<%
    	CategoryDao cdao= new CategoryDao(factoryProvider.getfactory());
		List<Category> list = cdao.getCategories();
		List<Category> listSize = cdao.getCategories();
		
	//	Getting User / Product Count
	
		Map<String,Long> map =  UserProductSize.getCount(factoryProvider.getfactory());
		
			        			
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page - MyCart</title>
<%@include file="Components/Common_Css_Js.jsp" %>
<!-- <link href="css/Style.css" rel="stylesheet"> -->
</head>
<body>
<%@include file="Components/navbar.jsp" %>


	<div class="container admin">
	
	<div class="container mt-3">
		<%@include file="Components/message.jsp" %>
	</div>
	
	<!--First row start  -->
		<div class="row mt-3">
			
	<!-- First box -->
			<div class="col-md-4">
				<div class="card ">
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 100px" class="img-fluid" alt="Error" src="img/man.png">
						</div>
						
						<h3 class="mt-3"><%= map.get("userCount") %></h3>
						<h1 class="text-uppercase text-muted">Users</h1>				
					</div>
				</div>
			</div>
		
	<!-- Second box -->
			<div class="col-md-4">
			<div class="card">
					<div class="card-body text-center">
					
						<div class="container">
							<img style="max-width: 100px" class="img-fluid" alt="Error" src="img/list.png">
						</div>
					
						<h3 class="mt-3"><%=listSize.size() %></h3>
						<h1 class="text-uppercase text-muted">Categories</h1>				
					</div>
				</div>
			</div>
		
	<!-- Third box -->
			<div class="col-md-4">
			<div class="card">
					<div class="card-body text-center">
					
						<div class="container">
							<img style="max-width: 100px" class="img-fluid" alt="Error" src="img/product.png">
						</div>
					
						<h3 class="mt-3"><%= map.get("productCount") %></h3>
						<h1 class="text-uppercase text-muted">Products</h1>				
					</div>
				</div>
				</div>
		<!--First Row End  -->				
		</div>		
		
		
		
	<!--Second row start  -->			
	<div class="row mt-4">	
	<!-- First box -->
			<div class="col-md-6"> 
				<div class="card " data-bs-toggle="modal" data-bs-target="#add-category-modal">   <!--BOOTSTRAP CLASSES  -->
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 100px" class="img-fluid" alt="Error" src="img/button.png">
						</div>
						
						<p class="mt-3">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Categoey</h1>				
					</div>
				</div>
			</div>
		
	<!-- Second box -->
			<div class="col-md-6">
			<div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">   <!--BOOTSTRAP CLASSES  -->
					<div class="card-body text-center">
					
						<div class="container">
							<img style="max-width: 100px" class="img-fluid" alt="Error" src="img/plus.png">
						</div>
					
						<p class="mt-3">Click here to add new products</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>				
					</div>
				</div>
			</div>
	<!--Second Row End  -->
	</div>
		
		
		
	<!-- Conatiner End  -->	
	</div>
	
	
	
	<!--Add Category model -->
	
		 
			<!-- Button trigger modal -->
		<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category-modal">
			  Launch demo modal
			</button> 
		--> 
	
				
				
				
<!-- Add category Modal [IT IS THE BOOTSTRAP MODAL]-->
			<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header custom-bg text-white">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill category details</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        
			        	<form action="ProductOperationServlet" method="post">
			        		
			        		<input type="hidden" name="operation" value="addcategory">
			        		
			        		<div class="form-group">  <!--BOOTSTRAP CLASSES  -->
			        			<input name="catTitle" type="text" class="form-control" placeholder="Enter category title" required="required"> 
			        		</div>
			        		
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<textarea name="catDescription" style="height:150px" type="text-area" class="form-control" placeholder="Enter category description" required="required"></textarea> 
			        		</div>
			        		
			        		<div class="container text-center">
			        			<button class="btn btn-outline-success mt-2 ">Add Category</button>
			        			<button type="button" class="btn btn-outline-secondary mt-2 mx-2" data-bs-dismiss="modal">Close</button>
			        		</div>
			        		
			        	</form>
			        	
			      </div>
			    </div>
			  </div>
			</div>
	<!--End Category model  -->
	
	
	
	
	<!-- Add Product Modal [IT IS THE BOOTSTRAP MODAL]-->
			<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header custom-bg text-white">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill product details</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       
			       
			        	<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
			        
			        		<input type="hidden" name="operation" value="addproduct">
			        	
			        		<div class="form-group">   <!--BootStrap Classes  -->
			        			<input name="pName" type="text" class="form-control" placeholder="Enter Product Name" required="required"> 
			        		</div>
			        		
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<textarea name="pDesc" style="height:150px" type="text-area" class="form-control" placeholder="Enter Product Description" required="required"></textarea> 
			        		</div>
			        				        		
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<input name="pPrice" type="number" class="form-control" placeholder="Enter Product Price" required="required" /> 
			        		</div>
			        		
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<input name="pDiscount" type="number" class="form-control" placeholder="Enter Product Discount" required="required" /> 
			        		</div>
			        		
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<input name="pQuantity" type="number" class="form-control" placeholder="Enter Product Quantity" required="required" /> 
			        		</div>
			        		        		
			        		
						<!--GET CATEGORIES FROM DATABASE  -->
			        		
			        		<!--ISKO UPAR LIKH DIYA HAI BCZ CATEGORY @ JAGAH CHAIYE HMEE  -->
			        		
			        		<%-- <%
			        			CategoryDao cdao= new CategoryDao(factoryProvider.getfactory());
			        			List<Category> list = cdao.getCategories();
			        			
			        		%> --%>
			        		
			        		
			        		
			           		<div class="form-group mt-3"> 
				        		<select  name="pCatid" class="form-select" aria-label="Default select example">
								  <option selected>Select Product Category</option>
									
								<%
									for(Category c : list)
									{		
								%>				
								  <option value="<%=c.getCategoryID()%>"><%=c.getCategoryTitle() %></option>
								<%
									}
								%>
								</select>
			        		</div>
			        	
			        			
			        			
			        		<div class="form-group mt-3">   <!--BootStrap Classes  -->
			        			<label for="pPic" class="mb-1 mx-2">Select product photo</label>
			        			<input name="pPhoto" type="file" id="pPic" class="form-control" required="required" /> 
			        		</div>
			        		
			        		
			        		<!-- <div class="form-group mt-3">   BootStrap Classes 
			        			<input name="pCategory" type="text" class="form-control" placeholder="Enter Product Category" required="required" /> 
			        		</div> -->
			        		
			        		<div class="container text-center">
			        			<button class="btn btn-outline-success mt-2 ">Add Product</button>
			        			<button type="button" class="btn btn-outline-secondary mt-2 mx-2" data-bs-dismiss="modal">Close</button>
			        		</div>
			        		
			        	</form>
			        	
			      </div>
			    </div>
			  </div>
			</div>
	<!--End Product model  -->
	



<%@include file="Components/Common_modals.jsp" %>
</body>
</html>