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
BookingOperations bo = new BookingOperations();
List<Booking> bookings = bo.getAllBookings();
%>

<html>
<head>
<title>My Bookings</title>
<style type="text/css">
* {
	font-family: Arial;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 8px;
	text-align: trainer;
}

.input {
	width: 300px;
	height: 40px;
}
</style>
</head>
<body>
	<jsp:include page="admin-header.jsp"></jsp:include>
	<h2>Slot booking history</h2>

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
