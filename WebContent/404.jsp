<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="JS代码,其他代码,JS广告代码,JS特效代码" />
<meta name="description" content="漂亮的蓝天白云404错误代码下载" />
<meta name="author" content="www.xmoban.cn">
<meta name="copyright" content="Copyright    版权所有">
<title>404</title>
<meta http-equiv="refresh" content="60;url=http://www.xmoban.cn/">
<!-- content="600，即600秒后返回主页，可根据需要修改或者删除这段代码 -->
<link href="<%=basePath%>css/error.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- 代码 开始 -->
	<div id="container">
		<img class="png" src="<%=basePath%>images/404.png" /> <img class="png msg"
			src="<%=basePath%>images/404_msg.png" />
		<p>
			<a href="<%=basePath%>index.jsp" target="_blank"><img class="png"
				src="<%=basePath%>images/404_to_index.png" /></a>
		</p>
	</div>
	<div id="cloud" class="png"></div>
</body>
</html>