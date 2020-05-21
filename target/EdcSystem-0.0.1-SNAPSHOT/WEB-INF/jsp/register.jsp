<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- *********************************注册页面********************************* -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商家注册</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
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
									<h1>欢迎加入</h1>
								</div>
								<p>易点餐后台管理系统</p>
							</div>
						</div>
					</div>
					<!-- Form Panel    -->
					<div class="col-lg-6 bg-white">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form id="sellerFrom" enctype="multipart/form-data">
									<!-- 选择头像开始 -->
									<p class="upload_view" id="view"></p>
									<a class="open btn "
										style="border: 1px solid black; height: 18; font-size: 13px">选择头像</a>
									<div id="upload_D">
										<div class="upload_frame">
											<div class="upload_title">
												<span class="upload_title_left">请选择图片</span> <span
													class="upload_title_right"><img src="../img/x.jpg"></span>
											</div>
											<div class="upload_fileBtn">
												图片上传 <input type="file" id="file" name="m_imgPath" /> <label
													for="file">选择图片</label>
											</div>
											<div class="upload_content">
												<div id="clipArea"></div>
												<div class="upload_content_right">
													<p class="upload_view"></p>
													<a id="clipBtn" class="btn btn-primary">保存修改</a> <label
														for="file">重新选图片</label>
												</div>
											</div>
										</div>
									</div>
									<br>
									<br>
									<!-- 选择头像结束 -->
									<div class="form-group">
										<input id="register-username" class="input-material"
											type="text" name="m_Name" placeholder="请输入注册人姓名">
									</div>
									<div class="form-group">
										<input id="register-shopName" class="input-material"
											type="text" name="m_ShopName" placeholder="请输入店铺名称">
									</div>
									<div class="form-group">
										<input id="register-shopAddress" class="input-material"
											type="text" name="m_Address" placeholder="请输入店铺地址">
									</div>
									<div class="form-group">
										<input id="register-shopTime" class="input-material"
											type="text" name="m_BusinessHours"
											placeholder="营业时间(08:00-18:00)">
									</div>
									<div class="form-group">
										<input id="register-userCode" class="input-material"
											type="text" name="m_Code" placeholder="请输入登录账号">
									</div>
									<div class="form-group">
										<input id="register-password" class="input-material"
											type="password" name="m_Pwd" placeholder="请输入密码">
									</div>
									<div class="form-group">
										<input id="register-phone" class="input-material" type="text"
											name=m_Phone placeholder="请输入注册人电话">
									</div>
									<div class="form-group">
										<button id="regbtn" type="button" name="registerSubmit"
											class="btn btn-primary">注册</button>
									</div>
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
	<script src="<%=basePath%>layer/layer.js"></script>
	<script>
		$(function() {
			$("#regbtn").click(function() {
				var files = $("#register-file").val();//文件
				var name = $("#register-username").val();//注册人姓名
				var shop = $("#register-shopName").val();//店铺名称
				var shopAddress = $("#register-shopAddress").val();//店铺地址
				var shopTime = $("#register-shopTime").val();//营业时间
				var code = $("#register-userCode").val();//账号
				var pwd = $("#register-password").val();//密码
				var phone = $("#register-phone").val();//phone-电话
				/* 判断账号 */
				var codereg = /^[A-Za-z]+$/;
				/* 判断密码 */
				var pwdreg = /^[^\u4e00-\u9fa5]{0,}$/;
				/* 判断电话 */
				var regphone = /^[0-9]*$/;

				if (files == "") {
					layer.alert("请选择一张图片 作为店铺头像", {
						icon : 7
					})
				} else if (name == ""){
					layer.alert("注册人姓名不能为空", {
						icon : 7
					})
				}else if (shop == "") {
					layer.alert("店铺名称不能为空", {
						icon : 7
					})
				} else if (shopAddress == "") {
					layer.alert("店铺地址不能为空", {
						icon : 7
					})
				}else if (shopTime == "") {
					layer.alert("店铺营业时间不能为空", {
						icon : 7
					})
				}else if (code == "") {
					layer.alert("登录账号不能为空", {
						icon : 7
					})
				}else if (pwd == "") {
					layer.alert("密码不能为空", {
						icon : 7
					})
				}else if (phone == "") {
					layer.alert("手机号码不能为空", {
						icon : 7
					})
				} else if (codereg.test(code) == false) {
					$("#register-userCode").val('');
					layer.alert("登录账号只能为字母", {
						icon : 7
					})
				} else if (pwdreg.test(pwd) == false) {
					$("#register-password").val('');
					layer.alert("密码不能含有中文", {
						icon : 7
					})
				} else if (regphone.test(phone) == false) {
					$("#register-phone").val('');
					layer.alert("手机号码必须为数字", {
						icon : 7
					})
				} else if (phone.length != 11) {
					$("#register-phone").val('');
					layer.alert("手机号码必须为11位", {
						icon : 7
					})
				} else {
					var formData = new FormData($("#sellerFrom")[0]); 
					$.ajax({
						url :"<%=basePath%>back/saveSeller.do",
						type : 'POST',
						data : formData,
						async : false,
						cache : false,
						contentType : false, //必须
						processData : false, //必须
						dataType : "JSON",
						success : function(result) {
							if (result == "1") {
								window.location.href = "login.do";
								layer.alert("注册成功 ", {
									icon : 7
								})
							} else {
								layer.alert("注册失败", {
									icon : 7
								})
							}
						}
					})
				}
			})

		})
		/* 头像上传 */
		$(function() {
			//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
			var clipArea = new bjj.PhotoClip("#clipArea", {
				size : [ 300, 300 ], // 截取框的宽和高组成的数组。默认值为[260,260]
				outputSize : [ 300, 300 ], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
				//outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
				file : "#file", // 上传图片的<input type="file">控件的选择器或者DOM对象
				view : ".upload_view", // 显示截取后图像的容器的选择器或者DOM对象
				ok : "#clipBtn", // 确认截图按钮的选择器或者DOM对象
				loadStart : function() {
					// 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
					$('.cover-wrap').fadeIn();
					console.log("照片读取中");
				},
				loadComplete : function() {
					// 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
					console.log("照片读取完成");
				},
				//loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
				clipFinish : function(dataURL) {
					// 裁剪完成的回调函数。this指向图片对象，会将裁剪出的图像数据DataURL作为参数传入
					console.log(dataURL);
				}
			});

			$(".upload_title_right").click(function() {
				$("#upload_D").fadeOut(500);
				$(".form-group").fadeIn(1500);
			});

			$(".open").click(function() {
				$("#upload_D").fadeIn();
				$(".form-group").hide();
			});
		})
	</script>
</body>
</html>