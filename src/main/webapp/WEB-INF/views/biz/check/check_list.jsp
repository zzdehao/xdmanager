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
    <title>巡店记录查询</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20">
    <div class="text-c mb-10">
        <form id="form" action="<%=request.getContextPath()%>/check/export">
        用户名称：
        <input type="text" placeholder="用户名或电话" name="key"  id="q"
               class="input-text" style="width:172px;margin-right: 10px;">
        <button type="button" class="btn btn-success" id="search" name="" onclick="loadData(1) ;">
            <i class="Hui-iconfont">&#xe665;</i>查询
        </button>
        <a href="javascript:;" id="report" class="btn btn-success radius">
            <i class="Hui-iconfont">&#xe665;</i>导出EXCEL</a>
        </form>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="56">巡店记录查询</th>
        </tr>
        <tr class="text-c">
            <th width="60">计划批次</th>
            <th width="60">省份</th>
            <th width="60">城市</th>
            <th width="60">渠道名称</th>
            <th width="60">公司名称</th>
            <th width="60">店铺名称</th>
            <th width="60">平台名称</th>
            <th width="60">详细地址</th>
            <th width="60">渠道管理员</th>
            <th width="60">渠道管理员电话</th>
            <th width="60">检查人</th>
            <th width="60">检查时间</th>
            <th width="60">经度</th>
            <th width="60">纬度</th>
            <th width="60">店铺是否存在</th>
            <th width="60">店铺实际名称是否相符</th>
            <th width="60">店铺实际巡查地址省</th>
            <th width="60">店铺实际巡查地址城市</th>
            <th width="60">店铺实际巡查地址</th>
            <th width="60">店铺地域类型</th>
            <th width="60">店铺门店类型</th>
            <th width="60">店铺类型业态商圈</th>
            <th width="60">店铺面积类型</th>
            <th width="60">店铺人员规模</th>
            <th width="60">近一个月是否变更</th>
            <th width="60">忙时人数</th>
            <th width="60">闲时人数</th>
            <th width="60">营业员受理业务程度</th>
            <th width="60">营业员对内部套餐策略数量程度</th>
            <th width="60">终端营销策略数量</th>
            <th width="60">对客户是否主动营销</th>
            <th width="60">是否推出4g</th>
            <th width="60">是否推出全网通</th>
            <th width="60">是否主推机型</th>
            <th width="60">是否干净卫生</th>
            <th width="60">宣传是否合规</th>
            <th width="60">店内动线是否设计合规</th>
            <th width="60">月销售终端数量</th>
            <th width="60">异网发展能力</th>
            <th width="60">是否联通门头</th>
            <th width="60">是否联通灯箱</th>
            <th width="60">是否联通标牌</th>
            <th width="60">是否联通二维码</th>
            <th width="60">是否有实名制公告</th>
            <th width="60">是否联通背景墙</th>
            <th width="60">是否联通柜台贴</th>
            <th width="60">是否opp专区</th>
            <th width="60">是否有金立专柜</th>
            <th width="60">是否vivo专柜</th>
            <th width="60">是否为华为专柜</th>
            <th width="60">是否三星专柜</th>
            <th width="60">是否苹果专柜</th>
            <th width="60">是否魅族</th>
            <th width="60">是否2g,3g专柜</th>
            <th width="60">社会机型库存数量</th>
            <th width="60">自由机型库存数量</th>
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
<div id="temp" style="display: none">
    <table>
    <tr class="text-c" >
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </table>
</div>

<script type="text/javascript">

    function checkOkMap(key){

        if(key == 1){
            return "是";
        }else{
            return "否";
        }
    }

    function checkRegionMap(key){
        if(key == 1){
            return "城区";
        }else if(key == 2){
            return "城郊";
        }else if(key == 3){
            return "县城";
        }else if(key == 4){
            return "乡镇";
        }else if(key == 5){
            return "其他";
        }
    }

    function checkMendianMap(key){

        if(key == 1){
            return "联通专营终端卖场";
        }else if(key == 2){
            return "联通专营";
        }else if(key == 3){
            return "开放型终端卖场";
        }else if(key == 4){
            return "代理点";
        }else if(key == 5){
            return "社区沃店(宽带)";
        }else if(key == 6){
            return "移动排他终端卖场";
        }else if(key == 7){
            return "电信排他终端卖场";
        }

    }

    function checkYtsqMap(key){

        if(key == 1){
            return "通讯商圈";
        }else if(key == 2){
            return "商业区";
        }else if(key == 3){
            return "学校";
        }else if(key == 4){
            return "社区";
        }else if(key == 5){
            return "工业园区";
        }else if(key == 6){
            return "办公楼宇";
        }else if(key == 7){
            return "其他";
        }

    }

    function checkAreaMap(key){

        if(key == 1){
            return "20平米以下";
        }else if(key == 2){
            return "20-50平米";
        }else if(key == 3){
            return "50-100平米";
        }else if(key == 4){
            return "100平米以上";
        }

    }

    function checkMembersMap(key){

        if(key == 1){
            return "3人以下";
        }else if(key == 2){
            return "4-6人";
        }else if(key == 3){
            return "7-10人";
        }else if(key == 4){
            return "大于10人";
        }

    }

    function checkScopMap(key){

        if(key == 1){
            return "非常熟练";
        }else if(key == 2){
            return "一般熟练";
        }else if(key == 3){
            return "不太熟练";
        }else if(key == 4){
            return "不熟练";
        }

    }

    function checkLiangMap(key){

        if(key == 1){
            return "0";
        }else if(key == 2){
            return "<20";
        }else if(key == 3){
            return "20-50";
        }else if(key == 4){
            return "50-100";
        }else if(key == 5){
            return "100以上";
        }

    }

    Handlebars.registerHelper("checkOkMap" , checkOkMap) ;
    Handlebars.registerHelper("checkRegionMap" , checkRegionMap) ;
    Handlebars.registerHelper("checkMendianMap" , checkMendianMap) ;
    Handlebars.registerHelper("checkYtsqMap" , checkYtsqMap) ;
    Handlebars.registerHelper("checkAreaMap" , checkAreaMap) ;
    Handlebars.registerHelper("checkMembersMap" , checkMembersMap) ;
    Handlebars.registerHelper("checkScopMap" , checkScopMap) ;
    Handlebars.registerHelper("checkLiangMap" , checkLiangMap) ;


    function loadData(page) {
        page = page || 1;
        var index = parent.layer.load();
        $.getJSON("check/list/query", {
            page: page
        }, function (data) {
            parent.layer.close(index);buildTR(data);
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
        });
    }

    function buildTR(list){
        var html = $("#temp").find("tbody").html();
        var $listBox = $("#xuser-list");
        $listBox.empty();
        for(var i = 0; i < list.length; i++){
            var obj = list[i];
            var $tr = $(html);
            var tdList = $tr.find("td");
            var k = 0;
            $(tdList[k++]).text(obj.bizCheckDetail.planBatchName);
            $(tdList[k++]).text(obj.bizStore.provinceName);
            $(tdList[k++]).text(obj.bizStore.cityName);
            $(tdList[k++]).text(obj.bizStore.channelName);
            $(tdList[k++]).text(obj.bizStore.companyName);
            $(tdList[k++]).text(obj.bizStore.storeName);
            $(tdList[k++]).text(obj.bizStore.platformName);
            $(tdList[k++]).text(obj.bizStore.addressDetail);
            $(tdList[k++]).text(obj.bizStore.channelManagerName);
            $(tdList[k++]).text(obj.bizStore.channelManagerPhone);
            $(tdList[k++]).text(obj.bizCheckDetail.checkUserName);
            $(tdList[k++]).text(obj.bizCheckDetail.checkTime);
            $(tdList[k++]).text(obj.bizCheckDetail.checkLongitude);
            $(tdList[k++]).text(obj.bizCheckDetail.checkLatitude);
            $(tdList[k++]).text(obj.bizCheckDetail.storeExistsok);
            $(tdList[k++]).text(obj.bizCheckDetail.storeRealnameok);
            $(tdList[k++]).text(obj.bizCheckDetail.storeCheckProvinceName);
            $(tdList[k++]).text(obj.bizCheckDetail.storeCheckCityName);
            $(tdList[k++]).text(obj.bizCheckDetail.storeAddress);
            $(tdList[k++]).text(checkRegionMap(obj.bizCheckDetail.storeRegiontype));
            $(tdList[k++]).text(checkMendianMap(obj.bizCheckDetail.storeMendiantype));
            $(tdList[k++]).text(checkYtsqMap(obj.bizCheckDetail.storeYtsqtype));
            $(tdList[k++]).text(checkAreaMap(obj.bizCheckDetail.storeAreatype));
            $(tdList[k++]).text(checkMembersMap(obj.bizCheckDetail.storeMemberstype));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeNmonthChangeok));
            $(tdList[k++]).text(obj.bizCheckDetail.storeBusyUsercount);
            $(tdList[k++]).text(obj.bizCheckDetail.storeFreeUsercount);
            $(tdList[k++]).text(checkScopMap(obj.bizCheckDetail.storeMemberBusscope));
            $(tdList[k++]).text(checkScopMap(obj.bizCheckDetail.storeMemberTaocanScope));
            $(tdList[k++]).text(checkScopMap(obj.bizCheckDetail.storeMemberTerminalPolicy));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeMemeberActivesellok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.store4gok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeAllnetok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeFirstRecdTerminal));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeHealthok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeConductok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeDonglineok));
            $(tdList[k++]).text(checkLiangMap(obj.bizCheckDetail.storeMonthSalecount));
            $(tdList[k++]).text(checkLiangMap(obj.bizCheckDetail.storeDifExpandability));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeDoortouok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeDengxiangok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeBrandok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeQrcode));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeRealnameNoticeok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeBackwall));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeBartie));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqOppok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqJinliok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqVivook));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqHuaweiok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqSamsongok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqAppleok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZqMeizuok));
            $(tdList[k++]).text(checkOkMap(obj.bizCheckDetail.storeZq2g3gok));
            $(tdList[k++]).text(obj.bizCheckDetail.storeKccheckOutcount);
            $(tdList[k++]).text(obj.bizCheckDetail.storeKccheckSelfcount);
            $listBox.append($tr);
        }
    }

    $(function () {
        /**/
        $('.radio-box input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        loadData(1);
        $("#report").click(function(){
            var $form = $("#form");
            var times = "?v=" + new Date().getTime();
            $("#form").attr("action", "check/export" + times);
            $form.attr("target", "reportExcel");
            $form.submit();
        });
    });
</script>
<iframe id="reportExcel" name="reportExcel" width="0" height="0"></iframe>
</body>
</html>