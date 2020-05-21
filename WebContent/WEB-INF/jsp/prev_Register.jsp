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
<!-- ---------------------------------------------用户注册-------------------------------------------------- -->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>易点餐注册</title>
<link rel="stylesheet"
	href="<%=basePath%>back/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>back/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="../img/log.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=basePath%>layer/theme/default/layer.css">
</head>
<!--头像上传js -->
<script src="<%=basePath%>js/iscroll-zoom.js"></script>
<script src="<%=basePath%>js/hammer.js"></script>
<script src="<%=basePath%>js/lrz.all.bundle.js"></script>
<script src="<%=basePath%>layer/layer.js"></script>
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
	border-radius: 50%;
}

.asd {
	background-image: url(../img/zhuce.jpg);
	
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

.bbb input {
	border: 1px solid black;
}
</style>

<body>
	<div class="container-fluid" style="height: 84px; background: #333333">
		<nav class="navbar " style="background: #333333">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				<a href="<%=basePath%>index.jsp"> <img
						src="../homeImg/logo1.png" height="35%" width="35%" />
					</a>
				</div>
				
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="asd"
			style="width: 100%; height: 91.3%; margin-top: -20px;">
			<div align="center">
				<h1 style="color: white;">账号注册</h1>
			</div>
			<div class="bbs container"
				style="width: 500px; height: 500px; margin-top: 50px;">
				<div class="aaa">
					<form class="bbb" id="buyerFrom" enctype="multipart/form-data">
						<!-- 选择头像开始 -->
						<div align="center">
							<p class="upload_view" id="view"></p>
							<a class="open btn "
								style="border: 1px solid black; background-color: #985F0D; color: white; height: 18; font-size: 13px">选择头像</a>
						</div>
						<div id="upload_D">
							<div class="upload_frame">
								<div class="upload_title">
									<span class="upload_title_left">请选择图片</span> <span
										class="upload_title_right"><img src="../img/x.jpg"></span>
								</div>
								<div class="upload_fileBtn">
									图片上传 <input type="file" id="file" name="buyerPath" /> <label
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
						<br />
						<div class="form-group input-group-lg">
							<input type="text" name="b_Code" style="width: 431px;"
								class="form-control" id="user" placeholder="请输入账户ID">
						</div>
						<div class="form-group input-group-lg">
							<input type="text" name="b_Name" class="form-control" id="name"
								style="float: left; width: 300px;" placeholder="请输入真实姓名">
							<div style="float: left; margin-left: 10px;">
								<select name="b_Sex" class="form-control"
									style="width: 120px; height: 45px;">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<br /> <br /> <br />
						<div class="form-group input-group-lg">
							<input type="password" name="b_Pwd" style="width: 431px;"
								class="form-control" id="pwd" placeholder="请输入密码">
						</div>
						<div class="form-group input-group-lg">
							<input type="tel" name="b_Phone" style="width: 431px;"
								class="form-control" id="phone" placeholder="请输入电话号码">
						</div>
						<div class="form-group input-group-lg">
							<input type="text" name="b_Birthday" style="width: 431px;"
								class="form-control" id="date" placeholder="请输入出生日期">
						</div>
						<div class="form-group input-group-lg">
							<input type="text" id="email" name="b_Email" class="form-control"
								style="float: left; width: 300px;" id="email"
								placeholder="请输入email">
							<div style="float: left; margin-left: 10px;">
								<select id="backEmail" name="backEmail" class="form-control"
									style="width: 120px; height: 45px;">
									<option value="@qq.com">@qq.com</option>
									<option value="@163.com">@163.com</option>
								</select>
							</div>
						</div>
						<br /> <br /> <br />

						<div class="form-group input-group-lg">

							<input type="text" name="b_yz" class="form-control"
								style="float: left; width: 300px;" id="yzm" placeholder="请输入验证码">

							<div style="float: left; margin-left: 10px;">
								<button class="form-control" type="button" id="btn"
									style="width: 120px; height: 45px;"
									onclick="sendCode()">获取验证码</button>
							</div>
						</div>
						<br /> <br />
						<div class="form-group input-group-lg"
							style="margin-left: -20px; margin-top: 5%" align="center">
							<button type="button" onclick="check();" class="btn btn-default"
								style="border-radius: 30px; width: 240px; height: 60px; background-color: #985F0D; color: white; font-size: 20px;">注&nbsp;册</button>
						</div>
						<div align="center">
							<a href="<%=basePath %>prev/toLoginPage.do" style="color:#fff; text-decoration: none;"><b>已有账号，去登录！</b></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
		var countdown = 30;//验证码秒数
		function sendCode() {
			var btn = $("#btn")
			var email = $("#email").val();
			var backEmail = $("#backEmail").val();
			var userEmail = email + backEmail;
			if (email != null && email != "") {
				countTime(btn)
				$.ajax({
					url:"<%=basePath%>prev/getEmailCode.do",
					type : "post",
					data : {
						"email" : userEmail
					},
					success : function(result) {
						if (result == "true") {
							layer.alert(userEmail + "用户,请注意查收", {
								icon : 1
							})
						}else{
							layer.alert("发送失败，请注意邮箱格式", {
								icon : 7
							})
						}
					}
				})
			} else {
				layer.alert("邮箱不能为空", {
					icon : 7
				})
			}
		}
		
		
		function countTime(obg) {
			if (countdown != 0) {
				obg.attr("disabled", "disabled");
				obg.html("重新获取" + countdown)
				countdown--;
			} else {
				obg.attr("disabled", false);
				obg.html("获取验证码");
				countdown = 30;
				return;
			}
			setTimeout(function() {
				countTime(obg)
			}, 1000)
		}
		
		function check() {
			//判断日期格式
			var bithday = /^(?=\d)(?:(?!(?:1582(?:\.|-|\/)10(?:\.|-|\/)(?:0?[5-9]|1[0-4]))|(?:1752(?:\.|-|\/)0?9(?:\.|-|\/)(?:0?[3-9]|1[0-3])))(?=(?:(?!000[04]|(?:(?:1[^0-6]|[2468][^048]|[3579][^26])00))(?:(?:\d\d)(?:[02468][048]|[13579][26]))\D0?2\D29)|(?:\d{4}\D(?!(?:0?[2469]|11)\D31)(?!0?2(?:\.|-|\/)(?:29|30))))(\d{4})([-\/.])(0?\d|1[012])\2((?!00)[012]?\d|3[01])(?:$|(?=\x20\d)\x20))?((?:(?:0?[1-9]|1[012])(?::[0-5]\d){0,2}(?:\x20[aApP][mM]))|(?:[01]\d|2[0-3])(?::[0-5]\d){1,2})?$/;
			
			var admin = document.getElementById("user").value;
			var password = document.getElementById("pwd").value;
			var name = document.getElementById("name").value;
			var phone = document.getElementById("phone").value;
			var date = document.getElementById("date").value;
			var email = document.getElementById("email").value;
			var yzm = document.getElementById("yzm").value;
			var fileName = document.getElementById("file").value;
			if ("" == admin) {
				layer.alert("用户名不能为空", {
					icon : 7
				})
			} else if ("" == password) {
				layer.alert("密码不能为空", {
					icon : 7
				})
			} else if ("" == name) {
				layer.alert("名字不能为空", {
					icon : 7
				})
			} else if ("" == phone) {
				layer.alert("电话号码不能为空", {
					icon : 7
				})
			} else if ("" == date) {
				layer.alert("出生日期不能为空", {
					icon : 7
				})
			} else if ("" == email) {
				layer.alert("邮箱不能为空", {
					icon : 7
				})
			}else if (bithday.test(date) == false) {
				layer.alert("日期格式不正确 ，正确格式为：yyyy-MM-dd", {
					icon : 7
				})
			}else if (yzm== "") {
				layer.alert("请输入验证码", {
					icon : 7
				})
			}else if (fileName== "") {
				layer.alert("请选择头像", {
					icon : 7
				})
			}else{
				var formData = new FormData($("#buyerFrom")[0]); 
				$.ajax({
				url :"<%=basePath%>prev/saveBuyer.do",
				type : 'POST',
				data : formData,
				contentType : false, //必须
				processData : false, //必须
				dataType : "text",
				success : function(result) {
					if (result == "haveImg") {
						layer.alert("图片已经存在或者重名,请更改", {
							icon : 7
						})
					} else if (result == "emailfalse") {
						$("#yzm").val('')
						layer.alert("邮箱验证码不正确", {
							icon : 7
						})
					}else if (result == "haveCode") {
						$("#user").val('')
						layer.alert("账号已经存在或者重名,请更改", {
							icon : 7
						})
					}else if (result == "haveEmail") {
						$("#yzm").val('')
						$("#email").val('');
						layer.alert("邮箱已经存在或者重名,请更改", {
							icon : 7
						})
					}else{
						layer.confirm('注册成功！', {
						    btn: ['去登录', '取消']
						}, function () {
							window.location.href="../index.jsp";
						}, function () {
						 
						});
					}
				}
			})
		}
	}

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
</html>