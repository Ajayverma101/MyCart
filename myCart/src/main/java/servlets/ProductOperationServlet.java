package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.ha.backend.Sender;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;
import helper.factoryProvider;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();

		// Add category
		// Add product

		// Fetching category data

		String operation = request.getParameter("operation");

		if (operation.trim().equals("addcategory")) 
		{
			// Add Category  [fetching category data]
			
			String title = request.getParameter("catTitle"); 
			String description = request.getParameter("catDescription");
			
			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			  
			// Category database save.
			CategoryDao categoryDao = new CategoryDao(factoryProvider.getfactory());
			
			int catId =  categoryDao.saveCategory(category);
			
			HttpSession httpSession =  request.getSession();
			
			httpSession.setAttribute("message", "Category added successfully :"+catId);
			response.sendRedirect("admin.jsp");
			return;
			  
		} else if (operation.trim().equals("addproduct")) {
			// Add product
			
			String pName = request.getParameter("pName");
			String pDesc= request.getParameter("pDesc");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int pCatid = Integer.parseInt(request.getParameter("pCatid"));
			Part part = request.getPart("pPhoto");
			
			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
			
			// get category by id
			CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
			Category category = cdao.getCategoryById(pCatid);
			 
			p.setCategory(category);
			
			// product save
			
			ProductDao pdao = new ProductDao(factoryProvider.getfactory());
			pdao.saveProduct(p);
			
			
			HttpSession httpSession =  request.getSession();
			httpSession.setAttribute("message", "Product added successfully :"+pCatid);
			response.sendRedirect("admin.jsp");
			return;
			
		}

		
		
		 

	}

}
