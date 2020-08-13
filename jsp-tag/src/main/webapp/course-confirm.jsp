<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
</head>
<body>

	<jsp:useBean id="course" class="com.jdc.stu.model.entity.Course" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="course"/>
	<jsp:forward page="courses"></jsp:forward>

</body>
</html>