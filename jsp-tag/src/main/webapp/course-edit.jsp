<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Edit</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>

	<div class="container">
		<h3 class="text-primary mt-2">Add/Edit course</h3>
		<div class="grid">
			<div class="row">
				<div class="col-4">
					<form action="course-confirm.jsp" method="post" class="form">
						<div class="form-group">
							<label>Name</label>
							<input name="name" type="text" class="form-control" placeholder="Enter course name" required/>
						</div>
						<div class="form-group">
							<label>Level</label>
							<select name="level" class="form-control">
								<option>Basic</option>
								<option>Intermediate</option>
								<option>Advanced</option>
							</select>
						</div>
						<div class="form-group">
							<label>Fees</label>
							<input name="fees" type="number" step="any" class="form-control" placeholder="Enter fees" required/>
						</div>
						<div class="form-group">
							<label>Duration</label>
							<input name="duration" step="any" type="number" class="form-control" placeholder="Enter months" required/>
						</div>
						<div class="form-group">
							<button class="btn btn-primary" type="submit">Save Course</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>