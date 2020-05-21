<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>主页</title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<link rel="stylesheet" href="css/indexFont.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
<link href="../homeImg/dingbu.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
</head>
<style>
.imgs {
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px;
	background: #EEFF99;
}

.text-right a {
	color: #000000;
}
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
<script>
	$(function() {
		$.ajax({
			url : "<%=basePath%>prev/getSomeProduct.do",
			type : "post",
			dataType : "JSON",
			success : function(result) {
				$.each(result.someProduct, function(index, dom) {
					$("#someProduct").append("<div class='col-md-3'style='border:1px solid #EBEBEB' ><div class='imgcss' style='background: white;'><a href='<%=basePath%>prev/to-ProductParticulars.do?p_Id="+dom.p_Id+"'><br/><img src='productImg/"+dom.p_ImgPath+"' class='imgHover'  height='160px' width='260px' /></a><hr/><strong><p>"+dom.p_Name+"</p></strong><p>菜系："+dom.productType.pc_TypeName+"</p><p>金额："+dom.p_Price+"</p></div></div>")
				})
			}
		})
		$.ajax({
			url : "<%=basePath%>prev/getSomeSeller.do",
			type : "post",
			dataType : "JSON",
			success : function(result) {
				$.each(result, function(index, dom) {
					$("#someSeller").append("<div class='col-md-3' style='border:1px solid #EBEBEB' ><div class='imgcss' style='background: white;'><a href='<%=basePath%>prev/to-ShopParticulars.do?m_id="
																			+ dom.m_Id
																			+ "'><br/><img class='imgHover' src='SellerImg/"
																			+ dom.m_imgPath
																			+ "' height='160px' width='260px'/></a><hr/><strong><p style='font-size: 16px'>店名："
																			+ dom.m_ShopName
																			+ "</p></strong><p style='font-size: 14px'>营业时间："
																			+ dom.m_BusinessHours
																			+ "</p><p style='font-size: 14px'>电话："
																			+ dom.m_Phone
																			+ "</p></div></div>")
												})
							}
						})
				$(".imgcss").hover(function() {
					$(this).addClass("imgs")
				}, function() {
					$(this).removeClass("imgs")
				})
			})
</script>

<body style="background: #F9E7C7;">
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
						src="homeImg/logo1.png" height="45%" width="45%" />
					</a>
				</div>
				<div class="collapse navbar-collapse pull-right"
					id="bs-example-navbar-collapse-1">
					<form id="indexSelect" class="navbar-form navbar-right"
						style="margin-top: 2%;">
						<div class="form-group">
							<input size="35" type="text" class="form-control"
								placeholder="请输入要搜索的名称" name="selectName">
						</div>
						<a type="button" class="btn btn-default"
							onclick="selectSellerByName()">搜索店铺</a> <a
							onclick="selectProductPyName()" type="button"
							class="btn btn-default">搜索美食</a>
					</form>
					<ul class="list-inline text-right">
					<li><a href="<%=basePath%>prev/index.do"
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
	<!--中间部分 -->
	<div class="container" style="margin-top: 2%">
		<div class="row">
			<div class="col-md-9">
				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="<%=basePath%>prev/to-ProductParticulars.do?p_Id=79"><img
								src="homeImg/001.jpg" alt="First slide"></a>
						</div>
						<div class="item">
							<a href="<%=basePath%>prev/to-ProductParticulars.do?p_Id=77"><img
								src="homeImg/002.jpg" alt="Second slide"></a>
						</div>
						<div class="item">
							<a href="<%=basePath%>prev/to-ProductParticulars.do?p_Id=84"><img
								src="homeImg/003.jpg" alt="Third slide"></a>
						</div>
						<div class="item">
							<a href="<%=basePath%>prev/to-ProductParticulars.do?p_Id=81"><img
								src="homeImg/004.jpg" alt="Third slide"></a>
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!--from表单-->
			<div class="col-md-3"
				style="background-color: #FFFFFF; border-radius: 10px; border: 1px solid #EBEBEB; height: 310px;">
				<form action="" method="post">
					<br /> <br />
					<div align="center">
						<c:if test="${empty prev.b_ImgPath}">
							<img style="border-radius: 50%; border: 1px solid #EBEBEB;"
								src="userImg/avatar.jpg" height="80px" width="80px" />
						</c:if>
						<c:if test="${not empty prev.b_ImgPath}">
							<img style="border-radius: 50%; border: 1px solid #EBEBEB;"
								src="BuyerImg/${prev.b_ImgPath}" height="80px" width="80px" />
						</c:if>
					</div>
					<br /> <br />
					<c:if test="${empty prev}">
						<p align="center" style="margin-top: 8%;">
							<a href="prev/toLoginPage.do" type="button"
								class="btn btn-default"
								style="width: 100px; border-radius: 15px">登录</a>
						</p>
						<p align="center">
							<a href="prev/toRegister.do" type="button"
								class="btn btn-default "
								style="width: 100px; border-radius: 15px">注册</a>
						</p>
					</c:if>
					<c:if test="${not empty prev}">
						<a href="#"
							style="color: red; text-decoration: none; font-size: 15px; margin-left: 30%">欢迎登陆:</a>
						<a href="#"
							style="color: black; text-decoration: none; font-size: 15px">${prev.b_Name}</a>
						<br />
						<br />
						<p align="center">
							<!--  2020-4-16 -->
							<a href="prev/exit.do?path=<%=basePath%>" type="button"
								class="btn btn-default "
								style="width: 100px; border-radius: 15px">退出</a>
						</p>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 1%;">
		<p>
		<div class="text">
			<p style="font-size: 28px;">美&nbsp;&nbsp;食&nbsp;&nbsp;推&nbsp;&nbsp;荐</p>
		</div>
		</p>
	</div>
	<!--下部分-->
	<div class="container"
		style="border: 0px solid #EBEBEB; background-color: #FFFFFF; border-radius: 15px; margin-top: 40px;">
		<div class="row" id="someProduct"></div>
	</div>
	<!--店铺推荐-->
	<div class="container">
		<br />
		<div class="text">
			<p style="font-size: 28px;">店&nbsp;&nbsp;铺&nbsp;&nbsp;推&nbsp;&nbsp;荐</p>
		</div>
	</div>
	<div class="container"
		style="border: 1px solid #EBEBEB; background-color: #FFFFFF; border-radius: 15px; margin-top: 40px;">
		<div class="row" id="someSeller"></div>
	</div>
	<br />
	<br />
	<!--下部分-->
	<!--下部分-->
	<div class="container-fluid" style="background: #333333;">
		<div class="container" style="height: 163px;">
			<!--style="margin-left: 350px;margin-top: 3%;" -->
			<div class="row" style="margin-top: 1%;">
				<div class="col-md-5">
					<img src="homeImg/DiBuLogo.png" width="100%" />
				</div>
				<div class="col-md-5 col-md-offset-2">
					<div class="row" align="center">
						<div class="col-md-3 col-md-offset-5">
							<img src="homeImg/800.jpg" height="75px" width="85px" />
							<p>
								<a href="#" style="color: #CCCCCC; text-decoration: none;">关注微博</a>
							</p>
						</div>
						<div class="col-md-3">
							<img src="homeImg/900.jpg" height="75px" width="85px" />
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
<script type="text/javascript">
	function selectSellerByName() {
		var name = $("input[name=selectName]").val();
		if (name == null || name == "") {
			layer.alert("搜索内容不能为空", {
				icon : 7
			})
		} else {
			var shopName = $("input[name=selectName]").val();
			window.location.href = "prev/toSelectSeller.do?shopName="
					+ encodeURI(encodeURI(shopName));
		}
	}

	function selectProductPyName() {
		var name = $("input[name=selectName]").val();
		if (name == null || name == "") {
			layer.alert("搜索内容不能为空", {
				icon : 7
			})
		} else {
			window.location.href = "prev/to-AllProduct.do?name="
					+ encodeURI(encodeURI(name));
		}
	}
</script>
</html>