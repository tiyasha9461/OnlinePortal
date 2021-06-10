

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


 public class action extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter p = response.getWriter();
		String s1 = request.getParameter("user");
		String s2 = request.getParameter("pass");
		String s3 = request.getParameter("cpass");
		if(s1.equals("admin") && s2.equals("admin123"))
		{
		 if(s2.equals(s3))
		 {
			HttpSession session = request.getSession();
			session.setAttribute("username",s1);
			session.setAttribute("pwd",s2);
			response.sendRedirect("action.html");
		 }
		 else
		 {
			 p.println("Password and confirm password do not match");
			 p.println("<a href='adminsign.html'>Go to home page</a>");
			 
		 }		 
		}
		else
		{
		   p.println("Username or/and Password is Incorrect");
		   p.println("<a href='adminsign.html'>Go to home page</a>");			 
		}	
	}  	
		  	    
}