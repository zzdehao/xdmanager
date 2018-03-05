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
    <title>人员管理</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-10">
    <div class="text-c" >
        <input type="text" class="input-text" style="width:250px" placeholder="输入账号,手机或用户名" id="q">
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<shiro:hasPermission name="user:admin:add">
				<a href="javascript:;" onclick="user_add('添加账号','yewu/user/edit','800','620')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i> 添加账号
                </a>
            </shiro:hasPermission>
		</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="10">人员列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="100">账号</th>
            <th width="100">姓名</th>
            <th width="90">手机</th>
            <th width="100">权限</th>
            <th width="100">省</th>
            <th width="100">市</th>
            <th width="100">状态</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id ="datar-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id = "pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="datar-template">
    {{#each rows}}
    <tr class="text-c">
        <td><input class = "alls" type="checkbox" value="{{id}}" name=""></td>
        <td>{{name}}</td>
        <td>{{trueName}}</td>
        <td>{{tel}}</td>
        <td>{{roleCode}}</td>
        <td>{{provinceCode}}</td>
        <td>{{cityCode}}</td>
        <td class="td-status">{{{statusFormatter status}}}</td>
        <td class="td-manage">
            <a title="编辑" href="javascript:;" onclick="user_edit('管理员编辑','yewu/user/edit?id={{id}}','800','520')"
               class="ml-5" style="text-decoration:none">
                <i class="Hui-iconfont">&#xe6df;</i>
            </a>
            <a title="删除" href="javascript:;" onclick="user_del(this,{{id}})" class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6e2;</i>
            </a>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    function statusFormatter(val){
        if(val == 1 ){
            return '<span class="label label-success radius">已启用</span>' ;
        }else{
            return '<span class="label radius">已停用</span>' ;
        }
    }
    var dataTemplate = Handlebars.compile($("#datar-template").html());
    Handlebars.registerHelper("statusFormatter" , statusFormatter) ;
    function loadData(page){
        page =  page|| 1 ;
        var index = parent.layer.load();
        $.getJSON("yewu/user/list",{page:page,q:$("#q").val()} ,function(data){
            $('#datar-list').html(dataTemplate(data));
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
        loadData(1) ;
    }) ;
    function user_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    function user_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }
    function user_del(obj,id){
        parent.layer.confirm('确认要删除吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url:"yewu/user/del/" + id,
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
</script>
</body>
</html>