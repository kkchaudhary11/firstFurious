<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/head-meta"/>




<title>QueenS</title>
</head>

<script type="text/javascript">
	var myApp = angular.module("myApp",[]);
	
	myApp.factory("UserService",["$http","$q",function($http,$q)
	{
		var target_url = 'http://localhost:8090/firstFurious/';
		
		return{
			
			deleteFromCart : function(item) {
				return $http.post(target_url + 'flows/deleteFromCart/',item)
						.then(
								function(response) 
								{
									return response.data;
								},
								function(errResponse)
								{
									console.error('Error while sending data');
									return $q.reject(errResponse);
								});
			},
			
			
			
			fetchAllItems : function()
			{
				return $http.post( target_url + 'REST/fetchAllItems' ).then(
					function( response ){
						return response.data;
					},
					function( errResponse ){
						return $q.reject(errResponse);
					}
				);
			}
		};
	}]);
	
	myApp.controller("abc",["$scope","UserService",function($scope,$UserService){
		
		
		$scope.deleteFromCart = function(cartId) {
			$UserService.deleteFromCart(cartId).then(
					function(response) {
						try {
							$scope.data = response;
						} catch (e) {
							$scope.data = [];
						}
						console.log($scope.data);
					},
					function(errResponse) {
						console.error('Error while Sending Data.');
					});
		}
		
		
		$UserService.fetchAllItems().then(function(response)
		{
			//console.log(response);
			$scope.data = response;
		},function(errResponse)
		{
			console.log('Error fetching Items');
		});
	}]);
</script>


<body ng-app="myApp" ng-controller="abc">
<c:import url="/head"/>
	<div class="container-fluid">
		<a href="${pageContext.request.contextPath}/allProducts"
			class="btn btn-danger btn pull-left"><span
			class="glyphicon glyphicon-chevron-left"></span>BACK TO PRODUCT</a>


		<a href="${flowExecutionUrl}&_eventId=goToCheckout"
			class="btn btn-warning  btn pull-right">CHECK OUT<span
	
			class="glyphicon glyphicon-chevron-right"></span></a>
			
			</div>
<hr/>

	<div class="container-fluid">
	<div class="col-md-12">
	
	<table class="table table-hover">
			<tbody>
			<tr>			
				<th>Product Name</th>
				<th>Product Qty</th>
				<th>Product Price</th>
				<th>Product Image</th>
			</tr>
				<tr ng-repeat="x in data ">
					<td>
				
					{{x.ProductName}}
					</td>
					<td>{{x.ProductQty}}</td>
					<td>{{x.ProductPrice}}</td>
					<td><img
					ng-src="${pageContext.request.contextPath}/{{ x.ProductImage }}" height=" 50px" width="100px"></td>
                    
                    
					<td><a href="${pageContext.request.contextPath}/view/{{x.ProductId}}" class="btn btn-warning btn-xs">VIEW</a></td>
					
					<td><input type="button" value="Delete from Cart"
					class="btn btn-danger btn-xs" ng-click="deleteFromCart(x.CartId)" /></td>
					</tr>
			</tbody>
		</table>
		</div>
		</div>
	
</body>
</html>