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
<title>人员导入管理</title>
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
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
        <button type="submit" class="btn btn-success" id="importbtn" name="" onclick="javascript:toImpPage();">
            <i class="Hui-iconfont">&#xe665;</i>导入人员
        </button>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">人员列表</th>
        </tr>
        <tr class="text-c">
            <th width="140">批次ID</th>
            <th width="80">姓名</th>
            <th width="80">人员id</th>
            <th width="60">联系电话</th>
            <th width="100">职务</th>
            <th>导入时间</th>
            <th width="100">备注</th>
            <th width="25">操作</th>
        </tr>
        </thead>
        <tbody id = "user-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id = "pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="user-template">
    {{#each rows}}
    <tr class="text-c">
        <td>{{batchId}}</td>
        <td>{{userName}}</td>
        <td>{{userId}}</td>
        <td>{{fiveLevelphone}}</td>
        <td>{{dutyName}}</td>
        <td>{{createTime}}</td>
        <td>{{remark}}</td>
        <td class="td-manage">
         <a title="删除" href="javascript:;" onclick="role_del(this,{{id}})" class="ml-5" style="text-decoration:none">
            <i class="Hui-iconfont">&#xe6e2;</i></a>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var logTemplate = Handlebars.compile($("#user-template").html());
    function loadData(page){
        page =  page|| 1 ;
        var index = parent.layer.load();
        $.getJSON("import/userList",{page:page,minDate:$("#minDate").val(),maxDate:$("#maxDate").val()} ,function(data){
            //$("#total strong").text(data.length) ;
            $('#user-list').html(logTemplate(data));
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
    function toImpPage(flag){
        window.location.href="<%=request.getContextPath()%>/import/toImpPage";
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