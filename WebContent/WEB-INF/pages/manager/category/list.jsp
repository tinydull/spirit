<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别管理</title>
<jsp:include page="../include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style type="text/css">
.container .row{
	margin-top: 30px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var setting = {
			async: {
				enable: true,
				url: window.contextPath +  '/menu/list.do'
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				},
				key: {
					url:'xurl'
				}
			},
			callback: {
				onClick: function zTreeOnClick(event, treeId, treeNode) {
				    $('#ff').form('clear');
			    	$('#ff').form('load', treeNode);
			    	
				}
			}
		};
	var zNodes =[];
	zNodes = ${result};
	var zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
 });		
 
	function addSibling() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getSelectedNodes();
		console.log();
		if (nodes.length) {
		 	var n = treeObj.addNodes(nodes[0].getParentNode(), -1, {"id" : "", "pId": nodes[0].getParentNode().id, name: "new Node"});
		 	//treeObj.selectNode(n);
		}else {
			alert('请选择节点！');
		}
	};
	
	function addChild() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length) {
		 	var n = treeObj.addNodes(nodes[0], -1, {"id" : "", "pId": nodes[0].id, name: "new Node"});	
		 	//treeObj.selectNode(n);
		}else {
			alert('请选择节点！');
		}
	};
	
	function delMenu() {
		
	};
	
	function submitForm() {
		$('#ff').form('submit', {
			url: window.contextPath +  '/menu/save.do',
			
			onSubmit: function() {
				// 提交过程中
				
			},
			success: function(data) {
				// 提交成功
				alert('操作成功！');
				$('#ff').form('clear');
				// 刷新
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				treeObj.reAsyncChildNodes(null, "refresh");
			}
		})
	};
</script>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<ul id="treeDemo" class="ztree"></ul>
		</div>	
		<div class="col-md-6">
			<div style="margin: 20px;"> 
				<button class="btn btn-default" value="增加同级元素" onclick="addSibling();">增加同级元素</button>
				<button class="btn btn-default" value="增加下级元素" onclick="addChild();">增加下级元素</button>
				<button class="btn btn-default" value="删除当前元素" onclick="delMenu();">删除当前元素</button>
			</div>
			<form id="ff" class="form-horizontal" role="form" method="POST">
				<div class="form-group">
					<input type="hidden" name="id">
					<input type="hidden" name="pId">
      				<label for="firstname" class="col-sm-2 control-label">名称</label>
      				<div class="col-sm-10">
         				<input type="text" class="form-control" id="firstname" name="name">
      				</div>
   				</div>
   				<div class="form-group">
      				<label for="firsturl" class="col-sm-2 control-label">URL</label>
      				<div class="col-sm-10">
         				<input type="text" class="form-control" id="firsturl" name="url">
      				</div>
   				</div>
   				<div class="form-group">
      				<label for="firstpermission" class="col-sm-2 control-label">权限标识</label>
      				<div class="col-sm-10">
         				<input type="text" class="form-control" id="firstpermission" name="permission">
      				</div>
   				</div>
   				<div class="form-group">
      				<label for="firstremark" class="col-sm-2 control-label">备注</label>
      				<div class="col-sm-10">
         				<input type="text" class="form-control" id="firstremark" name="remark" placeholder="">
      				</div>
   				</div>
   				<div class="form-group" >
						<div class="col-sm-offset-4 col-sm-6">
							<button type="button" onclick="submitForm();" class="btn btn-default">确定</button>
						</div>
					</div>
			</form>
		</div>
	</div>
	
</div>
</body>
</html>