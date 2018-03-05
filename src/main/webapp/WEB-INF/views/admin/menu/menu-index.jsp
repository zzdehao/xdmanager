<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理</title>
<%@include file="/header.jsp" %>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
.ztree li span.button.del {margin-left:2px; margin-right: -1px; background-position:-110px -64px; vertical-align:top; *vertical-align:middle}
</style>
</head>
<body style="margin-top: 1px;">
<table class="table">
	<tr>
		<td width="200" class="va-t" style="background-color: #f5fafe">
            <ul id="menuTree" class="ztree"></ul>
        </td>
		<td class="va-t" id = "menu-edit" style="width: 80%">
		</td>
	</tr>
</table>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="menu-template">
<div class="pd-20">
<form action="" method="post" class="form form-horizontal" id="form-menu-add" style="margin: 0px;">
	<input type="hidden" name="id" id = "id"  value="{{id}}">
	<div class="row cl">
		<label class="form-label col-3">上级菜单：</label>
		<div class="formControls col-5">
			<select class="input-text" name="pid">
				<option value="">请选择上级</option>
				<c:forEach items="${parentItem}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3"><span class="c-red">*</span>菜单名称：</label>
		<div class="formControls col-5">
			<input type="text" class="input-text" value="{{name}}" placeholder="" name="name" datatype="*2-16" nullmsg="菜单名称不能为空">
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3">URL：</label>
		<div class="formControls col-5">
			<input type="text" class="input-text" value="{{url}}" placeholder="请输入URL" name="url">
		</div>
		<div class="col-4"> </div>
	</div>
	
	<div class="row cl">
		<label class="form-label col-3">图标：</label>
		<div class="formControls col-5">
			<input id = "icon" type="text" class="input-text" value="{{icon}}" placeholder="请选择图标 " name="icon" readonly="readonly">
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3"><span class="c-red">*</span>排序：</label>
		<div class="formControls col-5">
			<input type="text" class="input-text" placeholder="" value="{{sort}}" name="sort" datatype="n1-6" nullmsg = "请填写排序">
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3">权限编码：</label>
		<div class="formControls col-5">
			<input type="text" class="input-text" value="{{key}}" placeholder="请输入权限编码 " name="key">
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3">菜单资源：</label>
		<div class="formControls col-5">
			<c:forEach items="${rts}" var="rt">
				<label><input type="checkbox" value="${rt.key}:${rt.name}" name="resource">${rt.name}&nbsp;&nbsp;</label>
			</c:forEach>
		</div>
		<div class="col-4"> </div>
	</div>
	<div class="row cl">
		<label class="form-label col-3"><span class="c-red">*</span>状态：</label>
		<div class="formControls col-5"> 
			<span class="select-box" style="width:150px;">
				<select class="select" name="enable" size="1">
					<option value="1">启用</option>
					<option value="2">停用</option>
				</select>
			</span> 
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-3">备注：</label>
		<div class="formControls col-5">
			<textarea name="remark" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="textarealength(this,100)">{{remark}}</textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
		</div>
		<div class="col-4"></div>
	</div>
{{#compare isSubmit true '='}}
	<div class="row cl">
		<div class="col-9 col-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
{{else}}
{{/compare}}
</form>
</div>
</script>
<script type="text/javascript">
var addPermission = false ;
var editPermission = false ;
var delPermission = false ;
<shiro:hasPermission name="system:menu:add">
	addPermission = true ;
</shiro:hasPermission>
<shiro:hasPermission name="system:menu:edit">
	editPermission = true ;
</shiro:hasPermission>
<shiro:hasPermission name="system:menu:del">
	delPermission = true ;
</shiro:hasPermission>

var menuTemplate = Handlebars.compile($("#menu-template").html());
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false,
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom
	},
	data: {
		key:{
			url:""
		},
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pid",
			rootPId: ""
		}
	},
	callback: {
		onClick: onClick
	}
};

function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("menuTree");
	zTree.expandNode(treeNode);
	$.post("menu/get/" + treeNode.id , function(data){
		data.isSubmit = editPermission ;
		$('#menu-edit').html(menuTemplate(data));
		$("select[name='pid']").val(data.pid);
		$("select[name='status']").val(data.status);
		bindForm(data) ;
	})
}
function addHoverDom(treeId, treeNode) {
	
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0 || $("#delBtn_"+treeNode.tId).length>0 ) return;
	var addStr = "" ;
	
	if(!treeNode.getParentNode()&& addPermission ){
		addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		+ "' title='增加子菜单' onfocus='this.blur();' nid = '"+treeNode.id+"'></span>"; 
	}
	if(!treeNode.isParent && delPermission){
		addStr += "<span class='button del' id='delBtn_" + treeNode.tId
		+ "' title='删除子菜单' onfocus='this.blur();' nid = '"+treeNode.id+"'></span>";	
	}
	
	sObj.after(addStr);
	var addBtn = $("#addBtn_"+treeNode.tId);
	var delBtn = $("#delBtn_"+treeNode.tId);
	if (addBtn) {
		addBtn.bind("click", function(){
			var pid = $(this).attr("nid") ;
			$('#menu-edit').html(menuTemplate({isSubmit:addPermission}));
			$("select[name='pid']").val(pid);
			bindForm({}) ;
			return false;
		});
	}
	
	if(delBtn){
		delBtn.bind("click",function(){
			var nid = $(this).attr("nid") ;
			parent.layer.confirm('你确认要删除吗?',function(index){
				$.ajax({
						url:"menu/del/" + nid, 
						type:'post',
						async:true ,
						cache:false ,
						dataType:"json",
						success:function(data){
							if(data.s == true){
								parent.layer.msg("删除成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
									location.replace(location.href);
								}) ;
							}else{
								parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
							}
						},
						
					}) ;
			});
		});
	}
};
function removeHoverDom(treeId, treeNode) {
	if(!treeNode.getParentNode() && addPermission){
		$("#addBtn_"+treeNode.tId).unbind().remove() ;
	}
	if(!treeNode.isParent && delPermission){
		$("#delBtn_"+treeNode.tId).unbind().remove();
	}
};
$(document).ready(function(){
	var t = $("#menuTree");
	$.post("menu/list", function(data){
		t = $.fn.zTree.init(t, setting, data);
		t.expandAll(true);
	}) ;
});

function bindForm(data){
	$("#form-menu-add").Validform({
		tiptype:2,
		callback:function(form){
			var index = parent.layer.load();
			$.ajax({
				url:"menu/save" , 
				type:'post',
				async:true ,
				cache:false ,
				data:$(form).serialize(),
				dataType:"json",
				success:function(data){
					parent.layer.close(index);
					if(data.s == true){
						parent.layer.msg("保存成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
							location.replace(location.href);
						}) ;
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
				
			}) ;
			return false ;
		}
	});
	
	$("#icon").bind("click" , function(){
		layer_show("图标选择","menu/icon",800,500);
	});
	
	if(data.resource){
		$.each(data.resource,function(i,n){
			$("input[value='"+n+"']").attr("checked","checked");
		}) ;
	}
}
</script>
</body>
</html>