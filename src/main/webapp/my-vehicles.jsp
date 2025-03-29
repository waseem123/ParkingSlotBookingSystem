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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	font-family: "Arial";
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
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

	<table border="1">
		<tr>

			<td colspan=4><a style="display: block; float: right;"
				href="new-vehicle.jsp">Add New Vehicle</a></td>
		</tr>
		<tr>
			<th>Vehicle ID</th>
			<th>Vehicle Name</th>
			<th>Vehicle Number</th>
			<th>Vehicle Type</th>
		</tr>
		<%
		for (Vehicle vehicle : vehicles) {
		%>
		<tr>
			<td><%=vehicle.getVehicleId()%></td>
			<td><%=vehicle.getVehicleName()%></td>
			<td><%=vehicle.getVehicleNumber()%></td>
			<td><%=vehicle.getVehicleType().toUpperCase()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>

</body>
</html>