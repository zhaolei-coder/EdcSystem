<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>易点餐登录</title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>layer/layer.js"></script>
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
<link href="img/log.png" rel="shortcut icon" />
<!--头像上传js -->
<script src="<%=basePath%>js/iscroll-zoom.js"></script>
<script src="<%=basePath%>js/hammer.js"></script>
<script src="<%=basePath%>js/lrz.all.bundle.js"></script>
<script src="<%=basePath%>js/jquery.photoClip.min.js"></script>
<style type="text/css">
/* 头像上传样式 */
#upload_D {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: none;
}

#upload_D>.upload_frame {
	width: 666px;
	height: 634px;
	background: #FFFFFF;
	border-radius: 10px;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	overflow: hidden;
}

#upload_D>.upload_frame>.upload_title {
	padding: 28px 46px 28px 46px;
	border-bottom: 1px solid #e7e7e7;
	overflow: hidden;
}

#upload_D>.upload_frame>.upload_title>.upload_title_left {
	float: left;
	line-height: 24px;
	font-size: 18px;
}

#upload_D>.upload_frame>.upload_title>.upload_title_right {
	float: right;
	cursor: pointer;
}

#upload_D>.upload_frame>.upload_fileBtn {
	padding: 24px 46px;
	line-height: 34px;
	font-size: 16px;
}

#upload_D>.upload_frame>.upload_fileBtn>input {
	display: none;
}

#upload_D>.upload_frame>.upload_fileBtn>label {
	display: inline-block;
	width: 88px;
	height: 34px;
	text-align: center;
	border-radius: 5px;
	background: #ff5757;
	margin-left: 22px;
	color: #FFFFFF;
}

#upload_D>.upload_frame>.upload_content {
	padding: 0 46px;
}

#upload_D>.upload_frame>.upload_content>#clipArea {
	width: 388px;
	height: 388px;
	float: left;
	margin-left: 20px;
}

#upload_D>.upload_frame>.upload_content .upload_content_right {
	float: right;
	width: 120px;
	margin-right: 20px;
	text-align: center;
}

#upload_D>.upload_frame>.upload_content .upload_content_right .upload_view
	{
	width: 120px;
	height: 120px;
}

#upload_D>.upload_frame>.upload_content .upload_content_right #clipBtn {
	width: 90px;
	height: 34px;
	border: none;
	outline: none;
	border-radius: 5px;
	background: #FF5757;
	color: #FFFFFF;
	margin-top: 196px;
}

#upload_D>.upload_frame>.upload_content .upload_content_right label {
	display: block;
	margin-top: 14px;
	font-size: 16px;
	color: #666666;
}

#view {
	width: 100px;
	height: 99px;
	background-image: url("../img/upfile.png");
}
</style>
</head>
<style>
#ao {
	background-image: url(<%=basePath%>img/denglubeijing.jpg);
	position: absolute;
	top: 50;
	left: 0%;
	width: 100%;
	height: 100%;
	min-width: 1000px;
	z-index: 2;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
	background-repeat: no-repeat;
	background-position: center 0;
}
</style>
<script type="text/javascript">
	$(function() {
		//判断验证码
		$("#prev-code").change(function() {
			var code = $(this).val();
			$.ajax({
				url : "checkCode.do?inputCode=" + code,
				type : "get",
				dateType : "text",
				success : function(result) {
					if (result == "false") {
						$("#prev-code").val('');
						layer.alert("验证码输入有误，请重新输入", {
							icon : 7
						})
					}
				}
			})
		})
	})

	/*判断用户名和密码是否为空*/
	function check() {
		var user = document.getElementById("user").value;
		var password = document.getElementById("pwd").value;
		var code = $("#prev-code").val();
		if (user == "" || password == "") {
			alert("用户名和密码都不能为空！");
		} else if (code == "") {
			alert("验证码不能为空");
		} else {
			$.ajax({
				url : "prewLogin.do",
				type : "post",
				data : $("#prevFrom").serialize(),
				success : function(result) {
					if (result == "true") {
						window.location.href = "../index.jsp";
					} else {
						alert("登录失败");
					}
				}
			})
		}
	}
	//验证码
	function getImage(img) {
		$("#prev-code").val('');
		img.src = "loadimg.do?time" + new Date().getTime();
	}
</script>
<body id="ao">
	<div class="container-fluid" style="height: 84px; background: #333333">
		<nav class="navbar " style="background: #333333">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a href="<%=basePath%>index.jsp"> <img
						src="../homeImg/logo1.png" height="45%" width="45%" />
					</a>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row" align="center">
			<P style="font-size: 50px; font-family: '福星高照'">欢迎来到易点餐</P>
		</div>
		<div class="row" style="margin-top: 5%;">
			<!--id="ao" style="width:100%; height:91.3%; margin-top: -20px; text-align: center;"-->
			<div class="col-md-4 col-md-offset-4"
				style="border: 1px solid #CCCCCC; border-radius: 15px; background: white; height: 500px;"
				align="center">

				<div class="row" align="center">
					<h2>账号密码登录</h2>
				</div>
				<form id="prevFrom" style="margin-top: 20%;">
					<!--这个action 跳转的主界面页面-->
					<div class="form-group ">
						<input type="text" name="a_code" class="form-control" id="user"
							placeholder="请填写手机号或用户名" style="height: 50px;">
					</div>
					<div class="form-group ">
						<input type="password" name="a_pwd" class="form-control" id="pwd"
							placeholder="请填写密码" style="height: 50px;">
					</div>
					<div class="form-group form-inline">
						<input type="text" id="prev-code" name="code"
							class="form-control col-md-10" placeholder="请输入验证码"
							style="height: 50px; width: 66%;">
						<div>
							<img src="loadimg.do" onclick="getImage(this)" height="49px"
								id="imgCode">
						</div>
					</div>
					<br />
					<button type="button" onclick="check()"
						class="btn btn-danger btn-lg"
						style="border-radius: 30px; font-size: 15px; width: 180px; color: white; margin-top: 15%;">登&nbsp;录</button>
					<br /> <br />
					<div>
						<a href="<%=basePath %>prev/toRegister.do" style="color: red;"><b>没有账号，进行注册！</b></a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>