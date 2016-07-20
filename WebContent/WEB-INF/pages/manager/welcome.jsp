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

$(function () {
	sysinfofunc();    
	//setInterval('sysinfofunc()', 1000);
});				

function sysinfofunc() {
	$.ajax({url: window.contextPath +  '/manager/systeminfo.do',
			type: 'GET',
			dataType: 'html',
			success: function(data) {
				console.log(data);
				console.log('成功');
				$('#infoarea').html(data);
			},
			error: function(data) {
				console.log('失敗');
				console.log(data);
				$('#infoarea').html(data);
			}});
}
</script>
</head>
<body class="container-fluid">
	<div id="infoarea">
		
	</div>
</body>
</html>







