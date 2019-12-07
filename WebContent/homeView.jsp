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
	<link rel="stylesheet" href="css/style.css" />
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
						<li><a href="cartList.do">CART</a></li>
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
			<div id="banner">
				<div class="container">
					<section>
						<header>
							<h2>Young Art 오픈!</h2>
							<span class="byline">고퀄리티의 작품을 저렴한 가격으로 만나보세요</span>
						</header>
						<a href="#" class="button medium">작품들 보러가기</a>
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
					<section class="3u">
					
						<header>
							<h2>Mauris vulputate</h2>
						</header>
						<span class="fa fa-magic"></span>
						<p>Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
					</section>
					<section class="3u">
						<header>
							<h2>Fusce ultrices</h2>
						</header>
						<span class="fa fa-wrench"></span>
						<p>Pellentesque tristique ante ut risus. Integer risus congue. Suspendisse dictum porta lectus.</p>
					</section>
					<section class="3u">
						<header>
							<h2>Maecenas luctus</h2>
						</header>
						<span class="fa fa-chain"></span>
						<p>Suspendisse dictum porta lectus. Integer nisl risus, sagittis convallis, rutrum congue nibh. </p>
					</section>
					<section class="3u">
						<header>
							<h2>Donec dictum</h2>
						</header>
						<span class="fa fa-briefcase"></span>
						<p>In posuere eleifend odio quisque semper augue mattis wisi maecenas ligula augue praesent.</p>
					</section>
				</div>
				<a href="#" class="button medium">더 많은 작품 보러가기</a>
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
					<section class="6u right">
						<a href="#" class="image full"><img src="images/pics05.jpg" alt=""></a>
						<p>This is <strong>Imagination</strong>, a responsive HTML5 site template freebie by <a href="http://templated.co">TEMPLATED</a>. Released for free under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so use it for whatever (personal or commercial) &ndash; just give us credit! Check out more of our stuff at <a href="http://templated.co">our site</a> or follow us on <a href="http://twitter.com/templatedco">Twitter</a>.</p>
					</section>				
					<section class="6u left">
						<a href="#" class="image full"><img src="images/pics06.jpg" alt=""></a>
						<p>Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Pellentesque adipiscing purus ac magna. Pellentesque habitant morbi tristique senectus aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi purus ac magna. Pellentesque habitant morbi</p>
					</section>
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
					<section class="4u">
						<a href="#" class="image full"><img src="images/pics01.jpg" alt=""></a>
						<p>Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
						<p><a href="#" class="button">View Full Details</a></p>
					</section>
					<section class="4u">
						<a href="#" class="image full"><img src="images/pics03.jpg" alt=""></a>
						<p>Pellentesque tristique ante ut risus. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
						<p><a href="#" class="button">View Full Details</a></p>
					</section>
					<section class="4u">
						<a href="#" class="image full"><img src="images/pics04.jpg" alt=""></a>
						<p>Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
						<p><a href="#" class="button">View Full Details</a></p>
					</section>
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