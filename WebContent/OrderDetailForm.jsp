<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 상세 보기</title>
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
<style>
 div #main{
 	border-top :2px solid #f4f4f4;
 
 }

</style>
<body>
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

	</div>

</body>
</html>