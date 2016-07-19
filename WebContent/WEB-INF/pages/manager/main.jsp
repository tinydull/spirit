<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<jsp:include page="include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- zTree控件 -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/zTree_v3-master/css/menuStyle/menuStyle.css">
<script type="text/javascript" src="${ctx}/static/lib/zTree_v3-master/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
<style>
#left {
	overflow: auto;
}	
</style>
<script type="text/javascript">
$(function() {
	$('#left').height($(window).height() - 50);
	$('#right').height($(window).height() - 50);
	$('#mainFrame').height($('#right').height());
	$('#mainFrame').width($('#right').width());
	initMenuTree();
});
function initMenuTree() {
	var setting = {
			async: {
				enable: false,
				url: window.contextPath +  '/manager/menu/list.do'
			},
			check: {
				enable: false
			},
			data: {
				simpleData: {
					enable: true,
					pIdKey: "pid"
				},
				key: {
					url:'xurl'
				}
			},
			callback: {
				onClick: function zTreeOnClick(event, treeId, treeNode) {
					$('#mainFrame').attr('src', treeNode.url);
				}
			}
		};
	
	$.ajax({url: window.contextPath +  '/manager/menu/list.do',
			type: 'POST',
			dataType: 'json',
			success: function(data) {
				var zNodes = data;
				var zTreeObj = $.fn.zTree.init($("#treeMenu"), setting, zNodes);
			},
			error: function(data) {
				alert('初始化失败！');
			}
	});
}
</script>
</head>
<body class="container-fluid">
	<!-- 上边部分的内容，标题等 -->
	<div id="top" class="row navbar-static-top" style="height: 50px; padding: 10px;">
		<div class="col-md-2 col-md-offset-2">
			
		</div>
		<div class="col-md-8">
			<div class="dropdown pull-right">
  				<button class="btn btn-default dropdown-toggle" id="dropdownMenu1" 
  					data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    				<i class="glyphicon glyphicon-user"> huangteng </i>
    				<span class="caret"></span>
  				</button>
  				<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
    				<li><a href="#">个人信息</a></li>
    				<li><a href="#">修改密码</a></li>
    				<li><a href="#">登录日志</a></li>
  				</ul>
			</div>
		</div>
	</div>
	<!-- 左边的菜单树区域 -->
	<div id="left" class="col-md-2">
		<ul id="treeMenu" class="ztree"></ul>		
	</div>
	<!-- 右边的主要区域的内容，基本信息等功能 -->
	<div id="right" class="col-md-10">
		<iframe id="mainFrame" scrolling="auto" src="${ctx}/manager/welcome.do" frameborder="0">
			
		</iframe>
	</div>
</body>
</html>







