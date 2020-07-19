<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forward JSP</title>
</head>
<body>

	<h1>Foward to JSP</h1>

	<table>
		<tr>
			<td>Name:</td>
			<td>
				<%= request.getParameter("name") %>
			</td>
		</tr>
		<tr>
			<td>Subject:</td>
			<td>
				<%= request.getParameter("subject") %>
			</td>
		</tr>
		<tr>
			<td>Gender:</td>
			<td>
				<%= request.getParameter("gender") %>
			</td>
		</tr>
		<tr>
			<td>Interest:</td>
			<td>
				<%= request.getAttribute("interest") %>
			</td>
		</tr>
	</table>
	
	<a href="/index.jsp">Back</a>

</body>
</html>