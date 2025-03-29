package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user_name");
		String userEmail = req.getParameter("user_email");
		String userPassword = req.getParameter("user_password");
		
		User u = new User();
		u.setUserName(userName);
		u.setUserEmail(userEmail);
		u.setUserPassword(userPassword);
		
		UserOperations uo = new UserOperations();
		
		boolean isRegistered = uo.saveUser(u);
		if (isRegistered) {
			resp.sendRedirect("login.jsp");
		} else {
			resp.getWriter().println("Error- Registration could not complete.");
		}
		
	}
	
}
