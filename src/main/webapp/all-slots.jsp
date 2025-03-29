<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,models.Vehicle,models.Slot, controllers.DatabaseConnection, controllers.VehicleOperations,controllers.SlotOperations, java.util.*"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?error=Please login first.");
}
%>
<%
// Handling form submission
String vehicleNumber = request.getParameter("vehicle_number");
String location = request.getParameter("location");
String vehicleType = "";
if (vehicleNumber != null && location != null) {
	try {
		// Database connection		
		Connection con = DatabaseConnection.getConnection();
		Vehicle vehicle = new Vehicle();
		// SQL query to fetch available slots
		String vehicleSql = "SELECT vehicle_id, vehicle_name, vehicle_number, vehicle_type FROM vehicles WHERE vehicle_number=?";
		PreparedStatement stmt = con.prepareStatement(vehicleSql);
		stmt.setString(1, vehicleNumber);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
	vehicle.setVehicleId(rs.getInt("vehicle_id"));
	vehicle.setVehicleName(rs.getString("vehicle_name"));
	vehicle.setVehicleType(rs.getString("vehicle_type"));
	vehicle.setVehicleNumber(rs.getString("vehicle_number"));
		}
		stmt.close();
		rs.close();
		List<Slot> allSlots = SlotOperations.searchSlots(vehicle.getVehicleType().toLowerCase(), location);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h2>All available slots</h2>

	<h5>Vehicle Details</h5>
	<table>
		<tr>
			<th>ID</th>
			<td><%=vehicle.getVehicleId()%></td>
		</tr>
		<tr>
			<th>VEHICLE NAME</th>
			<td><%=vehicle.getVehicleName()%></td>
		</tr>
		<tr>
			<th>VEHICLE NUMBER</th>
			<td><%=vehicle.getVehicleNumber()%></td>
		</tr>
		<tr>
			<th>VEHICLE TYPE</th>
			<td><%=vehicle.getVehicleType()%></td>
		</tr>
	</table>

	<h5>Parking slot details</h5>
	<%
	if (allSlots.size() <= 0) { // No data found
		out.println("<p style='color:red; text-align:center;'>No available slots found for " + vehicleType + " in "
		+ location + ".</p>");
	} else {
	%>
	<table>
		<tr>
			<th>Slot Name</th>
			<th>Location</th>
			<th>Price Per Hour</th>
			<th>Availability</th>
		</tr>
		<%
		for (Slot s : allSlots) {
		%>
		<tr>
			<td><%=s.getSlotName()%></td>
			<td><%=s.getSlotLocation()%></td>
			<td><%=s.getSlotPrice()%> ₹</td>
			<td>
				<%
				if (s.getSlotAvailability()) {
				%>
				<form action="bookSlot" method="post">
					<input type="hidden" name="vehicle_number"
						value="<%=vehicle.getVehicleNumber()%>"> <input
						type="hidden" name="slot_id" value="<%=s.getSlotId()%>">
					<button type="submit">Book Now</button>
				</form> <%
 } else {
 out.println("Not Available");
 }
 %>

			</td>
		</tr>
		<%
		}
		out.println("</table>");
		}

		// Closing connections
		rs.close();
		stmt.close();
		con.close();
		} catch (Exception e) {
		out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
		e.printStackTrace();
		}
		}
		%>
	
</body>
</html>