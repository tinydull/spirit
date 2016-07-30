<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文章管理</title>
    <jsp:include page="../include.jsp"></jsp:include>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">
        $(function () {
            /* 调整表格的高度：表格的高度是是应父元素的高度，调整父元素的高度 */
            var height = $(window).height();
            $('.dgparent').height(height - 200);
            /* 数据展示表格 */
            $('#dg').datagrid({
                url: window.contextPath + '/manager/role/list.do',
                fit: true,
                rownumbers: true,
                fitColumns: true,
                pagination: true,
                striped: true,
                singleSelect: true,
                queryParams: {'conditions': $('#conditons').val()},
                columns: [[
                    {field: 'id', title: 'ID', align: 'center', width: 50},
                    {field: 'name', title: '角色名', align: 'center', width: 100},
                    {field: 'remark', title: '备注', align: 'center', width: 100}

                ]],
                toolbar: [{
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        $('#win').window({title: '&nbsp;新增', iconCls: "icon-add"});
                        $('#win').window('open');
                    }
                }, '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        /* 编辑 */
                        var id = $('#dg').datagrid('getSelected').id;
                        /* 加载表单数据，回填 */
                        $('#ff').form('clear');
                        $('#ff').form('load', window.contextPath + '/manager/role/edit.do?id=' + id);
                        $('#win').window('open', {title: '修改', iconCls: "icon-edit"});
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
                    var id = rowData.id;
                    $('#win').window({title: '修改', iconCls: "icon-edit"});
                    $('#win').window('open');
                    /* 加载表单数据，回填 */
                    $('#ff').form('clear');
                    $.ajax({
                        url: window.contextPath + '/manager/role/edit.do?id=' + id,
                        type: 'POST',
                        dataType: 'json',
                        success: function (data) {
                            $('#ff').form('load', data);
                            var nodeIds = [];
                            var nodeNames = [];
                            if (data.resources) {
                                for (var i = 0; i < data.resources.length; i++) {
                                    nodeIds.push(data.resources[i].id);
                                    nodeNames.push(data.resources[i].name)
                                }
                                $('#nodeNames').val(nodeNames);
                                $('#nodeIds').val(nodeIds);
                            }
                        },
                        error: function (data) {
                        }
                    })

                }
            });

            $('#resourceWin').window({
                title: '&nbsp;权限列表',
                width: 250,
                height: 450,
                modal: true,
                closed: true,
                collapsible: false,
                minimizable: false,
                maximizable: false,
                resizable: false,
                onBeforeOpen: function () {

                },
                onBeforeClose: function () {
                    var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
                    // 被选中的节点的数据
                    var nodes = treeObj.getCheckedNodes(true);
                    var nodeIds = [];
                    var nodeNames = [];
                    if (nodes) {
                        for (var i = 0; i < nodes.length; i++) {
                            nodeIds.push(nodes[i].id);
                            nodeNames.push(nodes[i].name);
                        }
                    }
                    // 名字放到资源框中，ID放到隐藏的表单中
                    $('#nodeNames').val(nodeNames);
                    $('#nodeIds').val(nodeIds);
                    treeObj.destroy();
                }
            });

        });

        /* 查询按钮的方法 */
        function reload() {
            $('#dg').datagrid('reload', {'conditions': $('#conditons').val()});
        }
        ;
        /* 提交表单 */
        function submitForm() {
            $('#ff').form('submit', {
                url: window.contextPath + '/manager/role/save.do',
                onSubmit: function () {
                    // 提交过程中

                },
                success: function (data) {
                    // 提交成功
                    alert('操作成功！');
                    $('#ff').form('clear');
                    $('#win').window('close');
                    $('#dg').datagrid('reload', {'conditions': $('#conditons').val()});
                }
            })
        }
        ;

        function initTree() {
            var setting = {
                async: {
                    enable: true,
                    url: window.contextPath + '/manager/menu/list.do'
                },
                check: {
                    enable: true
                },
                data: {
                    simpleData: {
                        enable: true
                    },
                    key: {
                        url: 'xurl'
                    }
                },
                callback: {
                    onAsyncSuccess: function (event, treeId, treeNode, msg) {
                        $('#resourceWin').window('open');
                        var nodeIds = $('#nodeIds').val();
                        if (nodeIds) {
                            nodeIds = nodeIds.split(',');
                            for (var i = 0; i < nodeIds.length; i++) {
                                var node = zTreeObj.getNodeByParam("id", nodeIds[i], null);
                                console.log("i:" + i + ";nodeIds[i]:" + nodeIds[i] + "")
                                if (node) {
                                    zTreeObj.checkNode(node, true, false);
                                    node.checked = true;
                                }
                                zTreeObj.updateNode(node);
                            }
                        }
                    }
                }
            };
            var zNodes = [];
            var zTreeObj = $.fn.zTree.init($("#treeDemo1"), setting, zNodes);

        }
        ;

        function submitResource() {
            $('#resourceWin').window('close');
        }
        ;
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
                <label>角色名：</label> <input id="conditons" type="text"
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
<div id="win" class="easyui-window" title="My Window" width="400px"
     data-options="closed:true, resizable:false, minimizable:false">
    <form id="ff" class="form-horizontal" method="POST" autocomplete="off">
        <div class="form-group">
            <input type="hidden" name="id"> <label for="usernameForm"
                                                   class="col-sm-offset-1 col-sm-3 control-label">角色名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="usernameForm"
                       name="name" placeholder="角色名">
            </div>
        </div>
        <div class="form-group">
            <label for="resourceForm"
                   class="col-sm-offset-1 col-sm-3 control-label">权限</label>
            <div class="col-sm-6">
                <input type="hidden" name="nodeIds" id="nodeIds"> <input
                    type="text" class="form-control" id="nodeNames" name="nodeNames"
                    onclick="initTree();" placeholder="权限">
            </div>
        </div>
        <div class="form-group">
            <label for="numberForm"
                   class="col-sm-offset-1 col-sm-3 control-label">备注</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="numberForm"
                       name="remark" placeholder="备注">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <button type="button" onclick="submitForm();"
                        class="btn btn-default">确定
                </button>
            </div>
        </div>
    </form>
</div>
<div id="resourceWin" iconCls="icon-add" title="My Window"
     style="margin: 0 auto;">
    <ul id="treeDemo1" class="ztree" style="margin: 0 auto;"></ul>
</div>
</body>
</html>