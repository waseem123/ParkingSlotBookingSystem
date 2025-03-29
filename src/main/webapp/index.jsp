<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
* {
	font-family: "Arial";
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 24px;
	text-align: center;
}
</style>
</head>
<body>
	<%
	HttpSession sessionObj = request.getSession(false);
	if (sessionObj == null || sessionObj.getAttribute("username") == null) {
		response.sendRedirect("login.jsp?error=Please login first.");
	}
	%>
	<h1>Parking Slot Booking System</h1>
	<table>
		<tr>
			<td><a href="my-vehicles.jsp">My Vehicles</a></td>
			<td><a href="bookSlot.jsp">Book a Parking Slot</a></td>
			<td><a href="viewBookings.jsp">View Bookings</a></td>
			<td><a href="logout.jsp">Logout</a></td>
		</tr>
	</table>
</body>
</html>