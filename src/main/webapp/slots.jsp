<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,models.Vehicle,models.Slot, controllers.DatabaseConnection, controllers.VehicleOperations,controllers.SlotOperations, java.util.*"%>


<html>
<head>
<title>All Jobs</title>
<style type="text/css">
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
	<c:if test="${userType!=1}">
		<c:redirect url="/index.jsp" />
	</c:if>
	<h2>All Slots</h2>
	<c:if test="${not empty success}">
		<p>${success}</p>
		<c:remove var="success" />
	</c:if>

	<c:if test="${not empty error}">
		<p>${error}</p>
		<c:remove var="error" />
	</c:if>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Slot Name</th>
				<th>Location</th>
				<th>Vehicle Type</th>
				<th>Price per hour</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			SlotOperations so = new SlotOperations();
			List<Slot> slotList = so.getAllSlots();
			pageContext.setAttribute("slotList", slotList);
			%>
			<%
			for (Slot slot : slotList) {
			%>
			<tr>
				<td><%=slot.getSlotId()%></td>
				<td><%=slot.getSlotName()%></td>
				<td><%=slot.getSlotLocation()%></td>
				<td><%=slot.getSlotVehicleType().toUpperCase()%></td>
				<td><%=slot.getSlotPrice()%></td>
				<td><%=slot.getSlotAvailability() ? "Available" : "Not Available"%></td>
				<td><a href="editslot.jsp?id=<%=slot.getSlotId()%>"><button>Edit</button></a>
					<a href="delete?id=<%=slot.getSlotId()%>"><button>Delete</button></a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7">Total <%=slotList.size()%> Slots Found.
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>