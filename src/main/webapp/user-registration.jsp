<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Registration</title>
	<style type="text/css">
        table,th,td{
            border: 1px solid black;
            border-collapse: collapse;
            padding:24px;
            text-align: center;
        }
		.formdiv{
			padding: 8px;
			border: 1px solid black;
			display: inline-block;
			margin-top: 24px;
		}

		.input{
			height: 20px;
			width: 300px;
			padding: 8px;
		}
	</style>
</head>
<body>
    <h2>User Registration</h2>
	<div class="formdiv">
		<form action="registration" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h3>Registration</h3></th>
						<c:if test="${not empty success}">
						<p>${success}</p>
						<c:remove var="success"/>
						</c:if>
						
						<c:if test="${not empty error}">
						<p>${error}</p>
						<c:remove var="error"/>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<tr>
                        <td>
                            <label for="user_name">User Name</label>
                        </td>
                        <td>
                            <input type="text" id="user_name" class="input" name="user_name">
                        </td>
                    </tr>
                    <tr>
						<td>
							<label for="user_email">Email</label>
						</td>
						
						<td>
                            <input type="email" id="user_email" class="input" name="user_email">
                        </td>
					</tr>
					
                    <tr>
                        <td>
                            <label for="user_password">Password</label>
                        </td>
                        <td>
                        	<input type="password" id="user_password" class="input" name="user_password">
                        </td>
                    </tr>
					
					<tr>
						<td colspan="2"><button type="submit">Register</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>