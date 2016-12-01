<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="/head-meta"/>
</head>
<body>
<c:import url="/head"/>

<div class="container-fluid">
		<a href="${pageContext.request.contextPath}/allProduct"
			class="btn btn-danger  btn pull-left">Back To product</a>


		<a href="${flowExecutionUrl}&_eventId=goToCheckout"
			class="btn btn-warning  btn pull-right">Check Out</a>
			</div>
			
	<c:import url="/foot"/>
</body>
</html>