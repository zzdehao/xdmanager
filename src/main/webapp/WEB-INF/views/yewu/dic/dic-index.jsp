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
    <title>字典管理</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
    <div class="text-c" >
        <div class="radio-box">
                <select class="input-text" name="type" id="type" style="width: 130px;" onchange="javascript:loadData();">
                    <option value="">全部类型</option>
                    <c:forEach items="${pdics}" var="item">
                        <option value="${item.type}">${item.description}</option>
                    </c:forEach>
                </select>
        </div>
        <input type="text" class="input-text" style="width:250px" placeholder="输入名称,值" id="q">
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;"><i class="Hui-iconfont">&#xe665;</i>查询</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<shiro:hasPermission name="baseinfo:dic:add">
				<a href="javascript:;" onclick="dic_add('添加字典','yewu/dic/edit','800','400')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i> 添加字典</a>
            </shiro:hasPermission>
		</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">字典列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="100">名称</th>
            <th width="100">值</th>
            <th width="90">类型</th>
            <th width="100">备注</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id = "dic-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id = "pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="dic-template">
    {{#each rows}}
    <tr class="text-c">
        <td><input class = "alls" type="checkbox" value="{{id}}" name=""></td>
        <td>{{name}}</td>
        <td>{{value}}</td>
        <td>{{type}}</td>
        <td>{{description}}</td>
        <td class="td-manage">
            <shiro:hasPermission name="baseinfo:dic:del">
                <a title="编辑" href="javascript:;" onclick="dic_edit('字典','yewu/dic/edit?id={{id}}','800','500')"
                   class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6df;</i></a>
            </shiro:hasPermission>
            <shiro:hasPermission name="baseinfo:dic:del">
                <a title="删除" href="javascript:;" onclick="dic_del(this,{{id}})" class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6e2;</i></a>
            </shiro:hasPermission>

        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var dicTemplate = Handlebars.compile($("#dic-template").html());
    function loadData(page){
        page =  page|| 1 ;
        var index = parent.layer.load();
        $.getJSON("yewu/dic/list",{page:page,type:$("#type").val(),key:$("#key").val()} ,function(data){
            $('#dic-list').html(dicTemplate(data));
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
        $('.radio-box input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        loadData(1) ;
    }) ;
    /*
     参数解释：
     title	标题
     url		请求的url
     id		需要操作的数据id
     w		弹出层宽度（缺省调默认值）
     h		弹出层高度（缺省调默认值）
     */
    function dic_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }
    function dic_del(obj, id) {
        parent.layer.confirm('确认要删除吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url: "yewu/dic/del/" + id,
                type: 'post',
                async: true,
                cache: false,
                dataType: "json",
                success: function (data) {
                    if (data.s == true) {
                        $(obj).parents("tr").remove();
                        parent.layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        parent.layer.alert(data.m, {icon: 2, title: "系统提示"});
                    }
                },

            });
        });
    }
    function dic_edit(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>
</body>
</html>