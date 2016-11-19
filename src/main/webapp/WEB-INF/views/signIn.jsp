<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<h3>
				<b>SIGN IN</b>
			</h3>
		</div>
	</div>
	<hr>

	<div class="col-md-4 col-md-offset-4">
		<form id="loginform" class="form-horizontal" role="form">
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="signin-username"
					type="text" class="form-control" name="username" value=""
					placeholder="username or email">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input id="signin-password"
					type="password" class="form-control" name="password"
					placeholder="password">
			</div>
			
			<div style="margin-top: 10px" class="form-group">
				<!-- Button -->
				<div class="col-sm-12 controls">
					<a id="btn-login" href="#" class="btn btn-warning btn-block">Sign
						In </a>
				</div>
			</div>
		</form>
	</div>

	<c:import url="/foot" />

</body>
</html>