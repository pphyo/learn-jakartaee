<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Search Product -->
<div class="fluid card">
	<div class="card-body">
		<h5 class="card-title">Search Product</h5>

		<c:url value="/pos-search" var="search"></c:url>
		<form action="${search}" class="form form-row ml-1">
			<div class="form-row">
				<div class="form-group mr-3">
					<select name="category"	class="form-control">
						<option value="0">All Categories</option>
						<c:forEach items="${categories}" var="c">
							<option value="${c.id}"
								${param.category eq c.id ? 'selected' : ''}>${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group mr-3">
					<input name="name" type="text" class="form-control" placeholder="Enter product name" value="${param.name}" />
				</div>
				<div class="form-group">
					<button class="btn btn-primary">
						<i class="fa fa-search"></i> Search
					</button>
				</div>
			</div>
		</form>
	</div>
</div>

<table class="table mt-2">
	<thead>
		<tr>
			<th>ID</th>
			<th>Category</th>
			<th>Product</th>
			<th class="text-right">Price</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${products}" var="p">
			<tr>
				<td>${p.id}</td>
				<td>${p.category.name}</td>
				<td>${p.name}</td>
				<td class="text-right">${p.price}</td>
				<td class="text-right">
					<c:url value="/add-to-cart" var="addToCart">
						<c:param name="id" value="${p.id}"></c:param>
					</c:url>
					<a href="${addToCart}"><i class="fa fa-cart-plus"></i></a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	
</table>