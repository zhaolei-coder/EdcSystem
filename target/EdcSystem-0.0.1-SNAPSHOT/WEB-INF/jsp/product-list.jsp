l<%@ page language="java" contentType="text/html; charset=UTF-8"
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
								<input type="text" name="proName" placeholder="请输入商品信息"
									autocomplete="off" class="layui-input"
									oninput="getProductByName()">
							</div>
						</div>
					</div>
					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>编号</th>
									<th>商品名称</th>
									<th>商家价格</th>
									<th>商品数量</th>
									<th>商品信息</th>
									<th>点赞次数</th>
									<th>操作</th>
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

	function getProductByName() {
		load(0);
	}
	function delproduct(pid){
		$.ajax({
			url:'deleteProduct.do',
			type:"post",
			data:{
				"pid":pid
				
			},
			dataType:"text",
			success:function(result){
				if(result=="success"){
					load(0)
				}else{
					layer.alert("下架失败")
				}
			}
		})
	}
	function toAddPro(){
		location.href="toproadd.do"
	}
	
	function load(pageIndex) {
		var name = $("input[name=proName]").val();
		$.ajax({
			url : "productlist.do",
			type : "post",
			data : {
				"pageIndex" : pageIndex,
				"proName" : name,
				"sid":${seller.m_Id}
			},
			dataType : "JSON",
			success : function(result) {
				$("#list").html('')
				$.each(result.pagelist, function(index, dom) {
					$("#list").append(
							"<tr><th>" + dom.p_Id + "</th><th>" + dom.p_Name
									+ "</th><th>" + dom.p_Price + "</th><th>"
									+ dom.p_Count + "</th><th>"
									+ dom.p_Info + "</th><th>"
									+ dom.p_Good + "</th><th><div onclick='delproduct("+dom.p_Id+")'>下架</div><a href='toUpdatePro.do?pid="+dom.p_Id+"'>修改</a></th></tr>")
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