<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="ctx" value="<%=request.getContextPath()%>" />
<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" type="image/x-icon" /> 
<title>引入资源页面</title>
<!--兼容模式下支持IE最高版本 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${ctx}/static/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	media="screen" />
<script type="text/javascript"
	src="${ctx}/static/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ctx}/static/js/zTree_v3-master/css/metroStyle/metroStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${ctx}/static/js/zTree_v3-master/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${ctx}/static/js/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
	

<!-- 引入自定义的样式文件  -->
<link rel="stylesheet" href="${ctx}/static/css/style.css" media="screen" />
<style type="text/css">
#left {
	position: fixed;
	background-color: black;
	width: 60px;
	height: 100%;
	font-size: 16px;
}
#left ul {
	list-style: none;
	padding: 0;
	margin: 10px 0;
	text-align: center;
}
#left ul li {
	padding: 15px 0;
}
#left ul li a {
    color: #BEC3C7;
    text-decoration: none;
}
#left ul li a:hover {
    color: #343638;
    text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function() {
		window.contextPath = '${ctx}';
	});
</script>
</head>
<body>
	<!-- 左边的固定侧边栏的位置 -->
	<div id="left">
		<ul>
			<li>
				<a href="${ctx}/" title="首页">
					<span class="glyphicon glyphicon-home"></span>
				</a>
			</li>
			<li>
				<a href="#" title="专题">
					<span class="glyphicon glyphicon-list"></span>
				</a>
			</li>
			<li>
				<a href="#" title="时间线">
					<span class="glyphicon glyphicon-time"></span>
				</a>
			</li>
			<li>
				<a href="${ctx}/about" title="关于我">
					<span class="glyphicon glyphicon-user"></span>
				</a>
			</li>
			<li>
				<a href="${ctx}/manager/login" title="登录">
					<span class="glyphicon glyphicon-log-in"></span>
				</a>
			</li>
		</ul>
	</div>
	<div class="container">
		<div class="row">
			<div style="height: 88px;"></div>
			<div class="col-md-5 col-md-offset-2">
				<div>
					懒癌晚期患者
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>