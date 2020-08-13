<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="r" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration List</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
	<div class="container">
		<h3>Registraion List</h3>
		
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Start Date</th>
					<th>Course</th>
				</tr>
			</thead>
			<tbody>
				<r:forEach items="${list}" var="reg">
					<tr>
						<td>${reg.id}</td>
						<td>${reg.name}</td>
						<td>${reg.phone}</td>
						<td>${reg.email}</td>
						<td>${reg.classes.startDate}</td>
						<td>${reg.classes.course.name}</td>
					</tr>
				</r:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>