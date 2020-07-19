<%@page import="java.io.PrintWriter"%>
<%@page import="com.jdc.scope.Counter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Servlet Scope</title>
</head>
<body>
	<h1>Servlet Scope</h1>
	<hr>
	
	<table>
		<tr>
			<td>Request</td>
			<td>
				<%
					Object obj1 = request.getAttribute("counter");
					Counter reqCounter = null != obj1 ? (Counter)obj1 : new Counter();
				%>
				<%= reqCounter.getCount() %>
			</td>
		</tr>
		<tr>
			<td>Session</td>
			<td>
				<% 
					Object obj2 = session.getAttribute("counter");
					Counter sesCounter = null != obj2 ? (Counter)obj2 : new Counter();
				%>
				<%= sesCounter.getCount() %>
			</td>
		</tr>
		<tr>
			<td>Application</td>
			<td>
				<%
					Object obj3 = application.getAttribute("counter");
					Counter appCounter = null != obj3 ? (Counter)obj3 : new Counter();
				%>
				<%= appCounter.getCount() %>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="counter">Count Up</a>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<form action="counter" method="post">
					<button type="submit">Invalidate Sesson</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>