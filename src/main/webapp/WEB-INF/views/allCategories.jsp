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
		$scope.data = ${Categories};	
		})
</script>

<body ng-app="myApp" ng-controller="myCntrl">
	<c:import url="/head" />

	<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	<h3><b>CATEGORIES</b></h3>
	</div>
		
	</div>
	<hr>

	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<a href="addCategory" class="btn btn-warning btn-block">Add Category</a>
		</div>
	</div>
	
	<br><br>
	
	<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	
	<table class="table table-hover">

			<tbody>
			
				<tr ng-repeat="x in data ">
					<td width="70%">
					<strong>{{x.CategoryName}}</strong>
					</td>
					<td><a href="${pageContext.request.contextPath}/updatecategory/{{x.CategoryId}}" class="btn btn-primary btn-xs">UPDATE</a></td>
					<td><a href="${pageContext.request.contextPath}/DeleteCategoryFromDB/{{x.CategoryId}}" class="btn btn-danger btn-xs">DELETE</a></td>
					
					</tr>
			</tbody>
		</table>
		</div>
	</div>
	
	<c:import url="/foot" />
</body>
</html>