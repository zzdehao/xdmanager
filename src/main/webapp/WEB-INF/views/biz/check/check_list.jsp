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
    <div style="overflow:auto; width:100%; height:100%;">
        <table class="table table-border table-bordered table-bg" width="100%">
            <thead>
            <tr>
                <th scope="col" colspan="56">巡店记录查询</th>
            </tr>
            <tr class="text-c">
                <th width="120" nowrap>计划批次</th>
                <th width="120" nowrap>省份</th>
                <th width="120" nowrap>城市</th>
                <th width="120" nowrap>渠道名称</th>
                <th width="120" nowrap>公司名称</th>
                <th width="120" nowrap>店铺名称</th>
                <th width="120" nowrap>平台名称</th>
                <th width="120" nowrap>详细地址</th>
                <th width="120" nowrap>渠道管理员</th>
                <th width="120" nowrap>渠道管理员电话</th>
                <th width="120" nowrap>检查人</th>
                <th width="120" nowrap>检查时间</th>
                <th width="120" nowrap>经度</th>
                <th width="120" nowrap>纬度</th>
                <th width="120" nowrap>店铺是否存在</th>
                <th width="120" nowrap>店铺实际名称是否相符</th>
                <th width="120" nowrap>店铺实际巡查地址省</th>
                <th width="120" nowrap>店铺实际巡查地址城市</th>
                <th width="120" nowrap>店铺实际巡查地址</th>
                <th width="120" nowrap>店铺地域类型</th>
                <th width="120" nowrap>店铺门店类型</th>
                <th width="120" nowrap>店铺类型业态商圈</th>
                <th width="120" nowrap>店铺面积类型</th>
                <th width="120" nowrap>店铺人员规模</th>
                <th width="120" nowrap>近一个月是否变更</th>
                <th width="120" nowrap>忙时人数</th>
                <th width="120" nowrap>闲时人数</th>
                <th width="120" nowrap>营业员受理业务程度</th>
                <th width="120" nowrap>营业员对内部套餐策略数量程度</th>
                <th width="120" nowrap>终端营销策略数量</th>
                <th width="120" nowrap>对客户是否主动营销</th>
                <th width="120" nowrap>是否推出4g</th>
                <th width="120" nowrap>是否推出全网通</th>
                <th width="120" nowrap>是否主推机型</th>
                <th width="120" nowrap>是否干净卫生</th>
                <th width="120" nowrap>宣传是否合规</th>
                <th width="120" nowrap>店内动线是否设计合规</th>
                <th width="120" nowrap>月销售终端数量</th>
                <th width="120" nowrap>异网发展能力</th>
                <th width="120" nowrap>是否联通门头</th>
                <th width="120" nowrap>是否联通灯箱</th>
                <th width="120" nowrap>是否联通标牌</th>
                <th width="120" nowrap>是否联通二维码</th>
                <th width="120" nowrap>是否有实名制公告</th>
                <th width="120" nowrap>是否联通背景墙</th>
                <th width="120" nowrap>是否联通柜台贴</th>
                <th width="120" nowrap>是否opp专区</th>
                <th width="120" nowrap>是否有金立专柜</th>
                <th width="120" nowrap>是否vivo专柜</th>
                <th width="120" nowrap>是否为华为专柜</th>
                <th width="120" nowrap>是否三星专柜</th>
                <th width="120" nowrap>是否苹果专柜</th>
                <th width="120" nowrap>是否魅族</th>
                <th width="120" nowrap>是否2g,3g专柜</th>
                <th width="120" nowrap>社会机型库存数量</th>
                <th width="120" nowrap>自由机型库存数量</th>
            </tr>
            </thead>
            <tbody id="xuser-list">
            </tbody>
        </table>
    </div>
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

    function loadData(page) {
        var limit = 20;
        page = page || 1;
        var offset = (page - 1) * limit;
        var index = parent.layer.load();

        $.ajax({
            url: 'check/list/query',
            method: 'GET',
            cache:false,
            dataType: 'json',
            headers: {
                'limit': limit,
                'offset':offset
            }
        }).done(function (data) {
            let list = data.rows;
            parent.layer.close(index);buildTR(list);
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



//        $.getJSON("check/list/query", {
//            page: page
//        }, function (data) {
//            let list = data.list;
//            parent.layer.close(index);buildTR(list);
//            laypage({
//                cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
//                pages: data.pages, //通过后台拿到的总页数
//                curr: page || 1, //当前页
//                jump: function (obj, first) { //触发分页后的回调
//                    $("#pager-info").html('共' + data.total + '条,' + obj.pages + '页,当前第' + obj.curr + '页');
//                    if (!first) { //点击跳页触发函数自身，并传递当前页：obj.curr
//                        loadData(obj.curr);
//                    }
//                }
//            });
//        });
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
            $(tdList[k++]).html(obj.bizCheckDetail.planBatchName);
            $(tdList[k++]).html(obj.bizStore.provinceName);
            $(tdList[k++]).html(obj.bizStore.cityName);
            $(tdList[k++]).html(obj.bizStore.channelName);
            $(tdList[k++]).html(obj.bizStore.companyName);
            $(tdList[k++]).html(obj.bizStore.storeName);
            $(tdList[k++]).html(obj.bizStore.platformName);
            $(tdList[k++]).html(obj.bizStore.addressDetail);
            $(tdList[k++]).html(obj.bizStore.channelManagerName);
            $(tdList[k++]).html(obj.bizStore.channelManagerPhone);
            $(tdList[k++]).html(obj.bizCheckDetail.checkUserName);
            $(tdList[k++]).html(obj.bizCheckDetail.checkTime);
            $(tdList[k++]).html(obj.bizCheckDetail.checkLongitude);
            $(tdList[k++]).html(obj.bizCheckDetail.checkLatitude);
            $(tdList[k++]).html(obj.bizCheckDetail.storeExistsok);
            $(tdList[k++]).html(obj.bizCheckDetail.storeRealnameok);
            $(tdList[k++]).html(obj.bizCheckDetail.storeCheckProvinceName);
            $(tdList[k++]).html(obj.bizCheckDetail.storeCheckCityName);
            $(tdList[k++]).html(obj.bizCheckDetail.storeAddress);
            $(tdList[k++]).html(checkRegionMap(obj.bizCheckDetail.storeRegiontype));
            $(tdList[k++]).html(checkMendianMap(obj.bizCheckDetail.storeMendiantype));
            $(tdList[k++]).html(checkYtsqMap(obj.bizCheckDetail.storeYtsqtype));
            $(tdList[k++]).html(checkAreaMap(obj.bizCheckDetail.storeAreatype));
            $(tdList[k++]).html(checkMembersMap(obj.bizCheckDetail.storeMemberstype));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeNmonthChangeok));
            $(tdList[k++]).html(obj.bizCheckDetail.storeBusyUsercount);
            $(tdList[k++]).html(obj.bizCheckDetail.storeFreeUsercount);
            $(tdList[k++]).html(checkScopMap(obj.bizCheckDetail.storeMemberBusscope));
            $(tdList[k++]).html(checkScopMap(obj.bizCheckDetail.storeMemberTaocanScope));
            $(tdList[k++]).html(checkScopMap(obj.bizCheckDetail.storeMemberTerminalPolicy));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeMemeberActivesellok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.store4gok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeAllnetok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeFirstRecdTerminal));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeHealthok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeConductok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeDonglineok));
            $(tdList[k++]).html(checkLiangMap(obj.bizCheckDetail.storeMonthSalecount));
            $(tdList[k++]).html(checkLiangMap(obj.bizCheckDetail.storeDifExpandability));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeDoortouok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeDengxiangok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeBrandok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeQrcode));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeRealnameNoticeok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeBackwall));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeBartie));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqOppok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqJinliok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqVivook));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqHuaweiok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqSamsongok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqAppleok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZqMeizuok));
            $(tdList[k++]).html(checkOkMap(obj.bizCheckDetail.storeZq2g3gok));
            $(tdList[k++]).html(obj.bizCheckDetail.storeKccheckOutcount);
            $(tdList[k++]).html(obj.bizCheckDetail.storeKccheckSelfcount);
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