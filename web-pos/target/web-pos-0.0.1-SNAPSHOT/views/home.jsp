<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>POS App</title>
<c:import url="/common/resources.jsp"></c:import>
</head>
<body>
	
	 <c:import url="/common/menu.jsp"></c:import>
	 
	 <div class="container">
	 	<div class="row">
	 		<div class="col-7">
	 			<c:import url="/views/sale-home/product-search.jsp"></c:import>	 			
	 		</div>
	 		
	 		<div class="col-5">
	 			<c:import url="/views/sale-home/sale-detail.jsp"></c:import>
	 		</div>
	 	</div>
	 </div>
</body>
</html>