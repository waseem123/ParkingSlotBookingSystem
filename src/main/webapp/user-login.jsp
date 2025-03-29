<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<style type="text/css">
	    body{
            font-family:"Arial"
        }

		.formdiv{
			padding: 8px;
			border: 1px solid black;
			display: inline-block;

			margin: auto;
		}

		.input{
			height: 20px;
			padding:8px;
			width: 300px;
		}
	</style>
</head>
<body>
	<div class="formdiv">
        
		<form action="user-login" method="POST">
			<table>
				<thead>
					<tr>
						<th><h3>User Login</h3></th>
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
							<label for="user_email">Username</label>
						</td>
						<td>
							<input type="email" placeholder="user@example.com" id="user_email" class="input" name="user_email">
						</td>
					</tr>
					<tr>
						<td>
							<label for="user_password">Password</label>
						</td>
						<td>
							<input type="password" placeholder="Enter your password" id="user_password" class="input" name="user_password">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="submit">Login</button>
							<a href="user-registration.jsp"><button type="button">Registration</button></a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>