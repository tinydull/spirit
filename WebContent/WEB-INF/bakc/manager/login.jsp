<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <jsp:include page="./include.jsp"></jsp:include>
    <c:set var="ctx" value="<%=request.getContextPath()%>"/>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        $(function () {
            resize();
            $(window).resize(resize);
        })
        /* 调整登录框的位置到垂直位置的中间地方
         *	$(window).height();// 浏览器可视区域的高度
         *	$(document).height();// 浏览器文档高度
         */
        function resize() {
            var vHeight = $(window).height();
            var fHeight = $('#login-form').height();
            var height = (vHeight - fHeight) / 2;
            $('#login-form').css('margin-top', height);
        }
        /* 登录 */
        function checkLogin() {
            var username = $('#emailInput').val();
            var password = $('#passwordInput').val();
            if (username == null || username == '') {
                alert('请输入用户名');
                return false;
            }
            if (password == null || password == '') {
                alert('请输入密码');
                return false;
            }
            $.ajax({
                url: window.contextPath + '/manager/checkLogin',
                type: 'POST',
                async: false,
                dataType: 'json',
                data: {
                    username: $('#emailInput').val(),
                    password: $('#passwordInput').val()
                },
                success: function (msg) {
                    if (msg.result) {
                        window.location.href = window.contextPath + '/manager/main';
                    } else {
                        alert(msg.msg);
                    }
                },
                error: function (msg) {

                }
            })
        }
        /* 监控键盘的enter事件 */
        function key_enter() {
            var event = arguments[0] || window.event;
            if (event.keyCode == 13) {
                // 开始登录
                checkLogin();
            }
        }
    </script>
</head>
<body class="container">
<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <form id="login-form" class="form-horizontal" action="checkLogin">
            <div class="form-group">
                <label for="emailInput" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-10">
                    <input id="emailInput" type="email" class="form-control"
                           placeholder="邮箱">
                </div>
            </div>
            <div class="form-group">
                <label for="passwordInput" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input id="passwordInput" type="password" class="form-control"
                           placeholder="密码" onkeyup="key_enter()">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="btn btn-default" onclick="checkLogin()">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>