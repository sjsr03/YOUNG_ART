<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시판</title>
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
<style></style>
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
						<li class="active"><a href="BoardList.do">REVIEW</a></li>
						<li><a href="cart.jsp">CART</a></li>
						<c:if test="${sessionID == null}">
							<li class="active"><a href="sign_in.jsp">LOGIN</a></li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li><a href="#"> ${sessionID} 님 </a></li>
							<li class="active"><a href="logoutAction.do">LOGOUT</a>
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
				<!-- 게시판 리스트 -->
				<div style="width: 1503px; margin: 0 auto;">
					<table border="1" style="margin: 0 auto;" summary="게시판 목록">
						<colgroup>
							<col width="100" />
							<col width="300" />
							<col width="300" />
							<col width="150" />
							<col width="200" />
							<col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th>글 번호</th>
								<th>작품명</th>
								<th>글 제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${boardlist.size() == 0}">
								<tr align="center" bgcolor="#FFFFFF" height="30">
									<td colspan="6">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<p style="text-align: center;">
								<input type="button" value="글쓰기"
									onClick="window.location = 'review_write.jsp'"
									style="width: 50px; height: 30px; color: white; background-color: #002266;" />
							</p>

							<c:forEach items="${boardlist}" var="review">
								<tr height="25" align="center">
									<td align="center">${review.getI()}</td>
									<td align="center">${review.getArt()}</a></td>
									<td align="center"><a href="review_view.do?num=${review.getI()}">${review.getTitle()}</a></td>
									<%--영화제목을 누르면 review_view.jsp로 이동 --%>
									<td align="center">${review.getId()}</td>
									<td align="center">${review.getDate()}</td>
									<td align="center">${review.getHit()}</td>
								</tr>
							</c:forEach>
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
										<a href="./BoardList.do?page=<%=nowpage-1%>">[이전]</a>&nbsp;<%
										}
									%>			
					
									<% 
										for(int a=startpage;a<=endpage;a++){
											if(a==nowpage){%>[<%=a%>]<%
											}else{%>
											<a href="./BoardList.do?page=<%=a%>">[<%=a%>]</a>
												<%}	
										}
										
										if(nowpage>=maxpage){%>
										[다음]&nbsp;<%}else{%>
										<a href="./BoardList.do?page=<%=nowpage+1%>">[다음] &nbsp;</a>
										<%} %>					
											
								</td>	
								
							</tr>
						</tbody>
					</table>
					<BR> <BR>
					<%-- <c:out value="총 게시물 : ${ReviewList.size() }개" /> --%>
				</div>







			</div>
		</div>
		<!-- /Main -->

	</div>

</body>
</html>