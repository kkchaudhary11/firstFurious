<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
</head>

<script type="text/javascript">
	var myApp = angular.module('myApp', []);
	myApp.controller("myCntrl", function($scope) {
	$scope.data = ${Products};	
	})
</script>

<body ng-app="myApp" ng-controller="myCntrl">
	<c:import url="/head" />

	<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	<h3><b>PRODUCTS</b></h3>
	</div>
		
	</div>
	<hr>

	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<a href="addProduct" class="btn btn-warning btn-block">Add Product</a>
		</div>
	</div>
	
	<br><br>
	
	<div class="container-fluid">
	<div class="col-md-12">
	
	<table class="table table-hover">
			<tbody>
			<tr>			
				<th>Product Name</th>
				<th>Product Category</th>
				<th>Product Description</th>
				<th>Product Quantity</th>
				<th>Product Price</th>
				<th>Product Image</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
				<tr ng-repeat="x in data ">
					<td>{{x.ProductName}}</td>
					<td>{{x.ProductCategory}}</td>
					<td>{{x.ProductDescription}}</td>
					<td>{{x.ProductQuantity}}</td>
					<td>{{x.ProductPrice}}</td>
					<td><img
						ng-src="${pageContext.request.contextPath}/{{ x.flag }}" height=" 50px" width="100px"></td>

					<td><a href="${pageContext.request.contextPath}/updateproduct/{{x.ProductId}}" class="btn btn-primary btn-xs">UPDATE</a></td>
					<td><a href="${pageContext.request.contextPath}/DeleteProductFromDB/{{x.ProductId}}" class="btn btn-danger btn-xs">DELETE</a></td>						
					</tr>
			</tbody>
		</table>
		</div>
	</div>
	<c:import url="/foot" />
</body>
</html>