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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>订单提交</title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="../img/log.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
<script src="<%=basePath%>layer/layer.js"></script>
<script src="<%=basePath%>js/area.js"></script>
</head>
<script>
	$(function() {
		
		$("#myform").submit(function() {
			if ($("input[name=address]").val() == undefined) {
				layer.alert("您还没有地址！", {
					icon : 7
				})
				return false;
			}
			return true;
		})
		/* 2020-4-28 17:02:46 添加地址*/
		$("#addAddr").click(function(){
			var s_province =$("select[name=s_province]").val();
			var s_city=$("select[name=s_city]").val();
			var s_county=$("select[name=s_county]").val();
			var detailedAddress=$("input[name=detailedAddress]").val();
			if(s_province=="省份"){
				alert("请选择省份")
			}else if(s_city=="地级市"){
				alert("请选择地级市")
			} else if(s_county=="市、县级市"){
				alert("请选择市、县级市")
			}else if(detailedAddress==""){
				alert("请输入详细地址")
			}else{
				$.ajax({
					url : "addAddress.do",
					type : "post",
					data : {
						"addr" : s_province+s_city+s_county+detailedAddress
					},
					dateType : "text",
					success : function(result) {
						 if (result == "true") {	
						    layer.alert("添加成功",{icon:1})
							location.reload();
						} else {
							layer.alert("添加失败",{icon:7})
						} 
					}
				})
			}
			
		})
		$(".addrSelect").first().prop("checked","checked")
	})
</script>

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
	<div style="background-color: #F8F8F8;">
		<br />
		<form method="post" id="myform" action="Alipay.do">
			<div class="container"
				style="background-color: #E9E9E9; height: 35px;">
				<h4>
					<strong>订单信息</strong>
				</h4>
			</div>
			<div class="container"
				style="border: 1px solid #EBEBEB; background-color: white;">
				<div class="row">
					<ul class="list-unstyled" style="margin-left: 3%; font-size: 14px;">
						<li><strong>订单编号</strong>:<input style="border: none;"
							type="text" readonly="readonly" name="WIDout_trade_no"
							id="WIDout_trade_no" /></li>
						<br />
						<li><strong>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</strong>:<input
							style="border: none;" id="WIDsubject" type="text"
							name="WIDsubject" readonly="readonly" /></li>
						<br />
						<li><strong>总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</strong>:<span
							style="border: none;" id="price">${money}</span></li>
					</ul>
				</div>
			</div>
			<div class="container"
				style="background-color: #E9E9E9; height: 35px;">
				<h4>
					<strong>收货地址</strong>
				</h4>
			</div>
			<div class="container"
				style="border: 1px solid #EBEBEB; background-color: white;">
				<div class="row">
					<c:forEach items="${addr}" var="addrs">
						<br />
						<label style="margin-left: 3%;"><input type="radio"
							name="address" value="${addrs.addr_Id}" class="addrSelect">&nbsp;${addrs.address}</label>
						<br />
					</c:forEach>
					<br />
				</div>
				<a type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">新添地址</a>
				<hr />
			</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document" style="width: 400px">
					<div class="modal-content" align="center">
						<div class="modal-header">
							<h3 class="modal-title" id="myModalLabel">添加地址</h3>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<select id="s_province" name="s_province" class="form-control"></select>
							</div>
							<div class="form-group">
								<select id="s_city" name="s_city" class="form-control"></select>
							</div>
							<div class="form-group">
								<select id="s_county" name="s_county" class="form-control"></select>
							</div>
							<div class="form-group">
								<input type="text" id="detailedAddress" class="form-control"
									name="detailedAddress" placeholder="输入详细地址" />
							</div>
							<a class="btn btn-warning" id="addAddr" style="width: 100px">添加</a>
						</div>
					</div>
				</div>
			</div>
			<br />
			<div class="container"
				style="background-color: #E9E9E9; height: 35px;">
				<h4>
					<strong>在线支付方式</strong>
				</h4>
			</div>
			<div class="container"
				style="border: 1px solid #EBEBEB; background-color: white;">
				<br /> <label style="margin-left: 3%;"><input type="radio"
					name="zhifu" value="1" checked="checked"><img class="a"
					src="../homeImg/alipay.jpg" /></label> <label style="margin-left: 3%;"><input
					disabled="disabled" type="radio" name="zhifu"><img
					class="a" src="../homeImg//unionpay.gif" /></label> <label
					class="layui-input layui-disabled layui-unselect"
					style="margin-left: 3%;"><input disabled="disabled"
					type="radio" name="zhifu"><img class="a"
					src="../homeImg/WXPAY.png" /></label>
			</div>
			<br />
			<div class="container">
				<div class="row"
					style="box-shadow: 0 0 40px rgba(0, 0, 0, 0.06) inset;">
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						商品名称</div>
					<div class="col-md-4"
						style="text-align: center; line-height: 40px; height: 40px;">
						数量</div>
					<div class="col-md-4"
						style="text-align: center; line-height: 40px; height: 40px;">
						价格</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						店铺</div>
				</div>
			</div>
			<div class="container">
				<c:forEach items="${shopList}" var="shopInfo">
					<div class="row">
						<div class="col-md-2"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							<input
								style="border: none; background-color: #F8F8F8; text-align: center"
								readonly="readonly" type="text" name="p_Name"
								value="${shopInfo.product.p_Name}" />
						</div>
						<div class="col-md-4"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							<input
								style="border: none; background-color: #F8F8F8; text-align: center"
								readonly="readonly" type="text" name="shopCont"
								value="${shopInfo.shopCont }" />
						</div>
						<div class="col-md-4"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							<input
								style="border: none; background-color: #F8F8F8; text-align: center"
								readonly="readonly" type="text" name="money"
								value="${shopInfo.money}" />
						</div>
						<div class="col-md-2"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							<input
								style="border: none; background-color: #F8F8F8; text-align: center"
								readonly="readonly" type="text" name="m_ShopName"
								value="${shopInfo.seller.m_ShopName}" />
						</div>
					</div>
				</c:forEach>
			</div>
			<br />
			<div class="container">
				<div class="row">
					<div class="col-md-1" style="margin-left: -15px;">
						<input type="text" style="width: 300px; height: 50px"
							name="WIDbody" placeholder="留言">
					</div>
					<div class="col-md-5 col-md-offset-9">
						<h3>
							合计:￥<input type="text"
								style="border: none; background-color: #F8F8F8"
								name="WIDtotal_amount" readonly="readonly" id="WIDtotal_amount" />
						</h3>
						<input type="submit" class="btn btn-default" value="提交订单" />
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="container-fluid" style="background: #333333; margin-top: 2%">
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
<script type="text/javascript">
	_init_area();
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		$("#WIDout_trade_no").val(sNow);
		$("#WIDsubject").val("易点餐支付");
		$("#WIDtotal_amount").val($("#price").text())
	}
	GetDateNow();
</script>
</html>