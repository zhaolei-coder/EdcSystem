<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="x-admin-sm">

<head>
<meta charset="UTF-8">
<title>易点餐后台管理</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if ("${seller.m_Name}" != "") {
			$("#userName").text("${seller.m_Name}")
			$("#side-nav").css("display", "none")
		} else if ("${admin.a_name}" != "") {
			$("#userName").text("${admin.a_name}")
			$("#side-nav2").css("display", "none")
		}

	})
	//2020年4月13日15:53:33
	function delMySeller(mid) {
		var r = confirm("确认注销此店铺吗")
		if (r == true) {
			$.ajax({
				url : 'deleteSeller.do',
				type : "post",
				data : {
					"sid" : mid
				},
				dataType : "text",
				success : function(result) {
					if (result == "success") {

						window.location.href = "exit.do"
					} else {
						layer.alert("注销失败", {
							icon : 1
						})
					}
				}
			})
		}

	}
</script>
</head>

<body class="index">
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a>易点餐后台管理</a>
		</div>
		<div class="left_open">
			<a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;" id="userName"></a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a href="exit.do">退出</a>
					</dd>
				</dl></li>
		</ul>
	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="商家管理">&#xe6b8;</i> <cite>商家管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a
							onclick="xadmin.add_tab('查看所有商家信息','to-seller-list.do')"> <i
								class="iconfont">&#xe6a7;</i> <cite>查看所有商家信息</cite>
						</a></li>
					</ul>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('删除商家','to-seller-delete.do')">
								<i class="iconfont">&#xe6a7;</i> <cite>删除商家</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="会员管理">&#xe6b8;</i> <cite>会员管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a
							onclick="xadmin.add_tab('查看所有会员信息','to-vipUser-list.do')"> <i
								class="iconfont">&#xe6a7;</i> <cite>查看所有会员信息</cite>
						</a></li>
					</ul></li>
			</ul>
		</div>
		<div id="side-nav2">
			<ul id="nav">
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="商品管理">&#xe6b8;</i> <cite>商品管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a
							onclick="xadmin.add_tab('查看商品信息','to-product-list.do')"> <i
								class="iconfont">&#xe6a7;</i> <cite>查看所有商品信息</cite>
						</a></li>
					</ul>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('上架商品','toProductAdd.do')">
								<i class="iconfont">&#xe6a7;</i> <cite>上架商品</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="店铺管理">&#xe6b8;</i> <cite>店铺管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('修改店铺信息','toUpdateSeller.do')"> <i
								class="iconfont">&#xe6a7;</i> <cite>修改店铺信息</cite>
						</a></li>
						<!-- 2020-4-13 17:00:32 下面的li标签-->
						<li><a onclick="delMySeller('${seller.m_Id}')"> <i
								class="iconfont">&#xe6a7;</i> <cite>注销当前店铺</cite>
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>首页</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='welcome.do' frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
			<div id="tab_show"></div>
		</div>
	</div>
</body>

</html>