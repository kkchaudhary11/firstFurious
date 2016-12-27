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
		
		
		<div class="container">
		<div class="col-md-12">
		<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-search"></i></span> <input
					type="text" class="form-control"  ng-model="searchText" placeholder="Search Products" autofocus/>
			</div>
		</div>
	</div>
	
	
	<br><br>
	
	
	<div class="container">

		<div class="col-md-4" ng-repeat="x in data | filter:searchText">
			<div class="panel panel-default">
			
	<div class="panel-body">
			<div class="col-md-12">
				<img class="img-rounded" ng-src="${pageContext.request.contextPath}/{{ x.pImage }}" height=" 150px" width="280px">

				</div>
					<div class="col-md-12" >
					<h4><strong>{{x.pName}}</strong></h4>
					</div>
					<div class="col-md-12" style="margin-bottom:10px">
					<div class="col-md-6"  >
					<span class="badge" style="margin-top:5px">{{x.pCategory}}</span>
					<span class="badge" style="margin-top:5px">{{x.pBrand}}</span>
					</div>
					<div class="col-md-6"  style="text-align: right;">
					<img src="${pageContext.request.contextPath}/resources/images/{{x.pId}}.jpg" height=30px width=30px  onerror="this.src='${pageContext.request.contextPath}/resources/images/logo.png'" >
		
					</div>
					
					</div>
					
				
				
				<div class="col-md-6" style="text-align: left;"  >
				<span  class="text-warning" ><strong>{{x.pPrice|currency:"&#8377":2}}</strong></span>
				
				
				</div>
				<div class="col-md-6" style="text-align: right;" >
				<span ><strong>Quantity:&nbsp{{x.pQuantity}}</strong></span>
				</div>
				
				<%
						if(request.isUserInRole("USER")){
					%>
				<div class="col-md-12" align="center" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/view/{{x.pId}}" class="btn btn-warning btn-block btn-xs">VIEW</a>
					</div>
					<%} %>
					
					<%
						if(request.isUserInRole("ADMIN"))
						{
					%>
				<div class="col-md-12" align="center" style="margin-top:10px;">
				
				<div class="col-md-6" style="text-align: left;" >
				<a href="${pageContext.request.contextPath}/updateproduct/{{x.pId}}" class="btn btn-primary btn-xs btn-block">UPDATE</a>
				
				
				</div>
				<div class="col-md-6" style="text-align: right;" >
				<a href="${pageContext.request.contextPath}/DeleteProductFromDB/{{x.pId}}" class="btn btn-danger btn-xs btn-block">DELETE</a>
				</div>
				</div>
				
					
					<%} %>
				</div>
				</div>	
		</div>
		
	</div>
	
	
	
	<%-- <div class="container-fluid">	
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
	</div> --%>
	<c:import url="/foot" />
</body>
</html>