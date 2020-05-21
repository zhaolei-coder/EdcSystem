<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>商品信息</title>
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
.nav-pills li {
	border: 1px solid #ccc;
	border-radius: 5px;
}

.col-md-10 {
	border: 2px solid #ccc;
}
</style>
<script></script>
<script>
	$(function() {
		$("ul li").click(function() {
			var index = $(this).index();
			$(".col-md-10").hide();
			$(".col-md-10:eq(" + index + ")").show();
		});
		
	});
	
	function showAlert(){
		layer.alert("暂时还不能修改头像",{icon:7})
	}
	
	
	//2020-4-21
	$(function() {
		$("li").click(function() {
			$(this).siblings().removeClass("active")
			$(this).addClass("active");
		})
		 $("#updabuyer").submit(function () {
				var b_Name=$("#b_text").val();
				var b_Pwd=$("#b_Pwd").val();
				var b_Birthday=$("#b_Birthday").val();
				var b_Phone=$("#b_Phone").val();
				//var b_ImgPath=$("#b_ImgPath").val();
				if(b_Name==null||b_Name==""){
					layer.alert("用户名不能为空",{icon:7});
				}else if(b_Pwd==null||b_Pwd==""){
					layer.alert("用户密码不能为空",{icon:7});
				}else if(b_Birthday==null||b_Birthday==""){
					layer.alert("用户生日不能为空",{icon:7});
				}else if(b_Phone==null||b_Phone==""){
					layer.alert("用户电话不能为空",{icon:7});
				}else{
					return true;
				}
				return false;
			}) 
	});
	//2020-4-21
	function update(addr_Id) {
		layer.alert("还在开发中，请到订单提交页面添加",{icon:7})
	}
	
	
	
	function fanhui() {
		$("#addForm").hide();
		$("#addList").show();
	}
	//2020-4-21
	function updateprevadd() {
		var bname = $("#b_Name").val();
		var address = $("#address").val();
		var bphone = $("#b_phone").val();
		if(bname==""){
			alert("收货人姓名不能为空");
		}else if(address==""){
			alert("收货人地址不能为空");
		}else if(bphone==""){
			alert("收货人电话不能为空");
		}else{		
		$.ajax({
			url : "updateprevadd.do",
			type : "post",
			data : {
				"bname" : bname,
				"address" : address,
				"bphone" : bphone
			},
			dateType : "JSON",
			success : function(result) {
				if (result == 0) {
					fanhui()
				} else {
					location.reload();
				}
			}
		})
		}
	}

	/* 2020--4-22 留言信息删除*/
	function delComment(cid){
		$.ajax({
			url : "deleteCommentInfo.do",
			type : "post",
			data : {
				"cid" : cid
			},
			dateType : "JSON",
			success : function(result) {
				if (result == "true") {
					
					window.location.href="to-prev_userInfo.do";
				} else {
					layer.alert("删除失败",{icon:7})
				}
			}
		})
	}
	
	/* 2020--4-23 用户地址信息删除*/
	function deletePrevAddress(prevAddId) {
		$.ajax({
			url : "deletePrevAddress.do",
			type : "post",
			data : {
				"prevAddId" : prevAddId
			},
			dateType : "JSON",
			success : function(result) {
				 if (result == "true") {	
				    layer.alert("删除成功",{icon:2})
					location.reload();
				} else {
					layer.alert("删除失败",{icon:7})
				} 
			}
		})
	}
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
	<div class="container">
		<div class="row">
			<div class=" " style="">
				<b style="color: red;">Welcome欢迎光临!</b>
				<hr style="margin-top: 15px;" />
				<div style="background-color: #f5f8fa; border: 1px solid #e9eef8;">
					<img class="col-md-offset-1"
						style="border: 3px solid #E0E0E0; width: 100px; height: 100px; border-radius: 50px 50px 50px 50px"
						src="../BuyerImg/${prev.b_ImgPath}" /> <b>&nbsp;&nbsp;&nbsp;&nbsp;${prev.b_Name}</b>
				</div>
				<div class="col-md-2"
					style="border: 1px solid #e9eef8; height: 50px; text-align: center; line-height: 50px;">
					全部订单:${in[1]}</div>
				<div class="col-md-3"
					style="border: 1px solid #e9eef8; height: 50px; text-align: center; line-height: 50px;">
					<span class="glyphicon glyphicon-shopping-cart" style="color: red"></span>&nbsp;购物车:${in[0]}
				</div>
				<div class="col-md-2"
					style="border: 1px solid #e9eef8; height: 50px; text-align: center; line-height: 50px;">
					已完成订单:${in[3]}</div>
				<div class="col-md-2"
					style="border: 1px solid #e9eef8; height: 50px; text-align: center; line-height: 50px;">
					&nbsp;未支付订单:${in[4]}</div>
				<div class="col-md-3"
					style="border: 1px solid #e9eef8; height: 50px; text-align: center; line-height: 50px;">
					<span class="glyphicon glyphicon-comment"></span>&nbsp;评价:${in[2]}
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-2" style="">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active "><a
						style="text-align: center;" href="#">我的订单</a></li>
					<li role="presentation"><a style="text-align: center;"
						href="#">收货地址</a></li>
					<li role="presentation"><a style="text-align: center;"
						href="#">我的留言</a></li>
					<li role="presentation"><a style="text-align: center;"
						href="#">账户管理</a></li>
					<li role="presentation"><a style="text-align: center;"
						href="#">加入会员</a></li>
					<li role="presentation"><a style="text-align: center;"
						href="exit.do?path=<%=basePath%>">安全退出</a></li>
					<!-- 2020-4-21 -->
				</ul>
			</div>
			<div class="col-md-10">
				<b style="color: black;">购买订单 !</b>
				<hr style="margin-top: 15px;" />
				<div class="row"
					style="box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;">
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						购买人</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						商品名称</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						下单时间</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						价格</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						购买个数</div>
					<div class="col-md-2"
						style="text-align: center; line-height: 40px; height: 40px;">
						支付类型</div>
				</div>
				<c:forEach items="${prevOrderList}" var="prevOrder">
					<div class="row">
						<div class="col-md-2"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.buyer.b_Name}</div>
						<div class="col-md-2"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.product.p_Name}</div>
						<div class="col-md-2"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.o_CreatDate}</div>
						<div class="col-md-2"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.o_TotalPrices}</div>
						<div class="col-md-2"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.o_Count}</div>
						<div class="col-md-2"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${prevOrder.payment_type.zft_type}</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-10" style="display: none;">
				<div id="addList">
					<div class="row">
						<div class="col-md-4">
							<h2>
								<strong>收货人地址</strong>
							</h2>
						</div>
						<div class="col-md-2 col-md-offset-6">
							<button onclick="update()" class="btn btn-default"
								style="margin-top: 18px">新增地址</button>
						</div>
					</div>
					<div id="prevadd">
						<!--  2020-4-20	 -->
						<c:forEach items="${prevAddress}" var="prevAdd">
							<div class="row">
								<div class="col-md-2"
									style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
									${prevAdd.b_Name}</div>
								<div onclick="update(${prevAdd.bAdd.addr_Id})" class="col-md-6"
									style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
									${prevAdd.bAdd.address}</div>
								<div class="col-md-2"
									style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
									${prevAdd.b_Phone}</div>
								<div class="col-md-2"
									onclick="deletePrevAddress(${prevAdd.bAdd.addr_Id})"
									style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
									删除</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="addForm" style="display: none;">
					<h4>
						<strong>详细信息</strong>
					</h4>
					<form class="form-horizontal" action="" method="post">
						<div class="form-group">
							<label for="b_Name" class="col-sm-2 control-label">收货人姓名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="b_Name"
									placeholder="收货人姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="col-sm-2 control-label">收货人地址:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="address"
									placeholder="收货人地址">
							</div>
						</div>
						<div class="form-group">
							<label for="b_phone" class="col-sm-2 control-label">收货人电话:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="b_phone"
									placeholder="收货人电话">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-2">
								<button type="button" onclick="updateprevadd()"
									class="btn btn-danger" style="margin-left: 30%;">确定修改</button>
							</div>
						</div>
					</form>
					<button onclick="fanhui()" type="submit" class="btn btn-default"
						style="margin-left: 70%; margin-top: -80px;">返回</button>
				</div>
			</div>
			<div class="col-md-10" style="display: none;">
				<b style="color: black;">留言详情 !</b>
				<hr style="margin-top: 15px;" />
				<!--  111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->
				<c:if test="${empty commentinfo}">
					<div align="center">
						<img src="../img/zwly.png" height="250px" width="300px" />
					</div>
				</c:if>
				<c:if test="${not empty commentinfo}">
					<div class="row"
						style="box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;">
						<div class="col-md-2"
							style="text-align: center; line-height: 40px; height: 40px;">
							商品名称</div>
						<div class="col-md-4"
							style="text-align: center; line-height: 40px; height: 40px;">
							评论内容</div>
						<div class="col-md-2"
							style="text-align: center; line-height: 40px; height: 40px;">
							店铺名</div>
						<div class="col-md-2"
							style="text-align: center; line-height: 40px; height: 40px;">
							留言时间</div>
						<div class="col-md-2"
							style="text-align: center; line-height: 40px; height: 40px;">
							操作</div>
					</div>
					<c:forEach items="${commentinfo }" var="comment">
						<div class="row">
							<div class="col-md-2"
								style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
								${comment.product.p_Name }</div>
							<div class="col-md-4"
								style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
								${comment.c_Content }</div>
							<div class="col-md-2"
								style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
								${comment.seller.m_ShopName }</div>
							<div class="col-md-2"
								style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
								${comment.c_Date }</div>
							<div class="col-md-2" onclick="delComment(${comment.c_Id})"
								style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
								删除</div>
						</div>
					</c:forEach>
				</c:if>
				<!--  111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->
			</div>
			<div class="col-md-10 account" style="display: none;">
				<b>账户管理</b>
				<hr style="margin-top: 15px;" />
				<p>登陆账号：${prev.b_Name}</p>
				<p>手机号码：${prev.b_Phone}(</p>
				<form action="updateBuyer.do" id="updabuyer" class="asds"
					enctype="multipart/form-data" method="post">
					<table>
						<tr>
							<td width="30%" align="right">*修改头像：</td>
							<td><input type="file" id="b_ImgPath" disabled="disabled"
								onclick="showAlert()" name="file">&nbsp&nbsp</td>
						</tr>
						<tr>
							<td width="30%" align="right">*姓名：</td>
							<td><input type="text" id="b_text" name="b_Name"
								value="${prev.b_Name}"></td>
						</tr>
						<tr>
							<td width="30%" align="right">*密码：</td>
							<td><input type="password" id="b_Pwd" name="b_Pwd"
								value="${prev.b_Pwd}"></td>
						</tr>
						<tr>
							<td width="30%" align="right">*生日：</td>
							<td><input type="date" id="b_Birthday" name="b_Birthday"
								value="${prev.b_Birthday}"></td>
						</tr>
						<tr>
							<td width="30%" align="right">*手机：</td>
							<td><input type="tel" id="b_Phone" name="b_Phone"
								value="${prev.b_Phone}"></td>
						</tr>
						<tr>
							<td></td>
							<td><input id="updabuyer" type="submit" value="保 存"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-10" style="display: none; height: 320px;">
				<div class="row"
					style="box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;">
					<div class="col-md-3"
						style="text-align: center; line-height: 40px; height: 40px;">
						会员类型</div>
					<div class="col-md-3"
						style="text-align: center; line-height: 40px; height: 40px;">
						会员价格</div>
					<div class="col-md-3"
						style="text-align: center; line-height: 40px; height: 40px;">
						优惠</div>
					<div class="col-md-3"
						style="text-align: center; line-height: 40px; height: 40px;">
						操作</div>
				</div>
				<c:forEach items="${selectVip}" var="selectVip">
					<div class="row">
						<div class="col-md-3"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${selectVip.v_Type}</div>
						<div class="col-md-3"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${selectVip.v_Money}</div>
						<div class="col-md-3"
							style="overflow: hidden; border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							${selectVip.v_Discount}折</div>
						<div class="col-md-3"
							style="border: 1px #CCCCCC solid; text-align: center; line-height: 40px; height: 40px;">
							<a class="dss" onclick="getThisVip(${selectVip.v_Id})">购买</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="background: #333333; margin-top: 11%">
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
	
	
	function getThisVip(vid) {
		 $.ajax({
			url:"getThisVip.do",
			type:"get",
			data:{"userId":vid},
			success:function(result){
				if(result=="true"){
					alert("您已经是会员")
				}else{
					$.ajax({
						url:"buyVip.do",
						type:"get",
						data:{"vid":vid},
						success:function(result){
							if(result=="true"){
								alert("购买成功");
								window.location.href="to-prev_userInfo.do";
							}else{
								alert("购买失败")
							}
						}
					})
				}
			}
		})
	}
	
</script>
</html>