<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
</head>
<body>

	<c:import url="/head" />

	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<h3><b>SIGN UP</b></h3>
		</div>
	</div>
	<hr>
  
  <div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	
		<c:if test="${not empty passwordmismatch}">
			<p class="alert alert-danger" ><b>OOPS!</b>&nbsp Password Does't Match</p>
		</c:if>

		<c:if test="${not empty useralreadyexists}">	
			<p class="alert alert-danger"><b>OOPS!</b>&nbsp Username Already Exists</p>			
		</c:if>

		<c:if test="${not empty success}">			
			<p class="alert alert-success"><b>GREAT</b>&nbsp Account Created Successfully</p>			
		</c:if>
	
		<form:form class="form-horizontal" role="form" action="AddUserToDB" method="post" modelAttribute="User">
			<div class="input-group" >
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>	
				<form:input path="uName" type="text" class="form-control" placeholder="Enter your User Name"/>		
			</div>
			<span class="text text-danger"><form:errors path="uName" /></span>
			
		
			<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-envelope"></i></span> <form:input path="uEmail"
					type="email" class="form-control" placeholder="Enter your email"/>	
			</div>
			<span class="text text-danger"><form:errors path="uEmail" /></span>
			
			<div  class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <form:input path="uPassword"
					type="password" class="form-control" placeholder="Enter your password"/>
			</div>
			<span class="text text-danger"><form:errors path="uPassword" /></span>
			
			<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <form:input path="uCPassword"
					type="password" class="form-control" placeholder="Re-enter your password"/>
			</div>
			

			<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-map-marker"></i></span>
				<form:textarea class="form-control" rows="3" path="uAddress"
					placeholder="Enter your Address" name ="address"></form:textarea>		
			</div>
			<span class="text text-danger"><form:errors path="uAddress" /></span>
			

			<div class="input-group" style="margin-top: 20px">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-earphone"></i></span> <form:input path="uPhone"
					type="tel" class="form-control"
					placeholder="Enter your Phone Number"/><br>	
			</div>
			<span  class="text text-danger"><form:errors path="uPhone" /></span>
			

			<div style="margin-top: 25px" class="form-group">
				<!-- Button -->

				<div class="col-sm-12 controls">
					<input type="submit" value="Sign Up" class="btn btn-warning btn-block">
				</div>
			</div>
		</form:form>
	</div>
	</div>
<c:import url="/foot" />
</body>
</html>