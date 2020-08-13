<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
	<div class="container">
		<h3>Add Registration</h3>
		<div class="grid">
		<div class="row">
			<div class="col-4">
				<form action="registration" method="post" class="form">
					<input type="hidden" name="classID" value="${classes.id}" />
					
					<div class="form-group">
						<label for="">Course Name</label>
						<input type="text" readonly class="form-control" value="${classes.course.name}" />
					</div>
					<div class="form-group">
						<label for="">Start Date</label>
						<input type="text" readonly class="form-control" value="${classes.startDate}" />
					</div>
					<div class="form-group">
						<label for="">Student Name</label>
						<input name="name" type="text" required class="form-control" placeholder="Enter student name"/>
					</div>
					<div class="form-group">
						<label for="">Phone</label>
						<input name="phone" type="number" class="form-control" placeholder="Enter phone number"/>
					</div>
					<div class="form-group">
						<label for="">Email</label>
						<input name="email" type="email" class="form-control" placeholder="Enter email address"/>
					</div>
					<div class="form-group">
						<button class="btn btn-primary float-right" type="submit">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>

</body>
</html>