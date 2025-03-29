<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?error=Please login first.");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: "Arial"
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
}

.input {
	height: 20px;
	padding: 8px;
	width: 300px;
}
</style>
</head>
<body>

	<table style="margin-bottom: 16px">
		<tr>
			<td><a href="my-vehicles.jsp">My Vehicles</a></td>
			<td><a href="searchSlot.jsp">Book a Parking Slot</a></td>
			<td><a href="my-bookings.jsp">View Bookings</a></td>
			<td><a href="logout.jsp">Logout</a></td>
		</tr>
	</table>
	<h2>Add New Vehicle</h2>

	<form action="AddVehicleServlet" method="post">
		<table>
			<tr>
				<td>Vehicle Name</td>
				<td><input class="input" type="text" name="vehicleName"></td>
			</tr>

			<tr>
				<td>Vehicle Number</td>
				<td><input class="input" type="text" name="vehicleNumber"></td>
			</tr>
			<tr>
				<td>Vehicle Type</td>
				<td><label><input type="radio" value="bike"
						name="vehicleType">Bike</label> <label><input type="radio"
						value="car" name="vehicleType">Car</label> <label><input
						type="radio" value="truck" name="vehicleType">Truck</label></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="Add Vehicle"></td>
			</tr>

		</table>
	</form>
</body>
</html>