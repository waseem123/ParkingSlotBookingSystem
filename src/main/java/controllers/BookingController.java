package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Booking;

@WebServlet("/bookSlot")
public class BookingController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookingOperations bo = new BookingOperations();
		int userId = 1;
		String vehicleNumber = request.getParameter("vehicle_number");
		int slotId = Integer.parseInt(request.getParameter("slot_id"));

		if(bo.isAlreadyBooked(vehicleNumber)) {
			response.getWriter().println("<script>alert('This vehicle is already booked or parked!'); history.goBack();</script>");
			return;
		}
		Booking booking = new Booking();
		booking.setSlotId(slotId);
		booking.setVehicleNumber(vehicleNumber);
		booking.setUserId(userId);
		boolean isBooked = bo.saveBooking(booking);
		if (isBooked) {
			response.sendRedirect("my-bookings.jsp");
		} else {
			response.getWriter().println("Error- Booking could not complete.");
		}
	}
}
