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

<!-- 
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.3.0/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.3.0/highlight.min.js"></script> -->	
<script src="${ctx}/static/suMarkdown/lib/highlight/highlight.pack.js"></script>	
<link rel="stylesheet" href="${ctx}/static/suMarkdown/lib/highlight/styles/monokai_sublime.css" />
<script>hljs.initHighlightingOnLoad();</script>
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
.info {
	margin: 15px 15px 30px 15px;
	height: 15px;
	font-weight: bolder;
}
.content h1,h2,h3,h4,h5,h6{
	font-weight: bolder;
}
.content p{
	font-family: Helvetica Neue",Helvetica,Microsoft Yahei,Hiragino Sans GB,WenQuanYi Micro Hei,sans-serif;
	line-height: 5em;
	font-size: 1.3em;
}

.comment {
	margin-top:50px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	height: 380px;
}
.commentList {
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}
.commentList > div > div{
	padding: 25px;
	margin: 15px 0;
	border: 1px solid #ddd;
}
.form-horizontal .form-group {
    margin-right: 0px;
    margin-left: 0px;
}
</style>
<script type="text/javascript">
	$(function() {
		window.contextPath = '${ctx}';
	});
	
	/* 提交评论 */
	function commentAdd() {
		var articleId = $('#articleId').val();
		var name = $('#name').val();
		var address = $('#address').val();
		var comment = $('#comment').val();
		$.ajax({
			url : window.contextPath + '/addComment',
			type:'POST',
			async: false,
			dataType: 'json',
			data:{articleId: articleId, 
				  name: name,
				  address: address,
				  comment: comment},
			success: function(msg) {
				if (msg) {
					alert('评论成功！');
					location.reload();
				}
			},
			error: function(msg) {
				
			}
		}); 
	}
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
			<div class="col-md-8 col-md-offset-2">
				<div style="height: 88px;"></div>
				<div class="content">
					<h1>${article.title}</h1>
					<div class="info">
						<span class="pull-right">发布时间：${article.time} </span>
						<span class="pull-right">字数：${article.words} &nbsp;&nbsp;</span>
						<span class="pull-right">浏览量：${article.pv} &nbsp;&nbsp;</span>
					</div>
					<div>${article.content}</div>
				</div>
				
				<div class="comment">
					<form  action="#" class="form-horizontal" >
						<h4>发表评论</h4>
						<hr>
						<div class="form-group">
							<input id="articleId" type="hidden" value="${article.id }">
							<label for="col-sm-3">姓名</label>
							<input id="name" name="name" class="col-sm-8 form-control">
						</div>
						<div class="form-group">
							<label for="col-sm-3">联系方式</label>
							<input id="address" name="address" class="col-sm-8 form-control">
						</div>
						<div class="form-group">
							<label for="col-sm-3">评论</label>
							<textarea id="comment" name="comment" class="col-sm-8 form-control"></textarea>
						</div>
						<div class="form-group">
							<input type="button" class="btn btn-default pull-right" onclick="commentAdd()" value="发表评论"/>
						</div>
					</form>
				</div>
				<br>
				
				<c:if test="${article.comments != null}">
					<div class="commentList">
						<!-- 有评论 -->
						<h4>评论列表</h4>
						<hr>
						<div>
							<c:forEach items="${article.comments}" var="i">							
								<div>
									<span><strong>${i.name} &nbsp;&nbsp;</strong>发表评论：</span>
									<p style="word-wrap:break-word;">&nbsp;&nbsp;${i.comment}</p>
									<br>
									<span class="pull-right">时间：${i.time}</span>								
								</div>
							</c:forEach>						
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>