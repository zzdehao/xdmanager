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
<title>日志管理</title>
<%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
	<div class="text-c mb-10" > 
		日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'maxDate\')||\'%y-%M-%d\'}'})" 
			id="minDate" class="input-text Wdate" style="width:186px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'minDate\')}',maxDate:'%y-%M-%d'})"
			id="maxDate" class="input-text Wdate" style="width:186px;">
		<button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;"><i class="Hui-iconfont">&#xe665;</i>查询</button>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">日志列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="140">记录时间</th>
				<th width="80">操作用户</th>
				<th width="80">访问IP</th>
				<th width="60">执行时间(毫秒)</th>
				<th width="300">执行方法</th>
				<th >参数</th>
				<th width="100">URL</th>
				<th width="25">操作</th>
			</tr>
		</thead>
		<tbody id = "log-list">
			
		</tbody>
	</table>
	<div class="mt-10">
		<div class="text-l f-l" id = "pager-info"></div>
		<div class="text-r f-r" id="pager"></div>
	</div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="log-template">
 	{{#each rows}}
	<tr class="text-c">
		<td><input class = "alls" type="checkbox" value="{{id}}" name=""></td>
		<td>{{create_time}}</td>
		<td>{{create_user}}</td>
		<td>{{ip}}</td>
		<td>{{executeTime}}</td>
		<td>{{classname}}.{{method}}</td>
		<td>{{params}}</td>
		<td>{{url}}</td>
		<td class="td-manage">
		<shiro:hasPermission name="system:log:del">
			<a title="删除" href="javascript:;" onclick="role_del(this,{{id}})" class="ml-5" style="text-decoration:none">
				<i class="Hui-iconfont">&#xe6e2;</i></a>
		</shiro:hasPermission>
		</td>
	</tr>
 	{{/each}}
</script>
<script type="text/javascript">
var logTemplate = Handlebars.compile($("#log-template").html());

function loadData(page){
	page =  page|| 1 ;
	var index = parent.layer.load();
	$.getJSON("log/list",{page:page,minDate:$("#minDate").val(),maxDate:$("#maxDate").val()} ,function(data){
		//$("#total strong").text(data.length) ;
		$('#log-list').html(logTemplate(data));
		
		laypage({
	        cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
	        pages: data.pages, //通过后台拿到的总页数
	        curr: page|| 1, //当前页
	        jump: function(obj, first){ //触发分页后的回调
	        	$("#pager-info").html('共'+data.total+'条,'+ obj.pages +'页,当前第'+obj.curr+'页');
	            if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
	            	loadData(obj.curr);
	            }
	        }
	    });
		
		parent.layer.close(index);
	}) ;
}

$(function(){
	/**/
	$('.radio-box input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	loadData(1) ;
}) ; 
</script>
</body>
</html>