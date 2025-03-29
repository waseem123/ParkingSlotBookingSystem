package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Booking;
import models.User;

public class UserOperations {
	public boolean saveUser(User user) {
		try {
			Connection conn = DatabaseConnection.getConnection();
			String insertQuery = "INSERT INTO users (username,email,password,usertype) VALUES (?, ?, ?, 2)";
			PreparedStatement stmt = conn.prepareStatement(insertQuery);
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getUserEmail());
			stmt.setString(3, user.getUserPassword());

			int rowsInserted = stmt.executeUpdate();

			if (rowsInserted > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public User loginUser(String useremail,String password) {
		User u = null;
		try {
			Connection conn = DatabaseConnection.getConnection();
			String loginQuery = "SELECT user_id,username,email,usertype FROM users WHERE email=? and password=?";
			PreparedStatement stmt = conn.prepareStatement(loginQuery);
	        ResultSet rs = null;
	        
			stmt.setString(1, useremail);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
            if (rs.next()) {
                // Fetching user details if needed
                int userId = rs.getInt("user_id");
                String userName = rs.getString("username");
                String userEmail = rs.getString("email");
                int userType = rs.getInt("usertype");
                u = new User();
                u.setUserId(userId);
                u.setUserName(userName);
                u.setUserEmail(userEmail);
                u.setUserType(userType);
                // If using sessions, you can store user details here
            }
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return u;
	}
}
