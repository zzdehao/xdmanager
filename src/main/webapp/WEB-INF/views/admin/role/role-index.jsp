<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20" style="height: 32px;">
    <div class="text-c">
        状态：
        <div class="radio-box"><input type="radio" name="s" value="" id="s-0" checked="checked">
            <label for="s-0">全部</label></div>
        <div class="radio-box">
            <input type="radio" id="s-1" name="s" value="1">
            <label for="s-1">启用</label>
        </div>
        <div class="radio-box">
            <input type="radio" id="s-2" name="s" value="2">
            <label for="s-2">停用</label>
        </div>
        <input type="text" class="input-text" style="width:250px" placeholder="输入角色名称" id="q">
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;"><i
                class="Hui-iconfont">&#xe665;</i>查询
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<shiro:hasPermission name="system:role:del">
                <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            </shiro:hasPermission>
			<shiro:hasPermission name="system:role:add">
			<a href="javascript:;" onclick="role_add('添加角色','role/edit','800','600')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加角色</a>
            </shiro:hasPermission>
		</span>
        <span class="r" id="total">共有数据：<strong>54</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">角色列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="250">角色名称</th>
            <th width="100">角色代码</th>
            <th width="80">状态</th>
            <th>角色描述</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id="role-list">

        </tbody>
    </table>
</div>
<%@include file="/footer.jsp" %>
<!--Handlebar模板-->
<script type="text/x-handlebars-template" id="role-template">
    {{#each this}}
    <tr class="text-c">
        <td><input class="alls" type="checkbox" value="{{id}}" name=""></td>
        <td>{{name}}</td>
        <td>{{roleCode}}</td>
        <td class="td-status">{{{statusFormatter status}}}</td>
        <td>{{remark}}</td>
        <td class="td-manage">
            <shiro:hasPermission name="system:admin:status">
                {{{statusTools status id}}}
            </shiro:hasPermission>
            <shiro:hasPermission name="system:role:edit">
                <a title="编辑" href="javascript:;" onclick="role_edit('角色编辑','role/edit?id={{id}}','800','500')"
                   class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6df;</i></a>
            </shiro:hasPermission>
            <shiro:hasPermission name="system:role:del">
                <a title="删除" href="javascript:;" onclick="role_del(this,{{id}})" class="ml-5"
                   style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6e2;</i></a>
            </shiro:hasPermission>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var roleTemplate = Handlebars.compile($("#role-template").html());
    function statusFormatter(val) {
        if (val == 1) {
            return '<span class="label label-success radius">已启用</span>';
        } else {
            return '<span class="label radius">已停用</span>';
        }
    }

    function statusTools(val, id) {
        if (val == 1) {
            return '<a style="text-decoration:none" onClick="role_stop(this,' + id + ')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> ';
        } else {
            return '<a style="text-decoration:none" onClick="role_start(this,' + id + ')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>';
        }
    }
    Handlebars.registerHelper("statusFormatter", statusFormatter);
    Handlebars.registerHelper("statusTools", statusTools);

    function loadData() {
        //alert($("input[name=s]:checked").val());
        var index = parent.layer.load();
        $.getJSON("role/list", {s: $("input[name=s]:checked").val(), q: $("#q").val()}, function (data) {
            $("#total strong").text(data.length);
            $('#role-list').html(roleTemplate(data));
            parent.layer.close(index);
        });
    }

    $(function () {
        /**/
        $('.radio-box input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        loadData();
    });
    /*
     参数解释：
     title	标题
     url		请求的url
     id		需要操作的数据id
     w		弹出层宽度（缺省调默认值）
     h		弹出层高度（缺省调默认值）
     */
    /*角色-增加*/
    function role_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }
    /*角色-删除*/
    function role_del(obj, id) {
        parent.layer.confirm('确认要删除吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url: "role/del/" + id,
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
    /*角色-编辑*/
    function role_edit(title, url, w, h) {
        layer_show(title, url, w, h);
    }
    /*角色-停用*/
    function role_stop(obj, id) {
        parent.layer.confirm('确认要停用吗？', {icon: 3, title: '提示'}, function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url: "role/status/" + id + "/2",
                type: 'post',
                async: true,
                cache: false,
                dataType: "json",
                success: function (data) {
                    if (data.s == true) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="role_start(this,' + id + ')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label  radius">已停用</span>');
                        $(obj).remove();
                        parent.layer.msg('已停用!', {icon: 5, time: 1000});
                    } else {
                        parent.layer.alert(data.m, {icon: 2, title: "系统提示"});
                    }
                },

            });
        });
    }

    /*角色-启用*/
    function role_start(obj, id) {
        parent.layer.confirm('确认要启用吗？', {icon: 3, title: '提示'}, function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url: "role/status/" + id + "/1",
                type: 'post',
                async: true,
                cache: false,
                dataType: "json",
                success: function (data) {
                    if (data.s == true) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="role_stop(this,' + id + ')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        parent.layer.msg('已启用!', {icon: 6, time: 1000});
                    } else {
                        parent.layer.alert(data.m, {icon: 2, title: "系统提示"});
                    }
                },

            });
        });
    }

    function datadel() {
        var alls = $(".alls:checked");
        if (alls.length == 0) {
            parent.layer.alert("请至少选择一行数据!", {icon: 2, title: "系统提示"});
            return;
        }
        parent.layer.confirm('确认要删除选中行的数据吗？', {icon: 3, title: '提示'}, function (index) {
            //var array= new Array() ;
            var array = [];
            $.each(alls, function (i, n) {
                //array.push($(n).val());
                array[i] = $(n).val();
            });
            $.ajax({
                url: "role/delall",
                type: 'post',
                async: true,
                cache: false,
                dataType: "json",
                data: {'id': array},
                success: function (data) {
                    if (data.s == true) {
                        parent.layer.msg('已删除!', {icon: 1, time: 1000});
                        loadData();
                    } else {
                        parent.layer.alert(data.m, {icon: 2, title: "系统提示"});
                    }
                },

            });
        });
    }
    function role_permission(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>
</body>
</html>