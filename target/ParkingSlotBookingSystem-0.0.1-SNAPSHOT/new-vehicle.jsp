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
		<br> Vehicle Type: <label><input type="radio" value="1" name="vehicleType">Two Wheeler</label>
		<label><input type="radio" value="2" name="vehicleType">Four Wheeler</label>
		<br>
		<br> <input type="submit" value="Add Vehicle">
	</form>
</body>
</html>