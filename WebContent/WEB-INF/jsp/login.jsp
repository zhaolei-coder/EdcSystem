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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>易点餐后台登录</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
</head>
<body>
	<div class="page login-page">
		<div class="container d-flex align-items-center">
			<div class="form-holder has-shadow">
				<div class="row">
					<!-- Logo & Information Panel-->
					<div class="col-lg-6">
						<div class="info d-flex align-items-center">
							<div class="content">
								<div class="logo">
									<h1>欢迎登录</h1>
								</div>
								<p>易点餐后台管理系统</p>
							</div>
						</div>
					</div>
					<!-- Form Panel    -->
					<div class="col-lg-6 bg-white">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form class="form-validate" id="loginFrom">
									<div class="form-group">
										<input id="login-username" type="text" name="userName"
											required data-msg="请输入用户名" placeholder="用户名"
											class="input-material">
									</div>
									<div class="form-group">
										<input id="login-password" type="password" name="passWord"
											required data-msg="请输入密码" placeholder="密码"
											class="input-material">
									</div>
									<div class="form-group">
										<input id="login-code" type="text" name="code" required
											data-msg="请输入验证码" placeholder="请输入验证码" class="input-material">
									</div>
									<div class="form-group ">
										<div class="row">
											<img src="loadimg.do" class="col-md-4" height="40px"
												id="imgCode" onclick="getImage(this)" />
										</div>
									</div>
									<div class="form-group radio">
										<label> <input type="radio" name="check" value="1"
											checked="checked"> 管理员
										</label> <label> <input type="radio" name="check" value="2">
											商家
										</label>
									</div>

									<button id="login" type="button" class="btn btn-primary">登录</button>
									<button id="register" type="button" class="btn btn-primary">
										<a href="register.do"
											style="text-decoration: none; color: white;">商家注册</a>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/bootstrap.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="<%=basePath%>layer/layer.js"></script>
	<!--表单验证-->
	<!-- Main File-->
	<script>
		$(function() {
			$("#login").click(function() {
				var name = $("#login-username").val();
				var pwd = $("#login-password").val();
				var code = $("#login-code").val();
				if (name == "" || pwd == "") {
					layer.alert("用户名或密码不能为空", {
						icon : 7
					})
				} else if (code == "") {
					layer.alert("请输入验证码", {
						icon : 7
					})
				} else {
					var check = $("input[name=check]:checked").val();
					if (check == 1) {
						$.ajax({
							url : "adminLogin.do",
							type : "post",
							data : $("#loginFrom").serialize(),
							success : function(result) {
								if (result == "true") {
									window.location.href = "index.do";
								} else {
									layer.alert("登录失败", {
										icon : 7
									})
								}
							}
						})
					} else if (check == 2) {
						$.ajax({
							url : "sellerLogin.do",
							type : "post",
							data : $("#loginFrom").serialize(),
							success : function(result) {
								if (result == "true") {
									window.location.href = "<%=basePath%>back/index.do";
								} else {
									layer.alert("登录失败", {
										icon : 7
									})
								}
							}
						})
					}
				}

			})

			//判断验证码
			$("#login-code").change(function() {
				var code = $(this).val();
				$.ajax({
					url : "checkCode.do?inputCode=" + code,
					type : "get",
					dateType : "text",
					success : function(result) {
						if (result == "false") {
							$("#login-code").val('');
							layer.alert("验证码输入有误，请重新输入", {
								icon : 7
							})
						}
					}
				})
			})
		})
		//验证码
		function getImage(img) {
			img.src = "loadimg.do?time" + new Date().getTime();
		}
	</script>
</body>

</html>