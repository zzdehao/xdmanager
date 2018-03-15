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
    <title>导入巡店人员管理</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
    <div class="text-c mb-10">
        <div class="select-box" style="width: 170px;">
            <select class="select" size="1" name="importType" id="importType">
                <option value="21" selected>人员</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
        <button type="submit" class="btn btn-success" id="importbtn" name="" onclick="javascript:toImpPage();">
            <i class="Hui-iconfont">&#xe665;</i>导入文件
        </button>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">文件列表</th>
        </tr>
        <tr class="text-c">
            <th width="160">批次</th>
            <th width="100">类型</th>
            <th width="80">文件名</th>
            <th width="80">导入时间</th>
            <th width="100">备注</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody id="user-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id="pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<form id="form" method="post">
</form>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="user-template">
    {{#each rows}}
    <tr class="text-c">
        <td>{{batchName}}</td>
        <td>{{importTypeName}}</td>
        <td>{{fileName}}</td>
        <td>{{createTime}}</td>
        <td>{{remark}}</td>
        <td class="td-manage">
            <input class="btn btn-danger size-S radius" type="button" value="删除" onclick="file_del(this,{{id}});"/>
            <input class="btn btn-link radius" type="button" onclick="fileLoad({{id}});" value="查看"/>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var logTemplate = Handlebars.compile($("#user-template").html());
    function loadData(page) {
        page = page || 1;
        var index = parent.layer.load();
        $.getJSON("import/userFileList", {
            page: page,
            importType:$("#importType").val()
        }, function (data) {
            $('#user-list').html(logTemplate(data));
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
    function toImpPage(flag) {
        window.location.href = "<%=request.getContextPath()%>/import/toImpUserPage";
    }
    function file_del(obj,id){
        parent.layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url:"import/delUserFile/" + id,
                type:'post',
                async:false ,
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
    function fileLoad(id){
        var $form = $("#form");
        var times = "?v=" + new Date().getTime();
        $("#form").attr("action", "import/getDownFile/"+id+times);
        $form.attr("target", "reportExcel");
        $form.submit();
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
<iframe id="reportExcel" name="reportExcel" width="0" height="0"></iframe>
</body>
</html>