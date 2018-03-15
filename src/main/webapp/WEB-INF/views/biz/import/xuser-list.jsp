<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户列表</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
    <div class="text-c mb-10">
        用户名称：
        <input type="text" placeholder="用户名或电话" name="key"  id="q"
               class="input-text" style="width:172px;margin-right: 10px;">
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData(1) ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
        <a href="javascript:;" onclick="xuser_add('添加巡店人员','import/xuserEdit','800','680')" class="btn btn-success radius">
            <i class="Hui-iconfont">&#xe665;</i>添加巡店人员</a>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="15">巡店人列表</th>
        </tr>
        <tr class="text-c">
            <th width="60">批次</th>
            <th width="60">用户名</th>
            <th width="80">手机号</th>
            <th width="80">省</th>
            <th width="80">城市</th>
            <th width="80">导入时间</th>
            <th width="146">操作</th>
        </tr>
        </thead>
        <tbody id="xuser-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id="pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="xuser-template">
    {{#each rows}}
    <tr class="text-c">
        <td>{{blz1}}</td>
        <td>{{name}}</td>
        <td>{{tel}}</td>
        <td>{{provinceName}}</td>
        <td>{{cityName}}</td>
        <td>{{create_time}}</td>
        <td class="td-manage">
            <input class="btn btn-danger size-S radius" type="button" value="删除" onclick="javascript:xuser_del(this,{{id}});"/>
            <input class="btn btn-success size-S radius" type="button" onclick="xuser_edit('巡店人编辑','<%=request.getContextPath()%>/import/xuserEdit?id={{id}}','820','680')" value="修改"/>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var logTemplate = Handlebars.compile($("#xuser-template").html());
    function loadData(page) {
        page = page || 1;
        var index = parent.layer.load();
        $.getJSON("import/xuserList", {
            page: page,
            q:$("#q").val()
        }, function (data) {
            $('#xuser-list').html(logTemplate(data));
            laypage({
                cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                pages: data.pages, //通过后台拿到的总页数
                curr: page || 1, //当前页
                jump: function (obj, first) { //触发分页后的回调
                    $("#pager-info").html('共' + data.total + '条,' + obj.pages + '页,当前第' + obj.curr + '页');
                    if (!first) { //点击跳页触发函数自身，并传递当前页：obj.curr
                        loadData(obj.curr);
                    }
                }
            });
            parent.layer.close(index);
        });
    }
    /*
     参数解释：
     title	标题
     url		请求的url
     id		需要操作的数据id
     w		弹出层宽度（缺省调默认值）
     h		弹出层高度（缺省调默认值）
     */
    /*管理员-增加*/
    function xuser_add(title,url,w,h){
        window.location.href=url;
        //layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function xuser_del(obj,id){
        parent.layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url:"import/delxuser/"+ id,
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
            });
        });
    }
    /*管理员-编辑*/
    function xuser_edit(title,url,w,h){
        //layer_show(title,url,w,h);
        window.location.href=url;
    }
    $(function () {
        /**/
        $('.radio-box input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        loadData(1);
    });
</script>
</body>
</html>