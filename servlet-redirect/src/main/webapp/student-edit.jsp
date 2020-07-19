<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Edit</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2 class="mt-3">Add New Student</h2>
		
		<div class="row">
			<div class="col6">
				<form action="student-save" method="post">
					<div class="form-group">
						<label>Name</label>
						<input required="required" name="name" type="text" class="form-control" placeholder="Enter name" />
					</div>
					<div class="form-group">
						<label>Phone</label>
						<input required="required" name="phone" type="tel" class="form-control" placeholder="Enter phone number" />
					</div>
					<div class="form-group">
						<label>Email</label>
						<input required="required" name="email" type="email" class="form-control" placeholder="Enter email address" />
					</div>
					<div class="form-group">
						<label>Address</label>
						<textarea name="address" class="form-control" cols="30" rows="5" placeholder="Enter address"></textarea>
					</div>
					
					<div class="form-group">
						<button type="reset" class="btn btn-danger mr-2" >Clear</button>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>