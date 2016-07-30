<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--logo图标-->
    <c:set var="ctx" value="<%=request.getContextPath()%>"/>
    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" type="image/x-icon"/>
    <title>引入资源页面</title>
    <!--兼容模式下支持IE最高版本 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--版本为bootstrap3.3.5  -->
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5-dist/css/bootstrap.min.css" media="screen"/>
    <!--必须先引入jquery,再引入其他的js文件-->
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

    <!-- jQuery easyUI  -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-easyui-v1.4.4/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-easyui-v1.4.4/themes/icon.css">
    <script type="text/javascript" src="${ctx}/static/js/jquery-easyui-v1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery-easyui-v1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <!-- zTree控件 -->
    <link rel="stylesheet" href="${ctx}/static/js/zTree_v3-master/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctx}/static/js/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/zTree_v3-master/js/jquery.ztree.excheck.js"></script>

    <!-- 引入自定义的样式文件  -->
    <link rel="stylesheet" href="${ctx}/static/css/style.css" media="screen"/>
    <script type="text/javascript">
        $(function () {
            window.contextPath = '${ctx}';
        });
    </script>
</head>
<body>

</body>
</html>