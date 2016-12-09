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
			<h3>
				<b>CONTACT US</b>
			</h3>
		</div>
	</div>
	<hr>

	<div class="col-md-4 col-md-offset-4">
		<form id="loginform" class="form-horizontal" role="form" action="sendQuery" method="post">
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="contact-name" type="text"
					class="form-control" name="name"
					placeholder="Enter your name">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-envelope"></i></span> <input id="contact-email"
					type="email" class="form-control" name="email"
					placeholder="Enter your email">
			</div>
			
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-envelope"></i></span> <input 
					type="text" class="form-control" name="subject"
					placeholder="Enter Query Subject">
			</div>

			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i
					class="glyphicons glyphicons-pencil"></i></span>
				<textarea class="form-control" rows="3" id="contact-message" name="message"
					placeholder="Enter your Message"></textarea>
			</div>

			<div style="margin-top: 10px" class="form-group">
				<!-- Button -->
				<div class="col-sm-12 controls">
					<input type="submit" class="btn btn-warning btn-block" value="SEND">
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="/foot" />
</body>
</html>