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
<nonscript>
<link rel="stylesheet" href="css/skel-noscript.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-desktop.css" />
</nonscript>

<script type="text/javascript">
			function writeCheck() {
			   var form = document.writeform; 
			   if( !form.name.value ) {
				   alert( "작품 이름을 적어주세요" );
				   form.name.focus();
				   return;
			   } if( !form.artist.value ) {
				   alert( "작가 이름을 적어주세요" );
				   form.artist.focus();
				   return;
			   } if( !form.content.value ) {
				   alert( "글 내용을 적어주세요" );
				   form.content.focus();
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


<title>상품 업로드</title>
<style type="text/css">
p {
	width: 1400px;
	text-align: center;
}

tr {

		margin-top: 10px;
	}
	
td{
	margin:5px;
}

table{

	margin:0 auto;
	width: 500px;
}
table thead tr th {
	background-color: #90B2F6;
	height: 30px;
	margin: 10px;
}

.thumb-info {
	position: relative;
	zoom: 1;
	padding: 40px 0;
	padding-top: 60px;
	border: 1px solid #e4e4e4;
	border-bottom: 0px;
	overflow: hidden;
	*height: 600px;
	width: 1300px;
	padding-left: 0px;
	padding-right: 0px;
	border-left-width: 0px;
	margin-left: 150px;
	border-right-width: 0px;
}

.thumb-info-bg {
	position: absolute;
	width: 555px;
	height: 620px;
	top: 70px;
	left: 50px;
	background: #f4f4f4;
}

.thumb-info .info {
	float: right;
	width: 423px;
	margin-top: 10px;
	margin-right: 127px;
}
</style>
</head>
<body>
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
						<li><a href="ProductList.do?category=painting">ART</a></li>
						<li><a href="review_board.jsp">REVIEW</a></li>
						<li><a href="cart.do">CART</a></li>
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
		background: #333 url(./images/banner44.jpg) no-repeat center;
		text-align: center;
		background-size:cover;
		color: #fff;">
			<div class="container"></div>
		</div>
		<!-- /Banner -->

		<!-- Main -->
		<div id="main">
	
				<form action="ProductUpload.do" method="post" enctype="multipart/form-data" name="uploadform" onsubmit="return formCheck();">
				
					<table>
						<tr>
							<td><br> <br>
								<table  cellpadding="0" cellspacing="0" border="0">
									<tr style="text-align: center;">
										<td width="5"></td>
										<td  style="font-size:25px"><H2>작품 등록</H2></td>
										<td width="5"></td>
									</tr>
								</table>
                    
								<table>
									<tr height="1" bgcolor="#002266">
										<td colspan="4"></td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>카테고리</td>
										<td>
										<select name="category">
											<option value="painting">Painting</option>
											<option value="sculpture">Sculpture</option>
											<option value="photo">Photo</option>	
										</select>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td>&nbsp;</td>
										<td align="center">작품명</td>
										<td><input type= "text" name="name" size="55" maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>
								
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">작가명</td>
										<td><input type="text" name="artist" size="55" maxlength="50" value="${sessionDisplayName}" readonly></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">가격</td>
										<td><input type="text" name="price" size="55"
											maxlength="50"></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center">이미지</td>
										<td><input type="file" name="img" id="img" size="55"></td>
										<td>&nbsp;</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td style="vertical-align:middle; text-align :center">작품 설명</td>
										<td><textarea name="content" cols="50" rows="20"></textarea></td>
										<td>&nbsp;</td>
									</tr>
						
									<tr align="center">
										<td>&nbsp;</td>
										<td colspan="2">
							      		<br>
							      		<input type=submit value="등록" OnClick="javascript:writeCheck();" 
							      		style="width:150px; height:45px; color: white; background-color: #010000;
		border:none; margin-left:3px">
							      		<input type=button value="취소" OnClick="javascript:history.back(-1)" 
							      		style="width:150px; height:45px; color: white; background-color: #010000;
		border:none; margin-left:3px">
							      	</td>
										<td>&nbsp;</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</form>
			</div>

	</div>

</body>
</html>