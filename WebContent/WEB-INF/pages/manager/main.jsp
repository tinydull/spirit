<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<jsp:include page="include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%-- 
<script type="text/javascript" src="${ctx}/static/markdown/markdown.js"></script>
<script type="text/javascript" src="${ctx}/static/markdown/markdown-editor-N.js"></script> --%>
<script type="text/javascript" src="${ctx}/static/js/jquery.fullscreen.js"></script>

<link rel="stylesheet"
	href="${ctx}/static/suMarkdown/lib/highlight/styles/default.css">
<%-- <script src="${ctx}/static/suMarkdown//lib/jquery/dist/jquery.min.js"></script> --%>
<script src="${ctx}/static/suMarkdown/lib/highlight/highlight.pack.js"></script>
<link rel="stylesheet" href="${ctx}/static/suMarkdown/lib/highlight/styles/monokai_sublime.css" />
<script>hljs.initHighlightingOnLoad();</script>
<script src="${ctx}/static/suMarkdown/lib/marked/marked.js"></script>
<script src="${ctx}/static/suMarkdown/js/suMarkdown.js"></script>
<style>
#left {
	background-color: black;
	width: 40px;
	height: 100%;
	position: fixed;
}

#left ul {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

#left ul a {
	color: #FFF;
	display: inline-block;
	width: 40px;
	height: 40px;
	cursor: pointer;
}

#left ul a:HOVER {
	color: #FFF;
	display: inline-block;
	background-color: red;
	width: 40px;
	height: 40px;
	cursor: pointer;
}

#left ul a span {
	padding-top: 12px;
}

#right {
	margin-left: 40px;
	height: 100%;
}

#right .row {
	height: 100%;
}

#right .row>div {
	border: 1px solid #d9d9d9;
	height: 100%;
	padding-top: 10px;
	padding-left: 0;
	padding-right: 0;
}

.addBtn>a {
	line-height: 40px;
	cursor: pointer;
	margin: 5px 15px;
	display: block;
}

#form-corpus {
	display: none;
}

#corpusArea>div {
	position: relative;
	line-height: 30px;
	padding: 5px 15px;
}

#corpusArea>div>span {
	height: 30px;
	line-height: 30px;
}

#corpusArea>div:hover {
	cursor: pointer;
}

#articleArea>div {
	position: relative;
	line-height: 30px;
	padding: 5px 15px;
}

#articleArea>div>span {
	height: 30px;
	line-height: 30px;
}

#articleArea>div:hover {
	cursor: pointer;
}

#right .tool-right {
	position: absolute;
	right: 15px;
	top: 6px;
}

.rightDIVCLK {
	background-color: #e78170;
}
.form-horizontal .form-group {
    margin-right: 0px;
    margin-left: 0px;
}
</style>
<script type="text/javascript">
$(function() {
	/* 调整body的高度为可视区域的高度 */
	$(document.body).height($(window).height());
	
	/* 刷新文集 */
	refreshCorpus();
	/* 绑定事件-- 点击文集时，加载下面的文章列表 */
	$('#right').on('click','.corpusList', function() {
		$(this).siblings().each(function() {
			$(this).removeClass('rightDIVCLK');
		});
		$(this).removeClass('rightDIVCLK');
		$(this).toggleClass('rightDIVCLK');			
		var id = $(this).data()['toggle'];
		if (id) {
			refreshArticles(id);
		}
	});
	/* 绑定事件-- 点击文章时，加载文章的信息到编辑区 */
	$("#right").on('click', '.articleList', function() {
		$(this).siblings().each(function() {
			$(this).removeClass('rightDIVCLK');
			
		});
		$(this).removeClass('rightDIVCLK');
		$(this).toggleClass('rightDIVCLK');	
		var id = $(this).data()['toggle'];
		if (id) {
			editArticle(id);
		}
	});
	/* 初始化markdown编辑器 */
	var option1={
			   insert:true,
			   preview:false,
			   textHeight:"400px",
			   baseUrl: window.contextPath + '/static/suMarkdown/theme/default.html',
			   upload: window.contextPath + '/file/uploadImg',
			   /* baseUrl: 'http://suemi94.com/suMarkdown/theme/default.html', */
			   target:'#markdown-editor'
			};
	
	SuMarkdown(option1);
	/* 绑定文章移动到回收站的方法 */
	$('body').on('click', '.article_gc', function() {
		var aid = $(this).data('aid');
		$.ajax({
			url:window.contextPath + '/manager/article/delete',
			dataType:'json',
			type: 'POST',
			data:{id: aid},
			success: function(msg) {
				if (msg) {
					alert('操作成功！');
					/* 刷新文章列表区域 */
					var id = $('#corpusArea > .rightDIVCLK').data('toggle');
					if (id){
						refreshArticles(id);
					}
				}
			}
		});
	});
	
	/* 绑定文集移动到回收站的方法 */
	$('body').on('click', '.corpus_gc', function() {
		var aid = $(this).data('aid');
		$.ajax({
			url:window.contextPath + '/manager/corpus/delete',
			dataType:'json',
			type: 'POST',
			data:{id: aid},
			success: function(msg) {
				if (msg) {
					alert('操作成功！');
					/* 刷新文集列表区域 */
					refreshCorpus();
				}
			}
		});
	});
	/* 文集修改名称的方法 */
	$('body').on('click', '.corpus_rename', function() {
		var aid = $(this).data('aid');
		var aname = $(this).data('aname'); 
		
		$('#win').window({
			title:'修改文集名称',
			width : 300,
			height : 300,
			modal : true,
			closed: true,
			collapsible:false,
			minimizable:false,
			maximizable:false,
			resizable:false,
			onBeforeOpen: function() {
				$('#rename_courpus_ID').val(aid);
				$('#rename_courpus_name').val(aname);
				
			}
		});
		
		$('#win').window('open');
		/* $.ajax({
			url:window.contextPath + '/manager/corpus/update',
			dataType:'json',
			type: 'POST',
			data:{id: aid},
			success: function(msg) {
				if (msg) {
					alert('操作成功！');
					
				}
			}
		}); */
	});
	

	$('#win').window({title:'修改文集名称'});
	$('#win').window('close');
	/* 编辑区域的下来列表 */
	var corpus = $("body").data("corpus");
	$("#corpusSelect").empty();
	for(var i=0; i < corpus.length; i++) {
		/* if(msg.corpus == corpus[i].id) {
			$("#corpusSelect").append("<option value='" + corpus[i].id + "' selected='selected'>" + corpus[i].name + "</option>");
		}else { */
		$("#corpusSelect").append("<option value='" + corpus[i].id + "'>" + corpus[i].name + "</option>");
		/* } */
	}
});
/* 点击增加一个新的文集，显示增加文集区域 */
function showCorpus() {
	$('#form-corpus').css('display','block');
}
/* 点击取消按钮，隐藏增加文集区域 */
function hideCorpus() {
	$('#form-corpus').css('display','none');
}
/* 保存新增文集的方法 */
function saveCorpus() {
	if ($('#corpusName').val()) {
		$.ajax({
			url: window.contextPath + '/manager/corpus/save',
			dataType: 'json',
			data: {name: $('#corpusName').val()},
			success:function(msg) {
				/* 增加成功之后，刷新文集列表界面的显示 */
				if (msg) {
					alert('操作成功！');
					hideCorpus();
					refreshCorpus();
				}
			},
			error:function(msg) {
				
			}
		});		
	}
}
/* 刷新文集列表区域的内容 */
function refreshCorpus() {
	$.ajax({
		url: window.contextPath +  '/manager/corpus/list',
		dataType: 'json',
		async: false,
		success: function(msg) {
			/* 加载所有的文集后选中第一个，并将其中的文章加载在文章区域 */
			if (msg.length != 0) {
				// 保存下文集的列表，待以后使用
				$("body").data("corpus",msg);
				var content= "";
				for (var i = 0; i < msg.length; i++) {
					var html = "<div data-toggle='" + msg[i].id + "' class='corpusList'> "
						+ "<span class='glyphicon glyphicon-book'> "+ msg[i].name +"</span>"
						+ "<div class='btn-group tool-right'>"
						+ "		<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown' "
						+ "         aria-haspopup='true' aria-expanded='false'>"
						+ "			<span class='glyphicon glyphicon-cog'></span>"
						+ "		</button>"
					    + "		<ul class='dropdown-menu'>"
					    + "			<li class='corpus_rename' data-aid='" + msg[i].id + "' data-aname='"+ msg[i].name +"'><a href='#'>修改名称</a></li>"
					    + "			<li class='corpus_gc' data-aid='" + msg[i].id + "'><a href='#'>移动到回收站</a></li>"
					    + "		</ul>"
					    + "</div>"
						+ "</div>";
					content = content + html;
				}
				$('#corpusArea').empty();
				$('#corpusArea').append(content);
			}
		}
	});
}
/* 刷新文章列表界面的内容 */
function refreshArticles(id) {
	$.ajax({
		url: window.contextPath + '/manager/article/list',
		data:{id: id},
		dataType: 'json',
		success: function(msg) {
			$('#articleArea').empty();
			/* $('#hidcorpusId').val(id); */
			/* 刷新文章列表区域的内容 */
			if (msg.length != 0) {
				var content = "";
				for (var i = 0; i < msg.length; i++) {
					var html = "<div data-toggle='" + msg[i].id + "' class='articleList'> "
						+ "<span class='glyphicon glyphicon-file' style='white-space:nowrap;'> "+ msg[i].title +"</span>"
						+ "<div class='btn-group tool-right'>"
						+ "		<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown' "
						+ "         aria-haspopup='true' aria-expanded='false'>"
						+ "			<span class='glyphicon glyphicon-cog'></span>"
						+ "		</button>"
					    + "		<ul class='dropdown-menu'>"
					    + "			<li class='article_gc' data-aid='" + msg[i].id + "'><a href='#'>移动到回收站</a></li>"
					    + "		</ul>"
					    + "</div>"
						+ "</div>";
					content = content + html;
				}
				$('#articleArea').append(content);
			}
		}
	});
}
/* 保存文章的方法 */
function saveArticle() {
	var id = $('#hidArticleId').val();
	var title = $('#articleTitle').val();
	var thumb = $('#thumbIMG').val();
	var md = $('#markdown-editor').find('.suEditor').find('textarea').val();
	var corpus = $('#corpusSelect').val();
	var html = marked(md);
	
	$.ajax({
		url: window.contextPath + '/manager/article/save',
		type: 'POST',
		dataType: 'json',
		data:{id: id,title: title, thumb: thumb, md: md, content: html, corpus: corpus},
		success: function(msg) {
			alert('操作成功！');
			var id = $('#corpusArea > .rightDIVCLK').data('toggle');
			if (id){
				refreshArticles(id);
			}
		},
		error: function() {
			
		}});
}

/* 编辑文章的方法 */
function editArticle(id) {
	$.ajax({
		url: window.contextPath + '/manager/article/queryArticleById',
		data: 'POST',
		dataType: 'json',
		data: {id: id},
		success: function(msg) {
			$('#hidArticleId').val(msg.id);
			$('#articleTitle').val(msg.title);
			$('#thumbIMG').val(msg.thumb);
			$('#markdown-editor').find('.suEditor').find('textarea').val(msg.md);
			// 将文章的文集列表显示出来
			var corpus = $("body").data("corpus");
			$("#corpusSelect").empty();
			for(var i=0; i < corpus.length; i++) {
				if(msg.corpus == corpus[i].id) {
					$("#corpusSelect").append("<option value='" + corpus[i].id + "' selected='selected'>" + corpus[i].name + "</option>");
				}else {
					$("#corpusSelect").append("<option value='" + corpus[i].id + "'>" + corpus[i].name + "</option>");
				}
			}
		}
	}); 
}

/* 新增文章的方法 */
function showArticle() {
	// 清空编辑区域
	$('#hidArticleId').val("");
	$('#articleTitle').val("");
    $('#thumbIMG').val("");
    $('#markdown-editor').find('.suEditor').find('textarea').val("");
	// 将文章的文集列表显示出来
	var corpus = $("body").data("corpus");
	$("#corpusSelect").empty();
	for(var i=0; i < corpus.length; i++) {
		$("#corpusSelect").append("<option value='" + corpus[i].id + "'>" + corpus[i].name + "</option>");
	}
}
/* 修改名称后保存的方法 */
function renameCorpus() {
	var id = $('#rename_courpus_ID').val();
	var name = $('#rename_courpus_name').val();
	
	$.ajax({
		url:window.contextPath + '/manager/corpus/save',
		dataType:'json',
		type: 'POST',
		data:{id: id, name: name},
		success: function(msg) {
			if (msg) {
				alert('操作成功！');
				$('#win').window('close');
				refreshCorpus();
			}
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
				<a href="#" title="首页"><span class="glyphicon glyphicon-home"></span></a>
			</li>
			<li>
				<a href="#" title="修改密码"><span class="glyphicon glyphicon-home"></span></a>
			</li>
			<li>
				<a href="#" title="回收站"><span class="glyphicon glyphicon-home"></span></a>
			</li>
			<li>
				<a href="#" title="系统"><span class="glyphicon glyphicon-user"></span></a>
			</li>
		</ul>
	</div>
	<!-- 右边的编辑区域的位置 -->
	<div id="right" class="container-fluid">
		<div class="row">
			<!-- 文集  -->
			<div class="col-md-2 addBtn">
				<a onclick="showCorpus()"> <span
					class="glyphicon glyphicon-plus"
					style="line-height: 40px; height: 40px;"> 新建文集</span>
				</a>
				<form id="form-corpus" class="form-horizontal" action="#">
					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-1">
							<input type="text" class="form-control" id="corpusName"
								placeholder="请输入文集名称">
						</div>
					</div>
					<div class="form-group form-corpus-hide">
						<div class="col-sm-3 col-sm-offset-3">
							<button type="button" class="btn btn-default"
								onclick="hideCorpus()">取消</button>
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-success" onclick="saveCorpus()" value="确定">
						</div>
					</div>
				</form>
				<!-- 文集列表显示区域 -->
				<div id="corpusArea"></div>
				<!-- 文集修改名称 -->
				<div id="win" iconCls="icon-edit" title="My Window" 
					data-options="closed:true, resizable:false, minimizable:false">
					<form class="form-horizontal" action="#" style="margin-top: 20px;">
						<div class="form-group win-rename-form">
							<label for="rename_courpus_id" class="col-sm-3 control-label">ID</label>
							<div class="col-sm-7">
								<input id="rename_courpus_ID" class="form-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="rename_courpus_name" class="col-sm-3 control-label">文集</label>
							<div class="col-sm-7">
								<input id="rename_courpus_name" class="form-control" >
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-4">
								<!-- <button type="button" class="btn btn-default"
									onclick="renameCorpus()">确定</button> -->
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-4">
								<input type="button" class="btn btn-default"
									onclick="renameCorpus()" value="确定">
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 文章 -->
			<div class="col-md-2 addBtn">
				<a onclick="showArticle()"> <span
					class="glyphicon glyphicon-plus"
					style="line-height: 40px; height: 40px;"> 新建文章</span>
				</a>
				<div id="articleArea"></div>
			</div>
			<!-- 编辑区域 -->
			<div class="col-md-8" style="overflow-y: scroll; overflow-x: hidden;">
				<form class="form-horizontal" action="#">
					<div class="form-group">
						<label for="articleTitle" class="col-sm-1 control-label">标题</label>
						<div class="col-sm-7">
							<input id="hidArticleId" type="hidden"> 
							<!-- <input id="hidcorpusId" type="hidden">  -->
							<input id="articleTitle" type="text" class="form-control" placeholder="标题">
						</div>
						<div class="col-sm-2 col-sm-offset-1">
							<input onclick="saveArticle()" class="form-control btn btn-default" value="保存">
						</div>
					</div>
					<div class="form-group">
						<label for="thumbIMG" class="col-sm-1 control-label">文集</label>
						<div class="col-sm-5">
							<select id="corpusSelect" class="form-control">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="thumbIMG" class="col-sm-1 control-label">摘要</label>
						<div class="col-sm-10">
							<textarea id="thumbIMG" rows="4" class="form-control"
								placeholder="摘要"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="#" class="col-sm-1 control-label">文章</label>
						<div class="col-sm-10">
							<!-- <textarea id="markdown-editor" class="form-control" rows="20"></textarea> -->
							<div id="markdown-editor" class="suMarkdown" ></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>