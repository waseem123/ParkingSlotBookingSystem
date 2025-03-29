<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, controllers.DatabaseConnection"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Bookings</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 24px;
	text-align: center;
}

.input {
	height: 20px;
	width: 300px;
	padding: 8px;
}
</style>
</head>
<body>
	<h1>View Bookings</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Vehicle Number</th>
			<th>Slot Number</th>
			<th>Booking Time</th>
		</tr>
		<%
		try {
			Connection conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM bookings";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				out.print("<tr>");
				out.print("<td>" + rs.getInt("booking_id") + "</td>");
				out.print("<td>" + rs.getString("user_id") + "</td>");
				out.print("<td>" + rs.getString("booking_time") + "</td>");
				out.print("<td>" + rs.getInt("slot_id") + "</td>");
				out.print("<td>" + rs.getString("booking_date") + "</td>");
				out.print("</tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</body>
</html>