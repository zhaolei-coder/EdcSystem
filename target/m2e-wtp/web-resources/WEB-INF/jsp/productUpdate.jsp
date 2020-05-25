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
	$(function() {
		$.ajax({
			url : "getproducttype.do",
			type : "post",
			dataType : "JSON",
			success : function(result) {
				$.each(result, function(index, dom) {
					$("select[name=P_pcId]").append(
							"<option value='"+dom.pc_Id+"'>" + dom.pc_TypeName
									+ "</option>")
				})
			}
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
		$("#submit").click(function() {
			var proName = $("#P_Name").val();
			var proPrice = $("#P_Price").val();
			var proCount = $("#P_Count").val();
			var proType = $("#P_pcId").val();
			var proInfo = $("#P_Info").val();
			if (proName == "") {
				layer.alert("商品名称不能为空", {
					icon : 7
				})
			} else if (proPrice == "") {
				layer.alert("商品价格不能为空", {
					icon : 7
				})
			}else if(proCount==""){
				layer.alert("商品数量不能为空", {
					icon : 7
				})
			}else if(proType==""){
				layer.alert("商品类型不能为空", {
					icon : 7
				})
			}else if(proInfo==""){
				layer.alert("商品信息不能为空", {
					icon : 7
				})
			}else{
				var formData = new FormData($("#proFrom")[0]); 
				$.ajax({
					url :"<%=basePath%>back/updateProduct.do",
							type : 'POST',
							data : formData,
							async : false,
							cache : false,
							contentType : false, //必须
							processData : false, //必须
							dataType : "JSON",
							success : function(result) {
								if (result == "1") {
									window.location.href="to-product-list.do";
									layer.alert("修改成功 ", {
										icon : 7
									})
								} else {
									layer.alert("修改失败", {
										icon : 7
									})
								} 
							}
						})
			}
		})

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
			<form id="proFrom" enctype="multipart/form-data">
				<h2 style="color: white; margin-left: 36%;">商品修改页</h2>
				<div class="form-group">
					<div class="image_container">
						<img id="preview" width="100" height="100"
							style="background-image: url(<%=basePath%>productImg/${pro.p_ImgPath}); background-size: cover;">
					</div>
					<input id="register-file" class="input-material" type="file"
						name="p_imgPath" accept="image/*">
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Name">商品Id</label> <input type="text"
						class="form-control " name="P_Id" id="P_Id"
						 value="${pro.p_Id}"  readonly="readonly"/>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Name">请输出商品名</label> <input type="text"
						class="form-control " name="P_Name" id="P_Name"
						 value="${pro.p_Name}"/>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Price">产品价格</label> <input type="text"
						class="form-control" name="P_Price" id="P_Price"
						 value="${pro.p_Price}">
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Good">产品点赞数</label> <input type="text"
						class="form-control" name="P_Good" id="P_Good" value="0"
						 value="${pro.p_Good}" readonly="readonly">
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Count">产品数量</label> <input type="text"
						class="form-control" name="P_Count" id="P_Count"
						 value="${pro.p_Count}" >
				</div>
				<div class="form-group form-group-lg">
					<label for="P_mId">商家id</label> <input type="text"
						class="form-control" id="P_mId" 
						readonly="readonly"  value="${pro.p_Mid}" name="P_mId">
				</div>
				<div class="form-group form-group-lg">
					<label for="P_pcId">商品类型</label> <select class="form-control"
						name="P_pcId" id="P_pcId">
						<c:forEach items="${productTypeList}"  var="item">
							<c:choose>
								<c:when test="${item.pc_Id  eq  pro.p_pcId}">
									<option value="${item.pc_Id}" selected>${item.pc_TypeName}</option>
								</c:when>
								
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="form-group form-group-lg">
					<label for="P_Info">产品详情</label> <input type="text"
						class="form-control" value="${pro.p_Info}" name="P_Info" id="P_Info">
				</div>

				<div class="row">
					<button type="button" id="submit"
						class="btn btn-default btn-primary btn-lg col-md-3 col-lg-offset-2">修改</button>
					&nbsp;
					<button type="reset"
						class="btn btn-default btn-danger btn-lg col-md-3 col-lg-offset-2">重置</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>