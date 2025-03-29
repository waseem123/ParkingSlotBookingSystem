<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,models.Vehicle, controllers.DatabaseConnection, controllers.VehicleOperations, java.util.*"%>

<%
    int userId = 1; // Replace this with the logged-in user's ID
    List<Vehicle> vehicles = VehicleOperations.getVehicles(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
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
			<td><%=vehicle.getVehicleNumber() %></td>
			<td>
				<%=vehicle.getVehicleType().toUpperCase()%>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<a href="new-vehicle.jsp">Add New Vehicle</a>
</body>
</html>