<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页-spirit</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:set var="ctx" value="<%=request.getContextPath()%>"/>
    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" type="image/x-icon"/>
    <title>引入资源页面</title>
    <!--兼容模式下支持IE最高版本 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="${ctx}/static/bootstrap-3.3.5-dist/css/bootstrap.min.css"
          media="screen"/>
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
    <link rel="stylesheet" href="${ctx}/static/css/style.css" media="screen"/>
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

        .avatar {
            margin: 80px auto;
            text-align: center;
            position: fixed;
        }

        .article {
            border-bottom: 1px dashed #d9d9d9;
            margin: 10px;
            padding: 15px;
        }

        .bottom-div-time {
            margin-top: 15px;
        }

        .load-more {
            margin-top: 30px;
            margin-bottom: 30px;
            text-align: center;
        }

        button[data-color=maleskine] {
            color: white;
            border-color: #e78170;
            background: #e78170;
        }

        .ladda-button {
            background: #666;
            border: 0;
            padding: 14px 18px;
            font-size: 18px;
            cursor: pointer;
            color: #fff;
            border-radius: 2px;
            border: 1px solid transparent;
            -webkit-appearance: none;
            -webkit-font-smoothing: antialiased;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        .formation div {
            margin: 20px 0;
        }

        .formation h3 {
            margin-bottom: 30px;
        }

        .formation img {
            width: 20px;
            height: 20px;
            margin: 5px 2px;
        }

        .formation a {
            cursor: pointer;
        }

        .formation img {
            border-radius: 5px;
        }

        .formation a.weixin {
            color: #f8f8f8;
        }

    </style>
    <script type="text/javascript">
        $(function () {
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
            <!--
				<a href="${ctx}/manager/login" title="退出">
					<span class="glyphicon glyphicon-log-out"></span>
				</a>
				 -->
        </li>
    </ul>
</div>
<div class="container-fluid" style="margin-left: 50px;">
    <div class="row">
        <div class="col-md-3 col-sm-3 avatar">
            <div class="formation">
                <img alt="头像" src="${ctx}/static/images/user.JPG"
                     style="width: 100px;height: 100px;border-radius: 50%;box-sizing: border-box;
						margin: 20px auto;">
                <h3>莫言</h3>
                <h5>间 歇 性 踌 躇 满 志</h5>
                <h5>持 续 性 混 吃 等 死</h5>
                <div>
                    <span>文章 • <strong>15</strong> </span>
                    <span> 字数 • <strong>0149</strong></span>
                </div>
                <div class="formation">
						<span>
							<a>
								<img alt="微信" src="${ctx}/static/images/weixin.png">
							</a>
						</span>
                    <span>
							<a>
								<img alt="微博" src="${ctx}/static/images/weibo.png">
							</a>
						</span>
                    <span>
							<a>
								<img alt="知乎" src="${ctx}/static/images/zhihu.jpg">
							</a>
						</span>
                </div>
            </div>
        </div>
        <div class="col-md-7 col-sm-7 col-md-offset-3 col-sm-offset-3">
            <div style="height: 88px;"></div>
            <c:forEach items="${list}" var="i">
                <div class="article">
                    <h4><a target="_blank" href="${ctx}/detail?id=${i.id}">
                        <c:out value="${i.title}"></c:out></a></h4>
                    <div class="bottom-div-time">
                        <span>阅读 • ${i.pv}　</span>
                        <span>点赞 • 5　</span>
                        <span class="pull-right">时间 • ${i.time}</span>
                    </div>
                </div>
            </c:forEach>

            <div class="load-more">
                <button class="ladda-button" data-color="maleskine">
                    <span class="ladda-label">点击查看更多</span>
                    <span class="ladda-spinner"></span>
                </button>
            </div>

        </div>
    </div>
</div>
</body>
</html>