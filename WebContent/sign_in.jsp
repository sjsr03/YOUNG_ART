<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Sign in</title>
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	// 회원가입 버튼 클릭시 회원가입 화면으로 이동
	function goJoinForm() {
		location.href = "sign_up_choice.jsp";
	}
</script>

<style>
 #main .container{
 	position: relative;
 	width: 1000px;
 	height: 600px;
 	margin:0 auto;
 	
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
						<li><a href="index.jsp">HOME</a></li>
						<li><a href="product_list.jsp">ART</a></li>
						<li><a href="review_board.jsp">REVIEW</a></li>
						<li><a href="cart.jsp">CART</a></li>
						<c:if test="${sessionID == null}">
						<li class="active"><a href="sign_in.jsp">LOGIN</a>
						</li>
						</c:if>
						<c:if test="${sessionID != null }">
						<li><a href="#"> ${sessionDisplayName} 님 </a> </li>
						<li class="active"><a href="logoutAction.do">LOGOUT</a>
						</c:if>
					</ul>
				</nav>

			</div>
	
		</div>
		<!-- Header -->
		<div id="banner"></div>

		<div id="main">
		<div class="container">
			<form method="post" action="member_authenticationAction.do"
				name="form1" style="height: 200px;">
				<table style=" margin:0 auto;">
					<tr>
						<td><input type="text" name="id" maxlength="45" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="password" maxlength="45" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td><input class="login" type="submit" value="로그인"> </td>
					</tr>
				</table>
				<hr>
				<div style="cursor:pointer; text-align:center; font-size:13px" onclick="location.href='sign_up_choice.jsp'">회원가입</div>
			</form>
		</div>
			
			<!-- 아이디 ,비밀번호가 틀린경우 화면에 메시지표시 -->
			<c:choose> 
				<c:when test="${x == 1}"> <!-- 로그인 성공 -->
					<jsp:forward page="index.jsp"/>
				</c:when>
				<c:when test="${x == 0 }"> <!-- 비밀번호 틀림-->
					<script>alert("틀린 비밀번호입니다. 비밀번호를 확인해주세요")</script>	
				</c:when>
				<c:when test="${x == -1 }"> <!-- 아이디가 존재하지 않음 -->
				  <script>alert("존재하지 않는 아이디입니다. 아이디를 확인해주세요")</script>	
				</c:when>			
			</c:choose>


			
		</div>

	</div>

</body>
</html>