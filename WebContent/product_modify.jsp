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
<title>Product Modify</title>
<script type="text/javascript">
		function writeCheck() {
		   var form = document.modifyform; 
		   if( !form.title.value ) {
			   alert( "글 이름을 적어주세요" );
			   form.content.focus();
			   return;
		   } if( !form.content.value ) {
			   alert( "글 내용을 적어주세요" );
			   form.memo.focus();
			   return;
		   } form.submit();
		   }
		
</script>
<style>

table{
	margin: 0 auto;
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
							<li><a href="member_edit.jsp">${sessionDisplayName} 님 </a></li>
							<li class="active"><a href="logoutAction.do">LOGOUT</a>
						</c:if>
					</ul>
				</nav>

			</div>
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
		<form name=modifyform method=post action="ProductModify.do?num=${product.getI()}">
				<table>
					<tr>
						<td>
					    	<table width="100%" cellpadding="0" cellspacing="0" border="0">
						    	<tr style="text-align: center; margin-bottom: 5px">
							      	<td width="5"></td>
							      	<td  ><H2 style="font-size: 25px">상품 수정</H2></td>
							     	<td width="5"></td>
							     
						    	</tr>
					
							</table >
					
							<table>
								<tr height="1" bgcolor="#002266"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							     	<td align="center">작품명</td>
							      	<td><input type=text name=art size=50 maxlength=50 readonly value="${product.getName()}"></td>
							      	<td>&nbsp;</td>
						     	</tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td align="center">작성자</td>
							      	<td><input type=text name=artist size=50 maxlength=50 readonly value="${product.getArtist()}"></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
							    <tr>
							      	<td>&nbsp;</td>
							      	<td  style="vertical-align: middle""align="center">글 내용</td>
							      	<td><textarea name=content cols="50" rows="20">"${product.getContent()}"</textarea></td>
							      	<td>&nbsp;</td>
							    </tr>
							    <tr height="1" bgcolor="#002266"><td colspan="4"></td></tr>
							    <tr align="center">
							      	<td>&nbsp;</td>
							      	<td colspan="2">
							      		<br>
							      		<input type=submit value="수정" OnClick="javascript:modifyCheck();" 
							      		style="width:150px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
							      		<input type=button value="취소" OnClick="javascript:history.back(-1)" 
							      		style="width:150px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px">
							      	</td>
							      	<td>&nbsp;</td>
							    </tr>
						    </table>
				    	</td>
			    	</tr>		
		    	</table>
	    	</form>
		
			
		</div>


</body>
</html>