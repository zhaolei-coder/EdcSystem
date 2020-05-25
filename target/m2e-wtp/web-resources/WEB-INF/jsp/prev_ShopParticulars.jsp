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
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>店铺详情页面</title>
<link rel="stylesheet" href="<%=basePath%>css/pagination.css">
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.pagination.js"></script>
<link href="../img/log.png" rel="shortcut icon" />
<script src="<%=basePath%>layer/layer.js"></script>
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
</head>
<style type="text/css">
.aaa {
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #000;
}
.imgHover {
	transition: All 0.4s ease-in-out;
	-webkit-transition: All 0.4s ease-in-out;
	-moz-transition: All 0.4s ease-in-out;
	-o-transition: All 0.4s ease-in-out;
}

.imgHover:hover {
transform: translate(0, -10px);
	-webkit-transform: translate(0, -10px);
	-moz-transform: translate(0, -10px);
	-o-transform: translate(0, -10px);
	-ms-transform: translate(0, -10px);
}
.imgHover2 {
	transition: All 0.4s ease-in-out;
	-webkit-transition: All 0.4s ease-in-out;
	-moz-transition: All 0.4s ease-in-out;
	-o-transition: All 0.4s ease-in-out;
}

.imgHover2:hover {
	transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
	-ms-transform: scale(1.1);
}

</style>
<script type="text/javascript">
	$(function() {
		load(0)
		$("#abc .one:first").show()
		$("ul li").click(function() {
			$("ul li:not(this)").attr("class", "")
			$(this).attr("class", "active")
			var index = $(this).index();
			$("#abc .one").hide()
			$("#abc .one:eq(" + index + ")").show();
		});
	});
	function load(pageIndex) {
		$.ajax({
			url : "selectAllProductByShopId.do",
			type : "post",
			data : {
				"pageIndex" : pageIndex,
				"shopId":${seller.m_Id}
			},
			dataType : "JSON",
			success : function(result) {
				$("#proList").html('')
				 $.each(result.pagelist, function(index, dom) {
					/*  2020-4-27  */
					$("#proList").append("<div class='col-md-3 imgHover' ><div class='thumbnail' ><img src='../productImg/"+dom.p_ImgPath+"' style='width:300px; height: 180px;'><div class='caption'><h4 style='text-align: center;'>"+dom.p_Name+"</h4><p style=';'><center><a  onclick='insert(+"+dom.p_Id+","+dom.p_Price+")'   class='btn btn-danger' role='button'>添加至购物车￥"+dom.p_Price+"</a></p></div></div>")
				}) 

				$("#pagination").pagination(result.pageCount, {
					current_page : result.pageIndex,
					items_per_page : result.pageSize,
					num_display_enteries : 10,
					callback : load,
					prev_text : '上一页',
					next_text : '下一页',
				});
			}
		})
	}
	
    /* 	2020-4-27 */
    function insert(pId,pPrice) {
    	var name="<%=session.getAttribute("prev")%>";
    	if(name=="null"){
    		layer.alert("请您先登录",{icon:7});
    	}else{
    		$.ajax({
    			url : "insertShoppingCart.do",
    			type : "post",
    			data : {
    				"p_Id" : pId,
    				"p_Price":pPrice,
    				"shopCount":1
    			},
    			dataType : "JSON",
    			success : function(result) {
    				if(result=="false"){
    					alert("添加购物车失败");
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
    	}
 }
	
</script>
<body>
<div class="container-fluid" style=" height: 84px; background: #333333">
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
	<br/>
	<br/>
	<div class="container" >
		<div class=" row">
			<div class="col-md-9">
				<div
					style=" background-color:; width: 800px; height: 70px; box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;">
					<img style="width: 100px; height: 70px;"
						src="../SellerImg/${seller.m_imgPath}" /> <b>${seller.m_ShopName}</b>
				</div>
				<!--margin-left: 350px;-->
				<div style="border: 1px #CCCCCC solid; width: 800px; height: 320px;">
					<div
						style="margin-top: 4px; margin-left: 3px; width: 360px; height: 310px; border: solid 1px #C0C0C0;">
						<img
							style="margin-top: 3px; margin-left: 4px; width: 350px; height: 300px;"
							src="../SellerImg/${seller.m_imgPath}" />
					</div>
					<div style="margin-left: 400px; margin-top: -290px;">
						<p style="margin-left: 20px;">
							<b>地址:</b>${seller.m_Address}
						</p>
						<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
						<p style="margin-left: 20px;">
							<b>电话:</b>${seller.m_Phone}
						</p>
						<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
						<p style="margin-left: 20px;">
							<b>特色菜品:</b>
							<c:forEach items="${twoPro}" var="pro">
								${pro.p_Name}
							</c:forEach>
						</p>
						<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
						<p style="margin-left: 20px;">
							<b>营业时间:</b>${seller.m_BusinessHours}
						</p>
						<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
						<p style="margin-left: 20px;">
							<b>WIFI:</b>免费WIFI
						</p>
						<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
					</div>
					<a href=""><button
							style="margin-left: 425px; background-color: red; color: white; border-radius: 5px; width: 200px; height: 50px;"
							type="button">
							<b>进 店</b>
						</button></a>
				</div>
			</div>
			<div class="col-md-3"
				style="height: 393px; border: 1px solid #CCCCCC;">
				<p style="text-align: center; font-size: 20px;">
					<b>菜品推荐</b>
				</p>
				<p style="width: 256px; border: 0.5px dashed #CCCCCC;"></p>
				<c:forEach items="${twoPro}" var="pro">
					<br/>
					<div class="imgHover2">
						<a href="<%=basePath%>prev/to-ProductParticulars.do?p_Id=${pro.p_Id}"><img style="border:1px solid #cccccc; margin-left: 20px; width: 220px; height: 100px;"
							src="../productImg/${pro.p_ImgPath}" /></a>
						<div class="col-md-4"
							style="margin-left: 20px; border: solid 1px #ADADAD; width: 110px; height: 50px;">
							<span style="margin-left: 30px;">${pro.p_Price}</span>
							<p style="margin-left: 30px;">
								<b>价格</b>
							</p>
						</div>
						<div class="col-md-4"
							style="border: solid 1px #ADADAD; width: 110px; height: 50px;">
							<span style="margin-left: 30px;">${pro.p_Good}</span>
							<p style="margin-left: 25px;">
								<b>好评</b>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="container" id="abc"
		style="margin-top: 50px; margin-top: 20px;">
		<ul class="nav nav-tabs">
			<li class="active" style="font-size: 15px; color:;"><a href="#"
				style="color: #000000;">菜 谱</a></li>
			<li style="font-size: 15px;"><a href="#" style="color: #000000;">商家详情</a>
			</li>
		</ul>
		<div class="row one" style="margin-top: 50px;">
			<div class="row">
				<div id="proList" ></div>
			</div>

			<div class="row" align="center">
				<div class="pagination" id="pagination" style="margin: 4px 0 0 0"
					class="M-box"></div>
			</div>
		</div>

		<div class="row one" style="display: none; margin-top: 50px;">
			<div class="col-md-offset-1">
				<div class="col-md-6 ">
					<!-- 2020-4-27 -->
					<img style="width: 500px; height: 290px;"
						src="../SellerImg/${seller.m_imgPath}" class="imgHover2"/>
				</div>
				<!-- 2020-4-27 -->
				<div class="col-md-offset-7 clo-md-6">

					<p style="margin-left: 20px;">
						<b>店铺名称:</b>${seller.m_ShopName}
					</p>
					
					<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
					<br/>
					<p style="margin-left: 20px;">
						<b>店铺地址:</b>${seller.m_Address}
					</p>
					
					<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
					<br/>
					<p style="margin-left: 20px;">
						<b>订餐电话:</b>${seller.m_Phone}
					</p>
					
					<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
					<br/>
					<p style="margin-left: 20px;">
						<b>营业时间:</b>${seller.m_BusinessHours}
					</p>
					
					<p style="width: 365px; border: 0.5px dashed #CCCCCC;"></p>
				</div>
			</div>
		</div>
	</div>
	<br/>
	<br/>
	<br/>
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