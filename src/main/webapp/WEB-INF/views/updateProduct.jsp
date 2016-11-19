<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/head-meta"/>
</head>
<body>
	<c:import url="/head" />
	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<h3>
				<strong>UPDATE CATEGORY</strong>
			</h3>
		</div>
	</div>

<hr>

	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">

			<form:form method="POST" action="${pageContext.request.contextPath}/UpdateProductToDB" modelAttribute="Product">
                                    	
          
               <form:label path="pName">Product Name</form:label>
                 <form:input type="text" path="pName" class="form-control"/>
				<br>
				<form:input path="pId" type="hidden" />
				<form:label path="pName">Product Category</form:label>
				<form:input type="text" path="pCategory" class="form-control"/>
				<br>
				<form:label path="pName">Product Description</form:label>
				<form:input type="text" path="pDescription" class="form-control"/>
				<br>
				<form:label path="pName">Product Quantity</form:label>
				<form:input type="text" path="pQuantity" class="form-control"/>
				<br>
				<form:label path="pName">Product Price</form:label>
				<form:input type="text" path="pPrice" class="form-control"/>

				<br>
                    	<input type="submit" class="btn btn-success btn-block" value="Update"/>
                    
                    </form:form>
		</div>


	</div>


	<c:import url="/foot" />
</body>

</html>