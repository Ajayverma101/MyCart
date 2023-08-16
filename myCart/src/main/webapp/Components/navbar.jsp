<%@page import="entities.User"%>
<%-- <%@include file="Common_modals.jsp" %> --%>
<%
	User user1 = (User) session.getAttribute("current-user");
	
	
%>




<nav class="navbar navbar-expand-lg bg-body-tertiary custom-bg navbar-dark ">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">MyCart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
<!--        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> -->
      </ul>
     <!--  <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
      
      <ul class="navbar-nav ml-auto">
      
      		<li class="nav-item">
      		<!--WHEN WE CLICK ON IT THEN A MODAL OPEN NOT LINK  -->
       	   		<a class="nav-link" style="color:white;" href="#!" data-bs-toggle="modal" data-bs-target="#cart"><i class="fa fa-cart-plus" style="font-size:20px"></i>  <span class="cart-items">(0)</span>  </a>
        	</li>	
      
      
      	<%
      		if(user1==null)
      		{	
      	%>		
      	      		
      	<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
        </li>
      		
      		
      	<%		
      		}
      		else
      		{	
      	%>		
      			
			      	<li class="nav-item mx-3">
			          <a class="nav-link active" aria-current="page" style="font-weight: bold;" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>">User-<%=user1.getUserName()%> </a>
			        </li>
        
      		
      			 <li class="nav-item">
          			<a class="nav-link active" aria-current="page" href="logoutServlet">Logout</a>
        		</li>	
      	<%		
      		}
      		
      	%>
      	
      
      	
      </ul>
      
    </div>
  </div>
</nav>