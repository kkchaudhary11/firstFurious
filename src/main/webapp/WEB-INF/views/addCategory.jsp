<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
				<b>ADD CATEGORY</b>
			</h3>
		</div>
	</div>
	<hr>

	<div class="col-md-4 col-md-offset-4">
		<form:form class="form-horizontal" role="form" method="post" action="AddCategoryToDB" modelAttribute="Category">
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="cName" type="text" class="form-control" placeholder="Enter Category Name" />
			</div>
			<div style="margin-top: 10px" class="col-lg-12">
				<!-- Button -->
			
					<input type="submit" value="Add" class="btn btn-warning btn-block" />
							</div>
		</form:form>
	</div>

	<c:import url="/foot" />

</body>
</html>