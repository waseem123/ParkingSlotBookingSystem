<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, models.Booking, controllers.BookingOperations"%>

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
	font-family: Arial, sans-serif;
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
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

.cancel-btn {
	background-color: red;
	color: white;
	padding: 5px;
	text-decoration: none;
	border-radius: 4px;
}

.cancel-btn:hover {
	background-color: darkred;
}
</style>
</head>
<body>
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
				%><a
				href="parkVehicle?booking_id=<%=booking.getBookingId()%>"
				class="cancel-btn">Park</a>
				 <a
				href="cancelBooking?booking_id=<%=booking.getBookingId()%>"
				class="cancel-btn">Cancel</a>
				 <%
 				}else if(bookingStatus.equalsIgnoreCase("Parked")){%>
					<a
					href="unparkVehicle?booking_id=<%=booking.getBookingId()%>"
					class="cancel-btn">Unpark</a>
				<%}else if(bookingStatus.equalsIgnoreCase("Cancelled")){%>
					<span style="color: gray;">-</span>
				<%} else {
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
