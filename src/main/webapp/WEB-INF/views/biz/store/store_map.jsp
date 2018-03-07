<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>GIS-店面分布</title>
    <%@ include file="/WEB-INF/views/ywinclude.jsp" %>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.4&key=702af4761943e6d922af67591128c064"></script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: "华文中宋";
            background-color: #EEEEEE;
        }

        .first {
            margin-top:4px;
            height: 6%;
                /*max-height: 40px;*/
            width: 100%;
            overflow-y: auto;
        }

        .second {
            height: 94%;
            width: 100%;
        }

        .right {
            float: right;
            height: 100%;
            width: 100%;
        }

        .map{
            border: 1px solid #bbb;
        }


        select {
            width: 80px;
        }

        label {
            color: #CF4646;
            font-size: 11px;
            font-weight: bold;
        }

        li {
            list-style: none;
            border-bottom: solid 1px #cccccc;
            padding-left: 6px;
            padding-bottom: 6px;
            padding-top: 2px;
        }
        #detailDiv li{
            list-style: none;
            border-bottom: solid 1px #cccccc;
            padding-bottom: 1px;
            padding-top: 2px;
        }

        .listBtn {
            font-size: 12px;
        }
        .layerList{
            font-size: 12px;
        }

    </style>
    <script type="text/javascript">
        $(function () {


        });
    </script>
</head>
<body>
<div class="first">

    <div class="right right-con">
        <div class="selectConditionDiv">
            <!--条件区域-->
            <form class="form-inline" id="searchForm" method="get" action="../data/allDataWithCds">
                <li>
                    <div class="form-group">
                        <label for="xdPhone">巡店人员(手机号)</label>
                        <input type="text" class="form-control input-sm" id="xdPhone" name="xdPhone" value="" style="width: 100px">
                    </div>&nbsp;

                    <div class="form-group">
                        <label for="batch">批次</label>
                        <select id="batch" class="form-control input-sm" name="batch">
                            <option value="0">全部</option>
                            <option value="1">1批次</option>
                            <option value="2">2批次</option>
                            <option value="3">3批次</option>
                        </select>
                    </div>
                    <%--&nbsp;--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="grid">网格</label>--%>
                        <%--<select id="grid" class="form-control input-sm" name="grid" style="width: 70px;">--%>
                            <%--<option value="all">全部</option>--%>
                            <%--<option value="未知">未知</option>--%>
                                <%--<option value="成华区青龙综合网格">成华区青龙综合网格</option>--%>
                                <%--<option value="成华区新鸿综合网格">成华区新鸿综合网格</option>--%>
                                <%--<option value="崇州市综合网格">崇州市综合网格</option>--%>
                        <%--</select>--%>
                    <%--</div>--%>
                    <%--&nbsp;--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="city">地市</label>--%>
                        <%--<select id="city" class="form-control input-sm" name="city">--%>
                            <%--<option value="all">全部</option>--%>
                                <%--<option value="乐山">乐山</option>--%>
                                <%--<option value="内江">内江</option>--%>
                                <%--<option value="凉山">凉山</option>--%>
                        <%--</select>--%>
                    <%--</div>--%>
                    &nbsp;
                    <div class="form-group">
                        <label for="startTime">时间段</label>
                        <input type="text" class="form-control input-sm" id="startTime" name="startTime" onClick="WdatePicker()" readonly style="width: 110px; cursor: pointer">
                        -
                        <input type="text" class="form-control input-sm" id="endTime" name="endTime" onClick="WdatePicker()" readonly style="width: 110px; cursor: pointer">
                    </div>
                    <div class="form-group">
                        <a id="searchBtn" class="btn btn-danger btn-sm">查询</a>
                    </div>
                </li>
            </form>
        </div>
    </div>
</div>
<div class="second">
    <div id="container" class="right map" tabindex="0"></div>
</div>
</body>
</html>
<script type="text/javascript">

    var url = "${staticPath}/store/map/query";

    //颜色数组
    var colors=["#FF2D2D","#600000","#900041","#FF359A","#460046","#930093","#FF00FF",
        "#3A006F","#8600FF","#CA8EFF","#000093","#4A4AFF","#0072E3","#003E3E","#00CACA","#006030",
        "#02F78E","#00BB00","#53FF53","#FFFF37","#977C00","#FFD306","#9F5000","#FF9225","#A23400",
        "#5151A2","#3D7878","#616130","#AD5A5A"];

    var map = new AMap.Map('container',{
        resizeEnable: true,
        zoom: 10,
        center: [116.480983, 40.0958]
    });

    $("#searchBtn").bind("click", function () {
        var index = layer.load(0, {shade: [0.1, '#fff']});
        $.ajax({
            cache: true,
            type: "POST",
            dataType: 'json',
            contentType:"application/json",
            url: url,//xd.169ol.com:8090/WeChatTest
            data: JSON.stringify({}),//$('#searchForm').serialize(),// 你的formid
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.close(index);
            },
            success: function (data) {
                console.info(data)

                layer.close(index);
                for(let i = 0; i < data.length; i++){
                    let point = data[i];
                    let marker = new AMap.Marker({
                        position: [point.longitude, point.latitude],//marker所在的位置
                        map:map//创建时直接赋予map属性
                    });
                }
            }
        });
    })

</script>
