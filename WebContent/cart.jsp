<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>

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
	
<!-- 전체선택/부분선택 -->


</head>

<body class="homepage">
<script>
let totalPrice = 0;
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
		<!-- Header -->
		
		<!-- Banner -->
			<div id="banner" style="position: relative;
		background: #333 url(./images/banner45.jpg) no-repeat center;
		text-align: center;
		background-size:cover;
		color: #fff;">
			
			</div>
		<!-- /Banner -->

	</div>
	
	<div id="main">

	 <div id="productList">
	 <table style="margin: 0 auto; width:1000px; text-align:center;">
	 	<tr height="1" bgcolor="#dddddd">
		<td colspan="5" width="1000px"></td>
		</tr>
		
	 	<tr>
	 	<th width="100px"><input type="checkbox" class="memberAllClick" ></th>
	 	<th width="300px">이미지</th>
	 	<th width="500px">상품정보</th>
	 	<th width="100px">판매가</th>
	 	</tr>
	 	<tr height="1" bgcolor="#dddddd">
		<td colspan="4" width="1000px"></td>
		</tr>
	  	
	  	<form name="pd" method="post" action="orderForm.do">
	 	<c:forEach items="${cart}" var="product">
	 	<script> totalPrice += parseInt(${product.getPrice()}); </script>
	 	<tr>	
	 	<td width="100px"><input type="checkbox" class="memberChk" name="chbox" onclick='OnOffMemberAllClickBtn()' 
	 	value="${product.getPrice()},${product.getI()}" ></td>
	 	<td width="300px" ><img src="upload/${product.getImg()}" style="width: 100px; height: 100px; margin:10px; vertical-align: middle" /></td>
	 	<td width="500px">${product.getName()} / ${product.getArtist()}</td>
	 	<td width="100px">${product.getPrice()} 원</td>
	 	</tr>

		</c:forEach>
	
		<tr height="1" bgcolor="#dddddd">
		<td colspan="4" width="1000px"></td>
		</tr>
		<tr><td colspan="3"></td><td><input style="border:none; width: 100px;"type="text" id="totalPrice" value="0"></td></tr>
	 	<tr height="5"></tr>
	 	<tr height="1" bgcolor="#dddddd"><td colspan="4" width="1000px"></td></tr>
		<tr>
		<tr height="20"></tr>
		<td colspan="3"></td>
		<td><input type=submit value="주문하기" style="width:150px; height:45px; color: white; background-color: #010000;
		border:none; margin-left:3px"></td>
		</tr>
	 	
	 </table> 
	 </div>
	</form>
	</div>


<script>
//전체 체크박스 선택
const allClick = document.querySelector(".memberAllClick");
allClick.addEventListener('click', function(){
	totalPrice =0;
const objs = document.querySelectorAll(".memberChk");
    const allchk = document.querySelector(".memberAllClick");
    for (let i = 0; i < objs.length; i++) {
        objs[i].checked = allchk.checked;
        
        if(allchk.checked === true){
        	totalPrice += parseInt(objs[i].value); 
        	
        }
        const total = document.querySelector("#totalPrice");
		 total.value = totalPrice + "원";       
    };
    
}, false);


//부분선택( totalPrice)
 const objs = document.querySelectorAll(".memberChk");
 for(let j=0; j<objs.length; j++){
	 objs[j].addEventListener('click',function(){
		 totalPrice= 0;
		 for(let i =0; i<objs.length; i++){
			 if(objs[i].checked === true){
				 totalPrice += parseInt(objs[i].value.split(',')[0]);
				
			 }
		 }
		 const total = document.querySelector("#totalPrice");
		 total.value = totalPrice + "원";
		 
	 },false);
	 
 }



function OnOffMemberAllClickBtn() {
	
	//부분선택 해제시 , 전체선택 체크박스 해제
    var objs = document.querySelectorAll(".memberChk");
    var allchk = document.querySelector(".memberAllClick");
    var existUnchecked = false;
    for (var i = 0; i < objs.length; i++) {
        if (objs[i].checked === false) {
            existUnchecked = true;
            break;
        }
    }
    if (existUnchecked === false) {
        allchk.checked = true;
    } else {
        allchk.checked = false;
    } 
    
}


</script>


</body>
</html>