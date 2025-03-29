<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <style type="text/css">
		*{
			font-family:calibri;
		}
		.formdiv{
			padding: 8px;
			border: 1px solid black;
			display: inline-block;

			margin: auto;
			/*width: 50%;*/
		}
        table,th{
            border: 1px solid black;
            border-collapse: collapse;
            padding:24px;
            text-align: center;
        }
		.input{
			height: 20px;
			width: 300px;
		}
	</style>
</head>
<body>
    <table>
        <tbody>
            <tr>
				<th><a href="./slots.jsp">Home</a></th>
                <th><a href="./addslot.jsp">Add Slots</a></th>
                <th><a href="./booking-history.jsp">Booking History</a></th>
                <th><a href="./logout">Log Out</a></th>
                <th colspan="5"><u style="text-align:right">Welcome, ${userName}</u></th>
            </tr>
        </tbody>
    </table>
</body>
</html>