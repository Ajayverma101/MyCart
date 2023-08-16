package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import dao.UserDao;
import entities.User;
import helper.factoryProvider;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Coding Area
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		String userEmail = request.getParameter("useremail");
		String userPassword = request.getParameter("userpassword");
				
				
		// Validation
				
		//  Authenticating User
		 UserDao userdao = new UserDao(factoryProvider.getfactory());
		 
// IMPORTANT LINE OF THIS PROJECT [TO CHECK USER IN PRESENFT IN THE DATABASE OR NOT]		 
		 User user = userdao.getUserbyEmailAndPassword(userEmail, userPassword);
		
		 HttpSession httpSession = request.getSession();

		 
		 if(user == null) {
			 writer.println("<h3>  Invalid Details !! </h3>");
			 httpSession.setAttribute("message", "Invalid Details !!");
			 response.sendRedirect("login.jsp");
			 return;
		 }
		 else {
			 writer.println("<h3> Welcome "+user.getUserName()+"</h3>");	

		}
		 
		 
		// login User [Save details of user]
		httpSession.setAttribute("current-user",user);
		 
		// Admin - admin.jsp
		if(user.getUserType().equals("admin")) 
		{
			response.sendRedirect("admin.jsp");
		}

		// Normal - normal.jsp
		else if (user.getUserType().equals("normal")) 
		{
			response.sendRedirect("normal.jsp");
		}
		else 
		{
			writer.println("We have not identified user type !!");
		}
		
		

		 
	}

}
