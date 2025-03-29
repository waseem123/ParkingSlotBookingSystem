package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Slot;

public class SlotOperations {
	public static List<Slot> searchSlots(String vehicleType, String location) {
		List<Slot> slots = new ArrayList<>();
		String query = "SELECT slot_id, slot_name, location, availability,vehicle_type,price_per_hour FROM parking_slots WHERE vehicle_type=? AND location LIKE ?";
		try {
			Connection conn = DatabaseConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, vehicleType);
			stmt.setString(2, "%" + location + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				slots.add(new Slot(rs.getInt("slot_id"), rs.getString("slot_name"), rs.getString("location"),
						rs.getBoolean("availability"), rs.getDouble("price_per_hour"), rs.getString("vehicle_type")));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return slots;
	}

	public List<Slot> getAllSlots() {
		List<Slot> slots = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DatabaseConnection.getConnection();
			String query = "SELECT slot_id, slot_name, location, availability, vehicle_type, price_per_hour FROM parking_slots";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Slot slot = new Slot();
				slot.setSlotId(rs.getInt("slot_id"));
				slot.setSlotName(rs.getString("slot_name"));
				slot.setSlotLocation(rs.getString("location"));
				slot.setSlotAvailability(rs.getBoolean("availability"));
				slot.setSlotVehicleType(rs.getString("vehicle_type"));
				slot.setSlotPrice(rs.getDouble("price_per_hour"));

				slots.add(slot);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return slots;
	}
	
	public Slot getSlotById(int slotId) {
		Slot slot = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DatabaseConnection.getConnection();
			String query = "SELECT slot_id, slot_name, location, availability, vehicle_type, price_per_hour FROM parking_slots WHERE slot_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, slotId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				slot = new Slot();
				slot.setSlotId(rs.getInt("slot_id"));
				slot.setSlotName(rs.getString("slot_name"));
				slot.setSlotLocation(rs.getString("location"));
				slot.setSlotAvailability(rs.getBoolean("availability"));
				slot.setSlotVehicleType(rs.getString("vehicle_type"));
				slot.setSlotPrice(rs.getDouble("price_per_hour"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return slot;
	}

	public boolean saveSlot(Slot slot) {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO parking_slots(slot_name,location,vehicle_type,price_per_hour,availability)VALUES(?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, slot.getSlotName());
			stmt.setString(2, slot.getSlotLocation());
			stmt.setString(3, slot.getSlotVehicleType());
			stmt.setDouble(4, slot.getSlotPrice());
			stmt.setBoolean(5, true);
			stmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean saveChanges(Slot slot) {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DatabaseConnection.getConnection();
			String sql = "UPDATE parking_slots set slot_name=?,location=?,vehicle_type=?,price_per_hour=?,availability=? WHERE slot_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, slot.getSlotName());
			stmt.setString(2, slot.getSlotLocation());
			stmt.setString(3, slot.getSlotVehicleType());
			stmt.setDouble(4, slot.getSlotPrice());
			stmt.setBoolean(5, slot.getSlotAvailability());
			stmt.setInt(6, slot.getSlotId());
			stmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean deleteSlot(int slotId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean isAvailable = true;
		try {
			conn = DatabaseConnection.getConnection();
			String query = "SELECT slot_id, slot_name, location, availability, vehicle_type, price_per_hour FROM parking_slots WHERE slot_id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, slotId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				isAvailable = rs.getBoolean("availability");
			}
			if(isAvailable) {
				String sql = "DELETE FROM parking_slots WHERE slot_id=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, slotId);
				stmt.executeUpdate();
				return true;
			}else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
