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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>商品详情</title>
<link rel="stylesheet" href="<%=basePath%>css/pagination.css">
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.pagination.js"></script>
</head>
<style>
a {
	color: black;
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
</style>
<script>

	$(function() {
		$("li").click(function() {
			$(this).css("color", "white")
			$(this).css("background", "red")
			$(this).siblings().css("background", "white")
			$(this).siblings().css("color", "black")
		})		
		 /*  2020-4-22 */
        	load(0,-1,-1);
		/* 2020-4-17	 */
		$("#price").children().click(function () {
			 var price=$(this).val();
			 load(0,-2,price) ; 
		})
	})
/* 2020-4-17	 */
	function load(pageIndex,pcId,price) {
		if(typeof (pcId)==='object'){
			pcId=$("#sp1").text();
			price=$("#sp2").text();
		} 
		var shopName;
		if(pcId==-1){
			pcId=$("#sp1").text();
			price=$("#sp2").text();
	 	    $("#sp").text($("#shopName").val()); 
	 	    shopName=$("#shopName").val()
		}else if(pcId==-2){
			shopName=$("#sp").text();
			$("#sp2").text(price);
			pcId=$("#sp1").text();
		}else{
			$("#sp1").text(pcId);
			shopName=$("#sp").text();
			price=$("#sp2").text();
		}
		$.ajax({
			url : "getProductList.do",
			type : "post",
			data : {"pageIndex" : pageIndex,"name":shopName,"pcId":pcId,"price":price},
			dataType : "JSON",
			success : function(result) {
				if(result==null){
					alert("未查询到该商家");
				}else{
					$("#fenye").html('');
				    $.each(result.pagelist, function(index, product) {
					$("#fenye").append("<div class='col-md-4 imgHover'><div class='imgcss' style='background: white; border:1px solid #ccc;'><a href='<%=basePath%>prev/to-ProductParticulars.do?p_Id="+product.p_Id+"'><img   src='../productImg/"
					+product.p_ImgPath+"' height='200px'width='358px' /></a><hr/> <strong><h4 style='font-size:;'>&nbsp;&nbsp;"
					+product.p_Name+"</h4></strong> <p>&nbsp;&nbsp;菜系："
					+product.productType.pc_TypeName+"</p><p>&nbsp;&nbsp;金额："
					+product.p_Price+"</p><a href='<%=basePath%>prev/to-ProductParticulars.do?p_Id="+product.p_Id+"' class='btn btn-danger col-md-3 col-lg-offset-2'style='margin-left: 70%; margin-top: -15%;'>点外卖</a></div></div>")
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
			}
		})
	}
</script>

<body>
	<br />
	<div class="container-fluid" style="height: 84px; background: #333333">
		<nav class="navbar" style="background: #333333">
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
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<form class="navbar-form navbar-right" style="margin-top: 2%;">
						<div class="form-group">
							<!-- 2020-4-22 -->
							<c:if test="${empty name}">
								<input type="text" id="shopName" size="40" class="form-control"
									placeholder="搜索商品名">
							</c:if>
							<c:if test="${not empty name}">
								<input value="${name}" type="text" id="shopName" size="40"
									class="form-control" placeholder="搜索商品名">
							</c:if>
						</div>
						<!--  2020-4-16	 -->
						<span style="display: none" id="sp"></span>
						<!--  2020-4-16	 -->
						<button type="button" onclick="load(0,-1,-1)"
							class="btn btn-default" style="background-color: #28A4C9;">搜索</button>
					</form>
				</div>
			</div>
		</nav>
	</div>
	<!-- 11111111111111111111111111111111111111111111111111111111111111111111111111111111111 -->
	<div class="container"
		style="background-color: #E9E9E9; height: 20px; width: 100%;"></div>
	<!--分类-->
	<div class="container" style="border: 1px solid #EBEBEB;">
		<ul class="list-inline">
			分类：
			<!--  2020-4-16	 -->
			<li onclick="load(0,0,-1)"
				style="margin-top: 2%; background: red; color: white;">全部</li>
			<c:forEach items="${productTypeList}" var="productType">
				<!--  2020-4-16	 -->
				<li value="${productType.pc_Id}"
					onclick="load(0,${productType.pc_Id},-1)">${productType.pc_TypeName }</li>
			</c:forEach>
			<!--  2020-4-16	 -->
			<span style="display: none" id="sp1"></span>
		</ul>
		<hr />
		<ul class="list-inline" id="price">
			价格：
			<!-- 2020-4-17 -->
			<li value="-1" style="background: red; color: white;">全部</li>
			<li value="0">20元以下</li>
			<li value="20">20-40元</li>
			<li value="40">40-60元</li>
			<li value="60">60-80元</li>
			<li value="80">80-100元</li>
		</ul>
		<!-- 2020-4-17 -->
		<span style="display: none" id="sp2"></span>
	</div>
	<!--中间部分-->
	<br />
	<br />
	<div class="container">
		<div class="row" id="fenye"></div>
	</div>
	<br />
	<div align="center">
		<div class="pagination" id="pagination" style="margin: 4px 0 0 0"
			class="M-box"></div>
	</div>
	<br />
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