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
				<b>ADD PRODUCT</b>
			</h3>
		</div>
	</div>
	<hr>

<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
		<form:form class="form-horizontal" role="form" method="post" action="AddProductToDB" modelAttribute="Product" enctype="multipart/form-data">
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pName" type="text" class="form-control" placeholder="Enter Product Name" />
			</div>
			
			  <div style="margin-bottom: 25px" class="col-lg-12">
			<form:select path="pCategory" class="form-control">
                    		
                    	<c:choose>
                    	<c:when test="${not empty AllCategories }">
                    	<c:forEach var="cat" items="${AllCategories}">
                    	<form:option value="${cat}"/>
                    	</c:forEach>
                    	</c:when>
                    	
                    	<c:otherwise>
                    	   	<form:option value="None"/>
                    	</c:otherwise>
                    	
                    	</c:choose>
                    		
                    		
                    	</form:select>
             				</div>
                  
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:textarea path="pDescription" class="form-control" rows="3" 
					placeholder="Enter Product Description"></form:textarea>
			
				</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pPrice" type="text" class="form-control" placeholder="Enter Product Price" />
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pQuantity" type="number" class="form-control" placeholder="Enter Product Quantity" />
			</div>
			
			<div style="margin-bottom: 25px" class="col-lg-12">
			
			<label class="btn btn-default btn-file">
			   Select Product Image <form:input path="ProductFile" type="file" style="display: none;" id="imageFile" 
			   onchange="filePathDisp()" /> 
			</label><br>
			<span id =file_location>&nbsp</span>
			<script type="text/javascript">
					function filePathDisp() {
							document.getElementById("file_location").innerHTML = $('#imageFile').val();}
			</script> 
									
						
			</div>
		
			
			<div style="margin-top: 10px" class="col-lg-12">
				<!-- Button -->
			
					<input type="submit" value="Add" class="btn btn-warning btn-block" />
							</div>
		</form:form>
	</div>
</div>	

	<c:import url="/foot" />

</body>
</html>