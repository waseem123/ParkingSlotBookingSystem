<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, controllers.DatabaseConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f0f0f0;
}

table {
	width: 80%;
	margin: auto;
	border-collapse: collapse;
	background-color: white;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #3E5926;
	color: white;
}

tr:hover {
	background-color: #f5f5f5;
}

h1 {
	text-align: center;
	color: #3E5926;
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