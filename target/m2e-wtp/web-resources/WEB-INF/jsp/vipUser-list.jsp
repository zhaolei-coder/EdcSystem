<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="<%=basePath%>css/pagination.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i>
		</a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<div class="layui-form layui-col-space5">
							<div class="layui-input-inline layui-show-xs-block">
								<input type="text" name="sellerName" placeholder="请输入商家姓名"
									autocomplete="off" class="layui-input"
									oninput="getVipUserByName()">
							</div>
						</div>
					</div>
					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户姓名</th>
									<th>出生日期</th>
									<th>性别</th>
									<th>电话</th>
									<th>执行操作</th>
								</tr>
							</thead>
							<tbody id="list">
							</tbody>
						</table>
					</div>
					<div align="center" class="pagination" id="pagination"
						style="margin: 4px 0 0 0" class="M-box"></div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="<%=basePath%>back/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.pagination.js"></script>
<script>
	$(function() {
		load(0);
	})

	function getVipUserByName() {
		load(0);
	}

	function deletevipuser(vipid) {
		$.ajax({
			url : "delete-vipuser.do",
			type : "post",
			data : {
				"vipid" : vipid
			},
			dataType : "json",
			success : function(result) {
				if (result == "0") {
					alert("删除失败");
					load(0);
				} else {
					alert("删除成功");
					load(0);
				}
			}
		})
	}

	function load(pageIndex) {
		var name = $("input[name=sellerName]").val();
		$.ajax({
			url : "getAllVipUsers.do",
			type : "post",
			data : {
				"pageIndex" : pageIndex,
				"name" : name
			},
			dataType : "json",
			success : function(result) {
				$("#list").html('')
				$.each(result.pagelist, function(index, user) {
					$("#list").append(
							"<tr><th>" + user.b_Id + "</th><th>" + user.b_Name
									+ "</th><th>" + user.b_Birthday
									+ "</th><th>" + user.b_Sex + "</th><th>"
									+ user.b_Phone
									+ "</th><th><a onclick='deletevipuser("
									+ user.b_Id + ")'>删除</a></th></tr>")
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
</script>

</html>