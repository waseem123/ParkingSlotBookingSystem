package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Vehicle;

public class VehicleOperations {
	public static List<Vehicle> getVehicles(int userId) {
		List<Vehicle> vehicles = new ArrayList<>();
		String query = "SELECT vehicle_id, vehicle_name, vehicle_number, vehicle_type FROM vehicles WHERE user_id = ?";

		try {
			Connection conn = DatabaseConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				vehicles.add(new Vehicle(rs.getInt("vehicle_id"), rs.getString("vehicle_name"),
						 rs.getString("vehicle_type"),rs.getString("vehicle_number")));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vehicles;
	}

	public static boolean addVehicle(int userId, String vehicleName, String vehicleNumber, String vehicleType)
			throws SQLException {
		String query = "SELECT vehicle_id, vehicle_name, vehicle_number, vehicle_type FROM vehicles WHERE vehicle_number = ?";

		String insertQuery = "INSERT INTO vehicles (user_id, vehicle_name, vehicle_number, vehicle_type) VALUES (?, ?, ?, ?)";
		try {
			Connection conn = DatabaseConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, vehicleNumber);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return false;
			}

			stmt = conn.prepareStatement(insertQuery);

			stmt.setInt(1, userId);
			stmt.setString(2, vehicleName);
			stmt.setString(3, vehicleNumber);
			stmt.setString(4, vehicleType);
			stmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
}
