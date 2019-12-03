<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign_up</title>
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
<script type="text/javascript">
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if( document.userInfor.password.value != document.userInfo.passwordcheck.value){
			alert("비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.");
			return false;
		}
	}

</script>

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
	<script>
		window.onfocus = function() {
		}
		window.onload = function() {
			window.focus();
			window.moveTo(0, 0);
			window.resizeTo(1280, 1500);
			window.scrollTo(0, 250);
		}
		
	</script>
		<!-- Header -->
	<div id="header-wrapper">
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
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="product_list.jsp">ART</a></li>
					<li><a href="review_board.jsp">REVIEW</a></li>
					<li><a href="cart.jsp">CART</a></li>
					<li class="active"><a href="sign_in.jsp">LOGIN</a>
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
						<h2>회원가입</h2>
					</header>
				</section>	
			</div>
		</div>
	<!-- /Banner -->
	</div>
	<div id="main">

		<div id="wrap">
			<c:if test="${param.userType == 'artist' }">
			<form name=form1 method=post action="member_sign_up.do" onsubmit="return checkValue()">
				<input type=hidden name="userType" value="artist"> 
				<table>
					<tr>
						<td id="title">아 이 디</td>
						<td><input type="text" name="id" maxlength="20"></td>
					</tr>

					<tr>
						<td id="title">비밀번호</td>
						<td><input type="text" name="password" maxlength="15"></td>
					</tr>
					<tr>
						<td id="title">닉네임</td>
						<td><input type="text" name="displayName" maxlength="15"></td>
					</tr>

					<tr>
						<td id="title">소속학교</td>
						<td><input type="text" name="college" maxlength="45"></td>
					</tr>

					<tr>
						<td id="title">학과</td>
						<td><input type="text" name="major" maxlength="45"></td>
		
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="submit" value="가입"></td>
					</tr>
				</table>
				<hr>
				<div style="cursor:pointer; padding-left:70px; text-align:center; font-size:13px" onclick="location.href='index.jsp'">홈으로 돌아가기</div>
			</form>
			</c:if>
			
			<c:if test="${param.userType == 'customer' }">
			<form name=form1 method=post action="member_sign_up.do" onsubmit="return checkValue()">
				<input type=hidden name="userType" value="customer"> 
				<table>
					<tr>
						<td id="title">아 이 디</td>
						<td><input type="text" name="id" maxlength="20"></td>
					</tr>

					<tr>
						<td id="title">비밀번호</td>
						<td><input type="text" name="password" maxlength="45"></td>
					</tr>
					<tr>
						<td id="title">닉네임</td>
						<td><input type="text" name="displayName" maxlength="10"></td>
					</tr>

					<tr>
						<td id="title">우편번호 </td>
						<td><input type="text" name="zipCode" maxlength="5"></td>
					</tr>

					<tr>
						<td id="title">주소 </td>
						<td><input type="text" name="address" maxlength="100"></td>
		
					</tr>
					
					<tr>
						<td id="title">휴대전화 번호</td>
						<td><input type="text" name="phoneNumber" maxlength="13"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="login" type="submit" value="가입"></td>
					</tr>
				</table>
				<hr>
				<div style="cursor:pointer; padding-left:70px; text-align:center; font-size:13px" onclick="location.href='index.jsp'">홈으로 돌아가기</div>
			</form>
			</c:if>
			
		</div>
	</div>




</body>
</html>