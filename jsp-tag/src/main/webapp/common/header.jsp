<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a href="#" class="navbar-brand"><%= request.getParameter("title") %></a>
		
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a href="#" class="nav-link">Courses</a>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">Classes</a>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">Registrations</a>
			</li>
		</ul>
		
	</div>
</nav>