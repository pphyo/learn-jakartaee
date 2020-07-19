<%@page import="com.jdc.model.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2 class="mt-3">Student List</h2>
		<hr>
		<!--  Search -->
		<form class="form-inline mt-3">
			<div class="form-group mr-3">
				<label class="mr-2">Name:</label>
				<input name="name" type="text" class="form-control" placeholder="Enter name for search" />
			</div>
			<div class="form-group mr-3">
				<label class="mr-2">Email:</label>
				<input name="email" type="email" class="form-control" placeholder="Enter email for search" />
			</div>
			<div class="form-group">
				<button class="btn btn-danger mr-3">Search</button>
				<a href="/student-add" class="btn btn-secondary">Add New</a>
			</div>
		</form>

		<!--  Result -->
		<table class="table table-bordered mt-4">
			<thead>
				<tr>
					<th class="text-center">Id</th>
					<th class="text-center">Name</th>
					<th class="text-center">Phone</th>
					<th class="text-center">Email</th>
					<th class="text-center">Address</th>
				</tr>
			</thead>
			<tbody>
				<% 
					@SuppressWarnings("unchecked")
					List<Student> list = (List<Student>)request.getAttribute("list");
				%>
				<% for(int i = 0; i < list.size(); i++) { %>
					<tr>
						<td><%= list.get(i).getId() %></td>
						<td><%= list.get(i).getName() %></td>
						<td><%= list.get(i).getPhone() %></td>
						<td><%= list.get(i).getEmail() %></td>
						<td><%= list.get(i).getAddress() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>