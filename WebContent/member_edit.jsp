<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
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
<style>
	#wrap{
		width: 1000px;
		height: 600px;
		position: relative;
		margin: 0 auto;
	
	}
	
	table {
		margin: 0 auto;
	
	}
	 input{

 	width: 300px;
 	height: 40px;
 	text-align: center;
 	margin-bottom: 10px;
 
 }
  
 .login{
 	background: #c61732;
	border-radius: 5px;
	color: #FFF;
	border: 0;
	outline: 0;
	font-size:17px;
 }
 
 td{
 	padding:5px;
 	text-align: center;
 
 }
 

</style>
</head>
<body>
	<div id="header-wrapper">

		<!-- Header -->
		<div id="header">
			<div class="container">
				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="#">Young Art</a>
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
		<div id="banner" style="position: relative;
		background: #333 url(./images/banner52.jpg) no-repeat center;
		text-align: center;
		background-size:cover;
		color: #fff;">
			<div class="container"></div>
		</div>
		<!-- /Banner -->

		<!-- Main -->
		<div id="main">
		<div id="wrap">
			<c:if test="${sessionUserType == 'A' }">
			<form name=form1 method=post action="member_editAction.do">
				<input type=hidden name="id" value="${sessionID}"> 
				<input type=hidden name="userType" value="${sessionUserType}"> 
				<table>
					<tr>
						<td id="title">아 이 디</td>
						<td>${sessionID}</td>
					</tr>

					<tr>
						<td id="title">비밀번호</td>
						<td><input type="text" name="password" maxlength="45"></td>
					</tr>
					<tr>
						<td id="title">이름</td>
						<td><input type="text" name="displayName" maxlength="10" value="${sessionDisplayName}"></td>
					</tr>

					<tr>
						<td id="title">소속학교</td>
						<td><input type="text" name="college" maxlength="10" value="${sessionCollege}"></td>
					</tr>

					<tr>
						<td id="title">학과</td>
						<td><input type="text" name="major" maxlength="45"value="${sessionMajor}"></td>
		
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="button" value="작품업로드" onClick=" window.location ='product_upload.jsp'"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="submit" value="저장"></td>
					</tr>
				</table>
				<hr>
				<div style="cursor:pointer; padding-left:70px; text-align:center; font-size:13px" onClick=" window.location = 'member_delete_ok.do?loginedId=${sessionID}'">회원탈퇴</div>
			</form>
			</c:if>
			
			<c:if test="${sessionUserType == 'C' }">
			<form name=form1 method=post action="member_editAction.do" >
				<input type=hidden name="id" value="${sessionID}"> 
				<input type=hidden name="userType" value="${sessionUserType}"> 
				<table>
					<tr>
						<td id="title">아 이 디</td>
						<td>${sessionID}</td>
					</tr>
					<tr>
						<td id="title">비밀번호</td>
						<td><input type="password" name="password" maxlength="45"></td>
					</tr>
					<tr>
						<td id="title">닉네임</td>
						<td><input type="text" name="displayName" maxlength="10" value="${sessionDisplayName}"></td>
					</tr>

					<tr>
						<td id="title">우편번호 </td>
						<td><input type="text" name="zipCode" maxlength="5" value="${sessionZipCode}"></td>
					</tr>

					<tr>
						<td id="title">주소 </td>
						<td><input type="text" name="address" maxlength="100" value="${sessionAddress}"></td>
		
					</tr>
					
					<tr>
						<td id="title">휴대전화 번호</td>
						<td><input type="text" name="phoneNumber" maxlength="13" value="${sessionPhoneNumber}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="button" value="주문목록" onClick="location.href='orderedListByCustomer.do?customerID=${sessionID}'
						"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="submit" value="저장"></td>
					</tr>
				</table>
				<hr>
				<div style="cursor:pointer; padding-left:70px; text-align:center; font-size:13px" onClick=" window.location = 'member_delete_ok.do?loginedId=${sessionID}'">회원탈퇴</div>
			</form>
			</c:if>
			
		</div>
			
		</div>
		<!-- /Main -->

	</div>

</body>
</html>