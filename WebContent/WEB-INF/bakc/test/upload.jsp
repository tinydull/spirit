<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="include.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		window.contextPath = '${ctx}';
		$('#win').window({title:'new window'});
	});
</script>
</head>
<body>
	<div id="win">
		asfdasdfads
	</div>
	<form action="uploadImg" method="post" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit">
	</form>
</body>
</html>