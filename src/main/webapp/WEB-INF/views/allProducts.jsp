<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
</head>

<script type="text/javascript">
	var products = ${Products};
	var myApp = angular.module('myApp', []);
	myApp.controller("myCntrl", function($scope) {
	$scope.data = products;	
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

		<%
			if(request.isUserInRole("ADMIN"))
			{
		%>
					

	<div class="container-fluid" >
		<div class="col-md-4 col-md-offset-4">
			<a href="addProduct" class="btn btn-warning btn-block">Add Product</a>
		</div>
	</div>
	
	
		<%
				}
		%>
		
		
		<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
		<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-search"></i></span> <input
					type="text" class="form-control"  ng-model="searchText" placeholder="Search Products" autofocus/>
			</div>
		</div>
	</div>
	
	
	<br><br>
	
	<div class="container-fluid">
	<div class="col-md-12">
	
	
	<table class="table table-hover">
			<tbody>
			<tr>			
				<th align="center">Product Name</th>
				<th align="center">Product Category</th>
				<th align="center">Product Description</th>
				<th align="center">Product Quantity</th>
				<th align="center">Product Price</th>
				<th align="center">Product Image</th>
			
			</tr>
				<tr ng-repeat="x in data | filter:searchText">
					<td >{{x.pName}}</td>
					<td >{{x.pCategory}}</td>
					<td>{{x.pDescription}}</td>
					<td align="center">{{x.pQuantity}}</td>
					<td align="center">{{x.pPrice|currency:"&#8377":2}}</td>
					<td align="center"><img
						ng-src="${pageContext.request.contextPath}/{{ x.pImage }}" height=" 50px" width="100px"></td>

					<%
						if(request.isUserInRole("ADMIN"))
						{
					%>
					
					<td><a href="${pageContext.request.contextPath}/updateproduct/{{x.pId}}" class="btn btn-primary btn-xs">UPDATE</a></td>
					<td><a href="${pageContext.request.contextPath}/DeleteProductFromDB/{{x.pId}}" class="btn btn-danger btn-xs">DELETE</a></td>						
					<%
					}
					%>
					
					<%
						if(request.isUserInRole("USER")){
					%>
					
					<td><a href="${pageContext.request.contextPath}/view/{{x.pId}}" class="btn btn-warning">VIEW</a></td>						
					
						<%
					}
					%>				
					</tr>
			</tbody>
		</table>
		
		</div>
	</div>
	<c:import url="/foot" />
</body>
</html>