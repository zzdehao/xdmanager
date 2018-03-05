<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="images/icon1.png">
    <title>GIS-巡店数据</title>
    <%@ include file="../ywinclude.jsp" %>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=VN0SG164b04AZFb2BBmpbgKI8Uh5i11O"></script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: 华文中宋;
            background-color: #EEEEEE;
        }

        .left {
            float: left;
            height: 100%;
            width: 12%;
            border-right-color: #CF4646;
        }

        .first {
            height: 12%;
            width: 100%;
            overflow-y: auto;
        }

        .second {
            height: 88%;
            width: 100%;
        }

        .right {
            float: right;
            height: 100%;
            width: 88%;
        }

        .right_bottom {
            height: 100%;
            width: 100%;
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
            padding-bottom: 2px;
            padding-top: 2px;
        }

        #detailDiv li {
            list-style: none;
            border-bottom: solid 1px #cccccc;
            padding-bottom: 1px;
            padding-top: 2px;
        }

        .baseLi {
            height: 33px;
            border: none;
        }

        .listBtn {
            font-size: 12px;
        }

        #layerList {
            width: 100%;
            padding-top: 30px;
        }
        .bttn {
            background-color: #CF4646;
            color: #FFFFFF;
            border: none;
            width: 80%;
            height: 30px;
            border-bottom: solid rgba(200,199,196,0.98);
        }

    </style>
    <script type="text/javascript">
        $(function () {
            //日期选择
            var start = {
                skinCell: "jedatered",                       //风格颜色
                format: "YYYY年MM月DD日",                        //格式
                minDate: "1900-01-01 00:00:00",              //最小日期
                maxDate: $.nowDate({DD: 0}),              //最大日期
                fixed: true,         //是否静止定位，为true时定位在输入框，为false时居中定位
                isinitVal: true,                            //是否初始化时间，默认不初始化时间
                zIndex: 2099,                                //弹出层的层级高度
                language: {                                  //多语言设置
                    name: "cn",
                    month: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
                    weeks: ["日", "一", "二", "三", "四", "五", "六"],
                    times: ["小时", "分钟", "秒数"],
                    clear: "清空",
                    today: "今天",
                    yes: "确定",
                    close: "关闭"
                },
                isToday: false,
                choosefun: function (elem, val, date) {
                    end.minDate = date; //开始日选好后，重置结束日的最小日期
                    endDates();
                }
            };
            var end = {
                skinCell: "jedatered",                       //风格颜色
                format: "YYYY年MM月DD日",                        //格式
                minDate: $.nowDate({DD: 0}),              //最小日期
                maxDate: "2099-12-31 12:59:59",              //最大日期
                fixed: true,         //是否静止定位，为true时定位在输入框，为false时居中定位
                isinitVal: true,                            //是否初始化时间，默认不初始化时间
                zIndex: 2099,                                //弹出层的层级高度
                language: {                                  //多语言设置
                    name: "cn",
                    month: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
                    weeks: ["日", "一", "二", "三", "四", "五", "六"],
                    times: ["小时", "分钟", "秒数"],
                    clear: "清空",
                    today: "今天",
                    yes: "确定",
                    close: "关闭"
                },
                isToday: false,
                choosefun: function (elem, val, date) {
                    start.maxDate = date; //将结束日的初始值设定为开始日的最大日期
                }
            };
            $("#startTime").jeDate(start);
            $("#endTime").jeDate(end);
        });
    </script>
</head>
<body>
<div class="left">
    <li class="baseLi">
        <div class="form-group">
            <select id="classOfShape" class="form-control input-sm" style="margin-bottom: 0px;">
                <option value="BMAP_POINT_SHAPE_CIRCLE">选择形状</option>
                <option value="BMAP_POINT_SHAPE_CIRCLE">圆形</option>
                <option value="BMAP_POINT_SHAPE_STAR">五星</option>
                <option value="BMAP_POINT_SHAPE_SQUARE">方形</option>
                <option value="BMAP_POINT_SHAPE_RHOMBUS">菱形</option>
                <option value="BMAP_POINT_SHAPE_WATERDROP">水滴</option>
            </select>
        </div>
    </li>
    <li class="baseLi">
        <div class="form-group">
            <select id="sizeChoice" class="form-control input-sm">
                <option value="BMAP_POINT_SIZE_HUGE">超大</option>
                <option value="BMAP_POINT_SIZE_BIGGER">很大</option>
                <option value="BMAP_POINT_SIZE_BIG">大</option>
                <option value="BMAP_POINT_SIZE_NORMAL">正常</option>
                <option value="BMAP_POINT_SIZE_SMALL">小</option>
                <option value="BMAP_POINT_SIZE_SMALLER">很小</option>
                <option value="BMAP_POINT_SIZE_TINY">超小</option>
            </select>
        </div>
    </li>
    <li class="baseLi">
        <div class="form-group">
            <select id="colorChoice" class="form-control input-sm">
                <option value="#000000">选择颜色</option>
                <option value="#000000" style="background-color: #000000">黑色</option>
                <option value="#ADADAD" style="background-color: #ADADAD">灰色</option>
                <option value="#FFFFFF" style="background-color: #FFFFFF">白色</option>
                <option value="#FF0000" style="background-color: #FF0000">红色</option>
                <option value="#00FF00" style="background-color: #00FF00">绿色</option>
                <option value="#0000FF" style="background-color: #0000FF">蓝色</option>
                <option value="#FA8C34" style="background-color: #FA8C34">橙色</option>
                <option value="#FFF143" style="background-color: #FFF143">鹅黄</option>
                <option value="#FFA631" style="background-color: #FFA631">杏黄</option>
                <option value="#9ED900" style="background-color: #9ED900">葱绿</option>
                <option value="#0EB83A" style="background-color: #0EB83A">葱青</option>
                <option value="#0000FF" style="background-color: #0000FF">蓝色</option>
                <option value="#930093" style="background-color: #930093">紫色</option>
            </select>
        </div>
    </li>
    <li class="baseLi">
        <div class="form-group">
            <select id="xzCity" class="form-control input-sm">
                
                    
                        <option value="510100000000">成都市</option>
                    
                        <option value="510300000000">自贡市</option>
                    
                        <option value="510400000000">攀枝花市</option>
                    
                        <option value="510500000000">泸州市</option>
                    
                        <option value="510600000000">德阳市</option>
                    
                        <option value="510700000000">绵阳市</option>
                    
                        <option value="510800000000">广元市</option>
                    
                        <option value="510900000000">遂宁市</option>
                    
                        <option value="511000000000">内江市</option>
                    
                        <option value="511100000000">乐山市</option>
                    
                        <option value="511300000000">南充市</option>
                    
                        <option value="511400000000">眉山市</option>
                    
                        <option value="511500000000">宜宾市</option>
                    
                        <option value="511600000000">广安市</option>
                    
                        <option value="511700000000">达州市</option>
                    
                        <option value="511800000000">雅安市</option>
                    
                        <option value="511900000000">巴中市</option>
                    
                        <option value="512000000000">资阳市</option>
                    
                        <option value="513200000000">阿坝藏族羌族自治州</option>
                    
                        <option value="513300000000">甘孜藏族自治州</option>
                    
                        <option value="513400000000">凉山彝族自治州</option>
                    
                
            </select>
            <input id="getXzArea" type="button" class="bttn" value="获取行政区域">
        </div>
    </li>
    <div class="left" id="layerList" style="overflow-y: auto">

    </div>
</div>
<div class="right right-con">
    <div class="first">
        <div class="selectConditionDiv">
            <!--条件区域-->
            <form class="form-inline" id="searchForm" method="get" action="../data/allDataWithCds">
                <li>
                    <div class="form-group">
                        <label for="storeId">店铺ID</label>
                        <input type="text" class="form-control input-sm" id="storeId"
                               name="storeId" style="width: 60px;">
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="storeNumber">渠道编码</label>
                        <input type="text" class="form-control" id="storeNumber" name="storeNumber"
                               style="width: 60px;">
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="storeName">店铺名称</label>
                        <input type="text" class="form-control input-sm" id="storeName" name="storeName"
                               style="width: 100px">
                    </div>&nbsp;
                    <div class="form-group">
                        <label for="xdPhone">巡店人员(手机号)</label>
                        <input type="text" class="form-control input-sm" id="xdPhone" name="xdPhone"
                               style="width: 95px">
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
                    &nbsp;
                    <div class="form-group">
                        <label for="grid">网格</label>
                        <select id="grid" class="form-control input-sm" name="grid" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="未知">未知</option>
                            
                                
                                    <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                                
                                    <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                                
                                    <option value="崇州市综合网格">崇州市综合网格</option>
                                
                                    <option value="大邑县综合网格">大邑县综合网格</option>
                                
                                    <option value="都江堰市综合网格">都江堰市综合网格</option>
                                
                                    <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                                
                                    <option value="高新区西综合网格">高新区西综合网格</option>
                                
                                    <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                                
                                    <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                                
                                    <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                                
                                    <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                                
                                    <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                                
                                    <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                                
                                    <option value="金堂县综合网格">金堂县综合网格</option>
                                
                                    <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                                
                                    <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                                
                                    <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                                
                                    <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                                
                                    <option value="彭州市综合网格">彭州市综合网格</option>
                                
                                    <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                                
                                    <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                                
                                    <option value="蒲江县综合网格">蒲江县综合网格</option>
                                
                                    <option value="青白江区综合网格">青白江区综合网格</option>
                                
                                    <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                                
                                    <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                                
                                    <option value="邛崃市综合网格">邛崃市综合网格</option>
                                
                                    <option value="双流区城区综合网格">双流区城区综合网格</option>
                                
                                    <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                                
                                    <option value="天府新区综合网格">天府新区综合网格</option>
                                
                                    <option value="温江区综合网格">温江区综合网格</option>
                                
                                    <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                                
                                    <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                                
                                    <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                                
                                    <option value="新都区城区综合网格">新都区城区综合网格</option>
                                
                                    <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                                
                                    <option value="新津县综合网格">新津县综合网格</option>
                                
                                    <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                                
                                    <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                                
                                    <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                                
                                    <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                                
                                    <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                                
                                    <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                                
                                    <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                                
                                    <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                                
                                    <option value="阿坝州分公司壤塘县综合网格">阿坝州分公司壤塘县综合网格</option>
                                
                                    <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                                
                                    <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                                
                                    <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                                
                                    <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                                
                                    <option value="阿坝州分公司政要行业销售服务中心">阿坝州分公司政要行业销售服务中心</option>
                                
                                    <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                                
                                    <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                                
                                    <option value="巴中市分公司金融行业销售服务中心">巴中市分公司金融行业销售服务中心</option>
                                
                                    <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                                
                                    <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                                
                                    <option value="巴中市分公司教育信息化行业销售服务中心">巴中市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="巴中市分公司大企业行业销售服务中心">巴中市分公司大企业行业销售服务中心</option>
                                
                                    <option value="巴中市分公司政要行业销售服务中心">巴中市分公司政要行业销售服务中心</option>
                                
                                    <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                                
                                    <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                                
                                    <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                                
                                    <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                                
                                    <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                                
                                    <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                                
                                    <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                                
                                    <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                                
                                    <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                                
                                    <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                                
                                    <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                                
                                    <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                                
                                    <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                                
                                    <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                                
                                    <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                                
                                    <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                                
                                    <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                                
                                    <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                                
                                    <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                                
                                    <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                                
                                    <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                                
                                    <option value="省属IT电子行业销售服务中心">省属IT电子行业销售服务中心</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                                
                                    <option value="成都市分公司制造商贸行业销售服务中心">成都市分公司制造商贸行业销售服务中心</option>
                                
                                    <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                                
                                    <option value="成都市分公司旅游传媒行业销售服务中心">成都市分公司旅游传媒行业销售服务中心</option>
                                
                                    <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                                
                                    <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                                
                                    <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                                
                                    <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                                
                                    <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                                
                                    <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                                
                                    <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                                
                                    <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                                
                                    <option value="省属保险行业销售服务中心">省属保险行业销售服务中心</option>
                                
                                    <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                                
                                    <option value="成都市分公司科教文卫行业销售服务中心">成都市分公司科教文卫行业销售服务中心</option>
                                
                                    <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                                
                                    <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                                
                                    <option value="省属机械制造汽车行业销售中心">省属机械制造汽车行业销售中心</option>
                                
                                    <option value="省属政要一部行业销售服务中心">省属政要一部行业销售服务中心</option>
                                
                                    <option value="成都市分公司金融行业销售服务中心">成都市分公司金融行业销售服务中心</option>
                                
                                    <option value="成都市分公司政要行业销售服务中心">成都市分公司政要行业销售服务中心</option>
                                
                                    <option value="省属银行行业销售服务中心">省属银行行业销售服务中心</option>
                                
                                    <option value="省属能源电力化工行业销售服务中心">省属能源电力化工行业销售服务中心</option>
                                
                                    <option value="成都市分公司交通物流行业销售服务中心">成都市分公司交通物流行业销售服务中心</option>
                                
                                    <option value="达州市分公司教育信息化行业销售服务中心">达州市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="达州市分公司万源市城区综合网格">达州市分公司万源市城区综合网格</option>
                                
                                    <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                                
                                    <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                                
                                    <option value="达州市分公司达川区城区综合网格 ">达州市分公司达川区城区综合网格 </option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格1">达州市分公司达川区乡镇综合网格1</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                                
                                    <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                                
                                    <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格2">达州市分公司达川区乡镇综合网格2</option>
                                
                                    <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                                
                                    <option value="达州市分公司开江县城区综合网格">达州市分公司开江县城区综合网格</option>
                                
                                    <option value="达州市分公司万源市乡镇综合网格">达州市分公司万源市乡镇综合网格</option>
                                
                                    <option value="达州市分公司开江县乡镇综合网格">达州市分公司开江县乡镇综合网格</option>
                                
                                    <option value="达州市分公司金融行业销售服务中心">达州市分公司金融行业销售服务中心</option>
                                
                                    <option value="达州市分公司大企业行业销售服务中心">达州市分公司大企业行业销售服务中心</option>
                                
                                    <option value="达州市分公司政要行业销售服务中心">达州市分公司政要行业销售服务中心</option>
                                
                                    <option value="德阳市分公司政要二部行业销售服务中心">德阳市分公司政要二部行业销售服务中心</option>
                                
                                    <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                                
                                    <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                                
                                    <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                                
                                    <option value="未归集">未归集</option>
                                
                                    <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                                
                                    <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                                
                                    <option value="德阳市分公司政要行业销售服务中心">德阳市分公司政要行业销售服务中心</option>
                                
                                    <option value="德阳市分公司金融行业销售服务中心">德阳市分公司金融行业销售服务中心</option>
                                
                                    <option value="德阳市分公司大企业行业销售服务中心">德阳市分公司大企业行业销售服务中心</option>
                                
                                    <option value="德阳市分公司教育行业销售服务中心">德阳市分公司教育行业销售服务中心</option>
                                
                                    <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                                
                                    <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                                
                                    <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                                
                                    <option value="甘孜州分公司政要行业销售服务中心">甘孜州分公司政要行业销售服务中心</option>
                                
                                    <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                                
                                    <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                                
                                    <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                                
                                    <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                                
                                    <option value="甘孜州分公司新龙县综合网格">甘孜州分公司新龙县综合网格</option>
                                
                                    <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                                
                                    <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                                
                                    <option value="甘孜州分公司德格县综合网格">甘孜州分公司德格县综合网格</option>
                                
                                    <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                                
                                    <option value="甘孜州分公司大企业行业销售服务中心">甘孜州分公司大企业行业销售服务中心</option>
                                
                                    <option value="甘孜州分公司中小幼行业销售服务中心">甘孜州分公司中小幼行业销售服务中心</option>
                                
                                    <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                                
                                    <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                                
                                    <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                                
                                    <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                                
                                    <option value="甘孜州分公司石渠县综合网格">甘孜州分公司石渠县综合网格</option>
                                
                                    <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                                
                                    <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                                
                                    <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                                
                                    <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                                
                                    <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                                
                                    <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                                
                                    <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                                
                                    <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                                
                                    <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                                
                                    <option value="广安市分公司商企行业服务销售中心">广安市分公司商企行业服务销售中心</option>
                                
                                    <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                                
                                    <option value="广安市分公司教育行业销售服务中心">广安市分公司教育行业销售服务中心</option>
                                
                                    <option value="广安市分公司金融行业销售服务中心">广安市分公司金融行业销售服务中心</option>
                                
                                    <option value="广安市分公司政要行业销售服务中心">广安市分公司政要行业销售服务中心</option>
                                
                                    <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                                
                                    <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                                
                                    <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                                
                                    <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                                
                                    <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                                
                                    <option value="广元市分公司金融行业销售服务中心">广元市分公司金融行业销售服务中心</option>
                                
                                    <option value="广元市分公司政要行业销售服务中心">广元市分公司政要行业销售服务中心</option>
                                
                                    <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                                
                                    <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                                
                                    <option value="乐山市分公司校园行业销售服务中心">乐山市分公司校园行业销售服务中心</option>
                                
                                    <option value="乐山市分公司大企业行业销售服务中心">乐山市分公司大企业行业销售服务中心</option>
                                
                                    <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                                
                                    <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                                
                                    <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                                
                                    <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                                
                                    <option value="乐山市分公司政要行业销售服务中心">乐山市分公司政要行业销售服务中心</option>
                                
                                    <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                                
                                    <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                                
                                    <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                                
                                    <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                                
                                    <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                                
                                    <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                                
                                    <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                                
                                    <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                                
                                    <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                                
                                    <option value="乐山市分公司公安交通旅游行业销售服务中心">乐山市分公司公安交通旅游行业销售服务中心</option>
                                
                                    <option value="乐山市分公司金融行业销售服务中心">乐山市分公司金融行业销售服务中心</option>
                                
                                    <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                                
                                    <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                                
                                    <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                                
                                    <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                                
                                    <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                                
                                    <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                                
                                    <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                                
                                    <option value="凉山州分公司政要行业销售服务中心">凉山州分公司政要行业销售服务中心</option>
                                
                                    <option value="凉山州分公司金融行业销售服务中心">凉山州分公司金融行业销售服务中心</option>
                                
                                    <option value="凉山州分公司大企业行业销售服务中心">凉山州分公司大企业行业销售服务中心</option>
                                
                                    <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                                
                                    <option value="凉山州分公司水电综合网格">凉山州分公司水电综合网格</option>
                                
                                    <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                                
                                    <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                                
                                    <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                                
                                    <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                                
                                    <option value="凉山州分公司普格县综合网格">凉山州分公司普格县综合网格</option>
                                
                                    <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                                
                                    <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                                
                                    <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                                
                                    <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                                
                                    <option value="凉山州分公司商企行业销售服务中心">凉山州分公司商企行业销售服务中心</option>
                                
                                    <option value="凉山州分公司教育行业销售服务中心">凉山州分公司教育行业销售服务中心</option>
                                
                                    <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                                
                                    <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                                
                                    <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                                
                                    <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                                
                                    <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                                
                                    <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                                
                                    <option value="泸州市分公司化工机械行业销售服务中心">泸州市分公司化工机械行业销售服务中心</option>
                                
                                    <option value="泸州市分公司政要行业销售服务中心">泸州市分公司政要行业销售服务中心</option>
                                
                                    <option value="泸州市分公司大企业行业销售服务中心">泸州市分公司大企业行业销售服务中心</option>
                                
                                    <option value="泸州市分公司金融行业销售服务中心">泸州市分公司金融行业销售服务中心</option>
                                
                                    <option value="泸州市分公司中小幼行业销售服务中心">泸州市分公司中小幼行业销售服务中心</option>
                                
                                    <option value="泸州市分公司交通运输行业销售服务中心">泸州市分公司交通运输行业销售服务中心</option>
                                
                                    <option value="泸州市IT行业销售服务中心">泸州市IT行业销售服务中心</option>
                                
                                    <option value="泸州市分公司旅游卫生行业销售服务中心">泸州市分公司旅游卫生行业销售服务中心</option>
                                
                                    <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                                
                                    <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                                
                                    <option value="眉山市分公司大企业行业销售服务中心">眉山市分公司大企业行业销售服务中心</option>
                                
                                    <option value="眉山市分公司教育信息化行业销售服务中心">眉山市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                                
                                    <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                                
                                    <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                                
                                    <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                                
                                    <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                                
                                    <option value="眉山市分公司金融行业销售服务中心">眉山市分公司金融行业销售服务中心</option>
                                
                                    <option value="眉山市分公司政要行业销售服务中心">眉山市分公司政要行业销售服务中心</option>
                                
                                    <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                                
                                    <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区魏城综合网格">绵阳市分公司游仙区魏城综合网格</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                                
                                    <option value="绵阳市分公司梓潼县乡镇综合网格">绵阳市分公司梓潼县乡镇综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                                
                                    <option value="绵阳市分公司大企业行业销售服务中心">绵阳市分公司大企业行业销售服务中心</option>
                                
                                    <option value="绵阳市分公司教育信息化行业销售服务中心">绵阳市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="绵阳市分公司政要行业销售服务中心">绵阳市分公司政要行业销售服务中心</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                                
                                    <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                                
                                    <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                                
                                    <option value="绵阳市分公司金融行业销售服务中心">绵阳市分公司金融行业销售服务中心</option>
                                
                                    <option value="绵阳市分公司科技贸易行业销售服务中心">绵阳市分公司科技贸易行业销售服务中心</option>
                                
                                    <option value="南充市分公司南部县东区综合网格">南充市分公司南部县东区综合网格</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                                
                                    <option value="南充市分公司高坪区龙门综合网格">南充市分公司高坪区龙门综合网格</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                                
                                    <option value="南充市分公司南部县西区综合网格">南充市分公司南部县西区综合网格</option>
                                
                                    <option value="南充市分公司顺庆区新城综合网格">南充市分公司顺庆区新城综合网格</option>
                                
                                    <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                                
                                    <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                                
                                    <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                                
                                    <option value="南充市分公司西充县多扶综合网格">南充市分公司西充县多扶综合网格</option>
                                
                                    <option value="南充市分公司教育信息化行业销售服务中心">南充市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="南充市分公司金融行业销售服务中心">南充市分公司金融行业销售服务中心</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                                
                                    <option value="南充市分公司阆中市水观综合网格">南充市分公司阆中市水观综合网格</option>
                                
                                    <option value="南充市分公司政要行业销售服务中心">南充市分公司政要行业销售服务中心</option>
                                
                                    <option value="南充市分公司大企业行业销售服务中心">南充市分公司大企业行业销售服务中心</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                                
                                    <option value="南充市分公司仪陇县金城综合网格">南充市分公司仪陇县金城综合网格</option>
                                
                                    <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                                
                                    <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                                
                                    <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                                
                                    <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                                
                                    <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                                
                                    <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                                
                                    <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                                
                                    <option value="内江市分公司交通物流行业销售服务中心">内江市分公司交通物流行业销售服务中心</option>
                                
                                    <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                                
                                    <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                                
                                    <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                                
                                    <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                                
                                    <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                                
                                    <option value="内江市分公司大企业行业销售服务中心">内江市分公司大企业行业销售服务中心</option>
                                
                                    <option value="内江市分公司政要行业销售服务中心">内江市分公司政要行业销售服务中心</option>
                                
                                    <option value="内江市分公司教育行业销售服务中心">内江市分公司教育行业销售服务中心</option>
                                
                                    <option value="内江市分公司商企行业销售服务中心">内江市分公司商企行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                                
                                    <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                                
                                    <option value="攀枝花市分公司卫生医疗行业销售服务中心">攀枝花市分公司卫生医疗行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司商企行业销售服务中心">攀枝花市分公司商企行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司教育行业销售服务中心">攀枝花市分公司教育行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司政要二部行业销售服务中心">攀枝花市分公司政要二部行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司交通能源行业销售服务中心">攀枝花市分公司交通能源行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司金融行业销售服务中心">攀枝花市分公司金融行业销售服务中心</option>
                                
                                    <option value="攀枝花市分公司政要一部行业销售服务中心">攀枝花市分公司政要一部行业销售服务中心</option>
                                
                                    <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                                
                                    <option value="遂宁市分公司校企行业销售服务中心">遂宁市分公司校企行业销售服务中心</option>
                                
                                    <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                                
                                    <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                                
                                    <option value="遂宁市分公司金融行业销售服务中心">遂宁市分公司金融行业销售服务中心</option>
                                
                                    <option value="遂宁市分公司大企业行业销售服务中心">遂宁市分公司大企业行业销售服务中心</option>
                                
                                    <option value="遂宁市分公司政要行业销售服务中心">遂宁市分公司政要行业销售服务中心</option>
                                
                                    <option value="雅安市分公司金融行业销售服务中心">雅安市分公司金融行业销售服务中心</option>
                                
                                    <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                                
                                    <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                                
                                    <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                                
                                    <option value="雅安市分公司中小幼行业销售服务中心">雅安市分公司中小幼行业销售服务中心</option>
                                
                                    <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                                
                                    <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                                
                                    <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                                
                                    <option value="雅安市分公司大企业行业销售服务中心">雅安市分公司大企业行业销售服务中心</option>
                                
                                    <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                                
                                    <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                                
                                    <option value="雅安市分公司雨城区集客销售服务中心">雅安市分公司雨城区集客销售服务中心</option>
                                
                                    <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                                
                                    <option value="雅安市分公司政要行业销售服务中心">雅安市分公司政要行业销售服务中心</option>
                                
                                    <option value="宜宾市分公司大企业行业销售服务中心">宜宾市分公司大企业行业销售服务中心</option>
                                
                                    <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                                
                                    <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                                
                                    <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                                
                                    <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                                
                                    <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                                
                                    <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                                
                                    <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                                
                                    <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                                
                                    <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                                
                                    <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                                
                                    <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                                
                                    <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                                
                                    <option value="宜宾市分公司金融行业销售服务中心">宜宾市分公司金融行业销售服务中心</option>
                                
                                    <option value="宜宾市分公司政要二部行业销售服务中心">宜宾市分公司政要二部行业销售服务中心</option>
                                
                                    <option value="宜宾市分公司政要一部行业销售服务中心">宜宾市分公司政要一部行业销售服务中心</option>
                                
                                    <option value="资阳市分公司教育信息化行业销售服务中心">资阳市分公司教育信息化行业销售服务中心</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                                
                                    <option value="资阳市分公司政要行业销售服务中心">资阳市分公司政要行业销售服务中心</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                                
                                    <option value="资阳市分公司金融行业销售服务中心">资阳市分公司金融行业销售服务中心</option>
                                
                                    <option value="资阳市分公司大企业行业销售服务中心">资阳市分公司大企业行业销售服务中心</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                                
                                    <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                                
                                    <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                                
                                    <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                                
                                    <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                                
                                    <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                                
                                    <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                                
                                    <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                                
                                    <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                                
                                    <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                                
                                    <option value="自贡市分公司大企业行业销售服务中心">自贡市分公司大企业行业销售服务中心</option>
                                
                                    <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                                
                                    <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                                
                                    <option value="自贡市分公司政要行业销售服务中心">自贡市分公司政要行业销售服务中心</option>
                                
                                    <option value="自贡市分公司金融行业销售服务中心">自贡市分公司金融行业销售服务中心</option>
                                
                                    <option value="自贡市分公司教育行业销售服务中心">自贡市分公司教育行业销售服务中心</option>
                                
                            
                        </select>
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="classLocal">地域</label>
                        <select id="classLocal" class="form-control input-sm" name="classLocal">
                            <option value="all">全部</option>
                            <option value="城区">城区</option>
                            <option value="城郊">城郊</option>
                            <option value="县城">县城</option>
                            <option value="乡村">乡村</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="classOperation">业态</label>
                        <select id="classOperation" class="form-control input-sm" name="classOperation"
                                style="width: 100px;">
                            <option value="all">全部</option>
                            <option value="通讯商圈">通讯商圈</option>
                            <option value="商业区">商业区</option>
                            <option value="学校">学校</option>
                            <option value="社区">社区</option>
                            <option value="工业园区">工业园区</option>
                            <option value="办公楼宇">办公楼宇</option>
                            <option value="非临街档口(楼上楼下)">非临街档口(楼上楼下)</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="storeClass">渠道类型</label>
                        <select id="storeClass" class="form-control input-sm" name="storeClass">
                            <option value="小微渠道">小微渠道</option>
                            <option value="签约渠道">签约渠道</option>
                            <option value="自有渠道">自有渠道</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="startTime">时间段</label>
                        <input type="text" class="form-control input-sm" id="startTime" name="startTime"
                               value="2017年12月23日" readonly style="width: 110px">
                        -
                        <input type="text" class="form-control input-sm" id="endTime" name="endTime"
                               value="2017年12月23日" readonly style="width: 110px">
                    </div>
                    <div class="form-group">
                        <label for="province">省</label>
                        <select id="province" class="form-control input-sm" name="province">
                            <option value="all">全部</option>
                            
                                
                                    <option value="四川">四川</option>
                                
                                    <option value="测试">测试</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="city">地市</label>
                        <select id="city" class="form-control input-sm" name="city">
                            <option value="all">全部</option>
                            
                                
                                    <option value="乐山">乐山</option>
                                
                                    <option value="内江">内江</option>
                                
                                    <option value="凉山">凉山</option>
                                
                                    <option value="宜宾">宜宾</option>
                                
                                    <option value="广元">广元</option>
                                
                                    <option value="广安">广安</option>
                                
                                    <option value="德阳">德阳</option>
                                
                                    <option value="成都">成都</option>
                                
                                    <option value="攀枝花">攀枝花</option>
                                
                                    <option value="泸州">泸州</option>
                                
                                    <option value="测试">测试</option>
                                
                                    <option value="眉山">眉山</option>
                                
                                    <option value="自贡">自贡</option>
                                
                                    <option value="达州">达州</option>
                                
                                    <option value="阿坝">阿坝</option>
                                
                                    <option value="雅安">雅安</option>
                                
                                    <option value="凉山州">凉山州</option>
                                
                                    <option value="巴中">巴中</option>
                                
                                    <option value="甘孜">甘孜</option>
                                
                                    <option value="资阳">资阳</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <a id="searchBtn" class="btn btn-danger btn-sm">查询</a>
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <a id="exportDataBtn" class="btn btn-danger btn-sm">导出</a>
                    </div>
                </li>
            </form>
        </div>
    </div>

    <div class="second">
        <div id="allmap" class="right right_bottom"></div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">

    var pointCollections = new Array();
    var plyCollections = new Array();
    var pointArray = new Array();
    var plyList = new Array();

    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom("成都", 12);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity("成都");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    //添加控件和比例尺
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    var stCtrl = new BMap.PanoramaControl();//添加全景按钮
    stCtrl.setOffset(new BMap.Size(30, 60));
    map.addControl(stCtrl);


    $("#searchBtn").bind("click", function () {
        var shape = $("#classOfShape").val();
        var size = $("#sizeChoice").val();
        var color = $("#colorChoice").val();
        var storeClass = $("#storeClass").val();

        var url = "../data/allDataWithCdsToMap";//weloop.duapp.com/WeChat
        var data = $('#searchForm').serialize();
        zeroModal.loading(4)
        $.ajax({
            cache: true,
            type: "POST",
            dataType: 'json',
            url: url,//xd.169ol.com:8090/WeChatTest
            data: data,//$('#searchForm').serialize(),// 你的formid
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                zeroModal.closeAll();
                zeroModal.error({content: "出现错误" + errorThrown, width: '500px', height: '250', top: '100px'});
//                alert(errorThrown);
            },
            success: function (data) {
                zeroModal.closeAll();
                //alert(data);
                var len = data.length;
                if (data.result!=null && data.result!=undefined && data.errcode=='-2') {
                    zeroModal.alert({content: data.result, width: '500px', height: '200', top: '100px'});
                }else {
                    zeroModal.success({content: "该次共查询" + len + "条数据", width: '500px', height: '200', top: '100px'});
                    if (len > 0) {
                        var points = new Array();
                        var shapeLocal = getShape(shape);
                        var sizeLocal = getSize(size);

                        var options = {
                            size: sizeLocal,
                            shape: shapeLocal,
                            color: color
                        }

                        for (var i = 0; i < len; i++) {
                            var baiduCoordinate = data[i].baiduCoordinate;
                            if (baiduCoordinate != null && baiduCoordinate != "" && baiduCoordinate != undefined) {
                                var longitude = baiduCoordinate.substring(0, baiduCoordinate.indexOf(","));
                                var latitude = baiduCoordinate.substring(baiduCoordinate.indexOf(",") + 1, baiduCoordinate.length);
                                points.push(new BMap.Point(longitude, latitude));
                            }

                        }
                        drawData(points, options, data, storeClass);
                    }
                }
            }
        });
    })

    //坐标转换完之后的回调函数
    translateCallback = function (data) {
        if (data.status === 0) {
            stationPoints.push(data.points[0]);
        }
    }


    function getShape(shape) {
        var shapeLocal = BMAP_POINT_SHAPE_CIRCLE;
        if (shape === 'BMAP_POINT_SHAPE_CIRCLE') {
            shapeLocal = BMAP_POINT_SHAPE_CIRCLE;
        } else if (shape === 'BMAP_POINT_SHAPE_STAR') {
            shapeLocal = BMAP_POINT_SHAPE_STAR;
        } else if (shape === 'BMAP_POINT_SHAPE_SQUARE') {
            shapeLocal = BMAP_POINT_SHAPE_SQUARE;
        } else if (shape === 'BMAP_POINT_SHAPE_RHOMBUS') {
            shapeLocal = BMAP_POINT_SHAPE_RHOMBUS;
        } else if (shape === 'BMAP_POINT_SHAPE_WATERDROP') {
            shapeLocal = BMAP_POINT_SHAPE_WATERDROP;
        }
        return shapeLocal;
    }

    function getSize(size) {
        var sizeLocal = BMAP_POINT_SIZE_TINY;
        if (size === 'BMAP_POINT_SIZE_TINY') {
            sizeLocal = BMAP_POINT_SIZE_TINY;
        } else if (size === 'BMAP_POINT_SIZE_SMALLER') {
            sizeLocal = BMAP_POINT_SIZE_SMALLER;
        } else if (size === 'BMAP_POINT_SIZE_SMALL') {
            sizeLocal = BMAP_POINT_SIZE_SMALL;
        } else if (size === 'BMAP_POINT_SIZE_NORMAL') {
            sizeLocal = BMAP_POINT_SIZE_NORMAL;
        } else if (size === 'BMAP_POINT_SIZE_BIG') {
            sizeLocal = BMAP_POINT_SIZE_BIG;
        } else if (size === 'BMAP_POINT_SIZE_BIGGER') {
            sizeLocal = BMAP_POINT_SIZE_BIGGER;
        } else {
            sizeLocal = BMAP_POINT_SIZE_HUGE;
        }
        return sizeLocal;
    }


    $("#getXzArea").bind("click", function () {
        var cityId = $("#xzCity").val();
        var color = $("#colorChoice").val();
        pointArray.length = 0;
        zeroModal.loading(4);
        $.ajax({
            url: "../weChat/getCounty",//weloop.duapp.com/WeChat
            dataType: 'json',
            data: {"cityId": cityId},
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                zeroModal.closeAll();
                zeroModal.error({content: "出现错误" + errorThrown, width: '500px', height: '250', top: '100px'});
            },
            success: function (res) {
                zeroModal.closeAll();
                var length = res.length;
                if (res.result!=null && res.result!=undefined && res.errcode=='-2') {
                    zeroModal.alert({content: res.result, width: '500px', height: '200', top: '100px'});
                }else {
                    if (length > 0) {
                        var plys = new Array();
                        for (var i = 0; i < length; i++) {
                            var county = res[i];
                            drawPly(county.countyName, color, 2);
                        }
                        //从plyList中取出本次查询的区县折线数据
                        for (var j = (plyList.length - length); j < plyList.length; j++) {
                            plys.push(plyList[j]);
                        }
                        plyCollections.push(plyList);
                        var id = plyCollections.length - 1;
                        addPlyList(id);
                        map.setViewport(pointArray);    //调整视野
                    }
                }
            }
        });
    })

    function drawPly(name, color, strokeWeight) {
        var bdary = new BMap.Boundary();
        bdary.get(name, function (rs) {       //获取行政区域
            // map.clearOverlays();        //清除地图覆盖物
            var count = rs.boundaries.length; //行政区域的点有多少个
            if (count === 0) {
                zeroModal.error({content: '未能获取当前输入行政区域'});
                return;
            }

            var ply = new BMap.Polygon(rs.boundaries[0], {
                strokeWeight: strokeWeight,
                strokeColor: color,
                fillOpacity: 0,
                fillColor: "none"
            }); //建立多边形覆盖物
            map.addOverlay(ply);  //添加覆盖物
            plyList.push(ply);
            pointArray = pointArray.concat(ply.getPath());
            // }

        })
    }
    /**
     * 绘制数据
     * */
    function drawData(points, options, data, storeClass) {
        if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
            var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
            var content;
            pointCollection.addEventListener('click', function (e) {
                for (var i = 0; i < data.length; i++) {
                    var baiduCoordinate = data[i].baiduCoordinate;
                    if (baiduCoordinate != null && baiduCoordinate != "" && baiduCoordinate != undefined) {
                        var longitude = baiduCoordinate.substring(0, baiduCoordinate.indexOf(","));
                        var latitude = baiduCoordinate.substring(baiduCoordinate.indexOf(",") + 1, baiduCoordinate.length);
                        if (longitude == e.point.lng && latitude == e.point.lat) {
                            content = getContent(data[i], storeClass);
                        }
                    }

                }
                var point = new BMap.Point(e.point.lng, e.point.lat);
                var infowindow = new BMap.InfoWindow(content);
                map.openInfoWindow(infowindow, point);
                //alert('该点的坐标为：(' + e.point.lng + ',' + e.point.lat + ')');  // 监听点击事件
            });

            map.addOverlay(pointCollection);  // 添加Overlay
            pointCollections.push(pointCollection);
            var id = pointCollections.length - 1;
            addLayerList(id, storeClass);
        } else {
            alert('您的浏览器不支持绘制海量点数据,建议更换浏览器进行尝试');
        }
    }

    /*
     生成信息窗口的内容
     */
    function getContent(obj, storeClass) {
        var content = "";
        if (storeClass === '签约渠道') {
            content =
                "<div style='width: 100%;'>" + obj.storeName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 12px;'>" +
                "<li>渠道编码：" + obj.storeNumber + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.branch + "</li>" +
                "<li>渠道类型：" + obj.storeClass + "</li>" +
                "<li>地域：" + obj.classRegion + "</li>" +
                "<li>门店类型：" + obj.storeClass + "</li>" +
                "<li>经营类型：" + obj.typeOfOperation + "</li>" +
                "<li>业态：" + obj.classTypeOfOperation + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<li>营业员人数：" + obj.countOfClerk + "</li>" +
                "<li>近一月内营业员是否变更：" + obj.clerkChangeOneMonth + "</li>" +
                "<li>月终端销量：" + obj.proceedsOfTerminalAvg + "</li>" +
                "<li>异网业务发展能力：" + obj.proceedsOfElseNet + "</li>" +
                "<li>反馈信息：" + obj.feedBack + "</li>" +
                "<li>巡店人员电话: " + obj.submitPerson + "</li>" +
                "<li>巡店时间：" + obj.createTime.toString() + "</li>" +
                "<li>最近更新时间：" + obj.updateTime + "</li>" +
                "</div>";
        } else if (storeClass === '小微渠道') {
            content =
                "<div style='width: 100%;'>" + obj.storeName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 12px;'>" +
                "<li>用户名称：" + obj.userName + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.branch + "</li>" +
                "<li>门店类型：" + obj.storeClass + "</li>" +
                "<li>业态：" + obj.classTypeOfOperation + "</li>" +
                "<li>地域：" + obj.classRegion + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<li>巡店人员电话：" + obj.submitPerson + "</li>" +
                "<li>巡店时间：" + obj.createTime.toString() + "</li>" +
                "<li>最近更新时间：" + obj.updateTime + "</li>" +
                "</div>";
        } else if (storeClass === '自有渠道') {
            content =
                "<div style='width: 100%;'>" + obj.storeName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 12px;'>" +
                "<li>渠道编码：" + obj.storeNumber + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.branch + "</li>" +
                "<li>运营方式：" + obj.typeOfOperation + "</li>" +
                "<li>地域：" + obj.classRegion + "</li>" +
                "<li>业态：" + obj.classTypeOfOperation + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<li>店员人数：" + obj.countOfClerk + "</li>" +
                "<li>巡店人员电话: " + obj.submitPerson + "</li>" +
                "<li>巡店时间：" + obj.createTime.toString() + "</li>" +
                "<li>最近更新时间：" + obj.updateTime + "</li>" +
                "</div>";
        }
        return content;
    }

    function addPlyList(id) {
        var cityName = $("#xzCity").find("option:selected").text();
        var color = $("#colorChoice").val();
        $("#layerList").prepend("<div id='" + id + "plyDiv' style='background-color: " + color + "'>" +
            "<li>" + cityName + "行政区划</li>" +
            "<li><input class='listBtn' id='" + id + "close' type='button' value='关闭所有' onclick='closePly(this.id)'></li> </div>");
    }

    /***
     *关闭行政区划图层
     **/
    function closePly(id) {
        var index = id.substring(0, id.indexOf("c"));
        if (plyCollections[index] != null) {
            for (var i = 0; i < plyCollections[index].length; i++) {
                var plys = plyCollections[index];
                map.removeOverlay(plys[i]);
            }
        }
        for (var i = 0; i < plyCollections.length; i++) {
            $("#" + i + "plyDiv").remove();
        }

    }
    function addLayerList(id, storeClass) {
        var shape = $("#classOfShape").val();
        var shapeStr = "圆形";
        if (shape == 'BMAP_POINT_SHAPE_STAR') {
            shapeStr = "星形";
        } else if (shape == 'BMAP_POINT_SHAPE_SQUARE') {
            shapeStr = "方形";
        } else if (shape == 'BMAP_POINT_SHAPE_RHOMBUS') {
            shapeStr = "菱形";
        } else if (shape == 'BMAP_POINT_SHAPE_WATERDROP') {
            shapeStr = "水滴";
        }
        var size = $("#sizeChoice").val();
        var sizeStr = "超小";
        if (size == 'BMAP_POINT_SIZE_SMALLER') {
            sizeStr = "较小";
        } else if (size == 'BMAP_POINT_SIZE_SMALL') {
            sizeStr = "小";
        } else if (size == 'BMAP_POINT_SIZE_NORMAL') {
            sizeStr = "正常";
        } else if (size == 'BMAP_POINT_SIZE_BIG') {
            sizeStr = "大";
        } else if (size == 'BMAP_POINT_SIZE_BIGGER') {
            sizeStr = "较大";
        } else {
            sizeStr = "超大";
        }
        var color = $("#colorChoice").val();
        var content = "(" + shapeStr + ";" + sizeStr + "尺寸)";

        $("#layerList").prepend("<div id='" + id + "div' style='background-color: " + color + "'>" +
            "<li>" + content + "</li>" + "<li>" + storeClass + "</li>" + "<li id='" + id + "status'>状态：显示</li>" +
            "<li><input class='listBtn' id='" + id + "hide' type='button' value='隐藏' onclick='hide(this.id)'><input class='listBtn' id='" + id + "show' type='button' value='显示' onclick='show(this.id)'><input class='listBtn' id='" + id + "close' type='button' value='关闭' onclick='closeLayer(this.id)'></li> </div>");
    }

    function hide(id) {
        var index = id.substring(0, id.indexOf("h"));
        if (pointCollections[index] != null) {
            pointCollections[index].hide();
            $("#" + index + "status").text("状态：已隐藏");
        }
    }

    function show(id) {
        var index = id.substring(0, id.indexOf("s"));
        if (pointCollections[index] != null) {
            pointCollections[index].show();
            $("#" + index + "status").text("状态：显示");
        }
    }

    function closeLayer(id) {
        var index = id.substring(0, id.indexOf("c"));
        id = index + "div";
        if (pointCollections[index] != null) {
            map.removeOverlay(pointCollections[index]);
        }
        $("#" + id).remove();
    }


</script>
