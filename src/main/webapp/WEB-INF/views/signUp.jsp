<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

	<div class="col-md-4 col-md-offset-4">
		<form id="loginform" class="form-horizontal" role="form">
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="signup-name" type="text"
					class="form-control" name="name" value=""
					placeholder="Enter your name">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-envelope"></i></span> <input id="signup-email"
					type="email" class="form-control" name="email"
					placeholder="Enter your email">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input id="signup-password"
					type="password" class="form-control" name="password"
					placeholder="Enter your password">
			</div>
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input id="signup-password_cnfrm"
					type="password" class="form-control" name="password_cnfrm"
					placeholder="Re-enter your password">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-map-marker"></i></span>
				<textarea class="form-control" rows="3" id="signup-address"
					placeholder="Enter your Address" name ="address"></textarea>
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-earphone"></i></span> <input id="signup-ph_number"
					type="number" class="form-control" name="ph_number"
					placeholder="Enter your Phone Number">
			</div>

			<div style="margin-top: 10px" class="form-group">
				<!-- Button -->

				<div class="col-sm-12 controls">
					<a id="btn-signup" href="#" class="btn btn-warning btn-block">Sign Up</a>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="/foot" />
</body>
</html>