<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classes</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
	<div class="container">
		<h3>Classes</h3>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Course</th>
					<th>Start Date</th>
					<th>Fees</th>
					<th>Duration</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="c">
					<tr>
						<td>${c.id}</td>
						<td>${c.course.name}</td>
						<td>${c.startDate}</td>
						<td>${c.course.fees} MMK</td>
						<td>${c.course.duration} Months</td>
						<td>
							<c:url var="regUrl" value="/registration-edit">
								<c:param name="classes" value="${c.id}"></c:param>
							</c:url>
							<a href="${regUrl}">Register</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>