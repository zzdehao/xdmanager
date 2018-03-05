<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色授权</title>
<%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-15">
	<form action="" method="post" class="form form-horizontal" id="form-role-add">
		<input type="hidden" name="id" value="${role.id}">
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-6">
				<input type="text" class="input-text" value="${role.name}" placeholder="请输入角色名称" name="name" datatype="*1-16" nullmsg="角色名称不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>角色代码：</label>
            <div class="formControls col-6">
                <input type="text" class="input-text" value="${role.roleCode}" placeholder="请输入角色唯一代码" name="roleCode" nullmsg="角色名称不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>排序：</label>
            <div class="formControls col-6">
                <input type="number" class="input-text" value="${role.orderFlag}" placeholder="请输入排序号" name="orderFlag" nullmsg="排序号不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
		<div class="row cl">
			<label class="form-label col-2">状态：</label>
			<div class="formControls col-6"> 
				<span class="select-box" style="width:150px;">
					<select class="select" name="status" id = "status" size="1">
						<option value="1">启用</option>
						<option value="0">停用</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">角色描述：</label>
			<div class="formControls col-6">
				<input type="text" class="input-text" value="${role.remark}" placeholder="请输入备注" name="remark">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">权限管理：</label>
			<div id = "permissionDiv" class="formControls col-9">
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</div>
<script type="text/x-handlebars-template" id="permission-template">
{{#each this}}
<dl class="permission-list">
	<dt>
		<label>
			<input type="checkbox" value="" name="topMenu">
			{{menu.name}}</label>
	</dt>
	<dd>
		{{#each children}}
		<dl class="cl permission-list2">
			<dt>
				<label class="">
					<input type="checkbox" value="" name="childMenu">
					{{menu.name}}</label>
			</dt>
			<dd>
				{{#each children}}
				<label class="">
					<input type="checkbox" 
						{{#if selected}}
						checked="checked"
						{{/if}}
					 value="{{id}}" name="resource">
					{{name}}</label>
				{{/each}}
			</dd>
		</dl>
		{{/each}}
	</dd>
</dl>
{{/each}}
</script>

<%@include file="/footer.jsp" %>

<script type="text/javascript">
var permissionTemplate = Handlebars.compile($("#permission-template").html());

$(function(){
	var status = '${role.status}' ;
	var id = $("#id").val();
	if(id){
		$("#status").val(status);
	}
	
	
	$.getJSON("role/permission?roleid=${role.id}",function(data){
		$('#permissionDiv').html(permissionTemplate(data));
		$(".permission-list2 dd input:checkbox").each(function(i ,e){
			if($(this).prop("checked")){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
			}
		});
		
		$(".permission-list dt input:checkbox").click(function(){
			$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
		});
		$(".permission-list2 dd input:checkbox").click(function(){
			var l =$(this).parent().parent().find("input:checked").length;
			var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
			if($(this).prop("checked")){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
			}
			else{
				if(l==0){
					$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
				}
				if(l2==0){
					$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
				}
			}
			
		});
	}) ;
	
	
	$("#form-role-add").Validform({
		tiptype:2,
		callback:function(form){
			var index = parent.layer.load();
			$.ajax({
				url:"role/save" , 
				type:'post',
				async:true ,
				cache:false ,
				data:$(form).serialize(),
                dataType:"json",
				success:function(data){
					parent.layer.close(index);
					if(data.s == true){
						index = parent.layer.getFrameIndex(window.name);
						parent.layer.msg("保存成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
							parent.$(".show_iframe:visible > iframe").contents().find("#search").click() ;
							parent.layer.close(index);
						}) ;
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
				
			}) ;
			return false ;
		}
	});
}) ;
</script>
</body>
</html>