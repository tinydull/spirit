<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<jsp:include page="include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>

</style>
<script type="text/javascript">
$(function() {
	
});

</script>
</head>
<body class="container-fluid">
	<div class="row">
		<h2>计算机以及虚拟机信息</h2>
		<div class="col-md-6">
			<table class="table table-condensed">
				<tr>
					<td>用户名</td>
					<td>${sys.sysname}</td>
				</tr>
				<tr>
					<td>计算机名</td>
					<td>${sys.comname}</td>
				</tr>
				<tr>
					<td>本地IP地址</td>
					<td>${sys.sysip}</td>
				</tr>
				<tr>
					<td>操作系统的名称</td>
					<td>${sys.osname}</td>
				</tr>
				<tr>
					<td>操作系统的构架</td>
					<td>${sys.osarch}</td>
				</tr>
				<tr>
					<td>操作系统的版本</td>
					<td>${sys.osversion}</td>
				</tr>
			</table>
		</div>
		<div class="col-md-6">
			<table class="table table-condensed">
				<tr>
					<td>JVM可以使用的总内存</td>
					<td>${sys.totalMemory}</td>
				</tr>
				<tr>
					<td>JVM可以使用的剩余内存</td>
					<td>${sys.freeMemory}</td>
				</tr>
				<tr>
					<td>JVM可以使用的处理器个数</td>
					<td>${sys.availableProcessors}</td>
				</tr>
				<tr>
					<td>Java的运行环境版本</td>
					<td>${sys.version}</td>
				</tr>
				<tr>
					<td>Java的安装路径</td>
					<td>${sys.home}</td>
				</tr>
				<tr>
					<td>其他</td>
					<td>暂无</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<h2>内存以及交换区信息</h2>
		<div class="col-md-6">
			<table class="table table-condensed">
				<tr>
					<td>内存总量</td>
					<td>${mem.mtotal}</td>
				</tr>
				<tr>
					<td>当前内存使用量</td>
					<td>${mem.mused}</td>
				</tr>
				<tr>
					<td>当前内存剩余量</td>
					<td>${mem.mfree}</td>
				</tr>
			</table>
		</div>
		<div class="col-md-6">
			<table class="table table-condensed">
				<tr>
					<td>交换区总量</td>
					<td>${mem.stotal}</td>
				</tr>
				<tr>
					<td>当前交换区使用量</td>
					<td>${mem.sused}</td>
				</tr>
				<tr>
					<td>当前交换区剩余量</td>
					<td>${mem.sfree}</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<h2>CPU信息展示</h2>
		
	</div>
</body>
</html>







