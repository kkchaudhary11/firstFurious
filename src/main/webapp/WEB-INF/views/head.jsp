<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.glyphicon.glyphicon-wrench, .glyphicon.glyphicon-fire, .glyphicon.glyphicon-ok
	{
	color: #f26522;
	font-size: 100px;
}

.glyphicon.glyphicon-chevron-left, .glyphicon.glyphicon-chevron-right {
	color: #f26522;
}



html {
	position: relative;
	min-height: 100%;
}

body {
	/* Margin bottom by footer height */
	margin-bottom: 80px;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	text-align: center;
	color: #dddddd;
	/* Set the fixed height of the footer here */
	height: 50px;
	background-color: #000000;
}

.navbar .navbar-nav>li>a:hover, .navbar .navbar-nav>li>a:focus {
	color: #f26522;
}

.navbar .navbar-nav>.active>a, .navbar .navbar-nav>.active>a:hover,
	.navbar .navbar-nav>.active>a:focus {
	color: #f26522;
	background-color: #000000;
}

.navbar .navbar-toggle {
	border-color: #f26522;
}

.navbar .navbar-toggle:hover, .navbar .navbar-toggle:focus {
	background-color: #f26522;
}

#fa_color {
    color: #f26522;
 
    font-size: 1.5em;
}

</style>

<!-- navigation bar  -->

<nav class="navbar  navbar-inverse navbar-static-top"  role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index" style="margin-top: -10px;"><img
				src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" width="60" height="40"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/index.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/index">Home</a></li>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/aboutUs.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/contactUs.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/contactus">Contact Us</a></li>
					
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/allCategories.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/allCategories">Categories</a></li>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/allProducts.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/allProducts">Products</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/signUp.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/loginpage.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/loginpage"><span class="glyphicon glyphicon-log-in"></span>
						Sign In</a></li>
			</ul>
		</div>
	</div>
</nav>




