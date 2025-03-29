<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,models.Vehicle,models.Slot, controllers.DatabaseConnection, controllers.VehicleOperations,controllers.SlotOperations, java.util.*"%>

<%
int slotId = Integer.parseInt(request.getParameter("id"));
SlotOperations so = new SlotOperations();
Slot slot = so.getSlotById(slotId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (slot != null) {
	%>
	<table>
		<form action="save-slot-changes" method="POST">
			<tr>
				<td>Slot Name</td>
				<td>
					<input type="hidden" name="slot_id"
					value="<%=slot.getSlotId()%>">
					<input type="text" name="slot_name"
					value="<%=slot.getSlotName()%>">
				</td>
			</tr>

			<tr>
				<td>Slot Location</td>
				<td><input type="text" name="slot_location"
					value="<%=slot.getSlotLocation()%>"></td>
			</tr>
	
			<tr>
				<td>Vehicle Type</td>
	
				<td>
					<%
					String vtype = slot.getSlotVehicleType();
					if (vtype.equals("car")) {
					%> <label>
							<input type="radio" value="bike" name="vehicle_type"> Bike
						</label>
						<label>
							<input type="radio" checked value="car" name="vehicle_type">Car
						</label>
						<label>
							<input type="radio" value="truck" name="vehicle_type">Truck
						</label> <%
					 } else if (vtype.equals("bike")) {
					 %> <label>
					 		<input type="radio" checked value="bike" name="vehicle_type">Bike
					 	</label>
					 	<label>
					 		<input type="radio" value="car" name="vehicle_type">Car
					 	</label>
					 	<label>
					 		<input
									type="radio" value="truck" name="vehicle_type">Truck
					 	</label>
					<% } else {
					 %> 
					 	<label>
					 		<input type="radio" value="bike" name="vehicle_type">Bike
					 	</label>
					 	<label>
					 		<input type="radio" value="car" name="vehicle_type">Car
					 	</label>
					 	<label>
					 		<input
									type="radio" checked value="truck" name="vehicle_type">Truck
					 	</label>
					  <% } %>
				</td>
			</tr>
	
			<tr>
				<td>Slot Price</td>
				<td>
					<input type="text" name="slot_price" value="<%=slot.getSlotPrice()%>">
					<input type="hidden" name="slot_available" value="<%=slot.getSlotAvailability() %>">
				</td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</form>
	</table>
	<%
	} else {
	%>
		<h3>No data found.</h3>
	<%
	}
	%>

</body>
</html>