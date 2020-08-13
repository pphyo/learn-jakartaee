<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
	<div class="container">
		<h3 class="mt-1">
			Courses<a href="course-edit.jsp" class="btn btn-primary float-right mt-2 mb-2">+ Add New Course</a>
		</h3>
	
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Level</th>
				<th>Fees</th>
				<th>Duration</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="c">
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					<td>${c.level}</td>
					<td>${c.fees} MMK</td>
					<td>${c.duration} Months</td>
					<td>
						<c:url var="editUrl" value="/classes-edit">
							<c:param name="course" value="${c.id}"></c:param>
						</c:url>
						<a href="${editUrl}">Create Class</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

</body>
</html>