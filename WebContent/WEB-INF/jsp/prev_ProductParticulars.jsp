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
<!-- 商品详情页面 -->
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
<link href="../img/log.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
<script src="<%=basePath%>layer/layer.js"></script>
<style type="text/css">
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
<script>
	$(function() {
		//加号
		var price1 = parseFloat($('#price').text());
		var num = parseInt($('input[name="num"]').attr('value'));
		var count = parseFloat($('#count').text());
		/* 2020-4-24 */
		$('.add').click(function() {
				num++;
				$('input[name="num"]').attr('value', num);
				var total = num * price1;
				$('#price').html(total.toFixed(2));
		});
		//减号
		$('.minus').click(function() {
			if (num > 1) {
				num--;
				$('input[name="num"]').attr('value', num);
				console.log(num)
				var total = num * price1;
				$('#price').text(total.toFixed(2));
			}

		});
		
		
	});
	
	/* 2020-4-24 */
	function insertShoppingCart(p_Id,p_Price,buyer) {
		var num = $('input[name="num"]').val();
		if(buyer != ""){
			$.ajax({
				url : "insertShoppingCart.do",
				type : "post",
				data :{"p_Id":p_Id,"shopCount":num,"p_Price":p_Price},
				dateType : "JSON",
				success : function(result) {
					if(result=="false"){
						layer.alert("添加购物车失败",{icon:7});
					}else{
						layer.confirm('添加成功！', {
						    btn: ['去购物车', '继续浏览']
						}, function () {
							window.location.href="to_prev_ShoppingTrolley.do";
						}, function () {
						 
						});
					}
				}
			}) 
		}else{
			layer.alert("您还没有登录！",{icon:7});
		} 
		
	}
	function submitComment(pId){
		var commentText=$("#commentText").val();
		if(commentText!=""){
			if("${prev}"==""){
				layer.alert("您还没有登录",{icon:7});
			}else{
				$.ajax({
					url : "selectCommentCount.do",
					type : "post",
					data : {
						"pId":pId
					},
					dataType : "text",
					success : function(result) {
						if(result=="true"){
							layer.alert("已经评论过此商品了",{icon:7});
						}else{
							$.ajax({
								url : "addComment.do",
								type : "post",
								data : {
									"pId":pId,
									"commentText":commentText
								},
								dataType : "text",
								success : function(result) {
									if(result=="true"){
										layer.alert("评论成功",{icon:1});
										window.location.href="to-ProductParticulars.do?p_Id="+${nb.product.p_Id}
									}else{
										layer.alert("评论失败",{icon:7});
									}
								}
							})
						}
					}
				})
			}
		}else{
			layer.alert("请输入评论内容",{icon:7});
		}
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
	<div class="container" style="margin-top: 3%;">
		<div class="row">
			<div class="col-md-8">
				<div style="height: 100px;">
					<img src="../productImg/${nb.product.p_ImgPath }"
						style="width: 300px; height: 255px; border: 1px solid #ccc; border-radius: 10px;" class="imgHover"/>
				</div>
				<div
					style="margin-left: 350px; margin-top: -100px; border: 1px solid #ccc; border-radius: 10px;">
					<div
						style="width: 398px; height: 130.9px; background-color: #CCCCCC;">
						<span
							style="font-weight: bold; font-size: 18px; margin-left: 10px;">${nb.product.p_Name }</span>
						<div
							style="background-color: #CCCCCC; width: 300px; height: 60px;">
							<p style="margin-left: 10px;">
								价格：￥<span
									style="font-weight: bold; font-size: 30px; color: orangered; text-align:">${nb.product.p_Price }</span>
							</p>
						</div>
						<div class="col-md-4"
							style="border: solid 1px #ADADAD; width: 150px; height: 45px; margin-left: 48px; border-radius: 10px;">
							<span style="margin-left: 50px;">${nb.saleCount}</span>
							<p style="margin-left: 40px;">销量</p>
						</div>
						<div class="col-md-4"
							style="border: solid 1px #ADADAD; width: 150px; height: 45px; border-radius: 10px;">
							<span style="margin-left: 50px;">${nb.comment.size()}</span>
							<p style="margin-left: 30px;">累计评价</p>
						</div>
					</div>
					<br />
					<p style="margin-left: 60px;">我要买:</p>
					<div class="goods_num clearfix"
						style="margin-left: 120px; margin-top: -33px;">
						<div class="num_add fl">
							<a href="javascript:;" class="add fr"><span
								class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>&nbsp;
							<input style="width: 50px;" type="text" name="num"
								class="num_show fl" value="1">&nbsp; <a
								href="javascript:;" class="minus fr"><span
								class="glyphicon glyphicon-minus" aria-hidden="true"></span></a>
						</div>
					</div>
					<div class="total" style="margin-left: 230px; margin-top: -22px;">单价：${nb.product.p_Price }元</div>
					<br /> <br />
					<p id="count"
						style="margin-left: 35px; margin-top: -40px; display: none;">${nb.product.p_Count }</p>
					<button class="btn btn-default"
						style="border-radius: 15px; width: 150px; height: 40px; margin-left: 120px;"
						onclick="insertShoppingCart(${nb.product.p_Id},${nb.product.p_Price},'${prev.b_Name}')">加入购物车</button>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1" style="border: 1px solid #ccc;">
				<b style="font-size: 20px;">商品信息</b>
				<hr />
				<blockquote>
					<p style="font-size: 14px">${nb.product.p_Info }</p>
				</blockquote>
			</div>
		</div>
		<br />
		<div class="row" style="margin-top: 8%">
			<ul class="media-list">
				<li class="media">
					<div class="media-body">
						<h3 class="page-header">评论</h3>
						<br /> <br />
						<c:choose>
							<c:when test="${not empty nb.comment}">
								<ul class="media-list">
									<c:forEach items="${nb.comment}" var="comment">
										<li class="media">
											<div class="media-left">
												<a href="#"> <img
													style="width: 63px; height: 63px; border: 2px solid #ccc;"
													class="media-object"
													src="../BuyerImg/${comment.buyer.b_ImgPath}">
												</a>
											</div>
											<div class="media-body">
												<p style="font-size: 15px" class="media-heading">${comment.buyer.b_Name}</p>
												<br />
												<p>&nbsp;&nbsp;&nbsp;&nbsp;${comment.c_Content}</p>
												<h6 align="right">&nbsp;&nbsp;&nbsp;&nbsp;${comment.c_Date}</h6>
												<hr />

											</div>
										</li>
									</c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
								<div align="center">
									<img width="200px" src="../productImg/no.png">
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container" style="margin-top: 10%">
		<div class="row">
			<form>
				<div class="form-group">
					<textarea id="commentText" cols="165" rows="3" placeholder="评价商品"></textarea>
				</div>
			</form>
			<div>
				<a class="btn btn-default "
					onclick="submitComment(${nb.product.p_Id})" style="width: 100px">提交</a>
			</div>
		</div>
	</div>
	<br>
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