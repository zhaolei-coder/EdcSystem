<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>易点餐购物车</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="../img/log.png" rel="shortcut icon" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>layer/layer.js"></script>
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
<script type="text/javascript">
	$(function() {

		$("#checkAll").on("click", function() {
			if ($(this).is(":checked")) {
				//把所有复选框选中
				$("input[name=newslist]").prop("checked", true);
				countPrice();

			} else {
				$("input[name=newslist]").prop("checked", false);
				countPrice2();
			}

		});
		$("input[name=newslist]").click(function() {

			var flag = false;
			if ($(this).is(":checked")) {

				$("input[name=newslist]").each(function() {
					if ($(this).is(":checked")) {
						flag = true;
					} else {
						flag = false;
						return false;
					}
				});
				if (flag) {
					$("#checkAll").prop("checked", "checked");
				}
			} else {
				$("#checkAll").removeAttr("checked");
			}

		})
		$("input[name=newslist]").click(function() {
					var c = 0;
					$("input[name=newslist]").each(function() {
								if ($(this).is(":checked")) {
									c += parseFloat($(this).parent().next()
											.next().next().next().next()
											.children(".tot").text());
								}
							});
					$("#zong1").text(c)
				})
	})

	function countPrice() {
		var totalPrice = 0;
		$(".tot").each(function() {
			totalPrice += parseFloat($(this).text())
		})
		$("#zong1").text(totalPrice)
	}
	function countPrice2() {
		$("#zong1").text(0)
	}
	function deletethis(thisid){
		$.ajax({
			url:'deleteShoppingTrolley.do',
			type:"post",
			data:{
				"thisid":thisid
			},
			dataType:"text",
			success:function(result){
				if(result=="true"){
					window.location.href="to_prev_ShoppingTrolley.do"
				}else{
					alert("删除失败")
				}
			}
		})
	}
</script>
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
	<form action="#">
		<div class="gwc" style="margin: auto;">
			<table cellpadding="0" cellspacing="0" class="gwc_tb1">
				<tr>
					<td class="tb1_td1">选择</td>
					<td class="tb1_td3">商品</td>
					<td class="tb1_td4">原价</td>
					<td class="tb1_td5">数量</td>
					<td class="tb1_td6">总价</td>
					<td class="tb1_td7">操作</td>
				</tr>
			</table>
			<c:forEach items="${shoppingCartS}" var="shoppingCart">
				<table cellpadding="0" cellspacing="0" class="gwc_tb2" id="table1">
					<tr>
						<td colspan="7" class="shopname Font14 FontW">店铺：${shoppingCart.seller.m_ShopName}</td>
					</tr>
					<tr>
						<td class="tb2_td1"><input type="checkbox"
							value="${shoppingCart.productId}" name="newslist" id="" /></td>
						<td class="tb2_td2"><a href="#" target="_blank"> <img
								src="../productImg/${shoppingCart.product.p_ImgPath}" />
						</a></td>
						<td class="tb2_td3"><span class="productName">${shoppingCart.product.p_Name}</span></td>
						<td class="tb1_td4">${shoppingCart.product.p_Price}</td>
						<td class="tb1_td5"><input readonly="readonly" id="text_box1"
							name="" type="text" value="${shoppingCart.shopCont}"
							style="width: 40px; height: 28px; text-align: center; border: 1px solid #ccc;" />
						</td>
						<td class="tb1_td6"><label class="tot"
							style="color: #ff5500; font-size: 14px; font-weight: bold;">${shoppingCart.money}</label>
						</td>
						<td class="tb1_td7"><a href="#" id="delcart1"
							onclick="deletethis(${shoppingCart.id})">删除</a></td>
					</tr>
				</table>
			</c:forEach>
			<table cellpadding="0" cellspacing="0" class="gwc_tb3">
				<tr>
					<td class="tb1_td1"><input id="checkAll" class="allselect"
						type="checkbox" /></td>
					<td class="tb1_td1">全选</td>
					<td class="tb3_td1"></td>
					<td class="tb3_td2 GoBack_Buy Font14"><a
						href="<%=basePath%>index.jsp" target="_blank">继续购物</a></td>

					<td class="tb3_td3">合计(不含运费):<span>￥</span> <span
						style="color: #ff5500;"> <label id="zong1"
							style="color: #ff5500; font-size: 14px; font-weight: bold;">0</label>
					</span>
					</td>
					<td class="tb3_td4" style="background-color: red"><a
						onclick="buy()" style="color: white;">结算</a></td>
				</tr>
			</table>
		</div>
	</form>
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
<script type="text/javascript">
	function buy(){
		if($("input[name=newslist]:checked").length>0){
			var money=$("#zong1").text();
			var pId=new Array($("input[name=newslist]:checked").length);
			var pName=new Array($("input[name=newslist]:checked").length);
			$.each($("input[name=newslist]:checked"),function(index,dom){
				pId[index]=$(this).val();
			})
			alert(pId)
			window.location.href="<%=basePath%>prev/toSubmitOrder.do?money="+money+"&ids="+pId;
		}else{
			layer.alert("请选择商品",{icon:7})
		}
	}
	

</script>
</html>