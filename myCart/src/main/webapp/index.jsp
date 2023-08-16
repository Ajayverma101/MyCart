<%@page import="helper.DescriptionHelper"%>
<%@page import="entities.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="entities.Product"%>
<%@page import="helper.factoryProvider"%>
<html>
<head>
	<title>MyCart - Home</title>
	<%@include file="Components/Common_Css_Js.jsp" %>
		
</head>

<body class="bg-color">
<%-- <jsp:include page="js/navbar.jsp"/> --%>
<%@include file="Components/navbar.jsp" %>
<div class="container-fluid">

	
		<div class="row mt-3">
		
			<%
				/*Fetching category  */
				String category = request.getParameter("category");
				/* out.println(category); */
			
	
				/* PRODUCTDAO OBJECT CREATED  */
				ProductDao pdao = new ProductDao(factoryProvider.getfactory());
				/* List<Product> list =pdao.getAllProducts(); */	
				 
				List<Product> list = null;
				if(category==null)
				{
					list = pdao.getAllProducts();			
				}
				else if(category.trim().equals("all"))
				{
					list = pdao.getAllProducts();			
				}
				else
				{
					int cid = Integer.parseInt(category.trim());
					list = pdao.getAllProductById(cid);  // HERE WE SEND INT AND WE RECIVE STRING VALUES FROM THE METHOD INTO DATABASE.
				}
				
				
				
				/* CATEGORYDAO OBJECT CREATED */
				CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
				List<Category> list2 = cdao.getCategories();	
				
			%>
		
		
	<!--SHOW CATEGORY  -->
			<div class="col-md-2">
			
				<div class="list-group">
					  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg" style="border-color:#6c5ce7;" aria-current="true">
					   	All Category 
					  </a>				
				<%
					for(Category cat : list2)
					{
						
				%>
						<a href="index.jsp?category=<%=cat.getCategoryID()%>" class="list-group-item list-group-item-action "><%=cat.getCategoryTitle()%></a>
						<!-- out.println(cat.getCategoryTitle()+"<br>");	 -->
				<%
					}
				%>
				</div>
			</div>
			
			
			
	<!--SHOW PRODUCTS  -->
			<div class="col-md-10">

			<!--ROW  -->
			<div class="row row-cols-1 row-cols-md-3 g-3">
			  
				<%
					for(Product p : list)
					{
				%>	
								<!--Product card  -->
			  <div class="col">
			    <div class="card product-card" style="height: 400px;">
			    
			    	<div  class="container text-center">
			    		<img src="img/<%=p.getpPhoto() %>" class="card-img-top m-2" style="max-height: 200px; max-width: 100%; width: auto;" alt="...">
			    	</div>	
			    		       
			      <div class="card-body">
			        <h5 class="card-title"><%=p.getpName() %></h5>
						<p class="card-text"><%=DescriptionHelper.getTenWords(p.getpDesc())%></p>  <!-- IN DescriptionHelper Class we Call method getTenWords.  -->
						<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
				 </div>
					<div class="card-footer text-center" style="width: 100%">
						<button class="btn btn-outline-success"> &#8377; <%=p.getPriceAfterApplyingtDiscount()%>/-  <span class="text-secondray discount-label" style="font-size: 12px; font-style: italic;">&#8377;<%=p.getpPrice() %>---</span><%=p.getpDiscount()%>%</button>
<!--HERE IS THE METHOD add_to_cart, IT METHOD WORK IN JAVASCRIPT TO ADD ITEMS INTO CART AND SHOWN  -->
						<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingtDiscount()%>)">Add to card</button>
					</div>
								    
				
			    </div>
			  </div>
	
				<%		
					}
					if(list.size()==0)
					{
						out.println("<h2>No items in this category.</h2>");
					}
				
				%>
			 			
			</div>
		</div>
		<!--PRODUCT ENDS  -->


</div>
</div>
 
 
 		
 
 		<%@include file="Components/Common_modals.jsp" %>
</body>
</html>
