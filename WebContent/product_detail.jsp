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
<title>Product Detail</title>

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
		
		 function mover(){
			 console.log(document.querySelector("#like"));

		 		 event.currentTarget.style.border= "2px solid #010000";
				 event.currentTarget.style.backgroundColor = "white";
				 event.currentTarget.style.color = "black";	 		
		 					
			 }
			 
			 function mout(){

					 event.currentTarget.style.border= "none";
			    	 event.currentTarget.style.backgroundColor = "black";
					 event.currentTarget.style.color = "white";			 
				    	
			      }
				 
			 function likeover(){
				 event.currentTarget.style.border= "2px solid red";
				 event.currentTarget.style.backgroundColor = "white";
				 event.currentTarget.style.color = "black";	 	
				 
			 }
			 function likeout(){
				 event.currentTarget.style.border= "none";
		    	 event.currentTarget.style.backgroundColor = "red";
				 event.currentTarget.style.color = "white";		
				 
			 }


	</script>
<script>
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
	if(doubleSubmitFlag) {
		return doubleSubmitFlag;
	}else{
		doubleSubmitFlag = true;
		return false;
	}
}
function likey(){
	$.ajax({
		url: "LikeUpdate.do",
		type:"POST",
		cache:false,
		data: $('#likey_form').serialize(),
		success:
		function(data){
			if(doubleSubmitCheck()) return;
			alert("작품을 추천하였습니다.");
		$("#likey_result").html(data.likey);
		},
		error:
		function(request, status, error){
			alert("ajax실패")
		}
	});
}
</script>
	
	
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
	
		 <div class="imgposition">
            <img src="upload/${product.getImg()}" style="width: inherit; height: inherit" />
         </div>
		<table> <!-- 작품 설명 -->
			<tr>
				<td>
				<br>
					<table class="info" width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr height="2" bgcolor="#010000">
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="20" >
							<td colspan="4" width="407"></td>
						</tr>
						<tr style="text-align: center; ">
							<td width="5"></td>
							<td style="text-align: center; font-size:25px; width:90%">${product.getName()}</td>
							<td style="color: red">♥<div id="likey_result">${product.likey}</div></td>
							<td width="5"></td>
						</tr>
					</table>

					<table width="413">
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작가명</td>
							<td width="319">${product.getArtist()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="10" >
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">판매가</td>
							<td width="319">${product.getPrice()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="10" >
							<td colspan="4" width="407"></td>
						</tr>
		
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
		
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작품설명</td>
							<td width="500px" height="320px" colspan="2">${product.getContent()}</td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="20" >
							<td colspan="4" width="407"></td>
						</tr>
						<!-- 버튼 -->
						<tr align="center">
					   			<td width="0">&nbsp;</td>
			
					   	<c:choose>
					   	<c:when test="${sessionDisplayName == product.getArtist()}">
					   	 <td><input type=button value="목록" onmouseover="mover()" onmouseout="mout()" OnClick="window.location='ProductList.do?category=painting'" style="width:150px; height:45px; color: white; background-color: #010000;
					   	  border:none; margin-left:3px"></td>
						<td width="33%"><input type=button value="수정" onmouseover="mover()" onmouseout="mout()" OnClick="location.href='ProductModifyView.do?num=${product.getI()}'" 
						style="width:150px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px"></td>
						<td width="33%"><input type=button value="삭제" onmouseover="mover()" onmouseout="mout()" OnClick="location.href='ProductDelete.do?num=${product.getI()}'" 
						style="width:150px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px"></td>
					   	</c:when>
					   	<c:when test="${sessionUserType == 'C' }">
					   		 <td><input type=button value="목록" onmouseover="mover()" onmouseout="mout()" OnClick="window.location='ProductList.do?category=painting'" style="width:150px; height:45px; color: white; background-color: #010000;
								   	  border:none; margin-left:3px"></td>
							<form name="cart" method="post" action="cart.do">
							<input type="hidden" name="num" value="${product.getI()}">
							<input type="hidden" name="name" value="${product.getName()}">
							<input type="hidden" name="artist" value="${product.getArtist()}">
							<input type="hidden" name="price" value="${product.getPrice()}">
							<input type="hidden" name="like" value="${product.getLikey()}">
							<input type="hidden" name="content" value="${product.getContent()}">
							<input type="hidden" name="img" value="${product.getImg()}">
							<input type="hidden" name="category" value="${product.getCategory()}">
							<td width="33%"><input type=submit value="장바구니" onmouseover="mover()" onmouseout="mout()" 
									style="width:150px; height:45px; color: white; background-color: #010000; border:none; margin-left:3px"></td>		
							</form>
							<form id="likey_form">
      
                             <input type="hidden" name="command" value="likey">
                             <input type="hidden" name="product_num" value="${product.getI()}">
                             <td><input id="like" type=button value="좋아요" onmouseover="likeover()" onmouseout="likeout()" onClick="return likey()" 
									style="width:150px; height:45px; color: white; background-color: red; border:none; margin-left:3px"></td>             
              			 	 </form>	
						
					   	</c:when>
					   	<c:when test="${sessionUserType == 'A' }">
					   	<td colspan="2"><input type=button value="목록" onmouseover="mover()" onmouseout="mout()" OnClick="window.location='ProductList.do?category=painting'" style="width:150px; height:45px; color: white; background-color: #010000;
								   	  border:none; margin-left:3px"></td>
					   	  	
					   	</c:when>
					   	</c:choose>
					   	
		
	
						</tr>
		</table>
		
		</td>
		</tr>
		</table>
	
		</div>

</body>
</html>