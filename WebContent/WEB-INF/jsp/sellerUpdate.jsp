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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title></title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=basePath%>layer/theme/default/layer.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
<script type="text/javascript">
	$(function () {
		
		$("#updaseller").submit(function () {
			if($("#m_Name").val()=="" || $("#m_Name").val()==null){
				alert("卖家姓名不能为空");
			}else if($("#m_ShopName").val()=="" || $("#m_ShopName").val()==null){
				alert("店铺名不能为空");
			}else if($("#m_Pwd").val()=="" || $("#m_Pwd").val()==null){
				alert("卖家密码不能为空");
			}else if($("#m_Phone").val()=="" || $("#m_Phone").val()==null){
				alert("卖家电话不能为空");
			}else if($("#m_Address").val()=="" || $("#m_Address").val()==null){
				alert("店铺地址不能为空");
			}else{
				return true;
			}
			return false;
		})
		
		
		$("#register-file")
		.change(
				function() {
					var $file = $(this);
					var fileObj = $file[0];
					var windowURL = window.URL || window.webkitURL;
					var dataURL;
					var $img = $("#preview");

					if (fileObj && fileObj.files && fileObj.files[0]) {
						dataURL = windowURL
								.createObjectURL(fileObj.files[0]);
						$img.attr('src', dataURL);
					} else {
						dataURL = $file.val();
						var imgObj = document.getElementById("preview");
						// 两个坑:
						// 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
						// 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
						imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
						imgObj.filters
								.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

					}
				});
		
	})
</script>
</head>
<style>
label {
	font-size: 18px;
}

#register-file {
	position: absolute;
	right: 0;
	top: 0;
	opacity: 0;
	/*关键点*/
	filter: alpha(opacity = 0);
	/*兼容ie*/
	font-size: 100px;
	/* 增大不同浏览器的可点击区域 */
	cursor: pointer;
}
</style>

<body>
	<div class="container">
		<div class="row col-md-6 col-lg-offset-3"
			style="background-color: #008288">
			<form action="updateSeller.do?m_Id=${seller.m_Id}" id="updaseller" enctype="multipart/form-data" method="post">
				<h2 style="color: white; margin-left: 36%;">商铺修改页</h2>
				<div class="form-group">
					<div class="image_container">
						<img id="preview" width="100" height="100"
							style="background-image: url(../SellerImg/${seller.m_imgPath}); background-size: cover;">
					</div>
					<input id="register-file" class="input-material" type="file"
						name="file" >
				</div>
				<%-- <div class="form-group form-group-lg">
					<label for="P_Name">店铺Id</label> <input type="text"
						class="form-control " name="P_Id" id="P_Id"
						 value="${seller.m_Id}"  readonly="readonly"/>
				</div> --%>
				<div class="form-group form-group-lg">
					<label for="P_Name">卖家姓名</label> <input type="text"
						class="form-control " name="m_Name" id="m_Name"
						 value="${seller.m_Name}"/>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Name">店铺名</label> <input type="text"
						class="form-control " name="m_ShopName" id="m_ShopName"
						 value="${seller.m_ShopName}"/>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Price">卖家登陆密码</label> <input type="text"
						class="form-control" name="m_Pwd" id="m_Pwd"
						 value="${seller.m_Pwd}">
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Name">卖家电话</label> <input type="text"
						class="form-control " name="m_Phone" id="m_Phone"
						 value="${seller.m_Phone}"/>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Name">店铺地址</label> <input type="text"
						class="form-control " name="m_Address" id="m_Address"
						 value="${seller.m_Address}"/>
				</div>			
				<br/>	
				<br/>	
				<div class="row">
					<input type="submit" value="修改"
						class="btn btn-default btn-primary btn-lg col-md-3 col-lg-offset-2"></button>
					&nbsp;
					<button type="reset"
						class="btn btn-default btn-danger btn-lg col-md-3 col-lg-offset-2">重置</button>
				</div>
			</form>
				<br/>	
		</div>
	</div>
</body>

</html>