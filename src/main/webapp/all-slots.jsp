<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,models.Vehicle,models.Slot, controllers.DatabaseConnection, controllers.VehicleOperations,controllers.SlotOperations, java.util.*"%>

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
	font-family: Arial, sans-serif;
	margin: 20px;
}

form {
	width: 50%;
	margin: auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

label {
	font-weight: bold;
}

select, input {
	width: 100%;
	padding: 8px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<table style="border: 1px solid black">
		<tr>
			<th>ID</th>
			<th><%=vehicle.getVehicleId()%></th>
		</tr>
		<tr>
			<th>VEHICLE NAME</th>
			<th><%=vehicle.getVehicleName()%></th>
		</tr>
		<tr>
			<th>VEHICLE NUMBER</th>
			<th><%=vehicle.getVehicleNumber()%></th>
		</tr>
		<tr>
			<th>VEHICLE TYPE</th>
			<th><%=vehicle.getVehicleType()%></th>
		</tr>
	</table>

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
					if(s.getSlotAvailability()){%>
						<form action="bookSlot" method="post">
						<input type="hidden" name="vehicle_number"
							value="<%=vehicle.getVehicleNumber()%>"> <input
							type="hidden" name="slot_id" value="<%=s.getSlotId()%>">
						<button type="submit">Book Now</button>
					</form>
					<%}else{
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