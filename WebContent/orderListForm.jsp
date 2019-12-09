<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>주문목록</title>
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
 
 div #main-root{
 	width: 700px;
 	margin: 0 auto;
 
 }
 
 .list {
 	border: 1px solid #e7e7e7;
 }
 
 img {
 	width: 100px;
 	height: 100px;
 
 }
 
 #list-title {
 	font-size: 23px;
 	margin-bottom : 10px;
 }
 table {
 	width: 700px;
 	
 
 }
 
 td {
 	padding: 10px;
 
 	vertical-align: middle;
 
 }
 
 .title-tr{
 	background-color : #f9f9f9;
 	border-bottom : 1px solid #e7e7e7;
 }
 
 .product-unit{
 	border: 1px solid #cecece;
 	box-shadow : 0 2px 1px -1px rgba(0,0,0,0.1);
 	table-layout: fixed;
 	border-collapse : seperate;
 	width: 100%;
 	margin: 0 auto;
 
 }
 
 .detail {
 
	border: none;
	background-color: transparent;
	color :#286BC8;
 }
 
 .review{
 border: none;
 background-color: transparent;
 color : #FF5733;
 
 
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
	
	<div id="main">
		<div id="main-root">
			
				<!-- 날짜별 주문목록 -->
				<h1 id="list-title">주문목록</h1>
				<c:forEach items="${map.keySet()}" var="key">
				
				<div class="ProductListByOrderCD">
				<table class="list">
					<tr class="title-tr"><td>주문번호 : ${key}</td><td></td><td></td>
					<td><button class="detail" onclick="window.location.href='OrderDetailList.do?orderNO=${key}'">주문상세보기 ></button></td></tr>
					
					<c:forEach items="${map.get(key)}" var="product">
					<tr class="product-unit"><td><img src="upload/${product.getImg()}"></td>
					<td>${product.getName()} /${product.getArtist()}</td>
					<td>${product.getPrice()} 원</td>
					<td style="text-align:center">
					<input class="review" type="button" value="리뷰쓰기" onClick="location.href='review_write.do?num=${product.getI()}'"></td>
					</tr>
					</c:forEach>	
				</table>			
				</div>			
				</c:forEach>	

		
		</div>
	</div>


</body>
</html>