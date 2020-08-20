<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>History</title>
<c:import url="/common/resources.jsp"></c:import>
</head>
<body>
	
	 <c:import url="/common/menu.jsp"></c:import>
	 
	<div class="container">
		<h3>Sale History</h3>
		<c:url value="/sales" var="sales"></c:url>
		<form action="${sales}" class="form-inline">
		
			<div class="form-group mr-4">
				<label for="from" class="mr-2">Date From</label>
				<input type="date" id="from" class="form-control" name="from" />
			</div>
			
			<div class="form-group mr-4">
				<label for="to" class="mr-2">Date To</label>
				<input type="date" id="to" class="form-control" name="to" />
			</div>
			
			<div class="form-group">
				<button class="btn btn-primary"><i class="fa fa-search"></i> Search</button>
			</div>
		
		</form>
		
		<table class="mt-4 table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Sale Date</th>
					<th class="text-right">Sub Total</th>
					<th class="text-right">Tax</th>
					<th class="text-right">Total</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="s">
					<tr>
						<td>${s.id}</td>
						<td>${s.date}</td>
						<td class="text-right">${s.subTotal}</td>
						<td class="text-right">${s.tax}</td>
						<td class="text-right">${s.total}</td>
						<td class="text-right">
							<c:url value="/sales/edit" var="editSale">
								<c:param name="id" value="${s.id}"></c:param>
							</c:url>
							<a href="${editSale}" title="Edit Sale"><i class="fa fa-pencil"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		
	</div>	 
	 
</body>
</html>