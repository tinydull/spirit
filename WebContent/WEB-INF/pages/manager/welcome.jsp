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
			
		</div>
	</div>
</body>
</html>







