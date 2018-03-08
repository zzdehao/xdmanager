<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>GIS-巡店轨迹</title>
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
                            <option value="">全部</option>
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

    var queryUrl = "${staticPath}/check/route/query";
    var batchUrl = "${staticPath}/common/batch?typeList=11";

    $(function(){
        init();
    });

    function init(){
        $.get(batchUrl, function(data){
            console.info(data)
            let batch11 = data["11"];
            let $batch = $("#batch");
            for(let i = 0; i < batch11.length; i++){
                let $option = $("<option></option>");
                $option.val(batch11[i].id);
                $option.text(batch11[i].batchName);
                $batch.append($option);
            }
        });
    }


    var map = new AMap.Map('container',{
        resizeEnable: true,
        zoom: 10
    });


    /***************************************
     由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
     ***************************************/
    var map, geolocation;
    //加载地图，调用浏览器定位服务
    map = new AMap.Map('container', {
        resizeEnable: true,
        zoom: 10
    });

    map.plugin('AMap.Geolocation', function() {
        geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            //zoomToAccuracy: true,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            buttonPosition:'RB'
        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition();
    });


    // map.plugin('AMap.Geolocation', function () {
    //     geolocation = new AMap.Geolocation({
    //         enableHighAccuracy: true,//是否使用高精度定位，默认:true
    //         timeout: 10000,          //超过10秒后停止定位，默认：无穷大
    //         maximumAge: 0,           //定位结果缓存0毫秒，默认：0
    //         convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
    //         showButton: true,        //显示定位按钮，默认：true
    //         buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
    //         buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
    //         showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
    //         showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
    //         panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
    //         zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
    //     });
    //     map.addControl(geolocation);
    //     geolocation.getCurrentPosition();
    //     //AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
    //     //AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
    // });

    //颜色数组
    var colors=["#FF2D2D","#600000","#900041","#FF359A","#460046","#930093","#FF00FF",
        "#3A006F","#8600FF","#CA8EFF","#000093","#4A4AFF","#0072E3","#003E3E","#00CACA","#006030",
        "#02F78E","#00BB00","#53FF53","#FFFF37","#977C00","#FFD306","#9F5000","#FF9225","#A23400",
        "#5151A2","#3D7878","#616130","#AD5A5A"];

    $("#searchBtn").bind("click", function () {

        var index = layer.load(0, {shade: [0.1, '#fff']});

        $.ajax({
            cache: true,
            type: "POST",
            dataType: 'json',
            contentType:"application/json",
            url: queryUrl,//xd.169ol.com:8090/WeChatTest
            data: JSON.stringify({}),//$('#searchForm').serialize(),// 你的formid
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.close(index);
            },
            success: function (data) {
                console.info(data)
                //var data = [[{checkLongitude:116.399, checkLatitude:39.910},{checkLongitude:116.405, checkLatitude:39.920}]];
                layer.close(index);
                for(let i = 0; i < data.length; i++){
                    let line = data[i];
                    let lineArr = new Array();
                    for(let k = 0; k < line.length; k++){
                        let point = line[k];
                        let p = [point.checkLongitude, point.checkLatitude];
                        let marker = new AMap.Marker({
                            position: p,//marker所在的位置
                            map:map//创建时直接赋予map属性
                        });
                        lineArr.push(p);
                    }

                    var polyline = new AMap.Polyline({
                        path: lineArr,          //设置线覆盖物路径
                        strokeColor: colors[i], //线颜色
                        strokeOpacity: 1,       //线透明度
                        strokeWeight: 5,        //线宽
                        strokeStyle: "solid",   //线样式
                        strokeDasharray: [10, 5] //补充线样式
                    });
                    polyline.setMap(map);
                }
            }
        });
    })

</script>
