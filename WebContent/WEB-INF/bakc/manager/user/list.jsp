<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>
    <jsp:include page="../include.jsp"></jsp:include>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">
        $(function () {
            /* 调整表格的高度：表格的高度是是应父元素的高度，调整父元素的高度 */
            var height = $(window).height();
            $('.dgparent').height(height - 200);
            /* 数据展示表格 */
            $('#dg').datagrid({
                url: window.contextPath + '/manager/user/list.do',
                fit: true,
                rownumbers: true,
                fitColumns: true,
                pagination: true,
                striped: true,
                singleSelect: true,
                queryParams: {
                    'conditions': $('#conditons').val()
                },
                columns: [[{
                    field: 'id',
                    title: 'ID',
                    align: 'center',
                    width: 50,
                    hidden: true
                }, {
                    field: 'username',
                    title: '用户名',
                    align: 'center',
                    width: 100
                }, {
                    field: 'realname',
                    title: '真实姓名',
                    align: 'center',
                    width: 100
                }, {
                    field: 'email',
                    title: '邮箱',
                    align: 'center',
                    width: 100
                }, {
                    field: 'phone',
                    title: '手机号码',
                    align: 'center',
                    width: 100
                }, {
                    field: 'number',
                    title: '工号',
                    align: 'center',
                    width: 100
                }, {
                    field: 'sex',
                    title: '性别',
                    align: 'center',
                    width: 100,
                    formatter: function (value, rowData, rowIndex) {
                        if ('' != value && undefined != value) {
                            return value == '1' ? '男' : '女';
                        } else {
                            return '';
                        }
                    }
                }, {
                    field: 'qq',
                    title: 'QQ',
                    align: 'center',
                    width: 100
                }, {
                    field: 'status',
                    title: '用户状态',
                    align: 'center',
                    width: 100,
                    formatter: function (value, rowData, rowIndex) {
                        if ('' != value && undefined != value) {
                            return value == '1' ? '有效' : '无效';
                        } else {
                            return value;
                        }
                    }
                }]],
                toolbar: [{
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        /* 清空表单数据，显示 */
                        $('#ff').form('clear');
                        /* 角色下拉列表框 */
                        $('#cc').combobox({
                            url: window.contextPath + '/manager/role/allRoles.do',
                            valueField: 'id',
                            textField: 'name',
                            height: 34,
                            width: 165,
                            panelWidth: 165,
                            panelHeight: 150,
                            required: false,
                            editable: false,
                            multiple: true,
                            showItemIcon: true,
                            onLoadSuccess: function () {

                            }
                        });

                        $('#win').window({title: '&nbsp;新增', iconCls: "icon-add"});
                        $('#win').window('open');
                    }
                }, '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        editUser();
                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-remove',
                    handler: function () {
                        /* 删除 */
                        alert('删除数据。。。没做');

                    }
                }],
                onDblClickRow: function (rowIndex, rowData) {
                    /* 双击修改  */
                    editUser();
                },
                onLoadSuccess: function (data) {
                    /* 加载完成后 */

                }
            });

        });
        function editUser() {
            /* 编辑 */
            var datagrid = $('#dg').datagrid('getSelected');
            if (undefined != datagrid) {
                /* 加载表单数据，回填 */
                $('#ff').form('clear');
                $.ajax({
                    url: window.contextPath + '/manager/user/edit.do?id=' + datagrid.id,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        /* 下拉列表框 */
                        $('#cc').combobox({
                            url: window.contextPath + '/manager/role/allRoles.do',
                            valueField: 'id',
                            textField: 'name',
                            height: 34,
                            width: 165,
                            panelWidth: 165,
                            panelHeight: 120,
                            required: false,
                            editable: false,
                            multiple: true,
                            showItemIcon: true,
                            onLoadSuccess: function () {
                                var roles = data.roleList;
                                var r = [];
                                if (roles) {
                                    for (var i = 0; i < roles.length; i++) {
                                        r.push(roles[i].id);
                                    }
                                }
                                $(this).combobox('setValues', r);
                            }
                        });
                        $('#ff').form('load', data);
                        $('#win').window({title: '&nbsp;修改', iconCls: "icon-edit"});
                        $('#win').window('open');
                    },
                    error: function (data) {
                    }
                })

            } else {
                alert('请选择数据！');
            }
        }
        /* 查询按钮的方法 */
        function reload() {
            $('#dg').datagrid('reload', {
                'conditions': $('#conditons').val()
            });
        }
        ;
        /* 新增和修改：提交表单 */
        function submitForm() {
            $('#ff').form('submit', {
                url: window.contextPath + '/manager/user/save.do',
                onSubmit: function (param) {
                    // 提交过程中
                },
                success: function (data) {
                    // 提交成功
                    alert('操作成功！');
                    $('#ff').form('clear');
                    $('#win').window('close');
                    $('#dg').datagrid('reload', {
                        'conditions': $('#conditons').val()
                    });
                }
            })
        }

    </script>
</head>
<body>
<div class="container-fluid">
    <!-- 查询条件区域 -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">查询条件</h3>
        </div>
        <div class="panel-body form-inline">
            <div class="query-line col-md-4 col-md-offset-2">
                <label>用户名：</label> <input id="conditons" type="text"
                                           class="form-control">
            </div>
            <div class="query-line col-md-2 col-md-offset-4">
                <button type="button" onclick="reload();"
                        class="btn btn-primary btn-sm">查询
                </button>
            </div>
        </div>
    </div>
    <!-- 查询结果区域 -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">查询结果</h3>
        </div>
        <div class="panel-body dgparent">
            <table id="dg"></table>
        </div>
    </div>
</div>
<!-- 新增或者修改的窗口 -->
<div id="win" class="easyui-window" title="My Window" width="400px"
     data-options="closed:true, resizable:false, minimizable:false">
    <form id="ff" class="form-horizontal" method="POST" autocomplete="off">
        <div class="form-group">
            <input type="hidden" name="id"> <label for="usernameForm"
                                                   class="col-sm-offset-1 col-sm-3 control-label">用户名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="usernameForm"
                       name="username" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="realnameForm"
                   class="col-sm-offset-1 col-sm-3 control-label">真实姓名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="realnameForm"
                       name="realname" placeholder="真实姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="emailForm"
                   class="col-sm-offset-1 col-sm-3 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="emailForm" name="email"
                       placeholder="邮箱">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3"
                   class="col-sm-offset-1 col-sm-3 control-label">电话</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputPassword3"
                       name="phone" placeholder="电话">
            </div>
        </div>
        <div class="form-group">
            <label for="numberForm"
                   class="col-sm-offset-1 col-sm-3 control-label">工号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="numberForm"
                       name="number" placeholder="工号">
            </div>
        </div>
        <div class="form-group">
            <label for="sexFrom" class="col-sm-offset-1 col-sm-3 control-label">性别</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label> <input type="radio" name="sex" id="optionsRadios1"
                                   value="1" checked> 男
                    </label> <label> <input type="radio" name="sex"
                                            id="optionsRadios2" value="0"> 女
                </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="roleForm" class="col-sm-offset-1 col-sm-3 control-label">角色</label>
            <div class="col-sm-6">
                <input id="cc" type="text" class="form-control" id="roleForm"
                       name="roles">
            </div>
        </div>
        <!-- <div class="form-group">
                    <label for="pwdForm" class="col-sm-offset-1 col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="pwdForm" name="password"
                            placeholder="密码">
                    </div>
                </div> -->
        <div class="form-group">
            <label for="inputPassword3"
                   class="col-sm-offset-1 col-sm-3 control-label">QQ</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputPassword3"
                       name="qq" placeholder="QQ">
            </div>
        </div>
        <div class="form-group" style="margin-top: 20px;">
            <div class="col-sm-offset-5 col-sm-5">
                <button type="button" onclick="submitForm();"
                        class="btn btn-default">确定
                </button>
            </div>
        </div>
    </form>
</div>

</body>
</html>