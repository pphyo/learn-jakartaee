<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

</head>
<body>
	<c:if test="${empty list}">
		<c:redirect url="categories"></c:redirect>
	</c:if>
	
	<h4>Using Data Source</h4>
	<ul>
		<c:forEach items="${list}" var="c">
			<li>${c.name}</li>
		</c:forEach>
	</ul>
	
</body>
</html>