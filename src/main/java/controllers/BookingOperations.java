package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Booking;

public class BookingOperations {
	public boolean saveBooking(Booking booking) {
		try {
			Connection conn = DatabaseConnection.getConnection();
			String insertQuery = "INSERT INTO bookings (user_id, slot_id, vehicle_number, booking_date, booking_status, booking_time) VALUES (?, ?, ?, current_date(), 'booked', current_time())";
			PreparedStatement stmt = conn.prepareStatement(insertQuery);
			stmt.setInt(1, booking.getUserId());
			stmt.setInt(2, booking.getSlotId());
			stmt.setString(3, booking.getVehicleNumber());

			int rowsInserted = stmt.executeUpdate();

			if (rowsInserted > 0) {
				// Update Slot Availability (Mark as Booked)
				String updateQuery = "UPDATE parking_slots SET availability = 0 WHERE slot_id = ?";
				PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setInt(1, booking.getSlotId());
				updateStmt.executeUpdate();
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean isAlreadyBooked(String vehicleNumber) {
		// Check if the vehicle is already booked or parked
		try {
			Connection conn = DatabaseConnection.getConnection();
			String checkQuery = "SELECT booking_id FROM bookings WHERE vehicle_number = ? AND booking_status IN ('booked', 'parked')";
			PreparedStatement stmt = conn.prepareStatement(checkQuery);
			stmt.setString(1, vehicleNumber);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// Vehicle is already booked or parked
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public List<Booking> getAllBookingsByUser(int userId) {
	    List<Booking> bookings = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DatabaseConnection.getConnection();

	        // Join bookings with parking_slots to get slot name
	        String query = "SELECT b.booking_id, b.slot_id, concat(p.slot_name,' - ',p.location) slot_name, b.vehicle_number, " +
	                       "b.booking_date, b.booking_time, COALESCE(b.start_time, 'NA') AS start_time, " +
	                       "COALESCE(b.end_time, 'NA') AS end_time, b.booking_status " +
	                       "FROM bookings b " +
	                       "JOIN parking_slots p ON b.slot_id = p.slot_id " +
	                       "WHERE b.user_id = ?";
	        stmt = conn.prepareStatement(query);
	        stmt.setInt(1, userId);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            Booking booking = new Booking();
	            booking.setBookingId(rs.getInt("booking_id"));
	            booking.setSlotId(rs.getInt("slot_id"));
	            booking.setSlotName(rs.getString("slot_name")); // Set slot name
	            booking.setVehicleNumber(rs.getString("vehicle_number"));
	            booking.setBookingDate(rs.getString("booking_date"));
	            booking.setBookingTime(rs.getString("booking_time"));
	            booking.setParkTime(rs.getString("start_time"));
	            booking.setUnparkTime(rs.getString("end_time"));
	            booking.setBookingStatus(rs.getString("booking_status"));

	            bookings.add(booking);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    return bookings;
	}
	
	public List<Booking> getAllBookings() {
	    List<Booking> bookings = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DatabaseConnection.getConnection();

	        // Join bookings with parking_slots to get slot name
	        String query = "SELECT b.booking_id, b.slot_id, concat(p.slot_name,' - ',p.location) slot_name, b.vehicle_number, " +
	                       "b.booking_date, b.booking_time, COALESCE(b.start_time, 'NA') AS start_time, " +
	                       "COALESCE(b.end_time, 'NA') AS end_time, b.booking_status " +
	                       "FROM bookings b " +
	                       "JOIN parking_slots p ON b.slot_id = p.slot_id ORDER BY b.booking_id desc";
	        stmt = conn.prepareStatement(query);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            Booking booking = new Booking();
	            booking.setBookingId(rs.getInt("booking_id"));
	            booking.setSlotId(rs.getInt("slot_id"));
	            booking.setSlotName(rs.getString("slot_name")); // Set slot name
	            booking.setVehicleNumber(rs.getString("vehicle_number"));
	            booking.setBookingDate(rs.getString("booking_date"));
	            booking.setBookingTime(rs.getString("booking_time"));
	            booking.setParkTime(rs.getString("start_time"));
	            booking.setUnparkTime(rs.getString("end_time"));
	            booking.setBookingStatus(rs.getString("booking_status"));

	            bookings.add(booking);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    return bookings;
	}


//	public boolean changeBookingStatus(int bookingId, String status) {
//		boolean updated = false;
//		Connection conn = null;
//		PreparedStatement stmt = null;
//		ResultSet rs = null;
//		String updateQuery = "";
//
//		try {
//			conn = DatabaseConnection.getConnection();
//
//			// Fetch slot_id for the given booking_id
//			String fetchQuery = "SELECT slot_id FROM bookings WHERE booking_id = ?";
//			stmt = conn.prepareStatement(fetchQuery);
//			stmt.setInt(1, bookingId);
//			rs = stmt.executeQuery();
//
//			int slotId = -1;
//			if (rs.next()) {
//				slotId = rs.getInt("slot_id");
//			}
//
//			if (slotId == -1) {
//				return false; // No valid booking found
//			}
//
//			// Update booking status
//			if (status.equalsIgnoreCase("parked")) {
//				updateQuery = "UPDATE bookings SET booking_status = ?,start_time=current_time() WHERE booking_id = ?";
//			} else if (status.equalsIgnoreCase("Unparked")) {
//				updateQuery = "UPDATE bookings SET booking_status = ?,end_time=current_time() WHERE booking_id = ?";
//			} else {
//				updateQuery = "UPDATE bookings SET booking_status = ? WHERE booking_id = ?";
//			}
//			stmt = conn.prepareStatement(updateQuery);
//			stmt.setString(1, status);
//			stmt.setInt(2, bookingId);
//			int rowsUpdated = stmt.executeUpdate();
//
//			// If status is "Cancelled" or "Unparked", mark slot as available
//			if (rowsUpdated > 0 && (status.equalsIgnoreCase("Cancelled") || status.equalsIgnoreCase("Unparked"))) {
//				String slotUpdateQuery = "UPDATE parking_slots SET availability = TRUE WHERE slot_id = ?";
//				stmt = conn.prepareStatement(slotUpdateQuery);
//				stmt.setInt(1, slotId);
//				stmt.executeUpdate();
//			}
//
//			updated = rowsUpdated > 0;
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (stmt != null)
//					stmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return updated;
//	}
	
	public boolean changeBookingStatus(int bookingId, String status) {
	    boolean updated = false;
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    String updateQuery = "";

	    try {
	        conn = DatabaseConnection.getConnection();

	        // Fetch slot_id and price_per_hour for the given booking_id
	        String fetchQuery = "SELECT slot_id, TIMESTAMPDIFF(MINUTE, start_time, CURRENT_TIME()) AS duration, " +
	                            "(SELECT price_per_hour FROM parking_slots WHERE slot_id = bookings.slot_id) AS price_per_hour " +
	                            "FROM bookings WHERE booking_id = ?";
	        stmt = conn.prepareStatement(fetchQuery);
	        stmt.setInt(1, bookingId);
	        rs = stmt.executeQuery();

	        int slotId = -1;
	        int durationMinutes = 0;
	        double pricePerHour = 0.0;
	        if (rs.next()) {
	            slotId = rs.getInt("slot_id");
	            durationMinutes = rs.getInt("duration"); // Total parked duration in minutes
	            pricePerHour = rs.getDouble("price_per_hour");
	        }

	        if (slotId == -1) {
	            return false; // No valid booking found
	        }

	        // Calculate total cost when status is "Unparked"
	        double totalCost = 0.0;
	        if (status.equalsIgnoreCase("Unparked")) {
	            double durationHours = durationMinutes / 60.0; // Convert minutes to hours
	            totalCost = durationHours * pricePerHour;
	        }

	        // Update booking status and cost
	        if (status.equalsIgnoreCase("Parked")) {
	            updateQuery = "UPDATE bookings SET booking_status = ?, start_time = CURRENT_TIME() WHERE booking_id = ?";
	        } else if (status.equalsIgnoreCase("Unparked")) {
	            updateQuery = "UPDATE bookings SET booking_status = ?, end_time = CURRENT_TIME(), total_amount = ? WHERE booking_id = ?";
	        } else {
	            updateQuery = "UPDATE bookings SET booking_status = ? WHERE booking_id = ?";
	        }

	        stmt = conn.prepareStatement(updateQuery);
	        stmt.setString(1, status);

	        if (status.equalsIgnoreCase("Unparked")) {
	            stmt.setDouble(2, totalCost);
	            stmt.setInt(3, bookingId);
	        } else {
	            stmt.setInt(2, bookingId);
	        }

	        int rowsUpdated = stmt.executeUpdate();

	        // If status is "Cancelled" or "Unparked", mark slot as available
	        if (rowsUpdated > 0 && (status.equalsIgnoreCase("Cancelled") || status.equalsIgnoreCase("Unparked"))) {
	            String slotUpdateQuery = "UPDATE parking_slots SET availability = TRUE WHERE slot_id = ?";
	            stmt = conn.prepareStatement(slotUpdateQuery);
	            stmt.setInt(1, slotId);
	            stmt.executeUpdate();
	        }

	        updated = rowsUpdated > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return updated;
	}


}
