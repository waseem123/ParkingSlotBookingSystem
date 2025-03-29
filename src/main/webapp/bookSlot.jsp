<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, controllers.DatabaseConnection, controllers.VehicleOperations, java.util.*"%>

<%
int userId = 1;
String vehicleNumber = request.getParameter("vehicle_number");
int slotId = Integer.parseInt(request.getParameter("slot_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Confirm your booking details</h1>
	<form action="saveBooking" method="POST">
		Name: <input type="readonly" name="name" required><br> <br>
		Select Vehicle: <select type="text" name="vehicleNumber" required>
			
		</select><br> <br> Slot Number: <input type="number"
			name="slotNumber" required><br> <br> <input
			type="submit" value="Book Slot">
	</form>
</body>
</html>