<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>店铺搜索</title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
<link href="../img/log.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
<style>
.imgHover {
	transition: All 0.4s ease-in-out;
	-webkit-transition: All 0.4s ease-in-out;
	-moz-transition: All 0.4s ease-in-out;
	-o-transition: All 0.4s ease-in-out;
}

.imgHover:hover {
	transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
	-ms-transform: scale(1.1);
}
</style>
</head>

<body>
	<div class="container-fluid" style="height: 84px; background: #333333">
		<nav class="navbar " style="background: #333333">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">请输入您要搜索的餐饮名称</span> <span class="icon-bar"></span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a href="<%=basePath%>index.jsp"> <img
						src="../homeImg/logo1.png" height="45%" width="45%" />
					</a>
				</div>
				<div class="collapse navbar-collapse pull-right"
					id="bs-example-navbar-collapse-1">
					<ul class="list-inline text-right" style="margin-top: 10%">
					<li><a href="<%=basePath%>index.jsp"
							style="text-decoration: none; color: #ccc;">首页</a></li>
						<li><a href="<%=basePath%>prev/toSelectSeller.do"
							style="text-decoration: none; color: #ccc;">店铺</a></li>
						<li><a href="<%=basePath%>prev/to-AllProduct.do"
							style="text-decoration: none; color: #ccc;">美食</a></li>
						<li><a href="<%=basePath%>prev/to-prev_userInfo.do"
							style="text-decoration: none; color: #ccc;">用户中心</a></li>
						<li><a href="<%=basePath%>prev/to_prev_ShoppingTrolley.do"
							style="text-decoration: none; color: #ccc;">购物车</a></li>
						<li><a href="<%=basePath%>back/login.do"
							style="text-decoration: none; color: #ccc;">商家登陆</a></li>
						<li><a href="<%=basePath%>back/register.do"
							style="text-decoration: none; color: #ccc;">商家入驻</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container" style="">
		<h2 class="page-header">店铺</h2>
		<span style="color: #C0C0C0;">共有${sellerCount}数据</span>
		<div class="row" style="margin-top: 1%">
			<!-- 2020-4-28 17:00:57 -->
			<c:forEach items="${sellerList}" var="seller">
				<a href="<%=basePath%>prev/to-ShopParticulars.do?m_id=${seller.m_Id}">
					<div class="col-md-3 imgHover" style="height: 300px;" >
						<img width="260px" height="160px"
							src="../SellerImg/${seller.m_imgPath}" style="border:1px solid #ccc;">
						<div class="caption thumbnail">
							<p style="font-size: 13px; color: black">店铺名称:${seller.m_ShopName}</p>
							<p style="font-size: 13px; color: black">订餐电话:${seller.m_Phone}</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="container-fluid" style="background: #333333;">
		<div class="container" style="height: 163px;">
			<!--style="margin-left: 350px;margin-top: 3%;" -->
			<div class="row" style="margin-top: 1%;">
				<div class="col-md-5">
					<img src="../homeImg/DiBuLogo.png" width="100%" />
				</div>
				<div class="col-md-5 col-md-offset-2">
					<div class="row" align="center">
						<div class="col-md-3 col-md-offset-5">
							<img src="../homeImg/800.jpg" height="75px" width="85px" />
							<p>
								<a href="#" style="color: #CCCCCC; text-decoration: none;">关注微博</a>
							</p>
						</div>
						<div class="col-md-3">
							<img src="../homeImg/900.jpg" height="75px" width="85px" />
							<p style="color: #CCCCCC;">微信公众号</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row"></div>
			<div class="row" align="center">
				<p></p>
				<p style="color: white;">尽享天下美食，尽在易点餐美食网</p>
			</div>
		</div>
	</div>
</body>

</html>