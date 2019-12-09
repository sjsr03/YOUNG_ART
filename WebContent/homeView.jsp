<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	
	<link
		href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
		rel='stylesheet' type='text/css'>
	<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/skel-panels.min.js"></script>
	<script src="js/init.js"></script>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css?after" />
	<link rel="stylesheet" href="css/style-desktop.css" />

</head>
<body class="homepage">
		<div id="header-wrapper">

		<!-- Header -->
		<div id="header">
			<div class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="index.jsp">Young Art</a>
					</h1>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="index.jsp">HOME</a></li>
						<li><a href="ProductList.do?category=painting">ART</a></li>
						<li><a href="BoardList.do">REVIEW</a></li>
						<li><a href="cart.jsp">CART</a></li>
						<c:if test="${sessionID == null}">
						<li class="active"><a href="sign_in.jsp">LOGIN</a>
						</li>
						</c:if>
						<c:if test="${sessionID != null }">
						<li><a href="member_edit.jsp"> ${sessionDisplayName} 님 </a> </li>
						<li class="active"><a href="logoutAction.do">LOGOUT</a>
						</c:if>
					</ul>
				</nav>

			</div>
		</div>
		<!-- Header -->
		
		<!-- Banner -->
			<div id="banner" style= "position: relative;
		background: #333 url(./images/banner39.jpg) no-repeat center;
		text-align: center;
		color: #fff; background-size: cover;  text-shadow: 2px 2px 2px gray;">
				<div class="container">
					<section>
						<header>
							<h2>Young Art 오픈!</h2>
							<span class="byline">고퀄리티의 작품을 저렴한 가격으로 만나보세요</span>
						</header>
						<a href="ProductList.do?category=painting" class="button medium">작품들 보러가기</a>
					</section>	
				</div>
			</div>
		<!-- /Banner -->

	</div>
	<!--  header-wrapper -->
	<!-- Extra -->
		<div id="extra">
			<div class="container">
				<div class="row">
				<c:forEach items="${mainList}" var="product">
					<section class="3u">
					
						<header>
							<h2>${product.getName()}</h2>
						</header>
						<div><img src="upload/${product.getImg()}" style=" width: auto; height: auto;
    max-width: 260px;
    max-height: 200px; box-shadow: 5px 5px 5px #000;"></div>
						<p> ${product.getContent()}</p>
					</section>
				</c:forEach>
					
				</div>
				<a href="ProductList.do?category=painting" class="button medium">더 많은 작품 보러가기</a>
			</div>
		</div>

	<!-- /Extra -->

	<!-- Main -->
		<div id="main">
		
			<div class="container">

				<section>
					<header>
						<h2>오늘의 리뷰</h2>
						<span class="byline">내가 구매한 작품을 소개합니다</span>
					</header>
				</section>

				<div class="row">
				<c:forEach items="${reviewList}" var="review">
							
					<section class="6u left">
						<a href="review_view.do?num=${review.getI()}" class="image full"><img src="upload/${review.getImg()}" alt=""></a>
						<p>${review.getContent()}</p>
					</section>
				</c:forEach>
				</div>
				<div class="divider"></div>
			</div>
		</div>
	<!-- /Main -->

	<!-- Featured -->
		<div id="featured">
			<div class="container">
				<section>
					<header>
						<h2>가장 사랑받는 작품</h2>
						<span class="byline">가장 많은 추천을 받은 작품 1,2,3위를 소개합니다</span>
					</header>
				</section>
				<div class="row">
				<c:forEach items="${likeyList}" var="product">
					<section class="4u">
						<a href="#" class="image full"><img src="upload/${product.getImg()}" alt=""></a>
						<p style="font-size:17px"> ${product.getName()} / ${product.getArtist()} / ♥ ${product.getLikey()}</p>
						<p><a href="ProductView.do?num=${product.getI()}" class="button">View Full Details</a></p>
					</section>
				</c:forEach>

				</div>
			</div>
		</div>
	<!-- /Featured -->


	<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>


	</body>
</html>
</html>