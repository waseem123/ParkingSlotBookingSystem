package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/unparkVehicle")
public class UnparkVehicle extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookingId = Integer.parseInt(request.getParameter("booking_id"));

        BookingOperations bo = new BookingOperations();
        boolean isUpdated = bo.changeBookingStatus(bookingId, "unparked");

        if (isUpdated) {
            response.sendRedirect("my-bookings.jsp?success=unparked");
        } else {
            response.sendRedirect("my-bookings.jsp?error=Could not unpark");
        }
	}
}
