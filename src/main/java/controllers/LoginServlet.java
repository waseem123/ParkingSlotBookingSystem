package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail = req.getParameter("user_email");
		String userPassword = req.getParameter("user_password");

		UserOperations uo = new UserOperations();
		User u = uo.loginUser(userEmail, userPassword);
		if (u != null) {

			HttpSession session = req.getSession();
			switch (u.getUserType()) {
				case 1:
					session.setAttribute("userId", u.getUserId());
					session.setAttribute("username", u.getUserName());
					session.setAttribute("useremail", u.getUserEmail());
					session.setAttribute("usertype", u.getUserType());
					resp.sendRedirect("admin-index.jsp");
					break;
				case 2:
					session.setAttribute("userId", u.getUserId());
					session.setAttribute("username", u.getUserName());
					session.setAttribute("useremail", u.getUserEmail());
					session.setAttribute("usertype", u.getUserType());
					resp.sendRedirect("index.jsp");
					break;
			}
		}
	}

}
