<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Add New Vehicle</h2>
	<form action="AddVehicleServlet" method="post">
		Vehicle Name: <input type="text" name="vehicleName"><br>
		<br> Vehicle Number: <input type="text" name="vehicleNumber"><br>
		<br> Vehicle Type: <label><input type="radio" value="bike" name="vehicleType">Bike</label>
		<label><input type="radio" value="car" name="vehicleType">Car</label>
		<label><input type="radio" value="truck" name="vehicleType">Truck</label>
		<br>
		<br> <input type="submit" value="Add Vehicle">
	</form>
</body>
</html>