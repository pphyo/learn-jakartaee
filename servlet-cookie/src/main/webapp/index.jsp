<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cookie Servlet</title>
</head>
<body>
	<h1>Cookie Servlet</h1>
	<hr>
	
	<%
		Object obj = request.getAttribute("name");
		if(null != obj) {
			String name = obj.toString();
			%>
				User Name is: <%= name %>
			<%
		} else {
			%>
				<form action="cookies" method="post">
					<input placeholder="Enter name" name="name">
					<input type="submit" value="send" />
				</form>
			<%
		}
	%>
</body>
</html>