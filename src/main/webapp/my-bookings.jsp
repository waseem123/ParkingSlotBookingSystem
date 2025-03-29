<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, models.Booking, controllers.BookingOperations"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?error=Please login first.");
}
%>
<%
int userId = 1; // Replace this with the logged-in user's ID
BookingOperations bo = new BookingOperations();
List<Booking> bookings = bo.getAllBookingsByUser(userId);
%>

<html>
<head>
<title>My Bookings</title>
<style>
body {
	font-family: "Arial"
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align: center;
}

.input {
	height: 24px;
	padding: 16px;
	width: 300px;
}

.buttons {
	border: 1px solid gray;
	text-decoration: none;
	padding: 8px;
}
</style>
</head>
<body>
	<table style="margin-bottom: 16px">
		<tr>
			<td><a href="my-vehicles.jsp">My Vehicles</a></td>
			<td><a href="searchSlot.jsp">Book a Parking Slot</a></td>
			<td><a href="viewBookings.jsp">View Bookings</a></td>
			<td><a href="logout.jsp">Logout</a></td>
		</tr>
	</table>
	<h2 align="center">My Parking Slot Bookings</h2>

	<%
	if (bookings.isEmpty()) {
	%>
	<p style="text-align: center; color: red;">No bookings found!</p>
	<%
	} else {
	%>
	<table>
		<tr>
			<th>Booking ID</th>
			<th>Slot</th>
			<th>Vehicle Number</th>
			<th>Booking Date</th>
			<th>Booking Time</th>
			<th>Parking Time</th>
			<th>Unpark Time</th>

			<th>Status</th>
			<th>Action</th>
		</tr>
		<%
		for (Booking booking : bookings) {
		%>
		<tr>
			<td><%=booking.getBookingId()%></td>
			<td><%=booking.getSlotName()%></td>
			<td><%=booking.getVehicleNumber()%></td>
			<td><%=booking.getBookingDate()%></td>
			<td><%=booking.getBookingTime()%></td>
			<td><%=booking.getParkTime()%></td>
			<td><%=booking.getUnparkTime()%></td>
			<td><%=booking.getBookingStatus()%></td>
			<td>
				<%
				String bookingStatus = booking.getBookingStatus();
				if (bookingStatus.equalsIgnoreCase("Booked")) {
				%><a href="parkVehicle?booking_id=<%=booking.getBookingId()%>"
				class="buttons">Park</a> <a
				href="cancelBooking?booking_id=<%=booking.getBookingId()%>"
				class="buttons">Cancel</a> <%
 } else if (bookingStatus.equalsIgnoreCase("Parked")) {
 %> <a href="unparkVehicle?booking_id=<%=booking.getBookingId()%>"
				class="buttons">Unpark</a> <%
 } else if (bookingStatus.equalsIgnoreCase("Cancelled")) {
 %> <span style="color: gray;">-</span> <%
 } else {
 %> <span style="color: gray;">Not Cancellable</span> <%
 }
 %>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>

</body>
</html>
