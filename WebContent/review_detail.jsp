<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	.imgposition {
float:left;
margin-right:20px;
margin-top:20px;
clear:both;
width:500px;
margin-left:150px;
margin-right:auto;
}
table {
margin-left:auto;
margin-right:auto;
}
	
	
	</style>
<title>Review Detail</title>
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
		background: #333 url(./images/banner41.jpg) no-repeat center;
		text-align: center;
		background-size:cover;
		color: #fff;">
			<div class="container"></div>
		</div>
		<!-- /Banner -->
		<!-- Main -->
		<div id="main">
		<div class="imgposition">
		<img src="upload/${review.getImg()}" style="width: inherit; height: inherit">
		</div>
		<div class="review_detail">
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="text-align: center;">
							<td width="5"></td>
							<td><H2>리뷰 보기</H2></td>
							<td width="5"></td>
						</tr>
					</table>

					<table width="413">
						<tr height="1" bgcolor="#002266">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">글 번호</td>
							<td width="319">${review.getI()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">조회수</td>
							<td width="319">${review.getHit()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작품명</td>
							<td width="319">${review.getArt()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작가명</td>
							<td width="319">${review.getArtist()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">글 제목</td>
							<td width="319">${review.getTitle()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작성자</td>
							<td width="319">${review.getId()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작성일</td>
							<td width="319">${review.getDate()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">내용</td>
							<td width="319" height="319">${review.getContent()}</td>
							<td width="0">&nbsp;</td>
						</tr>
					
						<tr align="center">
					   			<td width="0">&nbsp;</td>
					   			<td colspan="2" width="399">
					   	<c:choose>
					   	<c:when test="${sessionDisplayName == review.getId()}">
					   	 <input type=button value="목록" OnClick="window.location='BoardList.do'" style="width:100px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
									<input type=button value="수정" OnClick="location.href='review_modify_View.do?num=${review.getI()}'" 
									style="width:100px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
									<input type=button value="삭제" OnClick="location.href='review_delete.do?num=${review.getI()}'" 
									style="width:100px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
					   	</c:when>
					   	<c:otherwise>
					   		<input type=button value="목록" OnClick="window.location='BoardList.do'" 
									style="width:100px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
					   	
					   	</c:otherwise>
					   	</c:choose>
	
						</tr>
		</table>
		</div>
		
		
		</div> <!-- end main -->

</body>
</html>