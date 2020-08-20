<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>
<c:import url="/common/resources.jsp"></c:import>
</head>
<body>
	<c:import url="/common/menu.jsp"></c:import>
	
	<div class="container">
		<h3 class="mb-2">Products List</h3>
		<form class="form-inline mb-3">
			<div class="form-group mr-4">
				<label class="mr-2">Category</label>
				<select name="category" class="form-control">
					<option value="0">All Categories</option>
					<c:forEach items="${categories}" var="c">
						<option value="${c.id}" ${param.category eq c.id ? 'selected' : ''}>${c.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group mr-4">
				<label class="mr-2">Product</label>
				<input name="name" type="text" class="form-control" value="${param.name}" placeholder="Search products" />
			</div>
			<div class="form-group">
				<button class="btn btn-primary mr-2">
					<i class="fa fa-search"></i> Search
				</button>
				<button id="uploadBtn" class="btn btn-info" type="button">
					<i class="fa fa-upload"></i> Upload
				</button>
			</div>
		</form>
		
		<c:choose>
			<c:when test="${empty list}">
				<div class="alert alert-warning" role="alert">There is no data.</div>
			</c:when>
			
			<c:otherwise>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Category</th>
							<th>Name</th>
							<th>Price</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="p">
							<tr>
								<td>${p.id}</td>
								<td>${p.category.name}</td>
								<td>${p.name}</td>
								<td>${p.price} MMK</td>
								<td>
									<c:url value="/products/edit" var="edit">
										<c:param name="id" value="${p.id}"></c:param>
									</c:url>
									<a href="${edit}">Edit</a>
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	
	<c:url value="/products/upload" var="upload"></c:url>
	<form id="uploadForm" action="${upload}" method="post" enctype="multipart/form-data" class="d-none" >
		<input id="uploadFile" type="file" name="file" />
	</form>
	
	<script type="text/javascript">
		$(() => {
			$("#uploadBtn").click(() => $("#uploadFile").click());
			
			$("#uploadFile").change(() => $("#uploadForm").submit())
		})
	</script>
	
</body>
</html>