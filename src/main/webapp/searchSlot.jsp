<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,models.Vehicle, controllers.DatabaseConnection, controllers.VehicleOperations, java.util.*"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?error=Please login first.");
}
%>
<%
int userId = 1; // Replace this with the logged-in user's ID
List<Vehicle> vehicles = VehicleOperations.getVehicles(userId);
%>
<html>
<head>
<title>Search Available Parking Slots</title>
<style>
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
	height: 24px;
	padding: 16px;
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
	<h2>Search Available Parking Slots</h2>
	<form method="GET" action="all-slots.jsp">
		<table>
			<tr>
				<td><label for="vehicle_type">Select Your Vehicle:</label></td>
				<td><select class="" name="vehicle_number" required>
						<%
						for (Vehicle vehicle : vehicles) {
						%>
						<option value="<%=vehicle.getVehicleNumber()%>"><%=vehicle.getVehicleName()%></option>
						<%
						}
						%>
				</select></td>
			</tr>

			<tr>
				<td><label for="location">Enter Location:</label></td>
				<td><input class='input' type="text" name="location" required
					placeholder="Enter area, sector, or city"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">Search</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
