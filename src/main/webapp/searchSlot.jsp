<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,models.Vehicle, controllers.DatabaseConnection, controllers.VehicleOperations, java.util.*"%>

<%
    int userId = 1; // Replace this with the logged-in user's ID
    List<Vehicle> vehicles = VehicleOperations.getVehicles(userId);
%>
<html>
<head>
    <title>Search Available Parking Slots</title>
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
    <h2 align="center">Search Available Parking Slots</h2>
    <form method="GET" action="all-slots.jsp">
        <label for="vehicle_type">Select Your Vehicle:</label>
        <select name="vehicle_number" required>
            <%
			for (Vehicle vehicle : vehicles) {
			%>
			<option value="<%=vehicle.getVehicleNumber()%>"><%=vehicle.getVehicleName()%></option>
			<%
			}
			%>
        </select>

        <label for="location">Enter Location:</label>
        <input type="text" name="location" required placeholder="Enter area, sector, or city">

        <button type="submit">Search</button>
    </form>
</body>
</html>
