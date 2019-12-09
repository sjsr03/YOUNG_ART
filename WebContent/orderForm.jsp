<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>주문 폼</title>

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
.middle{
	width: 800px;
	margin: 0 auto;
}

 .title{
  	border-bottom: 3px solid black;
 }
 
 table{
 	width: 800px;
 	border-top: 2px solid #A5A5A5;
 	border-bottom: 2px solid #A5A5A5;
 	border-collapse: collapse;
 }
 
 .idx{
 	text-align: right;
 	width: 130px;
 	background-color : #f4f4f4;
 
 }
 
 td{
 	padding:8px;
 	border:1px solid #e4e4e4;
 	height: 40px;
 	font-size:14px;
 
 }
 
 div #main{
 	border-top :2px solid #f4f4f4;
 
 }
</style>
<body>
<!--메뉴 -->
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
<div class="middle">
	<div class="title"><h2>주문/결제</h2></div>
	
	<div data-component="customer">
		<div class="customer-root">
			<h3 class="customer_h3">구매자정보</h3>
			<table class="customer_table">
				<tr><td class="idx">Id</td><td>${sessionID}</td></tr>
				<tr><td class="idx">구매자명</td><td>${sessionDisplayName}</td></tr>
				<tr><td class="idx">휴대폰 번호</td><td>${sessionPhoneNumber}</td></tr>			
			</table>
		</div>
	</div>
	<div data-component="deliveryAddress">
		<div class="deliveryAddress-root">
			<h3 class="deliveryAddress_h3">받는사람정보</h3>
			<table class="deliveryAddress_table">
				<tr><td class="idx">이름</td><td>${sessionDisplayName}</td></tr>
				<tr><td class="idx">배송주소</td><td>${sessionAddress }<td/></tr>
				<tr><td class="idx">우편번호</td><td>${sessionZipCode}</td></tr>
				<tr><td class="idx">연락처</td><td>${sessionPhoneNumber}</td></tr>	
			</table>
		</div>
	</div>
	<form method="post" action ="order.do">
	<div data-component="orderedListView">
		<h3>주문목록</h3>
		<table>
		<c:forEach items="${orderedList}" var="product">
			<input type=hidden name="productCD" value="${product.getI()}">
			<tr><td style="border-right:white">${product.getName()}</td><td style="border-left:white; text-align:right;">${product.getPrice()} 원</td></tr>	
		</c:forEach>
		
		
		
		</table>
	
	</div>
	<div data-component="priceInformation">
		<div class="priceInformation-root">
			<h3>결제정보</h3>
			
			<input type="hidden" name="customerID" value="${sessionID}" >>
			<input type="hidden" name="address"  value="${sessionAddress}">
			<input type="hidden" name="zipCD" value="${sessionZipCode }">
			<input type="hidden" name="totalPrice" value="${totalSum}" >	
			<table>
				<tr><td class="idx">총상품가격</td><td>${totalSum} 원</td></tr>
				<tr><td class="idx">배송비</td><td>3000 원</td></tr>
				<tr><td class="idx">총결제금액</td><td>${totalSum + 3000} 원</td></tr>
				<tr><td class="idx">결제방법</td><td>무통장입금: 우리은행 1002-111-111111 / 예금주:YOUNGART</td></tr>
				<tr><td class="idx">입금자명</td><td><input type="text" name="depositor" style="width:50px">님</td></tr>			
			</table>
			<div><input type=submit value="주문하기" style="width:150px; height:45px; color: white; background-color: #010000;
		border:none; margin:10px; margin-left:650px"></div>
			</form>
		</div>
	
	
	</div>

</div>






</div>

</body>
</html>