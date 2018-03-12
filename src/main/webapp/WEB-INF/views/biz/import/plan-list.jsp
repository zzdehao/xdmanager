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
    <title>巡检计划列表</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
    <div class="text-c mb-10">
         <label for="batch">批次：</label>
          <select class="batch" style="height: 30px;" size="1" name="batch" id="batch">
                        <option value="" selected>全部</option>
                </select>
        <button type="submit" class="btn btn-success" id="search" name="" onclick="loadData() ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="15">巡检计划列表</th>
        </tr>
        <tr class="text-c">
            <th width="60">批次id</th>
            <th width="80">批次编号</th>
            <th width="80">渠道编号</th>
            <th width="100">渠道名称</th>
            <th width="80">渠道类型</th>
            <th width="80">店铺编号</th>
            <th width="80">店铺名称</th>
            <th width="80">省</th>
            <th width="80">地市</th>
            <th width="100">店铺地址</th>
            <th width="60">巡检人</th>
            <th width="60">巡检人电话</th>
            <th width="146">操作</th>
        </tr>
        </thead>
        <tbody id="plan-list">
        </tbody>
    </table>
    <div class="mt-10">
        <div class="text-l f-l" id="pager-info"></div>
        <div class="text-r f-r" id="pager"></div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/x-handlebars-template" id="plan-template">
    {{#each rows}}
    <tr class="text-c">
        <td>{{batchId}}</td>
        <td>{{batchName}}</td>
        <td>{{channelCode}}</td>
        <td>{{channelName}}</td>
        <td>{{channelType}}</td>
        <td>{{storeCode}}</td>
        <td>{{storeName}}</td>
        <td>{{provinceName}}</td>
        <td>{{cityName}}</td>
        <td>{{storeAddress}}</td>
        <td>{{checkUserName}}</td>
        <td>{{channelUserTel}}</td>
        <td class="td-manage">
            <input class="btn btn-danger size-S radius" type="button" value="删除" onclick="javascript:store_del(this,{{id}});"/>
            <input class="btn btn-success size-S radius" type="button" onclick="store_edit('店铺编辑','<%=request.getContextPath()%>/import/storeEdit?id={{id}}','820','680')" value="修改"/>
        </td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var logTemplate = Handlebars.compile($("#plan-template").html());
    function loadData(page) {
        page = page || 1;
        var index = parent.layer.load();
        $.getJSON("import/planList", {
            page: page,
            batchId:$("#batch").val()
        }, function (data) {
            $('#plan-list').html(logTemplate(data));
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
    function store_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function store_del(obj,id){
        parent.layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url:"import/delStore/" + id,
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
    /*管理员-编辑*/
    function store_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }
    var batchUrl = "common/batch?typeList=31&typeList=32&typeList=33";
    $(function () {
        loadData(1);

        $.get(batchUrl, function(data){
            let batch31 = data["31"];
            let $batch = $("#batch");
            for(let i = 0; i < batch31.length; i++){
                let $option = $("<option></option>");
                $option.val(batch31[i].id);
                $option.text(batch31[i].batchName);
                $batch.append($option);
            }
            let batch32 = data["32"];
            for(let i = 0; i < batch32.length; i++){
                let $option = $("<option></option>");
                $option.val(batch32[i].id);
                $option.text(batch32[i].batchName);
                $batch.append($option);
            }
            let batch33 = data["33"];
            for(let i = 0; i < batch33.length; i++){
                let $option = $("<option></option>");
                $option.val(batch33[i].id);
                $option.text(batch33[i].batchName);
                $batch.append($option);
            }
        });
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