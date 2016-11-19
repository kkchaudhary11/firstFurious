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

	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="resources/images/carousel_img2.jpg" alt="Tesla"
						width="1200" height="570">
				</div>

				<div class="item">
					<img src="resources/images/carousel_img6.jpg" alt="Mini_Cooper_Yellow"
						width="1200" height="570">
				</div>

				<div class="item">
					<img src="resources/images/carousel_img3.jpg" alt="tesla model 3"
						width="1200" height="570">
				</div>

				<div class="item">
					<img src="resources/images/carousel_img5.jpg" alt="range rover"
						width="1200" height="570">
				</div>

				<div class="item">
					<img src="resources/images/carousel_img7.jpg" alt="mini cooper red"
						width="1200" height="570">
				</div>

				<div class="item">
					<img src="resources/images/carousel_img10.jpg" alt="two cars"
						width="1200" height="570">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<br>
	<br>

	<div class="container-fluid">


		<div class="row">
			<center>
				<div class="col-sm-4">

					<div class="row">
						<div class="col-sm-12">

							<span class="glyphicon glyphicon-ok"></span>

						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="margin-bottom: 50px;">
							<h3>Get the verified information</h3>
							All the information in the website is true and verified by the
							administrator time to time.

						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-12">
							<span class="glyphicon glyphicon-fire"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="margin-bottom: 50px;">
							<h3>Find most trending</h3>
							Find the best things. Market is analysed by the professionals and
							gives the best things to you.
						</div>
					</div>

				</div>
				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-12">
							<span class="glyphicon glyphicon-wrench"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<h3>Search your best</h3>
							You can find the most relevent things easily.
						</div>
					</div>
				</div>
			</center>
		</div>

	</div>

	<c:import url="/foot" />
</body>
</html>