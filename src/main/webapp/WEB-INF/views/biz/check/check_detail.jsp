<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String ctx = request.getContextPath();
    request.setAttribute("ctx", ctx);

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>巡店人员编辑</title>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .wrapper {
            width: 70%;
            padding: 100px 0;
            margin: 40px auto;
            background: #efefef;
            border: 1px solid #bbb;
            border-radius: 4px;
        }

        .line-box {
            width: 100%;
            padding: 10px 20px;
            margin: 0 auto;
            box-sizing: border-box;
            /*background: pink;*/
        }

        .item-div {
            width: 48%;
            display: inline-block;
        }

        .item-left {
            text-align: right;
        }

        .item-div label {
            display: inline-block;
            width: 80px;
            text-align: right;
            /*background: paleturquoise;*/
        }

        .item-div div {
            display: inline-block;
            width: 160px;
            text-align: left;
            /*background: bisque;*/
        }
    </style>
</head>
<body>
<div id="wrapper" class="wrapper"></div>

<div id="tempLine" style="display: none">
    <div class="line-box">
        <div class="item-div item-left">
            <label name="title0"></label>
            <div name="content0"></div>
        </div>
        <div class="item-div item-right">
            <label name="title1"></label>
            <div name="content1"></div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/javascript">

    var keyAndValueList = [
        {title: "计划批次", key: "bizCheckDetail.planBatchName", map: ""},
        {title: "省份", key: "bizStore.provinceName", map: ""},
        {title: "城市", key: "bizStore.cityName", map: ""},
        {title: "4", key: "bizStore.channelName", map: ""},
        {title: "5", key: "bizStore.companyName", map: ""},
        {title: "6", key: "bizStore.storeName", map: ""},
        {title: "7", key: "bizStore.platformName", map: ""},
        {title: "8", key: "bizStore.addressDetail", map: ""},
        {title: "9", key: "bizStore.channelManagerName", map: ""},
        {title: "0", key: "bizStore.channelManagerPhone", map: ""},
        {title: "11", key: "bizCheckDetail.checkUserName", map: ""},
        {title: "12", key: "bizCheckDetail.checkTime", map: ""},
        {title: "13", key: "bizCheckDetail.checkLongitude", map: ""},
        {title: "", key: "bizCheckDetail.checkLatitude", map: ""},
        {title: "", key: "bizCheckDetail.storeExistsok", map: ""},
        {title: "", key: "bizCheckDetail.storeRealnameok", map: ""},
        {title: "", key: "bizCheckDetail.storeCheckProvinceName", map: ""},
        {title: "", key: "bizCheckDetail.storeCheckCityName", map: ""},
        {title: "", key: "bizCheckDetail.storeAddress", map: ""},
        {title: "", key: "bizCheckDetail.storeRegiontype", map: "checkRegionMap"},
        {title: "", key: "bizCheckDetail.storeMendiantype", map: "checkMendianMap"},
        {title: "", key: "bizCheckDetail.storeYtsqtype", map: "checkYtsqMap"},
        {title: "", key: "bizCheckDetail.storeAreatype", map: "checkAreaMap"},
        {title: "", key: "bizCheckDetail.storeMemberstype", map: "checkMembersMap"},
        {title: "", key: "bizCheckDetail.storeNmonthChangeok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeBusyUsercount", map: ""},
        {title: "", key: "bizCheckDetail.storeFreeUsercount", map: ""},
        {title: "", key: "bizCheckDetail.storeMemberBusscope", map: "checkScopMap"},
        {title: "", key: "bizCheckDetail.storeMemberTaocanScope", map: "checkScopMap"},
        {title: "", key: "bizCheckDetail.storeMemberTerminalPolicy", map: "checkScopMap"},
        {title: "", key: "bizCheckDetail.storeMemeberActivesellok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.store4gok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeAllnetok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeFirstRecdTerminal", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeHealthok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeConductok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeDonglineok", map: "checkOkMap"},
        {title: "", key: "bizCheckDetail.storeMonthSalecount", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeDifExpandability", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeDoortouok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeDengxiangok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeBrandok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeQrcode", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeRealnameNoticeok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeBackwall", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeBartie", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqOppok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqJinliok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqVivook", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqHuaweiok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqSamsongok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqAppleok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZqMeizuok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeZq2g3gok", map: "checkLiangMap"},
        {title: "", key: "bizCheckDetail.storeKccheckOutcount", map: ""},
        {title: "", key: "bizCheckDetail.storeKccheckSelfcount", map: ""}
    ]

    function backgo() {
        window.location.href = "import/toXuserList";
    }

    $(function () {
        getCheckDetail();
    });

    function getCheckDetail() {
        var id = "${id}";
        $.ajax({
            type: "get",
            url: "check/detail/query/" + id,
            cache: false,
            async: true,
            dataType: "json",
            success: function (data) {
                console.info(data);
                var tempLineStr = $("#tempLine").html();
                var wrapper = $("#wrapper");
                var $tempLine = null;
                for (var i = 0; i < keyAndValueList.length; i++) {
                    var obj = keyAndValueList[i];
                    var n = i % 2;
                    if (n == 0) {
                        $tempLine = $(tempLineStr);
                        wrapper.append($tempLine);
                    }
                    $tempLine.find("[name='title"+n+"']").html(obj.title);
                    var arr = obj.key.split(".");
                    $tempLine.find("[name='content"+n+"']").html(data[arr[0]][arr[1]]);
                }
            },
            error: function () {
                alert("operation failed!");
            }
        });
    }


</script>
</body>
</html>