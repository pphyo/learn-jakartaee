<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Order List -->
<div class="fluid card">
	<div class="card-body">
		<h5 class="card-title">
			<i class="fa fa-shopping-cart"></i> Sale <span class="float-right pr-2">${cart.total}</span>
		</h5>

		<table class="table">
			<thead>
				<tr>
					<th>Product</th>
					<th>Price</th>
					<th>Qty</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${cart.details}" var="d">
					<tr>
						<td>${d.product.name}</td>
						<td class="text-right">${d.product.price}</td>
						<td class="text-right">${d.quantity}</td>
						<td class="text-right">${d.product.price * d.quantity}</td>
					</tr>
				</c:forEach>

				<c:choose>
					<c:when test="${cart.details.size() > 0}">
						<tr class="table-primary">
							<td colspan="3">Sub Total</td>
							<td class="text-right">${cart.subTotal}</td>
						</tr>
						<tr>
							<td colspan="3">Tax</td>
							<td class="text-right">${cart.tax}</td>
						</tr>
						<tr class="table-primary">
							<td colspan="3">Total</td>
							<td class="text-right">${cart.total}</td>
						</tr>
					</c:when>
				</c:choose>
			</tbody>

		</table>
		<c:url value="/cart-action" var="cartAction"></c:url>
		<form action="${cartAction}" method="post">
			<div class="form-row">
				<div class="col">
					<!-- <i class="fa fa-trash"></i> -->
					<input class="btn btn-danger btn-block" type="submit" value="Clear" name="action" ${cart.details.size() == 0 || null eq cart ? 'disabled' : ''} />
				</div>
				<div class="col">
					<!-- <i class="fa fa-dollar"></i> -->
					<input class="btn btn-primary btn-block" type="submit" value="Paid" name="action" ${cart.details.size() == 0 || null eq cart ? 'disabled' : ''} />
				</div>
			</div>
		</form>
	</div>
</div>