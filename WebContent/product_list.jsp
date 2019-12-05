<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product 게시판</title>
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
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>

<style>

.product-upload {
	width: 1290px;
	height: 60px;
	color: #333333;
	
}
.item-list {
	width: 1290px;
	height: 380px;
	color: #333333;
	
}

.item {
	width: 249px;
	height: 320px;	
	color: #333333;
	
}

.thumb {
	width: 220px;
	height: 220px;
	color: #F4F4F4;
	margin: 0px 14.5px;
}

.MS_prod_img_s {
	width: 170px;
	height: 170px;
}

.name {
	color: #888888;
	
}

.item-list .item {
	float: left;
	width: 249px;
	margin-top: 20px;
	margin-bottom: 40px;
	text-align: center;
}

li {
	widht: 220px;
	height: 45px;
	color: #333333;
	
}

.subname {
	width: 220px;
	height: 10px;
	color: #7F7F7F;
	
}

.info {
	width: 220px;
	height: 90px;
	color: #333333;
	margin: 0px 14.5px;
}

.price {
	width: 220px;
	height: 35px;
	color: #333333;
	margin: 15px 0px 0px;
}

.price03 {
	width: 220px;
	height: 20px;
	color: #CAAC7D;
	
}

dd {
	margin-left: 0px;
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
						<a href="index.jsp">Young Art</a>
					</h1>
				</div>

				<!-- Nav -->
				
				<nav id="nav">
					<ul>
						<li><a href="index.jsp">HOME</a></li>
						<li class="active"><a href="ProductList.do?category=painting">ART</a></li>
						<li><a href="BoardList.do">REVIEW</a></li>
						<li><a href="cart.jsp">CART</a></li>
						<c:if test="${sessionID == null}">
							<li class="active"><a href="sign_in.jsp">LOGIN</a></li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li><a href="member_edit.jsp"> ${sessionID} 님</a></li>
							<li class="active"><a href="logoutAction.do">LOGOUT</a></li>
						</c:if>
					</ul>
				</nav>
	</div>
	
</div>
	
		

		
		<!-- Header -->

		<!-- Banner -->
		<div id="banner">
			<div class="container"></div>
		</div>
		<!-- /Banner -->

	<!-- Main -->
	
	<div id="main">	
	
	
     <div class="container">
	 <div class="3u">


                   <section class="sidebar">  
						<header>
							<h2>ART</h2>
						</header>
						<ul class="default">
							<li><a href="ProductList.do?category=painting">PAINTING</a></li>
							<li><a href="ProductList.do?category=sculpture">SCULPTURE</a></li>
							<li><a href="ProductList.do?category=photo">PHOTO</a></li>
						</ul>
				</section>
    </div>
    </div>
    	

	
	<!-- 작품 리스트 -->
	

							<c:if test="${productlist.size() == 0}">
								<tr align="center" bgcolor="#FFFFFF" height="30">
									<td colspan="6">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							
							   
							<div class="product-upoload" style="text-align:center;">
								<input type="button" value="작품 업로드"
									onClick="window.location = 'product_upload.jsp'"
									style="width: 100px; height: 30px; color: white; background-color: #A4A4A4;">
							</div>
                          
                            <div class="item-list" style="margin:0 auto;">
                            
			<c:forEach items="${productlist}" var="product">
			<dl class="item">
			<dt class="thumb">
			<a href="ProductView.do?num=${product.getI()}">
				<img
					class="MS_prod_img_s"
					src="upload/${product.getImg()}"
					style="filter: alpha(opacity = 100); opacity: 1.0; box-shadow: 3px 2px 3px 0 rgba(0, 0, 0, 0.3);"
					onmouseover="this.style.opacity=0.5; this.filters.alpha.opacity=50;"
					onmouseout="this.style.opacity=1.0; this.filters.alpha.opacity=100;" /></a>
			
			</dt>
			<dd>
				<ul class="info" style="margin:0 auto;">
					<li>
						<div class="name">${product.getName()}</div>
						<div
							style="height: 1px; border-bottom: 1px solid #D3D3D3; margin-bottom: 10px;">
						</div>
							
						<div class="subname">${product.getArtist()}</div>
						
						<div class="txt">
							<span class='MK-product-icons'></span>
						</div>
						
					</li>
					
					
				
					<li>
						<div class="price">
							<p class="price03">${product.getPrice()}</p>
						</div>
					</li>
				</ul>
			</dd>
		</dl>
	</c:forEach>
	</div>

				<table>
						
					<tr>
								<td>			
									<%
										int nowpage = ((Integer)request.getAttribute("page")).intValue();
										int startpage = ((Integer)request.getAttribute("startpage")).intValue();
										int endpage =  ((Integer)request.getAttribute("endpage")).intValue();
										int maxpage= ((Integer)request.getAttribute("maxpage")).intValue();
									%>		
									<%
										if(nowpage<=1){%>[이전] &nbsp;<%}else{%>
										<a href="./ProductList.do?page=<%=nowpage-1%>">[이전]</a>&nbsp;<%
										}
									%>			
					
									<% 
										for(int a=startpage;a<=endpage;a++){
											if(a==nowpage){%>[<%=a%>]<%
											}else{%>
											<a href="./ProductList.do?page=<%=a%>">[<%=a%>]</a>
												<%}	
										}
										
										if(nowpage>=maxpage){%>
										[다음]&nbsp;<%}else{%>
										<a href="./ProductList.do?page=<%=nowpage+1%>">[다음] &nbsp;</a>
										<%} %>					
											
								</td>	
								
					</tr>
							
							
			
</table>


</div>

	<!-- /Main -->
</div>
</body>
</html>
			