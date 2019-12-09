<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionID==null}">
	<script>
		alert("로그인을 먼저 해주세요!");
		history.go(-1);
	</script>
</c:if>

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
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
<script type="text/javascript">
			function writeCheck() {
			   var form = document.writeform; 
			   if( !form.art.value ) {
				   alert( "작품 이름을 적어주세요" );
				   form.movie.focus();
				   return;
			   } if( !form.title.value ) {
				   alert( "글 이름을 적어주세요" );
				   form.content.focus();
				   return;
			   } if( !form.memo.value ) {
				   alert( "글 내용을 적어주세요" );
				   form.memo.focus();
				   return;
			   } form.submit();
			}
			
			window.onfocus=function(){}
			window.onload=function(){
				window.focus();
				window.moveTo(0, 0);
				window.resizeTo(1280, 1500);
				window.scrollTo(0, 250);
			}
		</script>
<style>
table{
	width: 500px;
	height: 700px;
	margin: 0 auto;
}

td{
	margin: 10px;
}


</style>

<title>review write</title>
</head>
<body>
	<!-- Header -->
	<div id="header-wrapper">
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
						<li><a href="BoardList.do">REVIEW</a></li>
						<li><a href="cart.jsp">CART</a></li>
						<c:if test="${sessionID == null}">
							<li class="active"><a href="sign_in.jsp">LOGIN</a></li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li><a href="member_edit.jsp"> ${sessionDisplayName} 님 </a></li>
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
		
		<!-- main -->
		<div id="main">
		<div>
			<form name=writeform method=post action="review_insert.do">
			<input type="hidden" name="img" value="${product.getImg()}">
					  
					   		<h2 style="width:500px; margin:0 auto; text-align:center; font-size:20px; margin-bottom:5px">리뷰 쓰기</h2>			
							<table>

	
								<tr height="1" bgcolor="#002266"><td colspan="4"></td></tr>
								<td>&nbsp;</td>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td align="center">작품명</td>
							      	<td><input name="art" size="55" maxlength="50" value="${product.getName()}" readonly></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td align="center">작가명</td>
							      	<td><input name="artist" size="55" maxlength="50" value="${product.getArtist()}" readonly></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td align="center">글 제목</td>
							      	<td><input name="title" size="55" maxlength="50"></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td align="center">작성자</td>
							      	<td><input name="id" size="55" maxlength="50" readonly value="${sessionDisplayName}"></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td style="vertical-align:middle" align="center">글 내용</td>
							      	<td><textarea style="width:400px" name="memo" cols="50" rows="20"></textarea></td>
							      	<td>&nbsp;</td>
							    </tr>
					
							    <tr align="center">
							      	<td>&nbsp;</td>
							      	<td colspan="2">
							      		<br>
							      		<input type=submit value="등록" OnClick="javascript:writeCheck();" 
							      		style="width:150px; height:45px; color: white; background-color:#010000;
		border:none; margin-left:3px">
							      		<input type=button value="취소" OnClick="javascript:history.back(-1)" 
							      		style="width:150px; height:45px; color: white; background-color: #010000;
		border:none; margin-left:3px">
							      		
							      	</td>
							      	<td>&nbsp;</td>
							    </tr>
						    </table>
				    	</td>
			
	    	</form>
	    </div>
		
		
		
		</div>


</body>
</html>