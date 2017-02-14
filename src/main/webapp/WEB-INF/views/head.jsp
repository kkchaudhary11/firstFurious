<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>



</style>

<!-- navigation bar  -->

<nav class="navbar  navbar-inverse navbar-static-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index" style="margin-top: -10px;"><img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="logo" width="60" height="40"></a>
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


				

				<%
					if (request.isUserInRole("ROLE_ADMIN")) {
				%>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/allCategories.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/allCategories">Categories</a></li>
				<%
					}
				%>




				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/allProducts.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/allProducts">Products</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">


				<c:choose>
					<c:when test="${not empty pageContext.request.userPrincipal.name }">
					
					<%
					if (request.isUserInRole("ROLE_USER")) {
				%>
				<li
					<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/initiateFlow.jsp'}">class="active"</c:if>><a
					href="${pageContext.request.contextPath}/initiateFlow"> View
						Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i>
				</a></li>

				<%
					}
				%>
					


						<li
							<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/signUp.jsp'}">class="active"</c:if>><a
							href="${pageContext.request.contextPath}/index"><strong>
									${pageContext.request.userPrincipal.name}</strong></a></li>
						<li
							<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/loginpage.jsp'}">class="active"</c:if>><a
							href="${pageContext.request.contextPath}/logout"><span
								class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
					</c:when>

					<c:otherwise>
						<li
							<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/signUp.jsp'}">class="active"</c:if>><a
							href="${pageContext.request.contextPath}/signup"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li
							<c:if test="${pageContext.request.requestURI eq '/firstFurious/WEB-INF/views/loginpage.jsp'}">class="active"</c:if>><a
							href="${pageContext.request.contextPath}/loginpage"><span
								class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
					</c:otherwise>

				</c:choose>


			</ul>
		</div>
	</div>
</nav>




