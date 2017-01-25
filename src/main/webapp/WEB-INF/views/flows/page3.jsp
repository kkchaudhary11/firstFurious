
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="/head-meta" />

</head>


<script type="text/javascript">
	'use strict';
	var myApp = angular.module('myApp', []);
	///////////////
	myApp
			.factory(
					'UserService',
					[
							'$http',
							'$q',
							function($http, $q) {
								return {
									fetchAllItems : function() {
										return $http
												.post(
														'http://localhost:8090/firstFurious/flows/fetchAllItems/')
												.then(
														function(response) {
															return response.data;
														},
														function(errResponse) {
															console
																	.error('Error while sending data');
															return $q
																	.reject(errResponse);
														});
									}
								};
							} ]);
	///////////////
	myApp
			.controller(
					"abc",
					[
							'$scope',
							'UserService',
							function($scope, $UserService) {
								$scope.TotalPrice = 0;
								$scope.shippingAddress = '';
								$scope.billingAddress = '';
								$UserService
										.fetchAllItems()
										.then(
												function(response) {
													//console.log( response );
													try {
														$scope.data = response;
													} catch (e) {
														$scope.data = [];
													}
													console.log($scope.data);
													for (var i = 0; i < $scope.data.length; i++) {
														try {
															$scope.TotalPrice += parseInt($scope.data[i].ProductQty
																	* $scope.data[i].ProductPrice);
															$scope.shippingAddress = $scope.data[i].ShippingAddress;
															$scope.billingAddress = $scope.data[i].BillingAddress;
														} catch (e) {
															console.log(e);
														}
													}
												},
												function(errResponse) {
													console
															.error('Error while Sending Data.');
												});
							} ]);
	
	
	
	function printDiv(divName) {
	     var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;

	     document.body.innerHTML = printContents;

	     window.print();

	     document.body.innerHTML = originalContents;
	}
</script>


<body ng-app="myApp" ng-controller="abc">
	<c:import url="/head" />
	<div class="container">
		<a href="${flowExecutionUrl}&_eventId=BackToConfirmDetails"
			class="btn btn-danger btn pull-left">Back To Update Address</a>
		<a href="${flowExecutionUrl}&_eventId=ConfirmOrder"
			class="btn btn-warning btn pull-right">Confirm Order</a>
	</div>

<hr/>

	<div class="container">
	
	<div class="col-md-6 col-md-offset-3" id="printableArea">
		
		<div class="panel panel-default">
		<div class="panel-heading">Invoice</div>
		<table width="100%" class="table">
		 	<thead align="center">
				<tr >
					<th></th>
					<th></th>
					<th></th>
					<th style="text-align: center">Quantity</th>
					<th style="text-align: center">Price </th>
				</tr>
			</thead>
			
			<tbody align="center">
			<tr ng-repeat="x in data" >
				<td>{{$index+1}}</td>
				<td><img ng-src="${pageContext.request.contextPath}/{{ x.ProductImage }}" height=" 30px" width="80px" class="img img-responsive img-thumbnail">
					</td>
				<td>{{x.ProductName}}</td>
				<td >{{x.ProductQty}} </td>
				<td>&#8377{{x.ProductPrice}}</td>
			</tr>
			<tr align="center">
			<td colspan="3"></td>
			<td>
			<b>Total Price:</b>
				</td><td>
				<b>&#8377{{TotalPrice}}</b>
			</td>
			</tr>
			</tbody>
			</table>
			<br/>
			
				<div style="margin:10px">
				<b>Shipping Address:</b><br/>
				{{shippingAddress}}
				</div>
				<div  style="margin:10px">
				<b>Billing Address:</b><br/>
				{{billingAddress}}
				</div>
			
		</div>
		
	</div>
	
	<input type="button" onclick="printDiv('printableArea')" value="print a div!" />
	
	<%-- 
	--------------------------------------
	
	
	<div class="col-md-6">

		<div ng-repeat="x in data" >
		<div class="panel panel-default">
		<div class="panel-heading">ITEM {{$index+1}}</div>
			<div class="panel-body">
				<div class="col-md-6">
				 	<img ng-src="${pageContext.request.contextPath}/{{ x.ProductImage }}" height=" 80px" width="170px" class="img img-responsive img-thumbnail">
				</div>
				<div class="col-mad-6">
					<div><span style="font-size:20px"><strong>{{x.ProductName}}</strong></span></div>
					
					<div><b>Quantity :{{x.ProductQty}} </b></div>
					
					<div><span style="font-size:15px" class="text-warning"><strong>&#8377  {{x.ProductPrice}}</strong></span></div>
				   
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div class="panel-group">
	
		
			
		<div class="panel panel-warning">
	      <div class="panel-heading">SHIPPING ADDRESS</div>
	      <textarea rows="4" placeholder="SHIPPING ADDRESS"
						class="form-control" style="resize: none;"
						ng-model="shippingAddress" disabled></textarea>
				
		</div>
		<br>
		<div class="panel panel-warning">
		  <div class="panel-heading">BILLING ADDRESS</div>
			
				<textarea rows="4" placeholder="BILLING ADDRESS"
					class="form-control" style="resize: none;"
					ng-model="billingAddress" ng-disabled="true"></textarea>
			
					
			</div>
			
	<br>
			<div class="panel panel-danger">
		  		<div class="panel-heading">TOTAL PRICE</div><strong> 
			<textarea rows="1" class="form-control"  style="resize: none;" ng-model="TotalPrice" ng-disabled="true">&#8377</textarea></strong>
				</div>
			</div>
			
		
					
	
	
	</div> --%>
	
	
	</div>
	
</body>

</html>
