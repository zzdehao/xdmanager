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
    <script type="text/javascript" src="script/biz/checkCode.js"></script>
    <STYLE type="text/css">
        .queryItemBox{
            display: inline-block;
            width: 380px;
            text-align: right;
            margin: 4px;
        }

        #otherQuery{
            text-align: left;
        }
    </STYLE>
</head>
<body>
<div class="pd-20">
    <div class="text-c mb-10" id="app">
        <form id="form" action="<%=request.getContextPath()%>/check/export">
            <div id="otherQuery">
                <div class="queryItemBox">
                    <label for="batchId">批次：</label>
                    <div class="select-box" style="width: 160px;">
                        <select id="batchId" name="batchId" class="select">
                            <option value="">全部</option>
                        </select>
                    </div>
                </div><div class="queryItemBox">
                    <label for="channelCode">渠道类型：</label>
                    <div class="select-box" style="width: 160px;">
                        <select id="channelCode" name="channelCode" class="select">
                            <option value="">全部</option>
                            <option value="31">自有渠道</option>
                            <option value="32">社会渠道</option>
                            <option value="33">小微渠道</option>
                        </select>
                    </div>
                </div><div class="queryItemBox">
                    <label for="storeName">店铺名称：</label>
                    <input type="text" placeholder="店铺名称" id="storeName" name="storeName" class="input-text"
                           style="width:160px;">
                </div><div class="queryItemBox">
                    <label for="checkUserName">检查人：</label>
                    <input type="text" placeholder="巡检人" id="checkUserName" name="checkUserName" class="input-text"
                           style="width:160px;">
                </div><div class="queryItemBox">
                    <label for="provinceCode">省份：</label>
                    <div class="select-box" style="width: 160px;">
                        <select id="provinceCode" name="provinceCode" class="select">
                            <option value="">全部</option>
                        </select>
                    </div>
                </div><div class="queryItemBox">
                    <label for="cityCode">城市：</label>
                    <div class="select-box" style="width: 160px;">
                        <select id="cityCode" name="cityCode" class="select">
                            <option value="">全部</option>
                        </select>
                    </div>
                </div><div class="queryItemBox">
                    <label for="startTime">开始时间：</label>
                    <input type="text" placeholder="开始时间" id="startTime" name="startTime" class="input-text"
                           onClick="WdatePicker()" readonly style="width:160px; cursor: pointer">
                </div><div class="queryItemBox">
                    <label for="endTime">结束时间：</label>
                    <input type="text" placeholder="结束时间" id="endTime" name="endTime" class="input-text"
                           onClick="WdatePicker()" readonly style="width:160px; cursor: pointer">
                </div></div>

            <button type="button" class="btn btn-success" id="search" name="" onclick="loadData(1) ;">
                <i class="Hui-iconfont">&#xe665;</i>查询
            </button>
            <a href="javascript:;" id="report" class="btn btn-success radius">
                <i class="Hui-iconfont">&#xe665;</i>导出EXCEL
            </a>
        </form>
    </div>
    <div style="overflow:auto; width:100%; height:100%;">
        <table class="table table-border table-bordered table-bg" width="100%">
            <thead>
            <tr>
                <th scope="col" colspan="57">巡店记录查询</th>
            </tr>
            <tr id="queryTitle" class="text-c">
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
                <th width="120" nowrap keyName="storeExistsok" queryMap="okMap">店铺是否存在</th>
                <th width="120" nowrap keyName="storeRealnameok" queryMap="okMap">店铺实际名称是否相符</th>
                <th width="120" nowrap>店铺实际巡查地址省</th>
                <th width="120" nowrap>店铺实际巡查地址城市</th>
                <th width="120" nowrap>店铺实际巡查地址</th>
                <th width="120" nowrap keyName="storeRegiontype" queryMap="regionMap">店铺地域类型</th>
                <th width="120" nowrap keyName="storeMendiantype" queryMap="mendianMap">店铺门店类型</th>
                <th width="120" nowrap keyName="storeYtsqtype" queryMap="ytsqMap">店铺类型业态商圈</th>
                <th width="120" nowrap keyName="storeAreatype" queryMap="areaMap">店铺面积类型</th>
                <th width="120" nowrap keyName="storeMemberstype" queryMap="membersMap">店铺人员规模</th>
                <th width="120" nowrap keyName="storeNmonthChangeok" queryMap="okMap">近一个月是否变更</th>
                <th width="120" nowrap>忙时人数</th>
                <th width="120" nowrap>闲时人数</th>
                <th width="120" nowrap keyName="storeMemberBusscope" queryMap="scopMap">营业员受理业务程度</th>
                <th width="120" nowrap keyName="storeMemberTaocanScope" queryMap="scopMap">营业员对内部套餐策略数量程度</th>
                <th width="120" nowrap keyName="storeMemberTerminalPolicy" queryMap="scopMap">终端营销策略数量</th>
                <th width="120" nowrap keyName="storeMemeberActivesellok" queryMap="okMap">对客户是否主动营销</th>
                <th width="120" nowrap keyName="store4gok" queryMap="okMap">是否推出4g</th>
                <th width="120" nowrap keyName="storeAllnetok" queryMap="okMap">是否推出全网通</th>
                <th width="120" nowrap keyName="storeFirstRecdTerminal" queryMap="okMap">是否主推机型</th>
                <th width="120" nowrap keyName="storeHealthok" queryMap="okMap">是否干净卫生</th>
                <th width="120" nowrap keyName="storeConductok" queryMap="okMap">宣传是否合规</th>
                <th width="120" nowrap keyName="storeDonglineok" queryMap="okMap">店内动线是否设计合规</th>
                <th width="120" nowrap keyName="storeMonthSalecount" queryMap="liangMap">月销售终端数量</th>
                <th width="120" nowrap keyName="storeDifExpandability" queryMap="liangMap">异网发展能力</th>
                <th width="120" nowrap keyName="storeDoortouok" queryMap="okMap">是否联通门头</th>
                <th width="120" nowrap keyName="storeDengxiangok" queryMap="okMap">是否联通灯箱</th>
                <th width="120" nowrap keyName="storeBrandok" queryMap="okMap">是否联通标牌</th>
                <th width="120" nowrap keyName="storeQrcode" queryMap="okMap">是否联通二维码</th>
                <th width="120" nowrap keyName="storeRealnameNoticeok" queryMap="okMap">是否有实名制公告</th>
                <th width="120" nowrap keyName="storeBackwall" queryMap="okMap">是否联通背景墙</th>
                <th width="120" nowrap keyName="storeBartie" queryMap="okMap">是否联通柜台贴</th>
                <th width="120" nowrap keyName="storeZqOppok" queryMap="okMap">是否opp专区</th>
                <th width="120" nowrap keyName="storeZqJinliok" queryMap="okMap">是否有金立专柜</th>
                <th width="120" nowrap keyName="storeZqVivook" queryMap="okMap">是否vivo专柜</th>
                <th width="120" nowrap keyName="storeZqHuaweiok" queryMap="okMap">是否为华为专柜</th>
                <th width="120" nowrap keyName="storeZqSamsongok" queryMap="okMap">是否三星专柜</th>
                <th width="120" nowrap keyName="storeZqAppleok" queryMap="okMap">是否苹果专柜</th>
                <th width="120" nowrap keyName="storeZqMeizuok" queryMap="okMap">是否魅族</th>
                <th width="120" nowrap keyName="storeZq2g3gok" queryMap="okMap">是否2g,3g专柜</th>
                <th width="120" nowrap>社会机型库存数量</th>
                <th width="120" nowrap>自由机型库存数量</th>
                <th width="146" nowrap>操作</th>
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
        <tr class="text-c">
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
            <td class="td-manage">
                <input name="goDetail" class="btn btn-success size-S radius" type="button" value="详情"/>
            </td>
        </tr>
    </table>
</div>
<div id="tempQuery" style="display: none">
    <div class="queryItemBox">
        <div class="select-box" style="width: 160px;">
            <select class="select">
                <option value="">全部</option>
            </select>
        </div>
    </div>
</div>
<script type="text/javascript">

    function loadData(page) {
        var limit = 20;
        page = page || 1;
        var offset = (page - 1) * limit;
        var index = parent.layer.load();
        var queryData = {};
        var $items = $("#form").find("select,input");
        for(var i = 0; i < $items.size(); i++){
            var item = $($items.get(i));
            if(item.val() == null || $.trim(item.val()) == ""){
                continue;
            }
            queryData[item.attr("name")] = item.val();
        }
        console.info(queryData);
        $.ajax({
            url: 'check/list/query',
            method: 'GET',
            cache: false,
            dataType: 'json',
            headers: {
                'limit': limit,
                'offset': offset
            },
            data:queryData
        }).done(function (data) {
            let list = data.rows;
            parent.layer.close(index);
            buildTR(list);
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

    function buildTR(list) {
        var $listBox = $("#xuser-list");
        $listBox.empty();
        if(!list){
            return;
        }
        var html = $("#temp").find("tbody").html();
        for (var i = 0; i < list.length; i++) {
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
            $(tdList[k++]).find("[name='goDetail']").click(function(){
                window.location.href = "check/detail/page/" + obj.bizCheckDetail.id;
            });
            $listBox.append($tr);
        }
    }

    $(function () {
        $('.radio-box input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        loadData(1);
        $("#report").click(function () {
            var $form = $("#form");
            var times = "?v=" + new Date().getTime();
            $("#form").attr("action", "check/export" + times);
            $form.attr("target", "reportExcel");
            $form.submit();
        });
        buildQuery();
        loadP('${admin.provinceCode}');
        loadC('${admin.cityCode}','${admin.provinceCode}');
        $("#provinceCode").change(function(){
            var pcode = $("#provinceCode").val();
            //$("#cityCode").empty();
            loadC('',pcode);
        });
        getBatch();
    });

    function buildQuery() {
        var $ths = $("#queryTitle").find("th");
        var queryStr = $("#tempQuery").html();
        for (var i = 0; i < $ths.size(); i++) {
            var $th = $($ths.get(i));
            var queryMapKey = $th.attr("queryMap");
            if (queryMapKey != null && queryMapKey != "") {
                var $query = $(queryStr);
                var $select = $query.find("select");
                $select.attr("name", $th.attr("keyName"));
                $query.prepend("<label>" + $th.html() + "：</label>");
                var map = checkMap[queryMapKey];
                for (var p in map) {
                    var $option = $("<option></option>");
                    $option.val(p);
                    $option.text(map[p]);
                    $select.append($option);
                }
                $("#otherQuery").append($query);
            }
        }
    }

    function loadP(provinceCode) {
        if(provinceCode=='all'){
            return;
        }
        $.ajax({
            type : "get",
            url : "yewu/province/getProvince",
            cache : false,
            async : true,
            data:{code:''},
            dataType : "json",
            success : function(datas) {
                if (datas.length > 0) {
                    for ( var i = 0; i < datas.length; i++) {
                        var code = datas[i].code;
                        var name=datas[i].name;
                        if(provinceCode) {
                            if(code==provinceCode) {
                                $("#provinceCode").append("<option value=" + code + " selected>" + name + "</option>");
                            }else{
                                $("#provinceCode").append("<option value=" + code + ">" + name + "</option>");
                            }
                        }else{
                            $("#provinceCode").append("<option value=" + code + ">" + name + "</option>");
                        }
                    }
                }
            },
            error : function() {
                alert("operation failed!");
            }
        });
    }
    function loadC(cityCode,provinceCode) {
        if(!provinceCode){
            return;
        }
        if(provinceCode=='all'){
            return;
        }
        $.ajax({
            type : "get",
            url : "yewu/province/getCity",
            cache : false,
            async : true,
            data:{provinceCode:provinceCode},
            dataType : "json",
            success : function(datas) {
                if (datas.length > 0) {
                    $("#cityCode").empty();
                    $("#cityCode").append("<option value=''>全部</option>");
                    for ( var i = 0; i < datas.length; i++) {
                        var code = datas[i].code;
                        var name=datas[i].name;
                        if(provinceCode!='') {
                            if(code==cityCode) {
                                $("#cityCode").append("<option value=" + code + " selected>" + name + "</option>");
                            }else{
                                $("#cityCode").append("<option value=" + code + ">" + name + "</option>");
                            }
                        }else{
                            $("#cityCode").append("<option value=" + code + ">" + name + "</option>");
                        }
                    }
                }
            },
            error : function() {
                alert("operation failed!");
            }
        });
    }
    var batchUrl = "common/batch/list?typeList=31,32,33";
    function getBatch(){
        $.get(batchUrl, function(data){
            console.info(data)
            let $batch = $("#batchId");
            data.forEach(function(batch){
                let $option = $("<option></option>");
                $option.val(batch.id);
                $option.text(batch.batchName);
                $batch.append($option);
            })
        });
    }


</script>
<iframe id="reportExcel" name="reportExcel" width="0" height="0"></iframe>
</body>
</html>