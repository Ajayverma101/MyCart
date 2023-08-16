package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.Session;
import entities.User;
import helper.factoryProvider;




public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			
			String uName = request.getParameter("username");
			String uEmail = request.getParameter("useremail");
			String uPassword = request.getParameter("userpassword");
			String uPhone = request.getParameter("userphone");
			String uAddress = request.getParameter("useraddress");
			
			// validations
			
			if(uName.isEmpty()) {
				writer.println("Name is Blank, please try again !!");
				return;
			}
			
			// creating user object to store data
			
			User user = new User(uName, uEmail, uPassword, uPhone, "default.jpg", uAddress, "normal");
			
			Session hbmsession = factoryProvider.getfactory().openSession();
			Transaction tx =  hbmsession.beginTransaction();
			
			int userid = (int) hbmsession.save(user);
			
			
			tx.commit();
			hbmsession.close();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successfull. User id is :- "+userid);
			
//			writer.println("Successfully saved");
//			writer.println("<br> User id is : "+userid);
			response.sendRedirect("register.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Please Use Another Email id !!");
			response.sendRedirect("register.jsp");
		}
		
		
	}

}
