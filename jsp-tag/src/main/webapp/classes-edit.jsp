<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Class</title>
<jsp:include page="/common/resources.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/common/header.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
	<div class="container">
		<h3>Add New Class</h3>
		
		<div class="grid">
			<div class="row">
				<div class="col-4">
					<form action="classes" method="post" class="form">
						
						<input type="hidden" name="courseId" value="${course.id}" />
						
						<div class="form-group">
							<label for="">Course</label>
							<input type="text" readonly value="${course.name}" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">Start Date</label>
							<input name="startDate" type="date" required placeholder="Select start date" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">Duration</label>
							<input type="text" readonly value="${course.duration}" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">Fees</label>
							<input type="text" readonly value="${course.fees}" class="form-control" />
						</div>
						<div class="form-group">
							<button class="btn btn-primary float-right" type="submit">Save Class</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>