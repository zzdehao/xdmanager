<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
 <%
	String ctx = request.getContextPath();
	request.setAttribute("ctx", ctx) ;
	
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>管理员编辑</title>

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pd-20">
	<form action="" method="post" class="form form-horizontal" id="form-admin-add">
		<input type="hidden" name="id" id = "id"  value="${admin.id}">
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="${admin.name}" placeholder="" id="name" name="name" datatype="*5-16" nullmsg="用户名不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl prow">
			<label class="form-label col-3"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls col-5">
				<input type="password" name="password" id ="password" placeholder="密码" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl prow">
			<label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-5">
				<input type="password" placeholder="确认新密码" autocomplete="off" class="input-text" errormsg="您两次输入的新密码不一致！"
					 datatype="*" nullmsg="请再输入一次新密码！" recheck="password" id="newpassword2" name="newpassword2">
			</div>
			<div class="col-4"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>昵称：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="${admin.nickname}" placeholder="请输入昵称" id="nickname" name="nickname"  datatype="s2-16" nullmsg="昵称不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="${admin.tel}" placeholder="请输入手机号码 " id="tel" name="tel"  datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red"></span>邮箱：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" placeholder="@" value="${admin.email}" name="email" id="email"  datatype="e">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">状态：</label>
			<div class="formControls col-5"> 
				<span class="select-box" style="width:150px;">
					<select class="select" name="status" id = "status" size="1">
						<option value="1">启用</option>
						<option value="2">停用</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">角色：</label>
			<div class="formControls col-5" id = "roles"> 
				<c:forEach items="${roles}" var="role">
                    <c:if test="${role.roleCode==admin.roleCode}">
					 <label><input type="radio" checked value="${role.id}" name="roles">${role.name}&nbsp;&nbsp;</label>
                    </c:if>
                    <c:if test="${role.roleCode!=admin.roleCode}">
                    <label><input type="radio" checked value="${role.id}" name="roles">${role.name}&nbsp;&nbsp;</label>
                    </c:if>
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">备注：</label>
			<div class="formControls col-5">
				<textarea name="remark" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="textarealength(this,100)">${admin.remark}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<%@include file="/footer.jsp" %>
<script type="text/javascript">
$(function(){
	var status = '${admin.status}' ;
	var id = $("#id").val();
	if(id){
		$(".prow").remove();
		$("#status").val(status);
		
		textarealength($("textarea[name=remark]"),100)
		
		$.post("role/getuserrole/" + id , function(data){
			//alert(data);
			$.each(data , function(i,n){
				$("#roles input[value="+n.roleId+"]").attr("checked","checked");
			});
		}) ;
	}
	
	$("#form-admin-add").Validform({
		tiptype:2,
		callback:function(form){
			var index = parent.layer.load();
			$.ajax({
				url:"admin/save" , 
				type:'post',
				async:true ,
				cache:false ,
				data:$(form).serialize(),
				dataType:"json",
				success:function(data){
					parent.layer.close(index);
					if(data.s == true){
						//parent.loadData();
						index = parent.layer.getFrameIndex(window.name);
						//alert(parent.$(".show_iframe:visible > iframe")[0].window);
						//parent.$(".show_iframe:visible > iframe").attr("src" ,parent.$(".show_iframe:visible > iframe")[0].src ); 
						parent.layer.msg("保存成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
							parent.$(".show_iframe:visible > iframe").contents().find("#search").click() ;
							parent.layer.close(index);
						}) ;
						
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
			}) ;
			//form[0].submit();
			return false ;
		}
	});
});
</script>
</body>
</html>