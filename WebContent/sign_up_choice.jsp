<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원유형 선택</title>
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
<link rel="stylesheet" href="css/style.css?ver=3" />
<link rel="stylesheet" href="css/style-desktop.css" />
<style>


#main .container{ 
    width:1200px;
    height:600px;
    margin:0 auto;
    text-align:center;
}


.usertypeButton {
	padding:10px;
	border: 1px solid;
	width: 600px;
	height: 100px;
	position: relative;
	margin:0 auto;
	
}
.usertypeButton > div{
	position:absolute;
	float: left;

}

.img{
	width:30%;
}

.content{
	right:50px;
}


</style>
<script>
 function mover(){
	// const m = document.querySelectorAll(".usertypeButton");
	 event.currentTarget.style.border= "2px solid #396fbf ";
 }
 
 function mout(){
	 //const m = document.querySelectorAll(".usertypeButton");
    	 event.currentTarget.style.border= "1px solid black";
      }
	 


</script>
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
	</div> <!-- header-wrapper -->

	<div id="main">
		<div class="container">
			<p style="font-size : 25px"><b>고객님의 <span style="color:#396fbf;">회원유형</span>을 선택해주세요</b></p>
			<br><br><br>
			<div class="usertypeButton" style="margin-left:300px; margin-bottom:20px;" onmouseover="mover()" onmouseout="mout()" onclick="window.location='sign_up.jsp?userType=artist';"  >
				<div class="img"><img src="./images/paint-palette.png" width="70px" height="70px"></div>
				<div class="content" style="right:90px"><span style="font-size:20px"><b>작가</b></span><br>
				<span>고객님의 작품을 등록하여 판매할수 있습니다.</span><br>
				<span style="font-size:13px">(작가는 작품구매,리뷰작성이 불가합니다.)</span><br>
				</div>
			</div>
				<div class="usertypeButton" onmouseover="mover()" onmouseout="mout()" onclick="window.location='sign_up.jsp?userType=customer';">
				<div class="img"><img src="./images/product.png" width="70px" height="70px"></div>
				<div class="content">
				<span style="font-size:20px"><b>구매자</b></span><br>
				<span>작가가 등록한 작품을 구매하고 리뷰를 작성할 수 있습니다.</span><br>
				<span style="font-size:13px">(구매자는 작품등록이 불가합니다.)</span><br>
				</div>
			</div>
			
		</div>
	</div>

</body>
</html>