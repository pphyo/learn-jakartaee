<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<c:import url="/common/resources.jsp"></c:import>
</head>
<body>
	<c:import url="/common/menu.jsp"></c:import>
	
	<div class="container">
		<h3>${title}</h3>
		<div class="row">
			<div class="col-4">
				<c:url value="/products" var="save"></c:url>
				<form action="${save}" method="post" class="form">
					<input type="hidden" value="${product.id}" name="id" />
					
					<div class="form-group">
						<label>Category :</label>
						<select name="category" class="form-control">
							<c:forEach items="${categories}" var="c">
								<option value="${c.id}" ${c.id eq product.category.id ? 'selected' : ''}>${c.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="n">Name :</label>
						<input name="name" value="${product.name}" type="text" class="form-control" id="n" required placeholder="Enter name" />
					</div>
					<div class="form-group">
						<label for="p">Price :</label>
						<input name="price" value="${product.price}" type="number" class="form-control" id="p" required placeholder="Enter price" />
					</div>
					<div class="form-group">
						<button class="btn btn-primary" type="submit"><i class="fa fa-save"></i> Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>