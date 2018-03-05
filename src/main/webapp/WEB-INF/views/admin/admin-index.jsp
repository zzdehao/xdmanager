<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<title>管理页面</title>

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pd-20">
	<div class="text-c" > 
		状态： <div class="radio-box"><input type="radio"  name="s" value="" id="s-0" checked="checked"><label  for = "s-0">全部</label></div>
		 <div class="radio-box">
		 <input type="radio"  id ="s-1"  name="s" value="1">
          <label for = "s-1">启用</label>
          </div>
          <div class="radio-box">
          <input type="radio" id="s-2"  name="s" value="2">
          <label for="s-2">停用</label>
        </div>
		<input type="text" class="input-text" style="width:250px" placeholder="输入登录名,手机或邮箱" id="q">
		<button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;"><i class="Hui-iconfont">&#xe665;</i>查询</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<shiro:hasPermission name="system:admin:del">
				<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
			</shiro:hasPermission>
			<shiro:hasPermission name="system:admin:add">
				<a href="javascript:;" onclick="admin_add('添加管理员','admin/edit','800','620')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i> 添加管理员</a>
			</shiro:hasPermission>
		</span> 
		<span class="r" id = "total">共有数据：<strong>54</strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">账号列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="100">登录名</th>
				<th width="100">昵称</th>
				<th width="90">手机</th>
				<th width="150">邮箱</th>
				<th width="130">加入时间</th>
				<th width="80">状态</th>
				<th>备注</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody id = "admin-list">
		</tbody>
	</table>
</div>
<script type="text/x-handlebars-template" id="admin-template">
 	{{#each this}}
	<tr class="text-c">
		<td><input class = "alls" type="checkbox" value="{{id}}" name=""></td>
		<td>{{name}}</td>
		<td>{{nickname}}</td>
		<td>{{tel}}</td>
		<td>{{email}}</td>
		<td>{{create_time}}</td>
		<td class="td-status">{{{statusFormatter status}}}</td>
		<td>{{remark}}</td>
		<td class="td-manage">
			{{#compare '<shiro:principal property="name"></shiro:principal>' "admin" "="}}
				<shiro:hasPermission name="system:admin:status">
				{{{statusTools status id}}}
				</shiro:hasPermission>
				<shiro:hasPermission name="system:admin:edit">
				<a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin/edit?id={{id}}','800','520')" class="ml-5" style="text-decoration:none">
					<i class="Hui-iconfont">&#xe6df;</i></a> 
				</shiro:hasPermission>
				<shiro:hasPermission name="system:admin:del">
				<a title="删除" href="javascript:;" onclick="admin_del(this,{{id}})" class="ml-5" style="text-decoration:none">
					<i class="Hui-iconfont">&#xe6e2;</i></a>
				</shiro:hasPermission>			
			{{else}}
				{{#compare name "admin" "="}}
				{{else}}
				<shiro:hasPermission name="system:admin:status">
				{{{statusTools status id}}}
				</shiro:hasPermission>
				<shiro:hasPermission name="system:admin:edit">
				<a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin/edit?id={{id}}','800','520')" class="ml-5" style="text-decoration:none">
					<i class="Hui-iconfont">&#xe6df;</i></a> 
				</shiro:hasPermission>
				<shiro:hasPermission name="system:admin:del">
				<a title="删除" href="javascript:;" onclick="admin_del(this,{{id}})" class="ml-5" style="text-decoration:none">
					<i class="Hui-iconfont">&#xe6e2;</i></a>
				</shiro:hasPermission>
			{{/compare}}
			{{/compare}}

			
		</td>
	</tr>
 	{{/each}}
</script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="lib/layer/layer.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/lib/handlebars/handlebars-v4.0.2.js"></script> 
<script type="text/javascript" src="script/H-ui.js"></script> 
<script type="text/javascript" src="script/H-ui.admin.js"></script> 
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="script/common.js"></script> 
<script type="text/javascript">
var adminTemplate = Handlebars.compile($("#admin-template").html());

function statusFormatter(val){
	if(val == 1 ){
		return '<span class="label label-success radius">已启用</span>' ;
	}else{
		return '<span class="label radius">已停用</span>' ;
	}
}

function statusTools(val , id){
	if(val == 1 ){
		return '<a style="text-decoration:none" onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> ' ;
	}else{
		return '<a style="text-decoration:none" onClick="admin_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>' ;
	}
}


Handlebars.registerHelper("statusFormatter" , statusFormatter) ;
Handlebars.registerHelper("statusTools" , statusTools) ;
//Handlebars.registerHelper("compare" , hCompare) ;
//加载填充数据
function loadData(){
	var index = parent.layer.load();
	$.getJSON("admin/list",{s:$("input[name=s]:checked").val() ,q:$("#q").val() } ,function(data){
		$("#total strong").text(data.length) ;
		$('#admin-list').html(adminTemplate(data));
		parent.layer.close(index);
	}) ;
}

$(function(){
	$('.radio-box input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	loadData() ;
}) ; 

/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	parent.layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
				url:"admin/del/" + id, 
				type:'post',
				async:true ,
				cache:false ,
				dataType:"json",
				success:function(data){
					if(data.s == true){
						$(obj).parents("tr").remove();
						parent.layer.msg('已删除!',{icon:1,time:1000});
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
				
			}) ;
	});
}
/*管理员-编辑*/
function admin_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	parent.layer.confirm('确认要停用吗？',{icon: 3, title:'提示'},function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
				url:"admin/save?id=" + id +"&status=2", 
				type:'post',
				async:true ,
				cache:false ,
				dataType:"json",
				success:function(data){
					if(data.s == true){
						$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label  radius">已停用</span>');
						$(obj).remove();
						parent.layer.msg('已停用!',{icon: 5,time:1000});
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
				
			}) ;
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	parent.layer.confirm('确认要启用吗？',{icon: 3, title:'提示'},function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
				url:"admin/save?id=" + id +"&status=1", 
				type:'post',
				async:true ,
				cache:false ,
				dataType:"json",
				success:function(data){
					if(data.s == true){
						$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
						$(obj).remove();
						parent.layer.msg('已启用!', {icon: 6,time:1000});
					}else{
						parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
					}
				},
				
			}) ;
	});
}

function datadel(){
	var alls = $(".alls:checked");
	if(alls.length == 0){
		parent.layer.alert("请至少选择一行数据!", {icon: 2,title:"系统提示"});
		return ;
	}
	parent.layer.confirm('确认要删除选中行的数据吗？',{icon: 3, title:'提示'},function(index){
		//var array= new Array() ;
		var array = [] ;
		$.each(alls , function(i, n){
			//array.push($(n).val());
			array[i] = $(n).val() ;
		}) ;
		$.ajax({
			url:"admin/delall", 
			type:'post',
			async:true ,
			cache:false ,
			dataType:"json",
			data:{'id':array},
			success:function(data){
				if(data.s == true){
					//$(obj).parents("tr").remove();
					parent.layer.msg('已删除!',{icon:1,time:1000});
					loadData() ;
				}else{
					parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
				}
			},
			
		}) ;
	});
	
}
</script>
</body>
</html>