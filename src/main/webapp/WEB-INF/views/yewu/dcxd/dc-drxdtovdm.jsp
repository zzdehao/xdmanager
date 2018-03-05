<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>GIS-导入数据</title>
    <%@ include file="../ywinclude.jsp" %>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=VN0SG164b04AZFb2BBmpbgKI8Uh5i11O"></script>
    <script type="text/javascript"
            src="${staticPath}/lib/yewu/Heatmap_min.js"></script>
    <script src="${staticPath}/lib/yewu/jquery.zclip.min.js"></script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            background-color: #EEEEEE;
            font-family: 华文中宋;
        }

        .left {
            float: left;
            height: 100%;
            width: 12%;
            border-right-color: #CF4646;
            overflow-y: auto;
        }

        .first {
            height: 17%;
            width: 100%;
            overflow-y: auto;
        }

        .second {
            height: 83%;
            width: 100%;
        }

        #allmap {
            width: 100%;
            height: 100%;
        }

        .right {
            float: right;
            height: 100%;
            width: 88%;
        }

        .channelConditions {
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

        .BB{
            font-size: 10px;
        }

        .baseLi {
            height: 33px;
            border: none;
        }

        .listBtn {
            font-size: 12px;
        }

        .bttn {
            background-color: #CF4646;
            color: #FFFFFF;
            border: none;
            width: 80%;
            height: 30px;
            border-bottom: solid rgba(200,199,196,0.98);
        }
        .left-bottom{
            width: 100%;
            float: none;
        }
        .first-left{
            width: 100%;
            height: 40%;
        }
    </style>

</head>
<body>
<div class="left">
    <div class="first-left">
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
                <select id="colorChoice" class="form-control input-sm" onchange="colorChange()">
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
                <select id="dataClass" class="form-control input-sm">
                    <option value="签约渠道信息">签约渠道信息</option>
                    <option value="自有渠道信息">自有渠道信息</option>
                    <option value="小微渠道信息">小微渠道信息</option>
                    <option value="基站信息">基站信息</option>
                    <option value="宽带信息">宽带信息</option>
                </select>
            </div>
        </li>
        <li class="baseLi">
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
            <button class="bttn openChildMap">打开辅助地图</button>
        </li>
    </div>
    <div class="left-bottom" id="layerList" style="overflow-y: auto">

    </div>
</div>

<div class="right right-con">
    <div class="first">
        <div class="channelConditions">

            <!--条件区域-->
            <form class="form-inline" id="searchForm" method="post" action="../map/getCooChannels">
                <li>
                    <div class="form-group">
                        <label for="storeId">ID</label>
                        <input type="text" class="form-control input-sm" id="storeId" name="storeId"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="channelNumber">渠道编码</label>
                        <input type="text" class="form-control input-sm" id="channelNumber" name="channelNumber"
                               style="width: 60px;">
                    </div>

                    <div class="form-group">
                        <label for="unicomDoorHeader">
                            门头
                        </label>
                        <select id="unicomDoorHeader" name="unicomDoorHeader" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="unicomLightBox">
                            灯箱
                        </label>
                        <select id="unicomLightBox" name="unicomLightBox" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="unicomSignBoard">
                            标识牌
                        </label>
                        <select id="unicomSignBoard" name="unicomSignBoard" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="unicomBg">
                            背景墙
                        </label>
                        <select id="unicomBg" name="unicomBg" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="oppo">
                            oppo
                        </label>
                        <select id="oppo" name="oppo" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="gionee">
                            金立
                        </label>
                        <select id="gionee" name="gionee" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="vivo">
                            vivo
                        </label>
                        <select id="vivo" name="vivo" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="huawei">
                            华为
                        </label>
                        <select id="huawei" name="huawei" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="samsung">
                            三星
                        </label>
                        <select id="samsung" name="samsung" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="iphone">
                            苹果
                        </label>
                        <select id="iphone" name="iphone" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="meizu">
                            魅族
                        </label>
                        <select id="meizu" name="meizu" class="form-control input-sm">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="typeOfOperation">业态</label>
                        <select id="typeOfOperation" class="form-control input-sm" name="typeOfOperation"
                                style="width: 80px;">
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
                    <div class="form-group">
                        <label for="classOfManage">经营类型</label>
                        <select id="classOfManage" class="form-control input-sm" name="classOfManage"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="他建他营">他建他营</option>
                            <option value="自建他营">自建他营</option>
                            <option value="自建混营">自建混营</option>
                            <option value="自建自营">自建混营</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="channelClass">渠道类型</label>
                        <select id="channelClass" class="form-control input-sm" name="channelClass"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="合作营业厅">合作营业厅</option>
                            <option value="代理点">代理点</option>
                            <option value="自营专区">自营专区</option>
                            <option value="专营店/专区">专营店/专区</option>
                            <option value="专营店专区">专营店专区</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="storeClass">门店类型</label>
                        <select id="storeClass" class="form-control input-sm" name="storeClass" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="联通专营店">联通专营店</option>
                            <option value="代理点">代理点</option>
                            <option value="开放型终端卖场">开放型终端卖场</option>
                            <option value="社区沃店(宽带)">社区沃店(宽带)</option>
                            <option value="联通专营终端卖场">联通专营终端卖场</option>
                            <option value="移动排他终端卖场">移动排他终端卖场</option>
                            <option value="电信排他终端卖场">电信排他终端卖场</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="region">地域</label>
                        <select id="region" class="form-control input-sm" name="region" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="城区">城区</option>
                            <option value="城郊">城郊</option>
                            <option value="县城">县城</option>
                            <option value="乡镇">乡镇</option>
                            <option value="乡村">乡村</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="measureOfArea">面积</label>
                        <select id="measureOfArea" name="measureOfArea" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="100平米以上">100平米以上</option>
                            <option value="50-100平米">50-100平米</option>
                            <option value="20-50平米">20-50平米</option>
                            <option value="20平米以下">20平米以下</option>
                        </select>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="countOfClerk">店员人数</label>
                        <select id="countOfClerk" name="countOfClerk" class="form-control input-sm"
                                style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="10人以上">10人以上</option>
                            <option value="7-10人">7-10人</option>
                            <option value="4-6人">4-6人</option>
                            <option value="3人以下">3人以下</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="proceedsMonthAvg">月终端销量</label>
                        <select id="proceedsMonthAvg" name="proceedsMonthAvg" class="form-control input-sm"
                                style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="100以上">100以上</option>
                            <option value="50-100">50-100</option>
                            <option value="20-50">20-50</option>
                            <option value="20以下">20以下</option>
                            <option value="0">0</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="proceedsElseNet">异网业务发展能力</label>
                        <select id="proceedsElseNet" name="proceedsElseNet" class="form-control input-sm"
                                style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="100以上">100以上</option>
                            <option value="50-100">50-100</option>
                            <option value="20-50">20-50</option>
                            <option value="20以下">20以下</option>
                            <option value="0">0</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="city">地市</label>
                        <select id="city" class="form-control input-sm" name="city" style="width: 65px;">
                            <option value="all">全部</option>
                            
                                
                                    <option value="乐山">乐山</option>
                                
                                    <option value="内江">内江</option>
                                
                                    <option value="凉山州">凉山州</option>
                                
                                    <option value="南充">南充</option>
                                
                                    <option value="宜宾">宜宾</option>
                                
                                    <option value="巴中">巴中</option>
                                
                                    <option value="广元">广元</option>
                                
                                    <option value="广安">广安</option>
                                
                                    <option value="德阳">德阳</option>
                                
                                    <option value="成都">成都</option>
                                
                                    <option value="攀枝花">攀枝花</option>
                                
                                    <option value="泸州">泸州</option>
                                
                                    <option value="测试">测试</option>
                                
                                    <option value="甘孜">甘孜</option>
                                
                                    <option value="眉山">眉山</option>
                                
                                    <option value="绵阳">绵阳</option>
                                
                                    <option value="自贡">自贡</option>
                                
                                    <option value="资阳">资阳</option>
                                
                                    <option value="达州">达州</option>
                                
                                    <option value="遂宁">遂宁</option>
                                
                                    <option value="阿坝">阿坝</option>
                                
                                    <option value="雅安">雅安</option>
                                
                                    <option value=""></option>
                                
                                    <option value="凉山">凉山</option>
                                
                                    <option value="凉山彝族自治州">凉山彝族自治州</option>
                                
                                    <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                                
                                    <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="grid">网格</label>
                        <select id="grid" class="form-control input-sm" name="gridName" style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="未知">未知</option>
                            
                                
                                    <option value="xxx网格">xxx网格</option>
                                
                                    <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                                
                                    <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                                
                                    <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                                
                                    <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                                
                                    <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                                
                                    <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                                
                                    <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                                
                                    <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                                
                                    <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                                
                                    <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                                
                                    <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                                
                                    <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                                
                                    <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                                
                                    <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                                
                                    <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                                
                                    <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                                
                                    <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                                
                                    <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                                
                                    <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                                
                                    <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                                
                                    <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                                
                                    <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                                
                                    <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                                
                                    <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                                
                                    <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                                
                                    <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                                
                                    <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                                
                                    <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                                
                                    <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                                
                                    <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                                
                                    <option value="凉山州分公司普格">凉山州分公司普格</option>
                                
                                    <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                                
                                    <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                                
                                    <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                                
                                    <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                                
                                    <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格???????????????">南充市分公司仪陇县新政综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县金城综合网格???????????????">南充市分公司仪陇县金城综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格???????????????">南充市分公司仪陇县马鞍综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县东区综合网格???????????????">南充市分公司南部县东区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县城区综合网格???????????????">南充市分公司南部县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县西区综合网格???????????????">南充市分公司南部县西区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格???????????????">南充市分公司嘉陵区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格???????????????">南充市分公司嘉陵区金龙综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格?????????????????">南充市分公司营山县双河老林综合网格?????????????????</option>
                                
                                    <option value="南充市分公司营山县城区综合网格???????????????">南充市分公司营山县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格?????????????????">南充市分公司营山县骆市回龙综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格?????????????????">南充市分公司蓬安县城北乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格???????????????">南充市分公司蓬安县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格?????????????????">南充市分公司蓬安县城南乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司西充县城区综合网格???????????????">南充市分公司西充县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司西充县多扶综合网格???????????????">南充市分公司西充县多扶综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格???????????????">南充市分公司阆中市七里综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格???????????????">南充市分公司阆中市古城综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市水观综合网格???????????????">南充市分公司阆中市水观综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格???????????????">南充市分公司顺庆区中城综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格???????????????">南充市分公司顺庆区和平综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区新城综合网格???????????????">南充市分公司顺庆区新城综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格???????????????">南充市分公司高坪区东观综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格???????????????">南充市分公司高坪区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区龙门综合网格???????????????">南充市分公司高坪区龙门综合网格???????????????</option>
                                
                                    <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                                
                                    <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                                
                                    <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                                
                                    <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                                
                                    <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                                
                                    <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                                
                                    <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                                
                                    <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                                
                                    <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                                
                                    <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                                
                                    <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                                
                                    <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                                
                                    <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                                
                                    <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                                
                                    <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                                
                                    <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                                
                                    <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                                
                                    <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                                
                                    <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                                
                                    <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                                
                                    <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                                
                                    <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                                
                                    <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                                
                                    <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                                
                                    <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                                
                                    <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                                
                                    <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                                
                                    <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                                
                                    <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                                
                                    <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                                
                                    <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                                
                                    <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                                
                                    <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                                
                                    <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                                
                                    <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                                
                                    <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                                
                                    <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                                
                                    <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                                
                                    <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                                
                                    <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                                
                                    <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                                
                                    <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                                
                                    <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                                
                                    <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                                
                                    <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                                
                                    <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格???????????????">成都市分公司武侯区望江综合网格???????????????</option>
                                
                                    <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                                
                                    <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                                
                                    <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                                
                                    <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                                
                                    <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                                
                                    <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                                
                                    <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                                
                                    <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                                
                                    <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                                
                                    <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                                
                                    <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                                
                                    <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                                
                                    <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                                
                                    <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                                
                                    <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                                
                                    <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                                
                                    <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                                
                                    <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格???????????????">成都市分公司高新区孵化综合网格???????????????</option>
                                
                                    <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                                
                                    <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                                
                                    <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                                
                                    <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                                
                                    <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                                
                                    <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                                
                                    <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                                
                                    <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                                
                                    <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                                
                                    <option value="测试网格">测试网格</option>
                                
                                    <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                                
                                    <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                                
                                    <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                                
                                    <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                                
                                    <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                                
                                    <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                                
                                    <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                                
                                    <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                                
                                    <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                                
                                    <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                                
                                    <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                                
                                    <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                                
                                    <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                                
                                    <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                                
                                    <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                                
                                    <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                                
                                    <option value="眉山市分公司教育信息化行业销售服务中心�������������������">眉山市分公司教育信息化行业销售服务中心�������������������</option>
                                
                                    <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                                
                                    <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                                
                                    <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格???????????????">绵阳市分公司三台县东区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格???????????????">绵阳市分公司三台县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格???????????????">绵阳市分公司三台县西区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司北川县综合网格?????????????">绵阳市分公司北川县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格??????????????">绵阳市分公司安县北区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格??????????????">绵阳市分公司安县南区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司平武县综合网格?????????????">绵阳市分公司平武县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县乡镇综合网格???????????????">绵阳市分公司梓潼县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格???????????????">绵阳市分公司梓潼县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格????????????????">绵阳市分公司江油市北区一综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格????????????????">绵阳市分公司江油市北区二综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格???????????????">绵阳市分公司江油市城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格????????????????">绵阳市分公司涪城区市中区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格???????????????">绵阳市分公司涪城区花园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格???????????????">绵阳市分公司涪城区高水综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格????????????????">绵阳市分公司游仙区沈家坝综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格????????????????">绵阳市分公司游仙区经开区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区魏城综合网格???????????????">绵阳市分公司游仙区魏城综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格???????????????">绵阳市分公司盐亭县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格???????????????">绵阳市分公司盐亭县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格???????????????">绵阳市分公司高新区普园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格???????????????">绵阳市分公司高新区永石综合网格???????????????</option>
                                
                                    <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                                
                                    <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                                
                                    <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                                
                                    <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                                
                                    <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                                
                                    <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                                
                                    <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                                
                                    <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                                
                                    <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                                
                                    <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                                
                                    <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格???????????????">资阳市分公司乐至县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格???????????????">资阳市分公司乐至县郊区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格???????????????">资阳市分公司安岳县北区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格???????????????">资阳市分公司安岳县南区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格???????????????">资阳市分公司安岳县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格???????????????">资阳市分公司雁江区东区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格???????????????">资阳市分公司雁江区城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格???????????????">资阳市分公司雁江区西区综合网格???????????????</option>
                                
                                    <option value="达州市分公司万源市综合网格">达州市分公司万源市综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                                
                                    <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                                
                                    <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                                
                                    <option value="达州市分公司开江县综合网格">达州市分公司开江县综合网格</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                                
                                    <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                                
                                    <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格">达州市分公司达川区乡镇综合网格</option>
                                
                                    <option value="达州市分公司达川区城区综合网格">达州市分公司达川区城区综合网格</option>
                                
                                    <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格?????????????">遂宁市分公司大英县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司安居区综合网格?????????????">遂宁市分公司安居区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格?????????????">遂宁市分公司射洪县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司船山区综合网格?????????????">遂宁市分公司船山区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格?????????????">遂宁市分公司蓬溪县综合网格?????????????</option>
                                
                                    <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                                
                                    <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                                
                                    <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                                
                                    <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                                
                                    <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                                
                                    <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                                
                                    <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                                
                                    <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                                
                                    <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                                
                                    <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                                
                                    <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                                
                                    <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                                
                                    <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                                
                                    <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                                
                                    <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                                
                                    <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                                
                                    <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                                
                                    <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                                
                                    <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                                
                                    <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                                
                                    <option value=""></option>
                                
                                    <option value="东兴网格">东兴网格</option>
                                
                                    <option value="乐山市分公司犍为乡镇综合网格">乐山市分公司犍为乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为城区综合网格">乐山市分公司犍为城区综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格�������������">凉山州分公司德昌县综合网格�������������</option>
                                
                                    <option value="前锋网格">前锋网格</option>
                                
                                    <option value="华蓥网格">华蓥网格</option>
                                
                                    <option value="协兴网格">协兴网格</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                                
                                    <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                                
                                    <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                                
                                    <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格?">南充市分公司阆中市七里综合网格?</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格?">南充市分公司阆中市古城综合网格?</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                                
                                    <option value="双流区城区综合网格">双流区城区综合网格</option>
                                
                                    <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                                
                                    <option value="双龙网格">双龙网格</option>
                                
                                    <option value="大邑县综合网格">大邑县综合网格</option>
                                
                                    <option value="天府新区综合网格">天府新区综合网格</option>
                                
                                    <option value="小金县综合网格">小金县综合网格</option>
                                
                                    <option value="岳池乡镇网格">岳池乡镇网格</option>
                                
                                    <option value="岳池城区网格">岳池城区网格</option>
                                
                                    <option value="崇州市综合网格">崇州市综合网格</option>
                                
                                    <option value="彭州市综合网格">彭州市综合网格</option>
                                
                                    <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                                
                                    <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                                
                                    <option value="攀枝花市东区炳一综合网格">攀枝花市东区炳一综合网格</option>
                                
                                    <option value="攀枝花市东区炳二综合网格">攀枝花市东区炳二综合网格</option>
                                
                                    <option value="攀枝花市仁和区仁和综合网格">攀枝花市仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市盐边县渔门综合网格">攀枝花市盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市米易县综合网格">攀枝花市米易县综合网格</option>
                                
                                    <option value="攀枝花市西区综合网格">攀枝花市西区综合网格</option>
                                
                                    <option value="新津县综合网格">新津县综合网格</option>
                                
                                    <option value="新都区城区综合网格">新都区城区综合网格</option>
                                
                                    <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                                
                                    <option value="未知">未知</option>
                                
                                    <option value="椑木网格">椑木网格</option>
                                
                                    <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                                
                                    <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                                
                                    <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                                
                                    <option value="武胜城区网格">武胜城区网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格�������������">泸州市分公司合江县综合网格�������������</option>
                                
                                    <option value="温江区综合网格">温江区综合网格</option>
                                
                                    <option value="理县综合网格">理县综合网格</option>
                                
                                    <option value="甜城网格">甜城网格</option>
                                
                                    <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                                
                                    <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                                
                                    <option value="红原县综合网格">红原县综合网格</option>
                                
                                    <option value="经开网格">经开网格</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                                
                                    <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格���������������">自贡市分公司贡井区筱溪综合网格���������������</option>
                                
                                    <option value="茂县综合网格">茂县综合网格</option>
                                
                                    <option value="蒲江县综合网格">蒲江县综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格���������������">达州市分公司大竹县乡镇综合网格���������������</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格���������������">达州市分公司宣汉县城区综合网格���������������</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格��������������">达州市分公司渠县乡镇综合网格��������������</option>
                                
                                    <option value="达州市分公司渠县城区综合网格��������������">达州市分公司渠县城区综合网格��������������</option>
                                
                                    <option value="达州市分公司经开区综合网格�������������">达州市分公司经开区综合网格�������������</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格1���������������">达州市分公司达川区乡镇综合网格1���������������</option>
                                
                                    <option value="达州市分公司达川区城区综合网格���������������">达州市分公司达川区城区综合网格���������������</option>
                                
                                    <option value="达州市分公司通川区城中综合网格���������������">达州市分公司通川区城中综合网格���������������</option>
                                
                                    <option value="连界网格">连界网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                                
                                    <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                                
                                    <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                                
                                    <option value="邛崃市综合网格">邛崃市综合网格</option>
                                
                                    <option value="邻水乡镇网格">邻水乡镇网格</option>
                                
                                    <option value="邻水城区网格">邻水城区网格</option>
                                
                                    <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                                
                                    <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                                
                                    <option value="都江堰市综合网格">都江堰市综合网格</option>
                                
                                    <option value="金堂县综合网格">金堂县综合网格</option>
                                
                                    <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                                
                                    <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                                
                                    <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                                
                                    <option value="金鹅网格">金鹅网格</option>
                                
                                    <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                                
                                    <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                                
                                    <option value="阿坝县综合网格">阿坝县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格�������������">雅安市分公司名山区综合网格�������������</option>
                                
                                    <option value="雅安市分公司石棉县综合网格�������������">雅安市分公司石棉县综合网格�������������</option>
                                
                                    <option value="青白江区综合网格">青白江区综合网格</option>
                                
                                    <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                                
                                    <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                                
                                    <option value="马尔康综合网格">马尔康综合网格</option>
                                
                                    <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                                
                                    <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                                
                                    <option value="高新区西综合网格">高新区西综合网格</option>
                                
                                    <option value="黄家网格">黄家网格</option>
                                
                                    <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                                
                                    <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                                
                                    <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                                
                                    <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                                
                                    <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                                
                                    <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                                
                                    <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                                
                                    <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                                
                                    <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                                
                                    <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                                
                                    <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                                
                                    <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                                
                            
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="from">月均发展量</label>
                        <input type="text" id="from" class="form-control input-sm" style="width: 35px;"
                               name="avgMonthDevFrom">→
                        <input type="text" id="end" class="form-control input-sm" style="width: 35px;"
                               name="avgMonthDevEnd">
                    </div>
                    <div class="form-group">
                        <label for="layerName">给查询命名</label>
                        <input type="text" id="layerName" class="form-control input-sm" style="width: 77px;">
                    </div>
                    <div class="form-group">
                        <a class="btn btn-danger btn-sm searchBtn">查询</a>

                    </div>
                </li>
            </form>
        </div>
        <!--社会渠道条件区域-->
        <div class="socialChannelConditions" style="display: none;">
            <form class="form-inline" id="searchSocForm" method="post">
                <li>
                    <div class="form-group">
                        <label for="storeIdSoc">ID</label>
                        <input type="text" class="form-control input-sm" id="storeIdSoc" name="storeId"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="xdPhone">巡店经理手机号</label>
                        <input type="text" class="form-control input-sm" id="xdPhone" name="xdPhone"
                               style="width: 100px;">
                    </div>

                    <div class="form-group">
                        <label for="typeOfOperationSoc">业态</label>
                        <select id="typeOfOperationSoc" class="form-control input-sm" name="typeOfOperation"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="通讯商圈">通讯商圈</option>
                            <option value="商业区">商业区</option>
                            <option value="学校">学校</option>
                            <option value="社区">社区</option>
                            <option value="街面">街面</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="storeClassSoc">门店类型</label>
                        <select id="storeClassSoc" class="form-control input-sm" name="storeClass"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="终端卖场">终端卖场</option>
                            <option value="通讯店">通讯店</option>
                            <option value="便利店">便利店</option>
                            <option value="异业类(邮政、水电等)">异业类(邮政、水电等)</option>
                            <option value="直销/个体">直销/个体</option>
                            <option value="非临街档口(楼上楼下)">非临街档口(楼上楼下)</option>
                            <option value="其他">其他</option>

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="regionSoc">地域</label>
                        <select id="regionSoc" class="form-control input-sm" name="ragion" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="城区">城区</option>
                            <option value="城郊">城郊</option>
                            <option value="县城">县城</option>
                            <option value="乡镇">乡镇</option>
                            <option value="乡村">乡村</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="measureOfArea">面积</label>
                        <select id="measureOfAreaSoc" name="measureOfArea" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="100平米以上">100平米以上</option>
                            <option value="50-100平米">50-100平米</option>
                            <option value="20-50平米">20-50平米</option>
                            <option value="20平米以下">20平米以下</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="citySoc">地市</label>
                        <select id="citySoc" class="form-control input-sm" name="city" style="width: 65px;">
                            <option value="all">全部</option>
                            
                                
                                    <option value="乐山">乐山</option>
                                
                                    <option value="内江">内江</option>
                                
                                    <option value="凉山州">凉山州</option>
                                
                                    <option value="南充">南充</option>
                                
                                    <option value="宜宾">宜宾</option>
                                
                                    <option value="巴中">巴中</option>
                                
                                    <option value="广元">广元</option>
                                
                                    <option value="广安">广安</option>
                                
                                    <option value="德阳">德阳</option>
                                
                                    <option value="成都">成都</option>
                                
                                    <option value="攀枝花">攀枝花</option>
                                
                                    <option value="泸州">泸州</option>
                                
                                    <option value="测试">测试</option>
                                
                                    <option value="甘孜">甘孜</option>
                                
                                    <option value="眉山">眉山</option>
                                
                                    <option value="绵阳">绵阳</option>
                                
                                    <option value="自贡">自贡</option>
                                
                                    <option value="资阳">资阳</option>
                                
                                    <option value="达州">达州</option>
                                
                                    <option value="遂宁">遂宁</option>
                                
                                    <option value="阿坝">阿坝</option>
                                
                                    <option value="雅安">雅安</option>
                                
                                    <option value=""></option>
                                
                                    <option value="凉山">凉山</option>
                                
                                    <option value="凉山彝族自治州">凉山彝族自治州</option>
                                
                                    <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                                
                                    <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="grid">网格</label>
                        <select id="gridSoc" class="form-control input-sm" name="gridName" style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="未知">未知</option>
                            
                                
                                    <option value="xxx网格">xxx网格</option>
                                
                                    <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                                
                                    <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                                
                                    <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                                
                                    <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                                
                                    <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                                
                                    <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                                
                                    <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                                
                                    <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                                
                                    <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                                
                                    <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                                
                                    <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                                
                                    <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                                
                                    <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                                
                                    <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                                
                                    <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                                
                                    <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                                
                                    <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                                
                                    <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                                
                                    <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                                
                                    <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                                
                                    <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                                
                                    <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                                
                                    <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                                
                                    <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                                
                                    <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                                
                                    <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                                
                                    <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                                
                                    <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                                
                                    <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                                
                                    <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                                
                                    <option value="凉山州分公司普格">凉山州分公司普格</option>
                                
                                    <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                                
                                    <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                                
                                    <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                                
                                    <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                                
                                    <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格???????????????">南充市分公司仪陇县新政综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县金城综合网格???????????????">南充市分公司仪陇县金城综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格???????????????">南充市分公司仪陇县马鞍综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县东区综合网格???????????????">南充市分公司南部县东区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县城区综合网格???????????????">南充市分公司南部县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县西区综合网格???????????????">南充市分公司南部县西区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格???????????????">南充市分公司嘉陵区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格???????????????">南充市分公司嘉陵区金龙综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格?????????????????">南充市分公司营山县双河老林综合网格?????????????????</option>
                                
                                    <option value="南充市分公司营山县城区综合网格???????????????">南充市分公司营山县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格?????????????????">南充市分公司营山县骆市回龙综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格?????????????????">南充市分公司蓬安县城北乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格???????????????">南充市分公司蓬安县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格?????????????????">南充市分公司蓬安县城南乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司西充县城区综合网格???????????????">南充市分公司西充县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司西充县多扶综合网格???????????????">南充市分公司西充县多扶综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格???????????????">南充市分公司阆中市七里综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格???????????????">南充市分公司阆中市古城综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市水观综合网格???????????????">南充市分公司阆中市水观综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格???????????????">南充市分公司顺庆区中城综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格???????????????">南充市分公司顺庆区和平综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区新城综合网格???????????????">南充市分公司顺庆区新城综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格???????????????">南充市分公司高坪区东观综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格???????????????">南充市分公司高坪区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区龙门综合网格???????????????">南充市分公司高坪区龙门综合网格???????????????</option>
                                
                                    <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                                
                                    <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                                
                                    <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                                
                                    <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                                
                                    <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                                
                                    <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                                
                                    <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                                
                                    <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                                
                                    <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                                
                                    <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                                
                                    <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                                
                                    <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                                
                                    <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                                
                                    <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                                
                                    <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                                
                                    <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                                
                                    <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                                
                                    <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                                
                                    <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                                
                                    <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                                
                                    <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                                
                                    <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                                
                                    <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                                
                                    <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                                
                                    <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                                
                                    <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                                
                                    <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                                
                                    <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                                
                                    <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                                
                                    <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                                
                                    <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                                
                                    <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                                
                                    <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                                
                                    <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                                
                                    <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                                
                                    <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                                
                                    <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                                
                                    <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                                
                                    <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                                
                                    <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                                
                                    <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                                
                                    <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                                
                                    <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                                
                                    <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                                
                                    <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                                
                                    <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格???????????????">成都市分公司武侯区望江综合网格???????????????</option>
                                
                                    <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                                
                                    <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                                
                                    <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                                
                                    <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                                
                                    <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                                
                                    <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                                
                                    <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                                
                                    <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                                
                                    <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                                
                                    <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                                
                                    <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                                
                                    <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                                
                                    <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                                
                                    <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                                
                                    <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                                
                                    <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                                
                                    <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                                
                                    <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格???????????????">成都市分公司高新区孵化综合网格???????????????</option>
                                
                                    <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                                
                                    <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                                
                                    <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                                
                                    <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                                
                                    <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                                
                                    <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                                
                                    <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                                
                                    <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                                
                                    <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                                
                                    <option value="测试网格">测试网格</option>
                                
                                    <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                                
                                    <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                                
                                    <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                                
                                    <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                                
                                    <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                                
                                    <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                                
                                    <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                                
                                    <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                                
                                    <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                                
                                    <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                                
                                    <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                                
                                    <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                                
                                    <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                                
                                    <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                                
                                    <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                                
                                    <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                                
                                    <option value="眉山市分公司教育信息化行业销售服务中心�������������������">眉山市分公司教育信息化行业销售服务中心�������������������</option>
                                
                                    <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                                
                                    <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                                
                                    <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格???????????????">绵阳市分公司三台县东区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格???????????????">绵阳市分公司三台县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格???????????????">绵阳市分公司三台县西区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司北川县综合网格?????????????">绵阳市分公司北川县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格??????????????">绵阳市分公司安县北区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格??????????????">绵阳市分公司安县南区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司平武县综合网格?????????????">绵阳市分公司平武县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县乡镇综合网格???????????????">绵阳市分公司梓潼县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格???????????????">绵阳市分公司梓潼县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格????????????????">绵阳市分公司江油市北区一综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格????????????????">绵阳市分公司江油市北区二综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格???????????????">绵阳市分公司江油市城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格????????????????">绵阳市分公司涪城区市中区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格???????????????">绵阳市分公司涪城区花园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格???????????????">绵阳市分公司涪城区高水综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格????????????????">绵阳市分公司游仙区沈家坝综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格????????????????">绵阳市分公司游仙区经开区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区魏城综合网格???????????????">绵阳市分公司游仙区魏城综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格???????????????">绵阳市分公司盐亭县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格???????????????">绵阳市分公司盐亭县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格???????????????">绵阳市分公司高新区普园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格???????????????">绵阳市分公司高新区永石综合网格???????????????</option>
                                
                                    <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                                
                                    <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                                
                                    <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                                
                                    <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                                
                                    <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                                
                                    <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                                
                                    <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                                
                                    <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                                
                                    <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                                
                                    <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                                
                                    <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格???????????????">资阳市分公司乐至县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格???????????????">资阳市分公司乐至县郊区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格???????????????">资阳市分公司安岳县北区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格???????????????">资阳市分公司安岳县南区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格???????????????">资阳市分公司安岳县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格???????????????">资阳市分公司雁江区东区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格???????????????">资阳市分公司雁江区城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格???????????????">资阳市分公司雁江区西区综合网格???????????????</option>
                                
                                    <option value="达州市分公司万源市综合网格">达州市分公司万源市综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                                
                                    <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                                
                                    <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                                
                                    <option value="达州市分公司开江县综合网格">达州市分公司开江县综合网格</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                                
                                    <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                                
                                    <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格">达州市分公司达川区乡镇综合网格</option>
                                
                                    <option value="达州市分公司达川区城区综合网格">达州市分公司达川区城区综合网格</option>
                                
                                    <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格?????????????">遂宁市分公司大英县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司安居区综合网格?????????????">遂宁市分公司安居区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格?????????????">遂宁市分公司射洪县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司船山区综合网格?????????????">遂宁市分公司船山区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格?????????????">遂宁市分公司蓬溪县综合网格?????????????</option>
                                
                                    <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                                
                                    <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                                
                                    <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                                
                                    <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                                
                                    <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                                
                                    <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                                
                                    <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                                
                                    <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                                
                                    <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                                
                                    <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                                
                                    <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                                
                                    <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                                
                                    <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                                
                                    <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                                
                                    <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                                
                                    <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                                
                                    <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                                
                                    <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                                
                                    <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                                
                                    <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                                
                                    <option value=""></option>
                                
                                    <option value="东兴网格">东兴网格</option>
                                
                                    <option value="乐山市分公司犍为乡镇综合网格">乐山市分公司犍为乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为城区综合网格">乐山市分公司犍为城区综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格�������������">凉山州分公司德昌县综合网格�������������</option>
                                
                                    <option value="前锋网格">前锋网格</option>
                                
                                    <option value="华蓥网格">华蓥网格</option>
                                
                                    <option value="协兴网格">协兴网格</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                                
                                    <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                                
                                    <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                                
                                    <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格?">南充市分公司阆中市七里综合网格?</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格?">南充市分公司阆中市古城综合网格?</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                                
                                    <option value="双流区城区综合网格">双流区城区综合网格</option>
                                
                                    <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                                
                                    <option value="双龙网格">双龙网格</option>
                                
                                    <option value="大邑县综合网格">大邑县综合网格</option>
                                
                                    <option value="天府新区综合网格">天府新区综合网格</option>
                                
                                    <option value="小金县综合网格">小金县综合网格</option>
                                
                                    <option value="岳池乡镇网格">岳池乡镇网格</option>
                                
                                    <option value="岳池城区网格">岳池城区网格</option>
                                
                                    <option value="崇州市综合网格">崇州市综合网格</option>
                                
                                    <option value="彭州市综合网格">彭州市综合网格</option>
                                
                                    <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                                
                                    <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                                
                                    <option value="攀枝花市东区炳一综合网格">攀枝花市东区炳一综合网格</option>
                                
                                    <option value="攀枝花市东区炳二综合网格">攀枝花市东区炳二综合网格</option>
                                
                                    <option value="攀枝花市仁和区仁和综合网格">攀枝花市仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市盐边县渔门综合网格">攀枝花市盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市米易县综合网格">攀枝花市米易县综合网格</option>
                                
                                    <option value="攀枝花市西区综合网格">攀枝花市西区综合网格</option>
                                
                                    <option value="新津县综合网格">新津县综合网格</option>
                                
                                    <option value="新都区城区综合网格">新都区城区综合网格</option>
                                
                                    <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                                
                                    <option value="未知">未知</option>
                                
                                    <option value="椑木网格">椑木网格</option>
                                
                                    <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                                
                                    <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                                
                                    <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                                
                                    <option value="武胜城区网格">武胜城区网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格�������������">泸州市分公司合江县综合网格�������������</option>
                                
                                    <option value="温江区综合网格">温江区综合网格</option>
                                
                                    <option value="理县综合网格">理县综合网格</option>
                                
                                    <option value="甜城网格">甜城网格</option>
                                
                                    <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                                
                                    <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                                
                                    <option value="红原县综合网格">红原县综合网格</option>
                                
                                    <option value="经开网格">经开网格</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                                
                                    <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格���������������">自贡市分公司贡井区筱溪综合网格���������������</option>
                                
                                    <option value="茂县综合网格">茂县综合网格</option>
                                
                                    <option value="蒲江县综合网格">蒲江县综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格���������������">达州市分公司大竹县乡镇综合网格���������������</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格���������������">达州市分公司宣汉县城区综合网格���������������</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格��������������">达州市分公司渠县乡镇综合网格��������������</option>
                                
                                    <option value="达州市分公司渠县城区综合网格��������������">达州市分公司渠县城区综合网格��������������</option>
                                
                                    <option value="达州市分公司经开区综合网格�������������">达州市分公司经开区综合网格�������������</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格1���������������">达州市分公司达川区乡镇综合网格1���������������</option>
                                
                                    <option value="达州市分公司达川区城区综合网格���������������">达州市分公司达川区城区综合网格���������������</option>
                                
                                    <option value="达州市分公司通川区城中综合网格���������������">达州市分公司通川区城中综合网格���������������</option>
                                
                                    <option value="连界网格">连界网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                                
                                    <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                                
                                    <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                                
                                    <option value="邛崃市综合网格">邛崃市综合网格</option>
                                
                                    <option value="邻水乡镇网格">邻水乡镇网格</option>
                                
                                    <option value="邻水城区网格">邻水城区网格</option>
                                
                                    <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                                
                                    <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                                
                                    <option value="都江堰市综合网格">都江堰市综合网格</option>
                                
                                    <option value="金堂县综合网格">金堂县综合网格</option>
                                
                                    <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                                
                                    <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                                
                                    <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                                
                                    <option value="金鹅网格">金鹅网格</option>
                                
                                    <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                                
                                    <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                                
                                    <option value="阿坝县综合网格">阿坝县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格�������������">雅安市分公司名山区综合网格�������������</option>
                                
                                    <option value="雅安市分公司石棉县综合网格�������������">雅安市分公司石棉县综合网格�������������</option>
                                
                                    <option value="青白江区综合网格">青白江区综合网格</option>
                                
                                    <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                                
                                    <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                                
                                    <option value="马尔康综合网格">马尔康综合网格</option>
                                
                                    <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                                
                                    <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                                
                                    <option value="高新区西综合网格">高新区西综合网格</option>
                                
                                    <option value="黄家网格">黄家网格</option>
                                
                                    <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                                
                                    <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                                
                                    <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                                
                                    <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                                
                                    <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                                
                                    <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                                
                                    <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                                
                                    <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                                
                                    <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                                
                                    <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                                
                                    <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                                
                                    <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="agency">上级代理商</label>
                        <select id="agency" name="agency" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            
                                
                                    <option value=""></option>
                                
                                    <option value="0">0</option>
                                
                                    <option value="一方通讯代理点">一方通讯代理点</option>
                                
                                    <option value="三台县城区吉顺达合作厅">三台县城区吉顺达合作厅</option>
                                
                                    <option value="三台县城区潼川镇宜为通讯店">三台县城区潼川镇宜为通讯店</option>
                                
                                    <option value="东区百腾电脑商店">东区百腾电脑商店</option>
                                
                                    <option value="东坡城区零距离店">东坡城区零距离店</option>
                                
                                    <option value="中江县玉兴镇琳珑">中江县玉兴镇琳珑</option>
                                
                                    <option value="中江天行鸿图科技">中江天行鸿图科技</option>
                                
                                    <option value="中隆邦邦店家联盟合作厅">中隆邦邦店家联盟合作厅</option>
                                
                                    <option value="乐至宏力平台商">乐至宏力平台商</option>
                                
                                    <option value="五通嘉阳专营店">五通嘉阳专营店</option>
                                
                                    <option value="井研陈菊容代理点">井研陈菊容代理点</option>
                                
                                    <option value="什邡城区鑫生泰">什邡城区鑫生泰</option>
                                
                                    <option value="代市华泰通讯代理店">代市华泰通讯代理店</option>
                                
                                    <option value="内江市东兴区合力通讯">内江市东兴区合力通讯</option>
                                
                                    <option value="内江市丰联通讯">内江市丰联通讯</option>
                                
                                    <option value="创润联通业务代理点">创润联通业务代理点</option>
                                
                                    <option value="剑阁下寺王者通讯代理点">剑阁下寺王者通讯代理点</option>
                                
                                    <option value="北川安昌南桥合作厅">北川安昌南桥合作厅</option>
                                
                                    <option value="华蓥市溪口代理点">华蓥市溪口代理点</option>
                                
                                    <option value="华蓥市祥和代理点">华蓥市祥和代理点</option>
                                
                                    <option value="南部新城永诚合作营业厅">南部新城永诚合作营业厅</option>
                                
                                    <option value="南部新城超亿数码科技专营店">南部新城超亿数码科技专营店</option>
                                
                                    <option value="双龙店家联盟邮政代理点">双龙店家联盟邮政代理点</option>
                                
                                    <option value="古蔺县城区恒波代理点">古蔺县城区恒波代理点</option>
                                
                                    <option value="合江县城区兴沃二合作营业厅">合江县城区兴沃二合作营业厅</option>
                                
                                    <option value="名山高丽琼">名山高丽琼</option>
                                
                                    <option value="嘉陵城区向民专营店">嘉陵城区向民专营店</option>
                                
                                    <option value="嘉陵城区大台北合作厅">嘉陵城区大台北合作厅</option>
                                
                                    <option value="嘉陵曲水合作营业厅">嘉陵曲水合作营业厅</option>
                                
                                    <option value="城区南河佳乐代理点">城区南河佳乐代理点</option>
                                
                                    <option value="城区翼欣合作厅">城区翼欣合作厅</option>
                                
                                    <option value="大竹县鸿兴通讯专营店1">大竹县鸿兴通讯专营店1</option>
                                
                                    <option value="大英融通通讯">大英融通通讯</option>
                                
                                    <option value="天全县巧林通讯">天全县巧林通讯</option>
                                
                                    <option value="太平镇金桥通讯经营店">太平镇金桥通讯经营店</option>
                                
                                    <option value="夹江甘霖果果专营店">夹江甘霖果果专营店</option>
                                
                                    <option value="威远县新场镇宏宇通讯">威远县新场镇宏宇通讯</option>
                                
                                    <option value="安县北区花荄宏鑫合作厅">安县北区花荄宏鑫合作厅</option>
                                
                                    <option value="安居富强通讯">安居富强通讯</option>
                                
                                    <option value="安岳五洋平台商">安岳五洋平台商</option>
                                
                                    <option value="宜宾县天创店家联盟代理点">宜宾县天创店家联盟代理点</option>
                                
                                    <option value="富顺板桥锦莹">富顺板桥锦莹</option>
                                
                                    <option value="射洪恒源通讯">射洪恒源通讯</option>
                                
                                    <option value="射洪旭日通讯">射洪旭日通讯</option>
                                
                                    <option value="岳池县罗渡超越代理点">岳池县罗渡超越代理点</option>
                                
                                    <option value="岳池县青扬代理点">岳池县青扬代理点</option>
                                
                                    <option value="峨眉桂花桥先达店家联盟">峨眉桂花桥先达店家联盟</option>
                                
                                    <option value="峨边战友代理点">峨边战友代理点</option>
                                
                                    <option value="市中区华峰">市中区华峰</option>
                                
                                    <option value="市中区苏稽华信专营店">市中区苏稽华信专营店</option>
                                
                                    <option value="广元三信">广元三信</option>
                                
                                    <option value="广安区城北厚街代理点">广安区城北厚街代理点</option>
                                
                                    <option value="广安市广安区壹加壹通讯代理点">广安市广安区壹加壹通讯代理点</option>
                                
                                    <option value="广安市锦睿代理店">广安市锦睿代理店</option>
                                
                                    <option value="店家联盟小金星毅">店家联盟小金星毅</option>
                                
                                    <option value="店家联盟阿坝县腾飞">店家联盟阿坝县腾飞</option>
                                
                                    <option value="彭山创利店家联盟">彭山创利店家联盟</option>
                                
                                    <option value="德昌县圣达店家联盟">德昌县圣达店家联盟</option>
                                
                                    <option value="成都爱美莱">成都爱美莱</option>
                                
                                    <option value="旌阳城区明辰智享">旌阳城区明辰智享</option>
                                
                                    <option value="旺苍天星白正伟专营店">旺苍天星白正伟专营店</option>
                                
                                    <option value="旺苍鸿宇通讯器材代理点">旺苍鸿宇通讯器材代理点</option>
                                
                                    <option value="昊天店家联盟">昊天店家联盟</option>
                                
                                    <option value="李春燕代理点">李春燕代理点</option>
                                
                                    <option value="梓潼嘉信合作厅">梓潼嘉信合作厅</option>
                                
                                    <option value="武胜县中通代理点">武胜县中通代理点</option>
                                
                                    <option value="江油城区博峰合作厅">江油城区博峰合作厅</option>
                                
                                    <option value="沐川四海店家联盟专营店">沐川四海店家联盟专营店</option>
                                
                                    <option value="沐川诚信专营店">沐川诚信专营店</option>
                                
                                    <option value="沙湾姚福枝店家联盟代理点">沙湾姚福枝店家联盟代理点</option>
                                
                                    <option value="沙湾福禄鸿远">沙湾福禄鸿远</option>
                                
                                    <option value="泸县鼎恒盛代理点">泸县鼎恒盛代理点</option>
                                
                                    <option value="涪城花园远望合作厅">涪城花园远望合作厅</option>
                                
                                    <option value="游仙御营坝网格翔宇合作厅">游仙御营坝网格翔宇合作厅</option>
                                
                                    <option value="游仙经开区网格昕鑫欣合作厅">游仙经开区网格昕鑫欣合作厅</option>
                                
                                    <option value="犍为张琼英专营店">犍为张琼英专营店</option>
                                
                                    <option value="犍为榨古罗光容代理点">犍为榨古罗光容代理点</option>
                                
                                    <option value="理县胜者科技">理县胜者科技</option>
                                
                                    <option value="盐亭北区富驿鑫浪合作厅">盐亭北区富驿鑫浪合作厅</option>
                                
                                    <option value="红原恒远通讯">红原恒远通讯</option>
                                
                                    <option value="纳溪区综合网格二维码代理点">纳溪区综合网格二维码代理点</option>
                                
                                    <option value="纳溪综合网格联合通讯专营店">纳溪综合网格联合通讯专营店</option>
                                
                                    <option value="绵竹城区鑫生泰科技">绵竹城区鑫生泰科技</option>
                                
                                    <option value="绵阳江油城区精联通讯工业技术学校">绵阳江油城区精联通讯工业技术学校</option>
                                
                                    <option value="罗江明辰智享">罗江明辰智享</option>
                                
                                    <option value="船山旭日通讯">船山旭日通讯</option>
                                
                                    <option value="苍溪五龙汪鑫代理点">苍溪五龙汪鑫代理点</option>
                                
                                    <option value="苍溪县邱源代理点">苍溪县邱源代理点</option>
                                
                                    <option value="苍溪歧坪邢书维代理点">苍溪歧坪邢书维代理点</option>
                                
                                    <option value="茂县超讯通讯">茂县超讯通讯</option>
                                
                                    <option value="荣县长山平杰">荣县长山平杰</option>
                                
                                    <option value="营山北坝合作厅">营山北坝合作厅</option>
                                
                                    <option value="营山双河合作厅">营山双河合作厅</option>
                                
                                    <option value="营山西桥袁明合作营业厅">营山西桥袁明合作营业厅</option>
                                
                                    <option value="营山金捷专营店">营山金捷专营店</option>
                                
                                    <option value="营山鑫隆合作厅">营山鑫隆合作厅</option>
                                
                                    <option value="蓬安县河舒镇诚信电脑代理店">蓬安县河舒镇诚信电脑代理店</option>
                                
                                    <option value="蓬安城北诸家合作厅">蓬安城北诸家合作厅</option>
                                
                                    <option value="蓬安城南利溪顺发合作厅">蓬安城南利溪顺发合作厅</option>
                                
                                    <option value="蓬安城南银汉鹏宇合作厅">蓬安城南银汉鹏宇合作厅</option>
                                
                                    <option value="蓬安新天地专营店">蓬安新天地专营店</option>
                                
                                    <option value="蓬溪县天程通信">蓬溪县天程通信</option>
                                
                                    <option value="西充城区北街合作厅">西充城区北街合作厅</option>
                                
                                    <option value="西充城区诚泰合作厅">西充城区诚泰合作厅</option>
                                
                                    <option value="贡井筱溪龙腾">贡井筱溪龙腾</option>
                                
                                    <option value="速讯店家联盟代理点">速讯店家联盟代理点</option>
                                
                                    <option value="遂宁金诚顺科技">遂宁金诚顺科技</option>
                                
                                    <option value="邻水县宏盛通讯代理点">邻水县宏盛通讯代理点</option>
                                
                                    <option value="邻水县王家金诚代理点">邻水县王家金诚代理点</option>
                                
                                    <option value="金口河华洋代理点">金口河华洋代理点</option>
                                
                                    <option value="金牛国宾网联">金牛国宾网联</option>
                                
                                    <option value="金牛沙湾正龙">金牛沙湾正龙</option>
                                
                                    <option value="鑫沃店家联盟">鑫沃店家联盟</option>
                                
                                    <option value="阆中七里亚泰代理店">阆中七里亚泰代理店</option>
                                
                                    <option value="阆中古城海发合作厅">阆中古城海发合作厅</option>
                                
                                    <option value="隆昌县金鹅镇荣诚">隆昌县金鹅镇荣诚</option>
                                
                                    <option value="隆昌县金鹅镇鼎诚">隆昌县金鹅镇鼎诚</option>
                                
                                    <option value="雁江旗舰平台商">雁江旗舰平台商</option>
                                
                                    <option value="雅安汉源九襄然然通讯合作厅">雅安汉源九襄然然通讯合作厅</option>
                                
                                    <option value="雅安石棉县创新广告工作室">雅安石棉县创新广告工作室</option>
                                
                                    <option value="雨城北万家福商行">雨城北万家福商行</option>
                                
                                    <option value="青川大院代理点">青川大院代理点</option>
                                
                                    <option value="青羊太升君临">青羊太升君临</option>
                                
                                    <option value="青羊金沙梅鑫嘉仪">青羊金沙梅鑫嘉仪</option>
                                
                                    <option value="顺庆中城明宵数码合作厅">顺庆中城明宵数码合作厅</option>
                                
                                    <option value="顺庆中城洪飞合作厅">顺庆中城洪飞合作厅</option>
                                
                                    <option value="顺庆和平骏驰合作厅">顺庆和平骏驰合作厅</option>
                                
                                    <option value="马尔康朵唯手机销售部">马尔康朵唯手机销售部</option>
                                
                                    <option value="马边苏坝超强代理点">马边苏坝超强代理点</option>
                                
                                    <option value="马鞍龙腾营业厅">马鞍龙腾营业厅</option>
                                
                                    <option value="高新永石炎彬合作厅">高新永石炎彬合作厅</option>
                                
                                    <option value="高新永石骏盛合作厅">高新永石骏盛合作厅</option>
                                
                                    <option value="龙马潭区睛彩代理点">龙马潭区睛彩代理点</option>
                                
                            
                        </select>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="unicomDoorHeaderSoc">是否有联通门头</label>
                        <select id="unicomDoorHeaderSoc" name="unicomDoorHeader" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="unicomAdSoc">是否有联通广告</label>
                        <select id="unicomAdSoc" class="form-control input-sm" name="unicomAd" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="phoneStickerSoc">是否有手机专柜</label>
                        <select id="phoneStickerSoc" name="phoneSticker" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="allDaysFrom">C_累计</label>
                        <input id="allDaysFrom" name="allDaysFrom" class="form-control input-sm" style="width: 60px;">
                        <input id="allDaysEnd" name="allDaysEnd" class="form-control input-sm" style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="thirtyDaysFrom">C_30天发展</label>
                        <input id="thirtyDaysFrom" name="thirtyDaysFrom" class="form-control input-sm"
                               style="width: 60px;">
                        <input id="thirtyDaysEnd" name="thirtyDaysEnd" class="form-control input-sm"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="sixtyDaysFrom">C_60天发展</label>
                        <input id="sixtyDaysFrom" name="sixtyDaysFrom" class="form-control input-sm"
                               style="width: 60px;">
                        <input id="sixtyDaysEnd" name="sixtyDaysEnd" class="form-control input-sm" style="width: 60px;">
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="registerTimeFrom">C_注册时间</label>
                        <input id="registerTimeFrom" name="registerTimeFrom" class="form-control input-sm"
                               style="width: 60px;">
                        <input id="registerTimeEnd" name="registerTimeEnd" class="form-control input-sm"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="loginTimeFrom">C_登录时间</label>
                        <input id="loginTimeFrom" name="loginTimeFrom" class="form-control input-sm"
                               style="width: 60px;">
                        <input id="loginTimeEnd" name="loginTimeEnd" class="form-control input-sm" style="width: 60px;">
                    </div>

                    <div class="form-group">
                        <label for="layerName">给查询命名</label>
                        <input type="text" id="layerNameSoc" class="form-control input-sm" style="width: 77px;">
                    </div>
                    <div class="form-group">
                        <a class="btn btn-danger btn-sm searchBtn">查询</a>

                    </div>
                </li>
            </form>

        </div>
        
        <div class="selfChannelConditions" style="display: none">
            <form id="searchSelfForm" class="form-inline" method="post">
                <li>
                    <div class="form-group">
                        <label for="storeIdSelf">ID</label>
                        <input type="text" class="form-control input-sm" id="storeIdSelf" name="storeId"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="channelNumberSelf">渠道编码</label>
                        <input type="text" class="form-control input-sm" id="channelNumberSelf" name="channelNumber"
                               style="width: 60px;">
                    </div>
                    <div class="form-group">
                        <label for="xdPhoneSelf">巡店人员手机号</label>
                        <input type="text" class="form-control input-sm" id="xdPhoneSelf" name="xdPhone"
                               style="width: 100px;">
                    </div>
                    <div class="form-group">
                        <label for="typeOfOperation">业态</label>
                        <select id="typeOfOperationSelf" class="form-control input-sm" name="typeOfOperation"
                                style="width: 80px;">
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
                    <div class="form-group">
                        <label for="classOfManage">运营方式_DB</label>
                        <select id="classOfManageSelf" class="form-control input-sm" name="classOfManage"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="他营">他营</option>
                            <option value="自营">自营</option>
                            <option value="柜台外包">柜台外包</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="storeClassDB">门店类型_DB</label>
                        <select id="storeClassDB" class="form-control input-sm" name="storeClassDB"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="发展型A级">发展型A级</option>
                            <option value="发展型B级">发展型B级</option>
                            <option value="发展型S级">发展型S级</option>
                            <option value="发展型AD级">发展型AD级</option>
                            <option value="发展型BD级">发展型BD级</option>
                            <option value="发展型SD级">发展型SD级</option>
                            <option value="服务型B级">服务型B级</option>
                            <option value="服务型BD级">服务型BD级</option>
                            <option value="服务型CD级">服务型CD级</option>
                            <option value="问题型C级">问题型C级</option>
                            <option value="问题型CD级">问题型CD级</option>
                            <option value="综合型A级">综合型A级</option>
                            <option value="综合型S级">综合型S级</option>
                            <option value="综合型AD级">综合型AD级</option>
                            <option value="综合型SD级">综合型SD级</option>
                            <option value="未评级">未评级</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="channelClass">渠道类型DB</label>
                        <select id="channelClassSelf" class="form-control input-sm" name="channelClass"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="标准营业厅(BSDM)">标准营业厅(BSDM)</option>
                            <option value="旗舰营业厅(BSDM)">旗舰营业厅(BSDM)</option>
                            <option value="小型营业厅(BSDM)">小型营业厅(BSDM)</option>
                            <option value=""></option>
                            <option value=""></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="storeClass">门店类型</label>
                        <select id="storeClassSelf" class="form-control input-sm" name="storeClass"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="联通专营店">联通专营店</option>
                            <option value="代理点">代理点</option>
                            <option value="开放型终端卖场">开放型终端卖场</option>
                            <option value="社区沃店(宽带)">社区沃店(宽带)</option>
                            <option value="联通专营终端卖场">联通专营终端卖场</option>
                            <option value="移动排他终端卖场">移动排他终端卖场</option>
                            <option value="电信排他终端卖场">电信排他终端卖场</option>
                        </select>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <label for="region">地域</label>
                        <select id="regionSelf" class="form-control input-sm" name="region" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="城区">城区</option>
                            <option value="城郊">城郊</option>
                            <option value="县城">县城</option>
                            <option value="乡镇">乡镇</option>
                            <option value="乡村">乡村</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="measureOfArea">面积</label>
                        <select id="measureOfAreaSelf" name="measureOfArea" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="100平米以上">100平米以上</option>
                            <option value="50-100平米">50-100平米</option>
                            <option value="20-50平米">20-50平米</option>
                            <option value="20平米以下">20平米以下</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="countOfClerk">店员人数</label>
                        <select id="countOfClerkSelf" name="countOfClerk" class="form-control input-sm"
                                style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="10人以上">10人以上</option>
                            <option value="7-10人">7-10人</option>
                            <option value="4-6人">4-6人</option>
                            <option value="3人以下">3人以下</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="city">地市</label>
                        <select id="citySelf" class="form-control input-sm" name="city" style="width: 65px;">
                            <option value="all">全部</option>
                            
                                
                                    <option value="乐山">乐山</option>
                                
                                    <option value="内江">内江</option>
                                
                                    <option value="凉山州">凉山州</option>
                                
                                    <option value="南充">南充</option>
                                
                                    <option value="宜宾">宜宾</option>
                                
                                    <option value="巴中">巴中</option>
                                
                                    <option value="广元">广元</option>
                                
                                    <option value="广安">广安</option>
                                
                                    <option value="德阳">德阳</option>
                                
                                    <option value="成都">成都</option>
                                
                                    <option value="攀枝花">攀枝花</option>
                                
                                    <option value="泸州">泸州</option>
                                
                                    <option value="测试">测试</option>
                                
                                    <option value="甘孜">甘孜</option>
                                
                                    <option value="眉山">眉山</option>
                                
                                    <option value="绵阳">绵阳</option>
                                
                                    <option value="自贡">自贡</option>
                                
                                    <option value="资阳">资阳</option>
                                
                                    <option value="达州">达州</option>
                                
                                    <option value="遂宁">遂宁</option>
                                
                                    <option value="阿坝">阿坝</option>
                                
                                    <option value="雅安">雅安</option>
                                
                                    <option value=""></option>
                                
                                    <option value="凉山">凉山</option>
                                
                                    <option value="凉山彝族自治州">凉山彝族自治州</option>
                                
                                    <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                                
                                    <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="grid">网格</label>
                        <select id="gridSelf" class="form-control input-sm" name="gridName" style="width: 65px;">
                            <option value="all">全部</option>
                            <option value="未知">未知</option>
                            
                                
                                    <option value="xxx网格">xxx网格</option>
                                
                                    <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                                
                                    <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                                
                                    <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                                
                                    <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                                
                                    <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                                
                                    <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                                
                                    <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                                
                                    <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                                
                                    <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                                
                                    <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                                
                                    <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                                
                                    <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                                
                                    <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                                
                                    <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                                
                                    <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                                
                                    <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                                
                                    <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                                
                                    <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                                
                                    <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                                
                                    <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                                
                                    <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                                
                                    <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                                
                                    <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                                
                                    <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                                
                                    <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                                
                                    <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                                
                                    <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                                
                                    <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                                
                                    <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                                
                                    <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                                
                                    <option value="凉山州分公司普格">凉山州分公司普格</option>
                                
                                    <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                                
                                    <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                                
                                    <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                                
                                    <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                                
                                    <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格???????????????">南充市分公司仪陇县新政综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县金城综合网格???????????????">南充市分公司仪陇县金城综合网格???????????????</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格???????????????">南充市分公司仪陇县马鞍综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县东区综合网格???????????????">南充市分公司南部县东区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县城区综合网格???????????????">南充市分公司南部县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司南部县西区综合网格???????????????">南充市分公司南部县西区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格???????????????">南充市分公司嘉陵区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格???????????????">南充市分公司嘉陵区金龙综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格?????????????????">南充市分公司营山县双河老林综合网格?????????????????</option>
                                
                                    <option value="南充市分公司营山县城区综合网格???????????????">南充市分公司营山县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格?????????????????">南充市分公司营山县骆市回龙综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格?????????????????">南充市分公司蓬安县城北乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格???????????????">南充市分公司蓬安县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格?????????????????">南充市分公司蓬安县城南乡镇综合网格?????????????????</option>
                                
                                    <option value="南充市分公司西充县城区综合网格???????????????">南充市分公司西充县城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司西充县多扶综合网格???????????????">南充市分公司西充县多扶综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格???????????????">南充市分公司阆中市七里综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格???????????????">南充市分公司阆中市古城综合网格???????????????</option>
                                
                                    <option value="南充市分公司阆中市水观综合网格???????????????">南充市分公司阆中市水观综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格???????????????">南充市分公司顺庆区中城综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格???????????????">南充市分公司顺庆区和平综合网格???????????????</option>
                                
                                    <option value="南充市分公司顺庆区新城综合网格???????????????">南充市分公司顺庆区新城综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格???????????????">南充市分公司高坪区东观综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格???????????????">南充市分公司高坪区城区综合网格???????????????</option>
                                
                                    <option value="南充市分公司高坪区龙门综合网格???????????????">南充市分公司高坪区龙门综合网格???????????????</option>
                                
                                    <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                                
                                    <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                                
                                    <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                                
                                    <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                                
                                    <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                                
                                    <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                                
                                    <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                                
                                    <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                                
                                    <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                                
                                    <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                                
                                    <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                                
                                    <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                                
                                    <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                                
                                    <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                                
                                    <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                                
                                    <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                                
                                    <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                                
                                    <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                                
                                    <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                                
                                    <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                                
                                    <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                                
                                    <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                                
                                    <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                                
                                    <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                                
                                    <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                                
                                    <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                                
                                    <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                                
                                    <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                                
                                    <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                                
                                    <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                                
                                    <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                                
                                    <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                                
                                    <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                                
                                    <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                                
                                    <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                                
                                    <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                                
                                    <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                                
                                    <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                                
                                    <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                                
                                    <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                                
                                    <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                                
                                    <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                                
                                    <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                                
                                    <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                                
                                    <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                                
                                    <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                                
                                    <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                                
                                    <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                                
                                    <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                                
                                    <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                                
                                    <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                                
                                    <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                                
                                    <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                                
                                    <option value="成都市分公司武侯区望江综合网格???????????????">成都市分公司武侯区望江综合网格???????????????</option>
                                
                                    <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                                
                                    <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                                
                                    <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                                
                                    <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                                
                                    <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                                
                                    <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                                
                                    <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                                
                                    <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                                
                                    <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                                
                                    <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                                
                                    <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                                
                                    <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                                
                                    <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                                
                                    <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                                
                                    <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                                
                                    <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                                
                                    <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                                
                                    <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                                
                                    <option value="成都市分公司高新区孵化综合网格???????????????">成都市分公司高新区孵化综合网格???????????????</option>
                                
                                    <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                                
                                    <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                                
                                    <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                                
                                    <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                                
                                    <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                                
                                    <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                                
                                    <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                                
                                    <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                                
                                    <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                                
                                    <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                                
                                    <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                                
                                    <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                                
                                    <option value="测试网格">测试网格</option>
                                
                                    <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                                
                                    <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                                
                                    <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                                
                                    <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                                
                                    <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                                
                                    <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                                
                                    <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                                
                                    <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                                
                                    <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                                
                                    <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                                
                                    <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                                
                                    <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                                
                                    <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                                
                                    <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                                
                                    <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                                
                                    <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                                
                                    <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                                
                                    <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                                
                                    <option value="眉山市分公司教育信息化行业销售服务中心�������������������">眉山市分公司教育信息化行业销售服务中心�������������������</option>
                                
                                    <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                                
                                    <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                                
                                    <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格???????????????">绵阳市分公司三台县东区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格???????????????">绵阳市分公司三台县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格???????????????">绵阳市分公司三台县西区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司北川县综合网格?????????????">绵阳市分公司北川县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格??????????????">绵阳市分公司安县北区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格??????????????">绵阳市分公司安县南区综合网格??????????????</option>
                                
                                    <option value="绵阳市分公司平武县综合网格?????????????">绵阳市分公司平武县综合网格?????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县乡镇综合网格???????????????">绵阳市分公司梓潼县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格???????????????">绵阳市分公司梓潼县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格????????????????">绵阳市分公司江油市北区一综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格????????????????">绵阳市分公司江油市北区二综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格???????????????">绵阳市分公司江油市城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格????????????????">绵阳市分公司涪城区市中区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格???????????????">绵阳市分公司涪城区花园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格???????????????">绵阳市分公司涪城区高水综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格????????????????">绵阳市分公司游仙区沈家坝综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格????????????????">绵阳市分公司游仙区经开区综合网格????????????????</option>
                                
                                    <option value="绵阳市分公司游仙区魏城综合网格???????????????">绵阳市分公司游仙区魏城综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格???????????????">绵阳市分公司盐亭县乡镇综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格???????????????">绵阳市分公司盐亭县城区综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格???????????????">绵阳市分公司高新区普园综合网格???????????????</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格???????????????">绵阳市分公司高新区永石综合网格???????????????</option>
                                
                                    <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                                
                                    <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                                
                                    <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                                
                                    <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                                
                                    <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                                
                                    <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                                
                                    <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                                
                                    <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                                
                                    <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                                
                                    <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                                
                                    <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格???????????????">资阳市分公司乐至县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格???????????????">资阳市分公司乐至县郊区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格???????????????">资阳市分公司安岳县北区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格???????????????">资阳市分公司安岳县南区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格???????????????">资阳市分公司安岳县城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格???????????????">资阳市分公司雁江区东区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格???????????????">资阳市分公司雁江区城区综合网格???????????????</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格???????????????">资阳市分公司雁江区西区综合网格???????????????</option>
                                
                                    <option value="达州市分公司万源市综合网格">达州市分公司万源市综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                                
                                    <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                                
                                    <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                                
                                    <option value="达州市分公司开江县综合网格">达州市分公司开江县综合网格</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                                
                                    <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                                
                                    <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格">达州市分公司达川区乡镇综合网格</option>
                                
                                    <option value="达州市分公司达川区城区综合网格">达州市分公司达川区城区综合网格</option>
                                
                                    <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格?????????????">遂宁市分公司大英县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司安居区综合网格?????????????">遂宁市分公司安居区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格?????????????">遂宁市分公司射洪县综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司船山区综合网格?????????????">遂宁市分公司船山区综合网格?????????????</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格?????????????">遂宁市分公司蓬溪县综合网格?????????????</option>
                                
                                    <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                                
                                    <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                                
                                    <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                                
                                    <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                                
                                    <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                                
                                    <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                                
                                    <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                                
                                    <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                                
                                    <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                                
                                    <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                                
                                    <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                                
                                    <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                                
                                    <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                                
                                    <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                                
                                    <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                                
                                    <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                                
                                    <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                                
                                    <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                                
                                    <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                                
                                    <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                                
                                    <option value=""></option>
                                
                                    <option value="东兴网格">东兴网格</option>
                                
                                    <option value="乐山市分公司犍为乡镇综合网格">乐山市分公司犍为乡镇综合网格</option>
                                
                                    <option value="乐山市分公司犍为城区综合网格">乐山市分公司犍为城区综合网格</option>
                                
                                    <option value="凉山州分公司德昌县综合网格�������������">凉山州分公司德昌县综合网格�������������</option>
                                
                                    <option value="前锋网格">前锋网格</option>
                                
                                    <option value="华蓥网格">华蓥网格</option>
                                
                                    <option value="协兴网格">协兴网格</option>
                                
                                    <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                                
                                    <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                                
                                    <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                                
                                    <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                                
                                    <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                                
                                    <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                                
                                    <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                                
                                    <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格?">南充市分公司阆中市七里综合网格?</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格?">南充市分公司阆中市古城综合网格?</option>
                                
                                    <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                                
                                    <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                                
                                    <option value="双流区城区综合网格">双流区城区综合网格</option>
                                
                                    <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                                
                                    <option value="双龙网格">双龙网格</option>
                                
                                    <option value="大邑县综合网格">大邑县综合网格</option>
                                
                                    <option value="天府新区综合网格">天府新区综合网格</option>
                                
                                    <option value="小金县综合网格">小金县综合网格</option>
                                
                                    <option value="岳池乡镇网格">岳池乡镇网格</option>
                                
                                    <option value="岳池城区网格">岳池城区网格</option>
                                
                                    <option value="崇州市综合网格">崇州市综合网格</option>
                                
                                    <option value="彭州市综合网格">彭州市综合网格</option>
                                
                                    <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                                
                                    <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                                
                                    <option value="攀枝花市东区炳一综合网格">攀枝花市东区炳一综合网格</option>
                                
                                    <option value="攀枝花市东区炳二综合网格">攀枝花市东区炳二综合网格</option>
                                
                                    <option value="攀枝花市仁和区仁和综合网格">攀枝花市仁和区仁和综合网格</option>
                                
                                    <option value="攀枝花市盐边县渔门综合网格">攀枝花市盐边县渔门综合网格</option>
                                
                                    <option value="攀枝花市米易县综合网格">攀枝花市米易县综合网格</option>
                                
                                    <option value="攀枝花市西区综合网格">攀枝花市西区综合网格</option>
                                
                                    <option value="新津县综合网格">新津县综合网格</option>
                                
                                    <option value="新都区城区综合网格">新都区城区综合网格</option>
                                
                                    <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                                
                                    <option value="未知">未知</option>
                                
                                    <option value="椑木网格">椑木网格</option>
                                
                                    <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                                
                                    <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                                
                                    <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                                
                                    <option value="武胜城区网格">武胜城区网格</option>
                                
                                    <option value="泸州市分公司合江县综合网格�������������">泸州市分公司合江县综合网格�������������</option>
                                
                                    <option value="温江区综合网格">温江区综合网格</option>
                                
                                    <option value="理县综合网格">理县综合网格</option>
                                
                                    <option value="甜城网格">甜城网格</option>
                                
                                    <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                                
                                    <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                                
                                    <option value="红原县综合网格">红原县综合网格</option>
                                
                                    <option value="经开网格">经开网格</option>
                                
                                    <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                                
                                    <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                                
                                    <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                                
                                    <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                                
                                    <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                                
                                    <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                                
                                    <option value="自贡市分公司贡井区筱溪综合网格���������������">自贡市分公司贡井区筱溪综合网格���������������</option>
                                
                                    <option value="茂县综合网格">茂县综合网格</option>
                                
                                    <option value="蒲江县综合网格">蒲江县综合网格</option>
                                
                                    <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                                
                                    <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                                
                                    <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                                
                                    <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                                
                                    <option value="达州市分公司大竹县乡镇综合网格���������������">达州市分公司大竹县乡镇综合网格���������������</option>
                                
                                    <option value="达州市分公司宣汉县城区综合网格���������������">达州市分公司宣汉县城区综合网格���������������</option>
                                
                                    <option value="达州市分公司渠县乡镇综合网格��������������">达州市分公司渠县乡镇综合网格��������������</option>
                                
                                    <option value="达州市分公司渠县城区综合网格��������������">达州市分公司渠县城区综合网格��������������</option>
                                
                                    <option value="达州市分公司经开区综合网格�������������">达州市分公司经开区综合网格�������������</option>
                                
                                    <option value="达州市分公司达川区乡镇综合网格1���������������">达州市分公司达川区乡镇综合网格1���������������</option>
                                
                                    <option value="达州市分公司达川区城区综合网格���������������">达州市分公司达川区城区综合网格���������������</option>
                                
                                    <option value="达州市分公司通川区城中综合网格���������������">达州市分公司通川区城中综合网格���������������</option>
                                
                                    <option value="连界网格">连界网格</option>
                                
                                    <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                                
                                    <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                                
                                    <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                                
                                    <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                                
                                    <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                                
                                    <option value="邛崃市综合网格">邛崃市综合网格</option>
                                
                                    <option value="邻水乡镇网格">邻水乡镇网格</option>
                                
                                    <option value="邻水城区网格">邻水城区网格</option>
                                
                                    <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                                
                                    <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                                
                                    <option value="都江堰市综合网格">都江堰市综合网格</option>
                                
                                    <option value="金堂县综合网格">金堂县综合网格</option>
                                
                                    <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                                
                                    <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                                
                                    <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                                
                                    <option value="金鹅网格">金鹅网格</option>
                                
                                    <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                                
                                    <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                                
                                    <option value="阿坝县综合网格">阿坝县综合网格</option>
                                
                                    <option value="雅安市分公司名山区综合网格�������������">雅安市分公司名山区综合网格�������������</option>
                                
                                    <option value="雅安市分公司石棉县综合网格�������������">雅安市分公司石棉县综合网格�������������</option>
                                
                                    <option value="青白江区综合网格">青白江区综合网格</option>
                                
                                    <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                                
                                    <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                                
                                    <option value="马尔康综合网格">马尔康综合网格</option>
                                
                                    <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                                
                                    <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                                
                                    <option value="高新区西综合网格">高新区西综合网格</option>
                                
                                    <option value="黄家网格">黄家网格</option>
                                
                                    <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                                
                                    <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                                
                                    <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                                
                                    <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                                
                                    <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                                
                                    <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                                
                                    <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                                
                                    <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                                
                                    <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                                
                                    <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                                
                                    <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                                
                                    <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                                
                                    <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                                
                                    <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                                
                                    <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                                
                                    <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                                
                                    <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                                
                                    <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                                
                                    <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                                
                                    <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                                
                                    <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                                
                                    <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                                
                                    <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                                
                                    <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                                
                                    <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                                
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="zhiHuiWoJia">智慧沃家体验区</label>
                        <select id="zhiHuiWoJia" name="zhiHuiWoJia" class="form-control input-sm" style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tingNeiDuoYeTai">厅内多业态</label>
                        <select id="tingNeiDuoYeTai" name="tingNeiDuoYeTai" class="form-control input-sm"
                                style="width: 80px;">
                            <option value="all">全部</option>
                            <option value="是">有</option>
                            <option value="否">无</option>
                        </select>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="layerName">给查询命名</label>
                        <input type="text" id="layerNameSelf" class="form-control input-sm" style="width: 77px;">
                    </div>
                    <div class="form-group">
                        <a class="btn btn-danger btn-sm searchBtn">查询</a>
                    </div>
                </li>
            </form>

        </div>
        <div class="baseStationConditions" style="display: none;">
            <form class="form-inline" id="searchBaseStationForm" method="post">
                <div class="form-group">
                    <label for="cityBS">地市</label>
                    <select id="cityBS" class="form-control input-sm" name="city" style="width: 100px;">
                        
                            
                                <option value="乐山">乐山</option>
                            
                                <option value="内江">内江</option>
                            
                                <option value="凉山州">凉山州</option>
                            
                                <option value="南充">南充</option>
                            
                                <option value="宜宾">宜宾</option>
                            
                                <option value="巴中">巴中</option>
                            
                                <option value="广元">广元</option>
                            
                                <option value="广安">广安</option>
                            
                                <option value="德阳">德阳</option>
                            
                                <option value="成都">成都</option>
                            
                                <option value="攀枝花">攀枝花</option>
                            
                                <option value="泸州">泸州</option>
                            
                                <option value="测试">测试</option>
                            
                                <option value="甘孜">甘孜</option>
                            
                                <option value="眉山">眉山</option>
                            
                                <option value="绵阳">绵阳</option>
                            
                                <option value="自贡">自贡</option>
                            
                                <option value="资阳">资阳</option>
                            
                                <option value="达州">达州</option>
                            
                                <option value="遂宁">遂宁</option>
                            
                                <option value="阿坝">阿坝</option>
                            
                                <option value="雅安">雅安</option>
                            
                                <option value=""></option>
                            
                                <option value="凉山">凉山</option>
                            
                                <option value="凉山彝族自治州">凉山彝族自治州</option>
                            
                                <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                            
                                <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                            
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="gridBS">
                        网格
                    </label>
                    <select id="gridBS" class="form-control input-sm" name="grid" style="width: 100px;">
                        <option value="all">全部</option>
                        
                            
                                <option value="xxx网格">xxx网格</option>
                            
                                <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                            
                                <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                            
                                <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                            
                                <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                            
                                <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                            
                                <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                            
                                <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                            
                                <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                            
                                <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                            
                                <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                            
                                <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                            
                                <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                            
                                <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                            
                                <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                            
                                <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                            
                                <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                            
                                <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                            
                                <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                            
                                <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                            
                                <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                            
                                <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                            
                                <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                            
                                <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                            
                                <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                            
                                <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                            
                                <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                            
                                <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                            
                                <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                            
                                <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                            
                                <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                            
                                <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                            
                                <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                            
                                <option value="凉山州分公司普格">凉山州分公司普格</option>
                            
                                <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                            
                                <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                            
                                <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                            
                                <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                            
                                <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                            
                                <option value="南充市分公司仪陇县新政综合网格???????????????">南充市分公司仪陇县新政综合网格???????????????</option>
                            
                                <option value="南充市分公司仪陇县金城综合网格???????????????">南充市分公司仪陇县金城综合网格???????????????</option>
                            
                                <option value="南充市分公司仪陇县马鞍综合网格???????????????">南充市分公司仪陇县马鞍综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县东区综合网格???????????????">南充市分公司南部县东区综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县城区综合网格???????????????">南充市分公司南部县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县西区综合网格???????????????">南充市分公司南部县西区综合网格???????????????</option>
                            
                                <option value="南充市分公司嘉陵区城区综合网格???????????????">南充市分公司嘉陵区城区综合网格???????????????</option>
                            
                                <option value="南充市分公司嘉陵区金龙综合网格???????????????">南充市分公司嘉陵区金龙综合网格???????????????</option>
                            
                                <option value="南充市分公司营山县双河老林综合网格?????????????????">南充市分公司营山县双河老林综合网格?????????????????</option>
                            
                                <option value="南充市分公司营山县城区综合网格???????????????">南充市分公司营山县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司营山县骆市回龙综合网格?????????????????">南充市分公司营山县骆市回龙综合网格?????????????????</option>
                            
                                <option value="南充市分公司蓬安县城北乡镇综合网格?????????????????">南充市分公司蓬安县城北乡镇综合网格?????????????????</option>
                            
                                <option value="南充市分公司蓬安县城区综合网格???????????????">南充市分公司蓬安县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司蓬安县城南乡镇综合网格?????????????????">南充市分公司蓬安县城南乡镇综合网格?????????????????</option>
                            
                                <option value="南充市分公司西充县城区综合网格???????????????">南充市分公司西充县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司西充县多扶综合网格???????????????">南充市分公司西充县多扶综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市七里综合网格???????????????">南充市分公司阆中市七里综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市古城综合网格???????????????">南充市分公司阆中市古城综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市水观综合网格???????????????">南充市分公司阆中市水观综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区中城综合网格???????????????">南充市分公司顺庆区中城综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区和平综合网格???????????????">南充市分公司顺庆区和平综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区新城综合网格???????????????">南充市分公司顺庆区新城综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区东观综合网格???????????????">南充市分公司高坪区东观综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区城区综合网格???????????????">南充市分公司高坪区城区综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区龙门综合网格???????????????">南充市分公司高坪区龙门综合网格???????????????</option>
                            
                                <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                            
                                <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                            
                                <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                            
                                <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                            
                                <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                            
                                <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                            
                                <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                            
                                <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                            
                                <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                            
                                <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                            
                                <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                            
                                <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                            
                                <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                            
                                <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                            
                                <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                            
                                <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                            
                                <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                            
                                <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                            
                                <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                            
                                <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                            
                                <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                            
                                <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                            
                                <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                            
                                <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                            
                                <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                            
                                <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                            
                                <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                            
                                <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                            
                                <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                            
                                <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                            
                                <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                            
                                <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                            
                                <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                            
                                <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                            
                                <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                            
                                <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                            
                                <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                            
                                <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                            
                                <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                            
                                <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                            
                                <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                            
                                <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                            
                                <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                            
                                <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                            
                                <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                            
                                <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                            
                                <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                            
                                <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                            
                                <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                            
                                <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                            
                                <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                            
                                <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                            
                                <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                            
                                <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                            
                                <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                            
                                <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                            
                                <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                            
                                <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                            
                                <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                            
                                <option value="成都市分公司武侯区望江综合网格???????????????">成都市分公司武侯区望江综合网格???????????????</option>
                            
                                <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                            
                                <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                            
                                <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                            
                                <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                            
                                <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                            
                                <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                            
                                <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                            
                                <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                            
                                <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                            
                                <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                            
                                <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                            
                                <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                            
                                <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                            
                                <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                            
                                <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                            
                                <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                            
                                <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                            
                                <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                            
                                <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                            
                                <option value="成都市分公司高新区孵化综合网格???????????????">成都市分公司高新区孵化综合网格???????????????</option>
                            
                                <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                            
                                <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                            
                                <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                            
                                <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                            
                                <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                            
                                <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                            
                                <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                            
                                <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                            
                                <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                            
                                <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                            
                                <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                            
                                <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                            
                                <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                            
                                <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                            
                                <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                            
                                <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                            
                                <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                            
                                <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                            
                                <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                            
                                <option value="测试网格">测试网格</option>
                            
                                <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                            
                                <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                            
                                <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                            
                                <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                            
                                <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                            
                                <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                            
                                <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                            
                                <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                            
                                <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                            
                                <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                            
                                <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                            
                                <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                            
                                <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                            
                                <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                            
                                <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                            
                                <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                            
                                <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                            
                                <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                            
                                <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                            
                                <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                            
                                <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                            
                                <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                            
                                <option value="眉山市分公司教育信息化行业销售服务中心�������������������">眉山市分公司教育信息化行业销售服务中心�������������������</option>
                            
                                <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                            
                                <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                            
                                <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                            
                                <option value="绵阳市分公司三台县东区综合网格???????????????">绵阳市分公司三台县东区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司三台县城区综合网格???????????????">绵阳市分公司三台县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司三台县西区综合网格???????????????">绵阳市分公司三台县西区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司北川县综合网格?????????????">绵阳市分公司北川县综合网格?????????????</option>
                            
                                <option value="绵阳市分公司安县北区综合网格??????????????">绵阳市分公司安县北区综合网格??????????????</option>
                            
                                <option value="绵阳市分公司安县南区综合网格??????????????">绵阳市分公司安县南区综合网格??????????????</option>
                            
                                <option value="绵阳市分公司平武县综合网格?????????????">绵阳市分公司平武县综合网格?????????????</option>
                            
                                <option value="绵阳市分公司梓潼县乡镇综合网格???????????????">绵阳市分公司梓潼县乡镇综合网格???????????????</option>
                            
                                <option value="绵阳市分公司梓潼县城区综合网格???????????????">绵阳市分公司梓潼县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司江油市北区一综合网格????????????????">绵阳市分公司江油市北区一综合网格????????????????</option>
                            
                                <option value="绵阳市分公司江油市北区二综合网格????????????????">绵阳市分公司江油市北区二综合网格????????????????</option>
                            
                                <option value="绵阳市分公司江油市城区综合网格???????????????">绵阳市分公司江油市城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司涪城区市中区综合网格????????????????">绵阳市分公司涪城区市中区综合网格????????????????</option>
                            
                                <option value="绵阳市分公司涪城区花园综合网格???????????????">绵阳市分公司涪城区花园综合网格???????????????</option>
                            
                                <option value="绵阳市分公司涪城区高水综合网格???????????????">绵阳市分公司涪城区高水综合网格???????????????</option>
                            
                                <option value="绵阳市分公司游仙区沈家坝综合网格????????????????">绵阳市分公司游仙区沈家坝综合网格????????????????</option>
                            
                                <option value="绵阳市分公司游仙区经开区综合网格????????????????">绵阳市分公司游仙区经开区综合网格????????????????</option>
                            
                                <option value="绵阳市分公司游仙区魏城综合网格???????????????">绵阳市分公司游仙区魏城综合网格???????????????</option>
                            
                                <option value="绵阳市分公司盐亭县乡镇综合网格???????????????">绵阳市分公司盐亭县乡镇综合网格???????????????</option>
                            
                                <option value="绵阳市分公司盐亭县城区综合网格???????????????">绵阳市分公司盐亭县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司高新区普园综合网格???????????????">绵阳市分公司高新区普园综合网格???????????????</option>
                            
                                <option value="绵阳市分公司高新区永石综合网格???????????????">绵阳市分公司高新区永石综合网格???????????????</option>
                            
                                <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                            
                                <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                            
                                <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                            
                                <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                            
                                <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                            
                                <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                            
                                <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                            
                                <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                            
                                <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                            
                                <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                            
                                <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                            
                                <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                            
                                <option value="资阳市分公司乐至县城区综合网格???????????????">资阳市分公司乐至县城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司乐至县郊区综合网格???????????????">资阳市分公司乐至县郊区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县北区综合网格???????????????">资阳市分公司安岳县北区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县南区综合网格???????????????">资阳市分公司安岳县南区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县城区综合网格???????????????">资阳市分公司安岳县城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区东区综合网格???????????????">资阳市分公司雁江区东区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区城区综合网格???????????????">资阳市分公司雁江区城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区西区综合网格???????????????">资阳市分公司雁江区西区综合网格???????????????</option>
                            
                                <option value="达州市分公司万源市综合网格">达州市分公司万源市综合网格</option>
                            
                                <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                            
                                <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                            
                                <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                            
                                <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                            
                                <option value="达州市分公司开江县综合网格">达州市分公司开江县综合网格</option>
                            
                                <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                            
                                <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                            
                                <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                            
                                <option value="达州市分公司达川区乡镇综合网格">达州市分公司达川区乡镇综合网格</option>
                            
                                <option value="达州市分公司达川区城区综合网格">达州市分公司达川区城区综合网格</option>
                            
                                <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                            
                                <option value="遂宁市分公司大英县综合网格?????????????">遂宁市分公司大英县综合网格?????????????</option>
                            
                                <option value="遂宁市分公司安居区综合网格?????????????">遂宁市分公司安居区综合网格?????????????</option>
                            
                                <option value="遂宁市分公司射洪县综合网格?????????????">遂宁市分公司射洪县综合网格?????????????</option>
                            
                                <option value="遂宁市分公司船山区综合网格?????????????">遂宁市分公司船山区综合网格?????????????</option>
                            
                                <option value="遂宁市分公司蓬溪县综合网格?????????????">遂宁市分公司蓬溪县综合网格?????????????</option>
                            
                                <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                            
                                <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                            
                                <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                            
                                <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                            
                                <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                            
                                <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                            
                                <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                            
                                <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                            
                                <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                            
                                <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                            
                                <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                            
                                <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                            
                                <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                            
                                <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                            
                                <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                            
                                <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                            
                                <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                            
                                <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                            
                                <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                            
                                <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                            
                                <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                            
                                <option value=""></option>
                            
                                <option value="东兴网格">东兴网格</option>
                            
                                <option value="乐山市分公司犍为乡镇综合网格">乐山市分公司犍为乡镇综合网格</option>
                            
                                <option value="乐山市分公司犍为城区综合网格">乐山市分公司犍为城区综合网格</option>
                            
                                <option value="凉山州分公司德昌县综合网格�������������">凉山州分公司德昌县综合网格�������������</option>
                            
                                <option value="前锋网格">前锋网格</option>
                            
                                <option value="华蓥网格">华蓥网格</option>
                            
                                <option value="协兴网格">协兴网格</option>
                            
                                <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                            
                                <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                            
                                <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                            
                                <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                            
                                <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                            
                                <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                            
                                <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                            
                                <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                            
                                <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                            
                                <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                            
                                <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                            
                                <option value="南充市分公司阆中市七里综合网格?">南充市分公司阆中市七里综合网格?</option>
                            
                                <option value="南充市分公司阆中市古城综合网格?">南充市分公司阆中市古城综合网格?</option>
                            
                                <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                            
                                <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                            
                                <option value="双流区城区综合网格">双流区城区综合网格</option>
                            
                                <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                            
                                <option value="双龙网格">双龙网格</option>
                            
                                <option value="大邑县综合网格">大邑县综合网格</option>
                            
                                <option value="天府新区综合网格">天府新区综合网格</option>
                            
                                <option value="小金县综合网格">小金县综合网格</option>
                            
                                <option value="岳池乡镇网格">岳池乡镇网格</option>
                            
                                <option value="岳池城区网格">岳池城区网格</option>
                            
                                <option value="崇州市综合网格">崇州市综合网格</option>
                            
                                <option value="彭州市综合网格">彭州市综合网格</option>
                            
                                <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                            
                                <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                            
                                <option value="攀枝花市东区炳一综合网格">攀枝花市东区炳一综合网格</option>
                            
                                <option value="攀枝花市东区炳二综合网格">攀枝花市东区炳二综合网格</option>
                            
                                <option value="攀枝花市仁和区仁和综合网格">攀枝花市仁和区仁和综合网格</option>
                            
                                <option value="攀枝花市盐边县渔门综合网格">攀枝花市盐边县渔门综合网格</option>
                            
                                <option value="攀枝花市米易县综合网格">攀枝花市米易县综合网格</option>
                            
                                <option value="攀枝花市西区综合网格">攀枝花市西区综合网格</option>
                            
                                <option value="新津县综合网格">新津县综合网格</option>
                            
                                <option value="新都区城区综合网格">新都区城区综合网格</option>
                            
                                <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                            
                                <option value="未知">未知</option>
                            
                                <option value="椑木网格">椑木网格</option>
                            
                                <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                            
                                <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                            
                                <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                            
                                <option value="武胜城区网格">武胜城区网格</option>
                            
                                <option value="泸州市分公司合江县综合网格�������������">泸州市分公司合江县综合网格�������������</option>
                            
                                <option value="温江区综合网格">温江区综合网格</option>
                            
                                <option value="理县综合网格">理县综合网格</option>
                            
                                <option value="甜城网格">甜城网格</option>
                            
                                <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                            
                                <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                            
                                <option value="红原县综合网格">红原县综合网格</option>
                            
                                <option value="经开网格">经开网格</option>
                            
                                <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                            
                                <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                            
                                <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                            
                                <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                            
                                <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                            
                                <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                            
                                <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                            
                                <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                            
                                <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                            
                                <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                            
                                <option value="自贡市分公司贡井区筱溪综合网格���������������">自贡市分公司贡井区筱溪综合网格���������������</option>
                            
                                <option value="茂县综合网格">茂县综合网格</option>
                            
                                <option value="蒲江县综合网格">蒲江县综合网格</option>
                            
                                <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                            
                                <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                            
                                <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                            
                                <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                            
                                <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                            
                                <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                            
                                <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                            
                                <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                            
                                <option value="达州市分公司大竹县乡镇综合网格���������������">达州市分公司大竹县乡镇综合网格���������������</option>
                            
                                <option value="达州市分公司宣汉县城区综合网格���������������">达州市分公司宣汉县城区综合网格���������������</option>
                            
                                <option value="达州市分公司渠县乡镇综合网格��������������">达州市分公司渠县乡镇综合网格��������������</option>
                            
                                <option value="达州市分公司渠县城区综合网格��������������">达州市分公司渠县城区综合网格��������������</option>
                            
                                <option value="达州市分公司经开区综合网格�������������">达州市分公司经开区综合网格�������������</option>
                            
                                <option value="达州市分公司达川区乡镇综合网格1���������������">达州市分公司达川区乡镇综合网格1���������������</option>
                            
                                <option value="达州市分公司达川区城区综合网格���������������">达州市分公司达川区城区综合网格���������������</option>
                            
                                <option value="达州市分公司通川区城中综合网格���������������">达州市分公司通川区城中综合网格���������������</option>
                            
                                <option value="连界网格">连界网格</option>
                            
                                <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                            
                                <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                            
                                <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                            
                                <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                            
                                <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                            
                                <option value="邛崃市综合网格">邛崃市综合网格</option>
                            
                                <option value="邻水乡镇网格">邻水乡镇网格</option>
                            
                                <option value="邻水城区网格">邻水城区网格</option>
                            
                                <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                            
                                <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                            
                                <option value="都江堰市综合网格">都江堰市综合网格</option>
                            
                                <option value="金堂县综合网格">金堂县综合网格</option>
                            
                                <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                            
                                <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                            
                                <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                            
                                <option value="金鹅网格">金鹅网格</option>
                            
                                <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                            
                                <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                            
                                <option value="阿坝县综合网格">阿坝县综合网格</option>
                            
                                <option value="雅安市分公司名山区综合网格�������������">雅安市分公司名山区综合网格�������������</option>
                            
                                <option value="雅安市分公司石棉县综合网格�������������">雅安市分公司石棉县综合网格�������������</option>
                            
                                <option value="青白江区综合网格">青白江区综合网格</option>
                            
                                <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                            
                                <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                            
                                <option value="马尔康综合网格">马尔康综合网格</option>
                            
                                <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                            
                                <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                            
                                <option value="高新区西综合网格">高新区西综合网格</option>
                            
                                <option value="黄家网格">黄家网格</option>
                            
                                <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                            
                                <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                            
                                <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                            
                                <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                            
                                <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                            
                                <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                            
                                <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                            
                                <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                            
                                <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                            
                                <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                            
                                <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                            
                                <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                            
                                <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                            
                                <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                            
                                <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                            
                                <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                            
                                <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                            
                                <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                            
                                <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                            
                                <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                            
                                <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                            
                                <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                            
                                <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                            
                                <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                            
                                <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                            
                                <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                            
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="stationClass">
                        基站类别
                    </label>
                    <select id="stationClass" class="form-control input-sm" name="stationClass" style="width:100px;">
                        <option value="2G">2G</option>
                        <option value="3G">3G</option>
                        <option value="4G">4G</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="layerNameBS">给查询命名</label>
                    <input type="text" id="layerNameBS" class="form-control input-sm" style="width: 77px;">
                </div>
                <div class="form-group">
                    <a class="btn btn-danger btn-sm searchBtn">查询</a>
                </div>
            </form>

        </div>
        <div class="broadBandCondition" style="display: none;">
            <form class="form-inline" id="searchBroadBand" method="post">
                <div class="form-group">
                    <label for="cityBB">地市</label>
                    <select id="cityBB" class="form-control input-sm" name="city" style="width: 100px;">
                        
                            
                                <option value="乐山">乐山</option>
                            
                                <option value="内江">内江</option>
                            
                                <option value="凉山州">凉山州</option>
                            
                                <option value="南充">南充</option>
                            
                                <option value="宜宾">宜宾</option>
                            
                                <option value="巴中">巴中</option>
                            
                                <option value="广元">广元</option>
                            
                                <option value="广安">广安</option>
                            
                                <option value="德阳">德阳</option>
                            
                                <option value="成都">成都</option>
                            
                                <option value="攀枝花">攀枝花</option>
                            
                                <option value="泸州">泸州</option>
                            
                                <option value="测试">测试</option>
                            
                                <option value="甘孜">甘孜</option>
                            
                                <option value="眉山">眉山</option>
                            
                                <option value="绵阳">绵阳</option>
                            
                                <option value="自贡">自贡</option>
                            
                                <option value="资阳">资阳</option>
                            
                                <option value="达州">达州</option>
                            
                                <option value="遂宁">遂宁</option>
                            
                                <option value="阿坝">阿坝</option>
                            
                                <option value="雅安">雅安</option>
                            
                                <option value=""></option>
                            
                                <option value="凉山">凉山</option>
                            
                                <option value="凉山彝族自治州">凉山彝族自治州</option>
                            
                                <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                            
                                <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                            
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="county">
                        区县
                    </label>
                    <select id="county" class="form-control input-sm" name="county" style="width:100px;">
                        <option value="all">全部</option>
                        
                            <option value="双流">双流</option>
                        
                            <option value="成华区">成华区</option>
                        
                            <option value="新津">新津</option>
                        
                            <option value="新都">新都</option>
                        
                            <option value="武侯北区">武侯北区</option>
                        
                            <option value="武侯南区">武侯南区</option>
                        
                            <option value="郫县">郫县</option>
                        
                            <option value="金堂">金堂</option>
                        
                            <option value="金牛区">金牛区</option>
                        
                            <option value="锦江区">锦江区</option>
                        
                            <option value="青白江">青白江</option>
                        
                            <option value="青羊区">青羊区</option>
                        
                            <option value="龙泉">龙泉</option>
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="town">
                        街道乡镇
                    </label>
                    <select id="town" class="form-control input-sm" name="town" style="width:100px;">
                        <option value="all">全部</option>
                        
                            <option value=""></option>
                        
                            <option value="一环路东五段">一环路东五段</option>
                        
                            <option value="一环路东四段">一环路东四段</option>
                        
                            <option value="万科南街">万科南街</option>
                        
                            <option value="万科路">万科路</option>
                        
                            <option value="三官堂街">三官堂街</option>
                        
                            <option value="三槐树街">三槐树街</option>
                        
                            <option value="三河镇">三河镇</option>
                        
                            <option value="三溪镇">三溪镇</option>
                        
                            <option value="下东大街">下东大街</option>
                        
                            <option value="东三环内华龙路中段">东三环内华龙路中段</option>
                        
                            <option value="东光南一巷">东光南一巷</option>
                        
                            <option value="东光南二巷">东光南二巷</option>
                        
                            <option value="东光街">东光街</option>
                        
                            <option value="东光街道">东光街道</option>
                        
                            <option value="东升街道">东升街道</option>
                        
                            <option value="东城拐下街">东城拐下街</option>
                        
                            <option value="东城拐街">东城拐街</option>
                        
                            <option value="东大街">东大街</option>
                        
                            <option value="东大路">东大路</option>
                        
                            <option value="东安南路">东安南路</option>
                        
                            <option value="东御街">东御街</option>
                        
                            <option value="东怡街">东怡街</option>
                        
                            <option value="东虹路">东虹路</option>
                        
                            <option value="东较场街">东较场街</option>
                        
                            <option value="中环路杨柳店北路段">中环路杨柳店北路段</option>
                        
                            <option value="中道街">中道街</option>
                        
                            <option value="临江东路">临江东路</option>
                        
                            <option value="九江街道">九江街道</option>
                        
                            <option value="书院街街道">书院街街道</option>
                        
                            <option value="二环路东三段双庆路">二环路东三段双庆路</option>
                        
                            <option value="二环路东二段">二环路东二段</option>
                        
                            <option value="二环路东五段">二环路东五段</option>
                        
                            <option value="云顶山路">云顶山路</option>
                        
                            <option value="五世同堂街">五世同堂街</option>
                        
                            <option value="五昭路">五昭路</option>
                        
                            <option value="五桂桥北路">五桂桥北路</option>
                        
                            <option value="五津镇">五津镇</option>
                        
                            <option value="人民南路一段">人民南路一段</option>
                        
                            <option value="人民南路二段">人民南路二段</option>
                        
                            <option value="光华街">光华街</option>
                        
                            <option value="光明路">光明路</option>
                        
                            <option value="兴义镇">兴义镇</option>
                        
                            <option value="净居寺路">净居寺路</option>
                        
                            <option value="北纱帽街">北纱帽街</option>
                        
                            <option value="北顺街">北顺街</option>
                        
                            <option value="北顺西巷">北顺西巷</option>
                        
                            <option value="华星街">华星街</option>
                        
                            <option value="华星路">华星路</option>
                        
                            <option value="华润路">华润路</option>
                        
                            <option value="南三街">南三街</option>
                        
                            <option value="南府街">南府街</option>
                        
                            <option value="友爱镇">友爱镇</option>
                        
                            <option value="双庆路">双庆路</option>
                        
                            <option value="双成三路">双成三路</option>
                        
                            <option value="双成二路">双成二路</option>
                        
                            <option value="双林巷">双林巷</option>
                        
                            <option value="双林路">双林路</option>
                        
                            <option value="双桥子北一二街">双桥子北一二街</option>
                        
                            <option value="双桥路">双桥路</option>
                        
                            <option value="双桥路北五街">双桥路北五街</option>
                        
                            <option value="双桥路南一街">双桥路南一街</option>
                        
                            <option value="双桥路南三街">双桥路南三街</option>
                        
                            <option value="双桥路南二街">双桥路南二街</option>
                        
                            <option value="双桥路南四街">双桥路南四街</option>
                        
                            <option value="双楠街办">双楠街办</option>
                        
                            <option value="双福三路">双福三路</option>
                        
                            <option value="古雅坡路">古雅坡路</option>
                        
                            <option value="合江亭街道">合江亭街道</option>
                        
                            <option value="和美东路">和美东路</option>
                        
                            <option value="和美西路">和美西路</option>
                        
                            <option value="唐元镇">唐元镇</option>
                        
                            <option value="唐昌镇">唐昌镇</option>
                        
                            <option value="团结镇">团结镇</option>
                        
                            <option value="均隆街">均隆街</option>
                        
                            <option value="城厢镇">城厢镇</option>
                        
                            <option value="城隍庙街">城隍庙街</option>
                        
                            <option value="培华西路">培华西路</option>
                        
                            <option value="培风">培风</option>
                        
                            <option value="塔山路东2.5环迎晖路交汇处">塔山路东2.5环迎晖路交汇处</option>
                        
                            <option value="大业路">大业路</option>
                        
                            <option value="大丰街道">大丰街道</option>
                        
                            <option value="大同镇">大同镇</option>
                        
                            <option value="大弯街道">大弯街道</option>
                        
                            <option value="大慈寺路">大慈寺路</option>
                        
                            <option value="大科甲巷">大科甲巷</option>
                        
                            <option value="天仙桥北街">天仙桥北街</option>
                        
                            <option value="天仙桥南路">天仙桥南路</option>
                        
                            <option value="天府新区">天府新区</option>
                        
                            <option value="太平镇">太平镇</option>
                        
                            <option value="安德镇">安德镇</option>
                        
                            <option value="安靖镇">安靖镇</option>
                        
                            <option value="宏济上路">宏济上路</option>
                        
                            <option value="宏济中路">宏济中路</option>
                        
                            <option value="宏济新路">宏济新路</option>
                        
                            <option value="宏济路">宏济路</option>
                        
                            <option value="官仓镇">官仓镇</option>
                        
                            <option value="崔家店路">崔家店路</option>
                        
                            <option value="工农院街">工农院街</option>
                        
                            <option value="年丰巷">年丰巷</option>
                        
                            <option value="庆云南街">庆云南街</option>
                        
                            <option value="建材路">建材路</option>
                        
                            <option value="建设北村">建设北村</option>
                        
                            <option value="建设南街">建设南街</option>
                        
                            <option value="建设西街">建设西街</option>
                        
                            <option value="建设路">建设路</option>
                        
                            <option value="弥牟镇">弥牟镇</option>
                        
                            <option value="总府路街道">总府路街道</option>
                        
                            <option value="成华区万兴街">成华区万兴街</option>
                        
                            <option value="成华区成华大道新鸿路">成华区成华大道新鸿路</option>
                        
                            <option value="成华区金马河路">成华区金马河路</option>
                        
                            <option value="成华大道崔家店路">成华大道崔家店路</option>
                        
                            <option value="成洛大道东虹路">成洛大道东虹路</option>
                        
                            <option value="成龙路街道">成龙路街道</option>
                        
                            <option value="抚琴街道">抚琴街道</option>
                        
                            <option value="提督街">提督街</option>
                        
                            <option value="文井乡">文井乡</option>
                        
                            <option value="斑竹园镇">斑竹园镇</option>
                        
                            <option value="新桂村西五街">新桂村西五街</option>
                        
                            <option value="新繁镇">新繁镇</option>
                        
                            <option value="新都镇">新都镇</option>
                        
                            <option value="新鸿路南一巷">新鸿路南一巷</option>
                        
                            <option value="春熙路街道">春熙路街道</option>
                        
                            <option value="昭忠祠街道">昭忠祠街道</option>
                        
                            <option value="晋阳街道办">晋阳街道办</option>
                        
                            <option value="普兴镇">普兴镇</option>
                        
                            <option value="木兰镇">木兰镇</option>
                        
                            <option value="机投街道办">机投街道办</option>
                        
                            <option value="染房街">染房街</option>
                        
                            <option value="梨花街">梨花街</option>
                        
                            <option value="槐树店路">槐树店路</option>
                        
                            <option value="橡树林路">橡树林路</option>
                        
                            <option value="水井坊街道">水井坊街道</option>
                        
                            <option value="水碾河北街">水碾河北街</option>
                        
                            <option value="水碾河路">水碾河路</option>
                        
                            <option value="永兴街道">永兴街道</option>
                        
                            <option value="永商镇">永商镇</option>
                        
                            <option value="汇源东路">汇源东路</option>
                        
                            <option value="沙河街道">沙河街道</option>
                        
                            <option value="海椒市">海椒市</option>
                        
                            <option value="海椒市街">海椒市街</option>
                        
                            <option value="淮口镇">淮口镇</option>
                        
                            <option value="滨江东路">滨江东路</option>
                        
                            <option value="点将台">点将台</option>
                        
                            <option value="牛市口街道">牛市口街道</option>
                        
                            <option value="牛沙路">牛沙路</option>
                        
                            <option value="牛王庙后街">牛王庙后街</option>
                        
                            <option value="牛王庙巷">牛王庙巷</option>
                        
                            <option value="狮子山街道">狮子山街道</option>
                        
                            <option value="猛追湾东街">猛追湾东街</option>
                        
                            <option value="玉皇观街">玉皇观街</option>
                        
                            <option value="琉璃路">琉璃路</option>
                        
                            <option value="白果林街道">白果林街道</option>
                        
                            <option value="盐市口街道">盐市口街道</option>
                        
                            <option value="督院街街道">督院街街道</option>
                        
                            <option value="石人">石人</option>
                        
                            <option value="祥福镇">祥福镇</option>
                        
                            <option value="福兴街">福兴街</option>
                        
                            <option value="竹林巷">竹林巷</option>
                        
                            <option value="竹篙镇">竹篙镇</option>
                        
                            <option value="簇锦街道">簇锦街道</option>
                        
                            <option value="米市坝">米市坝</option>
                        
                            <option value="糍粑店街">糍粑店街</option>
                        
                            <option value="紫东街">紫东街</option>
                        
                            <option value="红光镇">红光镇</option>
                        
                            <option value="红星路">红星路</option>
                        
                            <option value="红牌楼街办">红牌楼街办</option>
                        
                            <option value="红阳街道">红阳街道</option>
                        
                            <option value="经天路">经天路</option>
                        
                            <option value="署袜中街">署袜中街</option>
                        
                            <option value="群康路">群康路</option>
                        
                            <option value="花源镇">花源镇</option>
                        
                            <option value="芷泉街">芷泉街</option>
                        
                            <option value="苏坡街道办">苏坡街道办</option>
                        
                            <option value="茶店子街道">茶店子街道</option>
                        
                            <option value="草堂">草堂</option>
                        
                            <option value="莲新街道">莲新街道</option>
                        
                            <option value="莲桂南路">莲桂南路</option>
                        
                            <option value="菽香里二巷">菽香里二巷</option>
                        
                            <option value="营门口街道">营门口街道</option>
                        
                            <option value="蜀汉路">蜀汉路</option>
                        
                            <option value="蜀汉路街道">蜀汉路街道</option>
                        
                            <option value="街道">街道</option>
                        
                            <option value="观音桥街">观音桥街</option>
                        
                            <option value="贝森路">贝森路</option>
                        
                            <option value="走马街">走马街</option>
                        
                            <option value="赵镇">赵镇</option>
                        
                            <option value="路南街道">路南街道</option>
                        
                            <option value="跳登河南路">跳登河南路</option>
                        
                            <option value="跳蹬河南街">跳蹬河南街</option>
                        
                            <option value="较场坝东街">较场坝东街</option>
                        
                            <option value="较场坝中街">较场坝中街</option>
                        
                            <option value="较场坝西街11号">较场坝西街11号</option>
                        
                            <option value="迎晖路">迎晖路</option>
                        
                            <option value="通盈街">通盈街</option>
                        
                            <option value="邓双镇">邓双镇</option>
                        
                            <option value="邛崃山路">邛崃山路</option>
                        
                            <option value="金华镇">金华镇</option>
                        
                            <option value="金牛区">金牛区</option>
                        
                            <option value="金琴南路">金琴南路</option>
                        
                            <option value="金科苑街道">金科苑街道</option>
                        
                            <option value="金马河路">金马河路</option>
                        
                            <option value="锦东路">锦东路</option>
                        
                            <option value="锦兴路">锦兴路</option>
                        
                            <option value="锦华路一段">锦华路一段</option>
                        
                            <option value="长融东三路">长融东三路</option>
                        
                            <option value="长融街">长融街</option>
                        
                            <option value="青石桥北街">青石桥北街</option>
                        
                            <option value="青石桥南街">青石桥南街</option>
                        
                            <option value="青羊区">青羊区</option>
                        
                            <option value="青莲上街">青莲上街</option>
                        
                            <option value="静居寺">静居寺</option>
                        
                            <option value="静居寺路">静居寺路</option>
                        
                            <option value="静沙南路">静沙南路</option>
                        
                            <option value="顺城大街">顺城大街</option>
                        
                            <option value="顺江路">顺江路</option>
                        
                            <option value="黄忠街道">黄忠街道</option>
                        
                            <option value="黄水镇">黄水镇</option>
                        
                            <option value="黄田坝成飞社区">黄田坝成飞社区</option>
                        
                            <option value="龙桥镇">龙桥镇</option>
                        
                            <option value="龙泉驿区城区">龙泉驿区城区</option>
                        
                            <option value="龙舟路街道">龙舟路街道</option>
                        
                            <option value="龙虎镇">龙虎镇</option>
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="gridBB">
                        网格
                    </label>
                    <select id="gridBB" class="form-control input-sm" name="grid" style="width: 100px;">
                        <option value="all">全部</option>
                        
                            
                                <option value="xxx网格">xxx网格</option>
                            
                                <option value="乐山市分公司五通桥区综合网格">乐山市分公司五通桥区综合网格</option>
                            
                                <option value="乐山市分公司井研县综合网格">乐山市分公司井研县综合网格</option>
                            
                                <option value="乐山市分公司嘉州乡镇综合网格">乐山市分公司嘉州乡镇综合网格</option>
                            
                                <option value="乐山市分公司嘉州城区综合网格">乐山市分公司嘉州城区综合网格</option>
                            
                                <option value="乐山市分公司夹江县综合网格">乐山市分公司夹江县综合网格</option>
                            
                                <option value="乐山市分公司峨眉山市综合网格">乐山市分公司峨眉山市综合网格</option>
                            
                                <option value="乐山市分公司峨边县综合网格">乐山市分公司峨边县综合网格</option>
                            
                                <option value="乐山市分公司沐川县综合网格">乐山市分公司沐川县综合网格</option>
                            
                                <option value="乐山市分公司沙湾区综合网格">乐山市分公司沙湾区综合网格</option>
                            
                                <option value="乐山市分公司犍为县乡镇综合网格">乐山市分公司犍为县乡镇综合网格</option>
                            
                                <option value="乐山市分公司犍为县城区综合网格">乐山市分公司犍为县城区综合网格</option>
                            
                                <option value="乐山市分公司金口河区综合网格">乐山市分公司金口河区综合网格</option>
                            
                                <option value="乐山市分公司马边县综合网格">乐山市分公司马边县综合网格</option>
                            
                                <option value="内江市分公司东兴区东兴综合网格">内江市分公司东兴区东兴综合网格</option>
                            
                                <option value="内江市分公司东兴区双才综合网格">内江市分公司东兴区双才综合网格</option>
                            
                                <option value="内江市分公司东兴区椑木综合网格">内江市分公司东兴区椑木综合网格</option>
                            
                                <option value="内江市分公司威远县严陵综合网格">内江市分公司威远县严陵综合网格</option>
                            
                                <option value="内江市分公司威远县连界综合网格">内江市分公司威远县连界综合网格</option>
                            
                                <option value="内江市分公司市中区甜城综合网格">内江市分公司市中区甜城综合网格</option>
                            
                                <option value="内江市分公司市中区白马综合网格">内江市分公司市中区白马综合网格</option>
                            
                                <option value="内江市分公司资中县双龙综合网格">内江市分公司资中县双龙综合网格</option>
                            
                                <option value="内江市分公司资中县球溪综合网格">内江市分公司资中县球溪综合网格</option>
                            
                                <option value="内江市分公司资中县重龙综合网格">内江市分公司资中县重龙综合网格</option>
                            
                                <option value="内江市分公司隆昌县金鹅综合网格">内江市分公司隆昌县金鹅综合网格</option>
                            
                                <option value="内江市分公司隆昌县黄家综合网格">内江市分公司隆昌县黄家综合网格</option>
                            
                                <option value="凉山州分公司会东县综合网格">凉山州分公司会东县综合网格</option>
                            
                                <option value="凉山州分公司会理县综合网格">凉山州分公司会理县综合网格</option>
                            
                                <option value="凉山州分公司冕宁县综合网格">凉山州分公司冕宁县综合网格</option>
                            
                                <option value="凉山州分公司宁南县综合网格">凉山州分公司宁南县综合网格</option>
                            
                                <option value="凉山州分公司布拖县综合网格">凉山州分公司布拖县综合网格</option>
                            
                                <option value="凉山州分公司德昌县综合网格">凉山州分公司德昌县综合网格</option>
                            
                                <option value="凉山州分公司昭觉县综合网格">凉山州分公司昭觉县综合网格</option>
                            
                                <option value="凉山州分公司普格">凉山州分公司普格</option>
                            
                                <option value="凉山州分公司木里县综合网格">凉山州分公司木里县综合网格</option>
                            
                                <option value="凉山州分公司盐源县综合网格">凉山州分公司盐源县综合网格</option>
                            
                                <option value="凉山州分公司西昌市东城综合网格">凉山州分公司西昌市东城综合网格</option>
                            
                                <option value="凉山州分公司西昌市西城综合网格">凉山州分公司西昌市西城综合网格</option>
                            
                                <option value="凉山州分公司雷波县综合网格">凉山州分公司雷波县综合网格</option>
                            
                                <option value="南充市分公司仪陇县新政综合网格???????????????">南充市分公司仪陇县新政综合网格???????????????</option>
                            
                                <option value="南充市分公司仪陇县金城综合网格???????????????">南充市分公司仪陇县金城综合网格???????????????</option>
                            
                                <option value="南充市分公司仪陇县马鞍综合网格???????????????">南充市分公司仪陇县马鞍综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县东区综合网格???????????????">南充市分公司南部县东区综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县城区综合网格???????????????">南充市分公司南部县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司南部县西区综合网格???????????????">南充市分公司南部县西区综合网格???????????????</option>
                            
                                <option value="南充市分公司嘉陵区城区综合网格???????????????">南充市分公司嘉陵区城区综合网格???????????????</option>
                            
                                <option value="南充市分公司嘉陵区金龙综合网格???????????????">南充市分公司嘉陵区金龙综合网格???????????????</option>
                            
                                <option value="南充市分公司营山县双河老林综合网格?????????????????">南充市分公司营山县双河老林综合网格?????????????????</option>
                            
                                <option value="南充市分公司营山县城区综合网格???????????????">南充市分公司营山县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司营山县骆市回龙综合网格?????????????????">南充市分公司营山县骆市回龙综合网格?????????????????</option>
                            
                                <option value="南充市分公司蓬安县城北乡镇综合网格?????????????????">南充市分公司蓬安县城北乡镇综合网格?????????????????</option>
                            
                                <option value="南充市分公司蓬安县城区综合网格???????????????">南充市分公司蓬安县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司蓬安县城南乡镇综合网格?????????????????">南充市分公司蓬安县城南乡镇综合网格?????????????????</option>
                            
                                <option value="南充市分公司西充县城区综合网格???????????????">南充市分公司西充县城区综合网格???????????????</option>
                            
                                <option value="南充市分公司西充县多扶综合网格???????????????">南充市分公司西充县多扶综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市七里综合网格???????????????">南充市分公司阆中市七里综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市古城综合网格???????????????">南充市分公司阆中市古城综合网格???????????????</option>
                            
                                <option value="南充市分公司阆中市水观综合网格???????????????">南充市分公司阆中市水观综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区中城综合网格???????????????">南充市分公司顺庆区中城综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区和平综合网格???????????????">南充市分公司顺庆区和平综合网格???????????????</option>
                            
                                <option value="南充市分公司顺庆区新城综合网格???????????????">南充市分公司顺庆区新城综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区东观综合网格???????????????">南充市分公司高坪区东观综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区城区综合网格???????????????">南充市分公司高坪区城区综合网格???????????????</option>
                            
                                <option value="南充市分公司高坪区龙门综合网格???????????????">南充市分公司高坪区龙门综合网格???????????????</option>
                            
                                <option value="宜宾市分公司临港综合网格">宜宾市分公司临港综合网格</option>
                            
                                <option value="宜宾市分公司兴文县综合网格">宜宾市分公司兴文县综合网格</option>
                            
                                <option value="宜宾市分公司南溪县综合网格">宜宾市分公司南溪县综合网格</option>
                            
                                <option value="宜宾市分公司宜宾县综合网格">宜宾市分公司宜宾县综合网格</option>
                            
                                <option value="宜宾市分公司屏山县综合网格">宜宾市分公司屏山县综合网格</option>
                            
                                <option value="宜宾市分公司江安县综合网格">宜宾市分公司江安县综合网格</option>
                            
                                <option value="宜宾市分公司珙县综合网格">宜宾市分公司珙县综合网格</option>
                            
                                <option value="宜宾市分公司筠连县综合网格">宜宾市分公司筠连县综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区南岸综合网格">宜宾市分公司翠屏区南岸综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区市区综合网格">宜宾市分公司翠屏区市区综合网格</option>
                            
                                <option value="宜宾市分公司翠屏区江北综合网格">宜宾市分公司翠屏区江北综合网格</option>
                            
                                <option value="宜宾市分公司观音综合网格">宜宾市分公司观音综合网格</option>
                            
                                <option value="宜宾市分公司长宁县综合网格">宜宾市分公司长宁县综合网格</option>
                            
                                <option value="宜宾市分公司高县综合网格">宜宾市分公司高县综合网格</option>
                            
                                <option value="巴中市分公司南江县综合网格">巴中市分公司南江县综合网格</option>
                            
                                <option value="巴中市分公司巴州区城区综合网格">巴中市分公司巴州区城区综合网格</option>
                            
                                <option value="巴中市分公司巴州区城郊综合网格">巴中市分公司巴州区城郊综合网格</option>
                            
                                <option value="巴中市分公司平昌县综合网格">巴中市分公司平昌县综合网格</option>
                            
                                <option value="巴中市分公司恩阳区综合网格">巴中市分公司恩阳区综合网格</option>
                            
                                <option value="巴中市分公司通江县综合网格">巴中市分公司通江县综合网格</option>
                            
                                <option value="广元市分公司利州区综合网格">广元市分公司利州区综合网格</option>
                            
                                <option value="广元市分公司剑阁县综合网格">广元市分公司剑阁县综合网格</option>
                            
                                <option value="广元市分公司旺苍县综合网格">广元市分公司旺苍县综合网格</option>
                            
                                <option value="广元市分公司昭化区综合网格">广元市分公司昭化区综合网格</option>
                            
                                <option value="广元市分公司朝天区综合网格">广元市分公司朝天区综合网格</option>
                            
                                <option value="广元市分公司苍溪县综合网格">广元市分公司苍溪县综合网格</option>
                            
                                <option value="广元市分公司青川县综合网格">广元市分公司青川县综合网格</option>
                            
                                <option value="广安市分公司前锋区综合网格">广安市分公司前锋区综合网格</option>
                            
                                <option value="广安市分公司华蓥市综合网格">广安市分公司华蓥市综合网格</option>
                            
                                <option value="广安市分公司协兴区综合网格">广安市分公司协兴区综合网格</option>
                            
                                <option value="广安市分公司岳池县乡镇综合网格">广安市分公司岳池县乡镇综合网格</option>
                            
                                <option value="广安市分公司岳池县城区综合网格">广安市分公司岳池县城区综合网格</option>
                            
                                <option value="广安市分公司武胜县乡镇综合网格">广安市分公司武胜县乡镇综合网格</option>
                            
                                <option value="广安市分公司武胜县城区综合网格">广安市分公司武胜县城区综合网格</option>
                            
                                <option value="广安市分公司经开区综合网格">广安市分公司经开区综合网格</option>
                            
                                <option value="广安市分公司邻水县乡镇综合网格">广安市分公司邻水县乡镇综合网格</option>
                            
                                <option value="广安市分公司邻水县城区综合网格">广安市分公司邻水县城区综合网格</option>
                            
                                <option value="德阳市分公司中江县仓山综合网格">德阳市分公司中江县仓山综合网格</option>
                            
                                <option value="德阳市分公司中江县城区综合网格">德阳市分公司中江县城区综合网格</option>
                            
                                <option value="德阳市分公司中江县城郊综合网格">德阳市分公司中江县城郊综合网格</option>
                            
                                <option value="德阳市分公司什邡市城区综合网格">德阳市分公司什邡市城区综合网格</option>
                            
                                <option value="德阳市分公司什邡市城郊综合网格">德阳市分公司什邡市城郊综合网格</option>
                            
                                <option value="德阳市分公司广汉市城区综合网格">德阳市分公司广汉市城区综合网格</option>
                            
                                <option value="德阳市分公司广汉市城郊综合网格">德阳市分公司广汉市城郊综合网格</option>
                            
                                <option value="德阳市分公司旌阳区城区综合网格">德阳市分公司旌阳区城区综合网格</option>
                            
                                <option value="德阳市分公司旌阳区城郊综合网格">德阳市分公司旌阳区城郊综合网格</option>
                            
                                <option value="德阳市分公司绵竹市城区综合网格">德阳市分公司绵竹市城区综合网格</option>
                            
                                <option value="德阳市分公司绵竹市城郊综合网格">德阳市分公司绵竹市城郊综合网格</option>
                            
                                <option value="德阳市分公司罗江县综合网格">德阳市分公司罗江县综合网格</option>
                            
                                <option value="成都市分公司双流区城区综合网格">成都市分公司双流区城区综合网格</option>
                            
                                <option value="成都市分公司双流区西航港综合网格">成都市分公司双流区西航港综合网格</option>
                            
                                <option value="成都市分公司大邑县综合网格">成都市分公司大邑县综合网格</option>
                            
                                <option value="成都市分公司天府新区综合网格">成都市分公司天府新区综合网格</option>
                            
                                <option value="成都市分公司崇州市综合网格">成都市分公司崇州市综合网格</option>
                            
                                <option value="成都市分公司彭州市综合网格">成都市分公司彭州市综合网格</option>
                            
                                <option value="成都市分公司成华区新鸿综合网格">成都市分公司成华区新鸿综合网格</option>
                            
                                <option value="成都市分公司成华区青龙综合网格">成都市分公司成华区青龙综合网格</option>
                            
                                <option value="成都市分公司新津县综合网格">成都市分公司新津县综合网格</option>
                            
                                <option value="成都市分公司新都区城区综合网格">成都市分公司新都区城区综合网格</option>
                            
                                <option value="成都市分公司新都区新繁综合网格">成都市分公司新都区新繁综合网格</option>
                            
                                <option value="成都市分公司武侯区双楠综合网格">成都市分公司武侯区双楠综合网格</option>
                            
                                <option value="成都市分公司武侯区望江综合网格">成都市分公司武侯区望江综合网格</option>
                            
                                <option value="成都市分公司武侯区望江综合网格???????????????">成都市分公司武侯区望江综合网格???????????????</option>
                            
                                <option value="成都市分公司武侯区簇锦综合网格">成都市分公司武侯区簇锦综合网格</option>
                            
                                <option value="成都市分公司温江区综合网格">成都市分公司温江区综合网格</option>
                            
                                <option value="成都市分公司简阳市城区综合网格">成都市分公司简阳市城区综合网格</option>
                            
                                <option value="成都市分公司简阳市新区综合网格">成都市分公司简阳市新区综合网格</option>
                            
                                <option value="成都市分公司蒲江县综合网格">成都市分公司蒲江县综合网格</option>
                            
                                <option value="成都市分公司邛崃市综合网格">成都市分公司邛崃市综合网格</option>
                            
                                <option value="成都市分公司郫都区团结综合网格">成都市分公司郫都区团结综合网格</option>
                            
                                <option value="成都市分公司郫都区城区综合网格">成都市分公司郫都区城区综合网格</option>
                            
                                <option value="成都市分公司都江堰市综合网格">成都市分公司都江堰市综合网格</option>
                            
                                <option value="成都市分公司金堂县综合网格">成都市分公司金堂县综合网格</option>
                            
                                <option value="成都市分公司金牛区凤凰综合网格">成都市分公司金牛区凤凰综合网格</option>
                            
                                <option value="成都市分公司金牛区国宾综合网格">成都市分公司金牛区国宾综合网格</option>
                            
                                <option value="成都市分公司金牛区沙湾综合网格">成都市分公司金牛区沙湾综合网格</option>
                            
                                <option value="成都市分公司锦江区三圣综合网格">成都市分公司锦江区三圣综合网格</option>
                            
                                <option value="成都市分公司锦江区春熙综合网格">成都市分公司锦江区春熙综合网格</option>
                            
                                <option value="成都市分公司青白江区综合网格">成都市分公司青白江区综合网格</option>
                            
                                <option value="成都市分公司青羊区太升综合网格">成都市分公司青羊区太升综合网格</option>
                            
                                <option value="成都市分公司青羊区金沙综合网格">成都市分公司青羊区金沙综合网格</option>
                            
                                <option value="成都市分公司高新区孵化综合网格">成都市分公司高新区孵化综合网格</option>
                            
                                <option value="成都市分公司高新区孵化综合网格???????????????">成都市分公司高新区孵化综合网格???????????????</option>
                            
                                <option value="成都市分公司高新区紫荆综合网格">成都市分公司高新区紫荆综合网格</option>
                            
                                <option value="成都市分公司高新区西综合网格">成都市分公司高新区西综合网格</option>
                            
                                <option value="成都市分公司龙泉驿区城区综合网格">成都市分公司龙泉驿区城区综合网格</option>
                            
                                <option value="成都市分公司龙泉驿区经开综合网格">成都市分公司龙泉驿区经开综合网格</option>
                            
                                <option value="攀枝花市分公司东区炳一综合网格">攀枝花市分公司东区炳一综合网格</option>
                            
                                <option value="攀枝花市分公司东区炳二综合网格">攀枝花市分公司东区炳二综合网格</option>
                            
                                <option value="攀枝花市分公司仁和区仁和综合网格">攀枝花市分公司仁和区仁和综合网格</option>
                            
                                <option value="攀枝花市分公司仁和区渡口综合网格">攀枝花市分公司仁和区渡口综合网格</option>
                            
                                <option value="攀枝花市分公司盐边县新县城综合网格">攀枝花市分公司盐边县新县城综合网格</option>
                            
                                <option value="攀枝花市分公司盐边县渔门综合网格">攀枝花市分公司盐边县渔门综合网格</option>
                            
                                <option value="攀枝花市分公司米易县综合网格">攀枝花市分公司米易县综合网格</option>
                            
                                <option value="攀枝花市分公司西区综合网格">攀枝花市分公司西区综合网格</option>
                            
                                <option value="泸州市分公司叙永县综合网格">泸州市分公司叙永县综合网格</option>
                            
                                <option value="泸州市分公司古蔺县综合网格">泸州市分公司古蔺县综合网格</option>
                            
                                <option value="泸州市分公司合江县综合网格">泸州市分公司合江县综合网格</option>
                            
                                <option value="泸州市分公司江阳区综合网格">泸州市分公司江阳区综合网格</option>
                            
                                <option value="泸州市分公司泸县综合网格">泸州市分公司泸县综合网格</option>
                            
                                <option value="泸州市分公司纳溪区综合网格">泸州市分公司纳溪区综合网格</option>
                            
                                <option value="泸州市分公司龙马潭区综合网格">泸州市分公司龙马潭区综合网格</option>
                            
                                <option value="测试网格">测试网格</option>
                            
                                <option value="甘孜州分公司丹巴县综合网格">甘孜州分公司丹巴县综合网格</option>
                            
                                <option value="甘孜州分公司九龙县综合网格">甘孜州分公司九龙县综合网格</option>
                            
                                <option value="甘孜州分公司乡城县综合网格">甘孜州分公司乡城县综合网格</option>
                            
                                <option value="甘孜州分公司巴塘县综合网格">甘孜州分公司巴塘县综合网格</option>
                            
                                <option value="甘孜州分公司康定县城区综合网格">甘孜州分公司康定县城区综合网格</option>
                            
                                <option value="甘孜州分公司康定县姑咱综合网格">甘孜州分公司康定县姑咱综合网格</option>
                            
                                <option value="甘孜州分公司康定县新都桥综合网格">甘孜州分公司康定县新都桥综合网格</option>
                            
                                <option value="甘孜州分公司泸定县城区综合网格">甘孜州分公司泸定县城区综合网格</option>
                            
                                <option value="甘孜州分公司泸定县海螺沟综合网格">甘孜州分公司泸定县海螺沟综合网格</option>
                            
                                <option value="甘孜州分公司炉霍县综合网格">甘孜州分公司炉霍县综合网格</option>
                            
                                <option value="甘孜州分公司甘孜县综合网格">甘孜州分公司甘孜县综合网格</option>
                            
                                <option value="甘孜州分公司稻城县综合网格">甘孜州分公司稻城县综合网格</option>
                            
                                <option value="甘孜州分公司色达县综合网格">甘孜州分公司色达县综合网格</option>
                            
                                <option value="甘孜州分公司雅江县综合网格">甘孜州分公司雅江县综合网格</option>
                            
                                <option value="眉山市分公司东坡区万胜综合网格">眉山市分公司东坡区万胜综合网格</option>
                            
                                <option value="眉山市分公司东坡区城区综合网格">眉山市分公司东坡区城区综合网格</option>
                            
                                <option value="眉山市分公司东坡区岷东综合网格">眉山市分公司东坡区岷东综合网格</option>
                            
                                <option value="眉山市分公司丹棱县综合网格">眉山市分公司丹棱县综合网格</option>
                            
                                <option value="眉山市分公司仁寿县仁北综合网格">眉山市分公司仁寿县仁北综合网格</option>
                            
                                <option value="眉山市分公司仁寿县仁南综合网格">眉山市分公司仁寿县仁南综合网格</option>
                            
                                <option value="眉山市分公司仁寿县城区综合网格">眉山市分公司仁寿县城区综合网格</option>
                            
                                <option value="眉山市分公司彭山区综合网格">眉山市分公司彭山区综合网格</option>
                            
                                <option value="眉山市分公司教育信息化行业销售服务中心�������������������">眉山市分公司教育信息化行业销售服务中心�������������������</option>
                            
                                <option value="眉山市分公司洪雅县城区综合网格">眉山市分公司洪雅县城区综合网格</option>
                            
                                <option value="眉山市分公司洪雅县洪西综合网格">眉山市分公司洪雅县洪西综合网格</option>
                            
                                <option value="眉山市分公司青神县综合网格">眉山市分公司青神县综合网格</option>
                            
                                <option value="绵阳市分公司三台县东区综合网格???????????????">绵阳市分公司三台县东区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司三台县城区综合网格???????????????">绵阳市分公司三台县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司三台县西区综合网格???????????????">绵阳市分公司三台县西区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司北川县综合网格?????????????">绵阳市分公司北川县综合网格?????????????</option>
                            
                                <option value="绵阳市分公司安县北区综合网格??????????????">绵阳市分公司安县北区综合网格??????????????</option>
                            
                                <option value="绵阳市分公司安县南区综合网格??????????????">绵阳市分公司安县南区综合网格??????????????</option>
                            
                                <option value="绵阳市分公司平武县综合网格?????????????">绵阳市分公司平武县综合网格?????????????</option>
                            
                                <option value="绵阳市分公司梓潼县乡镇综合网格???????????????">绵阳市分公司梓潼县乡镇综合网格???????????????</option>
                            
                                <option value="绵阳市分公司梓潼县城区综合网格???????????????">绵阳市分公司梓潼县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司江油市北区一综合网格????????????????">绵阳市分公司江油市北区一综合网格????????????????</option>
                            
                                <option value="绵阳市分公司江油市北区二综合网格????????????????">绵阳市分公司江油市北区二综合网格????????????????</option>
                            
                                <option value="绵阳市分公司江油市城区综合网格???????????????">绵阳市分公司江油市城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司涪城区市中区综合网格????????????????">绵阳市分公司涪城区市中区综合网格????????????????</option>
                            
                                <option value="绵阳市分公司涪城区花园综合网格???????????????">绵阳市分公司涪城区花园综合网格???????????????</option>
                            
                                <option value="绵阳市分公司涪城区高水综合网格???????????????">绵阳市分公司涪城区高水综合网格???????????????</option>
                            
                                <option value="绵阳市分公司游仙区沈家坝综合网格????????????????">绵阳市分公司游仙区沈家坝综合网格????????????????</option>
                            
                                <option value="绵阳市分公司游仙区经开区综合网格????????????????">绵阳市分公司游仙区经开区综合网格????????????????</option>
                            
                                <option value="绵阳市分公司游仙区魏城综合网格???????????????">绵阳市分公司游仙区魏城综合网格???????????????</option>
                            
                                <option value="绵阳市分公司盐亭县乡镇综合网格???????????????">绵阳市分公司盐亭县乡镇综合网格???????????????</option>
                            
                                <option value="绵阳市分公司盐亭县城区综合网格???????????????">绵阳市分公司盐亭县城区综合网格???????????????</option>
                            
                                <option value="绵阳市分公司高新区普园综合网格???????????????">绵阳市分公司高新区普园综合网格???????????????</option>
                            
                                <option value="绵阳市分公司高新区永石综合网格???????????????">绵阳市分公司高新区永石综合网格???????????????</option>
                            
                                <option value="自贡市分公司大安区综合网格">自贡市分公司大安区综合网格</option>
                            
                                <option value="自贡市分公司富顺县代寺综合网格">自贡市分公司富顺县代寺综合网格</option>
                            
                                <option value="自贡市分公司富顺县富世综合网格">自贡市分公司富顺县富世综合网格</option>
                            
                                <option value="自贡市分公司富顺县板桥综合网格">自贡市分公司富顺县板桥综合网格</option>
                            
                                <option value="自贡市分公司沿滩区综合网格">自贡市分公司沿滩区综合网格</option>
                            
                                <option value="自贡市分公司自流井区汇东综合网格">自贡市分公司自流井区汇东综合网格</option>
                            
                                <option value="自贡市分公司自流井区自井综合网格">自贡市分公司自流井区自井综合网格</option>
                            
                                <option value="自贡市分公司荣县双石综合网格">自贡市分公司荣县双石综合网格</option>
                            
                                <option value="自贡市分公司荣县旭阳综合网格">自贡市分公司荣县旭阳综合网格</option>
                            
                                <option value="自贡市分公司荣县长山综合网格">自贡市分公司荣县长山综合网格</option>
                            
                                <option value="自贡市分公司贡井区筱溪综合网格">自贡市分公司贡井区筱溪综合网格</option>
                            
                                <option value="自贡市分公司贡井区龙潭综合网格">自贡市分公司贡井区龙潭综合网格</option>
                            
                                <option value="资阳市分公司乐至县城区综合网格???????????????">资阳市分公司乐至县城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司乐至县郊区综合网格???????????????">资阳市分公司乐至县郊区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县北区综合网格???????????????">资阳市分公司安岳县北区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县南区综合网格???????????????">资阳市分公司安岳县南区综合网格???????????????</option>
                            
                                <option value="资阳市分公司安岳县城区综合网格???????????????">资阳市分公司安岳县城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区东区综合网格???????????????">资阳市分公司雁江区东区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区城区综合网格???????????????">资阳市分公司雁江区城区综合网格???????????????</option>
                            
                                <option value="资阳市分公司雁江区西区综合网格???????????????">资阳市分公司雁江区西区综合网格???????????????</option>
                            
                                <option value="达州市分公司万源市综合网格">达州市分公司万源市综合网格</option>
                            
                                <option value="达州市分公司大竹县乡镇综合网格">达州市分公司大竹县乡镇综合网格</option>
                            
                                <option value="达州市分公司大竹县城区综合网格">达州市分公司大竹县城区综合网格</option>
                            
                                <option value="达州市分公司宣汉县乡镇综合网格">达州市分公司宣汉县乡镇综合网格</option>
                            
                                <option value="达州市分公司宣汉县城区综合网格">达州市分公司宣汉县城区综合网格</option>
                            
                                <option value="达州市分公司开江县综合网格">达州市分公司开江县综合网格</option>
                            
                                <option value="达州市分公司渠县乡镇综合网格">达州市分公司渠县乡镇综合网格</option>
                            
                                <option value="达州市分公司渠县城区综合网格">达州市分公司渠县城区综合网格</option>
                            
                                <option value="达州市分公司经开区综合网格">达州市分公司经开区综合网格</option>
                            
                                <option value="达州市分公司达川区乡镇综合网格">达州市分公司达川区乡镇综合网格</option>
                            
                                <option value="达州市分公司达川区城区综合网格">达州市分公司达川区城区综合网格</option>
                            
                                <option value="达州市分公司通川区城中综合网格">达州市分公司通川区城中综合网格</option>
                            
                                <option value="遂宁市分公司大英县综合网格?????????????">遂宁市分公司大英县综合网格?????????????</option>
                            
                                <option value="遂宁市分公司安居区综合网格?????????????">遂宁市分公司安居区综合网格?????????????</option>
                            
                                <option value="遂宁市分公司射洪县综合网格?????????????">遂宁市分公司射洪县综合网格?????????????</option>
                            
                                <option value="遂宁市分公司船山区综合网格?????????????">遂宁市分公司船山区综合网格?????????????</option>
                            
                                <option value="遂宁市分公司蓬溪县综合网格?????????????">遂宁市分公司蓬溪县综合网格?????????????</option>
                            
                                <option value="阿坝州分公司九寨沟县综合网格">阿坝州分公司九寨沟县综合网格</option>
                            
                                <option value="阿坝州分公司小金县综合网格">阿坝州分公司小金县综合网格</option>
                            
                                <option value="阿坝州分公司松潘县综合网格">阿坝州分公司松潘县综合网格</option>
                            
                                <option value="阿坝州分公司汶川县综合网格">阿坝州分公司汶川县综合网格</option>
                            
                                <option value="阿坝州分公司理县综合网格">阿坝州分公司理县综合网格</option>
                            
                                <option value="阿坝州分公司红原县综合网格">阿坝州分公司红原县综合网格</option>
                            
                                <option value="阿坝州分公司若尔盖县综合网格">阿坝州分公司若尔盖县综合网格</option>
                            
                                <option value="阿坝州分公司茂县综合网格">阿坝州分公司茂县综合网格</option>
                            
                                <option value="阿坝州分公司金川县综合网格">阿坝州分公司金川县综合网格</option>
                            
                                <option value="阿坝州分公司阿坝县综合网格">阿坝州分公司阿坝县综合网格</option>
                            
                                <option value="阿坝州分公司马尔康县综合网格">阿坝州分公司马尔康县综合网格</option>
                            
                                <option value="阿坝州分公司黑水县综合网格">阿坝州分公司黑水县综合网格</option>
                            
                                <option value="雅安市分公司名山区综合网格">雅安市分公司名山区综合网格</option>
                            
                                <option value="雅安市分公司天全县综合网格">雅安市分公司天全县综合网格</option>
                            
                                <option value="雅安市分公司宝兴县综合网格">雅安市分公司宝兴县综合网格</option>
                            
                                <option value="雅安市分公司汉源县综合网格">雅安市分公司汉源县综合网格</option>
                            
                                <option value="雅安市分公司石棉县综合网格">雅安市分公司石棉县综合网格</option>
                            
                                <option value="雅安市分公司芦山县综合网格">雅安市分公司芦山县综合网格</option>
                            
                                <option value="雅安市分公司荥经县综合网格">雅安市分公司荥经县综合网格</option>
                            
                                <option value="雅安市分公司雨城区北综合网格">雅安市分公司雨城区北综合网格</option>
                            
                                <option value="雅安市分公司雨城区南综合网格">雅安市分公司雨城区南综合网格</option>
                            
                                <option value=""></option>
                            
                                <option value="东兴网格">东兴网格</option>
                            
                                <option value="乐山市分公司犍为乡镇综合网格">乐山市分公司犍为乡镇综合网格</option>
                            
                                <option value="乐山市分公司犍为城区综合网格">乐山市分公司犍为城区综合网格</option>
                            
                                <option value="凉山州分公司德昌县综合网格�������������">凉山州分公司德昌县综合网格�������������</option>
                            
                                <option value="前锋网格">前锋网格</option>
                            
                                <option value="华蓥网格">华蓥网格</option>
                            
                                <option value="协兴网格">协兴网格</option>
                            
                                <option value="南充市分公司仪陇县马鞍综合网格">南充市分公司仪陇县马鞍综合网格</option>
                            
                                <option value="南充市分公司南部县城区综合网格">南充市分公司南部县城区综合网格</option>
                            
                                <option value="南充市分公司嘉陵区城区综合网格">南充市分公司嘉陵区城区综合网格</option>
                            
                                <option value="南充市分公司嘉陵区金龙综合网格">南充市分公司嘉陵区金龙综合网格</option>
                            
                                <option value="南充市分公司营山县双河老林综合网格">南充市分公司营山县双河老林综合网格</option>
                            
                                <option value="南充市分公司营山县城区综合网格">南充市分公司营山县城区综合网格</option>
                            
                                <option value="南充市分公司营山县骆市回龙综合网格">南充市分公司营山县骆市回龙综合网格</option>
                            
                                <option value="南充市分公司蓬安县城北乡镇综合网格">南充市分公司蓬安县城北乡镇综合网格</option>
                            
                                <option value="南充市分公司蓬安县城区综合网格">南充市分公司蓬安县城区综合网格</option>
                            
                                <option value="南充市分公司蓬安县城南乡镇综合网格">南充市分公司蓬安县城南乡镇综合网格</option>
                            
                                <option value="南充市分公司西充县城区综合网格">南充市分公司西充县城区综合网格</option>
                            
                                <option value="南充市分公司阆中市七里综合网格?">南充市分公司阆中市七里综合网格?</option>
                            
                                <option value="南充市分公司阆中市古城综合网格?">南充市分公司阆中市古城综合网格?</option>
                            
                                <option value="南充市分公司顺庆区中城综合网格">南充市分公司顺庆区中城综合网格</option>
                            
                                <option value="南充市分公司顺庆区和平综合网格">南充市分公司顺庆区和平综合网格</option>
                            
                                <option value="双流区城区综合网格">双流区城区综合网格</option>
                            
                                <option value="双流区西航港综合网格">双流区西航港综合网格</option>
                            
                                <option value="双龙网格">双龙网格</option>
                            
                                <option value="大邑县综合网格">大邑县综合网格</option>
                            
                                <option value="天府新区综合网格">天府新区综合网格</option>
                            
                                <option value="小金县综合网格">小金县综合网格</option>
                            
                                <option value="岳池乡镇网格">岳池乡镇网格</option>
                            
                                <option value="岳池城区网格">岳池城区网格</option>
                            
                                <option value="崇州市综合网格">崇州市综合网格</option>
                            
                                <option value="彭州市综合网格">彭州市综合网格</option>
                            
                                <option value="成华区新鸿综合网格">成华区新鸿综合网格</option>
                            
                                <option value="成华区青龙综合网格">成华区青龙综合网格</option>
                            
                                <option value="攀枝花市东区炳一综合网格">攀枝花市东区炳一综合网格</option>
                            
                                <option value="攀枝花市东区炳二综合网格">攀枝花市东区炳二综合网格</option>
                            
                                <option value="攀枝花市仁和区仁和综合网格">攀枝花市仁和区仁和综合网格</option>
                            
                                <option value="攀枝花市盐边县渔门综合网格">攀枝花市盐边县渔门综合网格</option>
                            
                                <option value="攀枝花市米易县综合网格">攀枝花市米易县综合网格</option>
                            
                                <option value="攀枝花市西区综合网格">攀枝花市西区综合网格</option>
                            
                                <option value="新津县综合网格">新津县综合网格</option>
                            
                                <option value="新都区城区综合网格">新都区城区综合网格</option>
                            
                                <option value="新都区新繁综合网格">新都区新繁综合网格</option>
                            
                                <option value="未知">未知</option>
                            
                                <option value="椑木网格">椑木网格</option>
                            
                                <option value="武侯区双楠综合网格">武侯区双楠综合网格</option>
                            
                                <option value="武侯区望江综合网格">武侯区望江综合网格</option>
                            
                                <option value="武侯区簇锦综合网格">武侯区簇锦综合网格</option>
                            
                                <option value="武胜城区网格">武胜城区网格</option>
                            
                                <option value="泸州市分公司合江县综合网格�������������">泸州市分公司合江县综合网格�������������</option>
                            
                                <option value="温江区综合网格">温江区综合网格</option>
                            
                                <option value="理县综合网格">理县综合网格</option>
                            
                                <option value="甜城网格">甜城网格</option>
                            
                                <option value="简阳市城区综合网格">简阳市城区综合网格</option>
                            
                                <option value="简阳市新区综合网格">简阳市新区综合网格</option>
                            
                                <option value="红原县综合网格">红原县综合网格</option>
                            
                                <option value="经开网格">经开网格</option>
                            
                                <option value="绵阳市分公司三台县城区综合网格">绵阳市分公司三台县城区综合网格</option>
                            
                                <option value="绵阳市分公司北川县综合网格">绵阳市分公司北川县综合网格</option>
                            
                                <option value="绵阳市分公司安县北区综合网格">绵阳市分公司安县北区综合网格</option>
                            
                                <option value="绵阳市分公司梓潼县城区综合网格">绵阳市分公司梓潼县城区综合网格</option>
                            
                                <option value="绵阳市分公司江油市城区综合网格">绵阳市分公司江油市城区综合网格</option>
                            
                                <option value="绵阳市分公司涪城区市中区综合网格">绵阳市分公司涪城区市中区综合网格</option>
                            
                                <option value="绵阳市分公司涪城区花园综合网格">绵阳市分公司涪城区花园综合网格</option>
                            
                                <option value="绵阳市分公司游仙区经开区综合网格">绵阳市分公司游仙区经开区综合网格</option>
                            
                                <option value="绵阳市分公司盐亭县乡镇综合网格">绵阳市分公司盐亭县乡镇综合网格</option>
                            
                                <option value="绵阳市分公司高新区永石综合网格">绵阳市分公司高新区永石综合网格</option>
                            
                                <option value="自贡市分公司贡井区筱溪综合网格���������������">自贡市分公司贡井区筱溪综合网格���������������</option>
                            
                                <option value="茂县综合网格">茂县综合网格</option>
                            
                                <option value="蒲江县综合网格">蒲江县综合网格</option>
                            
                                <option value="资阳市分公司乐至县城区综合网格">资阳市分公司乐至县城区综合网格</option>
                            
                                <option value="资阳市分公司乐至县郊区综合网格">资阳市分公司乐至县郊区综合网格</option>
                            
                                <option value="资阳市分公司安岳县北区综合网格">资阳市分公司安岳县北区综合网格</option>
                            
                                <option value="资阳市分公司安岳县南区综合网格">资阳市分公司安岳县南区综合网格</option>
                            
                                <option value="资阳市分公司安岳县城区综合网格">资阳市分公司安岳县城区综合网格</option>
                            
                                <option value="资阳市分公司雁江区东区综合网格">资阳市分公司雁江区东区综合网格</option>
                            
                                <option value="资阳市分公司雁江区城区综合网格">资阳市分公司雁江区城区综合网格</option>
                            
                                <option value="资阳市分公司雁江区西区综合网格">资阳市分公司雁江区西区综合网格</option>
                            
                                <option value="达州市分公司大竹县乡镇综合网格���������������">达州市分公司大竹县乡镇综合网格���������������</option>
                            
                                <option value="达州市分公司宣汉县城区综合网格���������������">达州市分公司宣汉县城区综合网格���������������</option>
                            
                                <option value="达州市分公司渠县乡镇综合网格��������������">达州市分公司渠县乡镇综合网格��������������</option>
                            
                                <option value="达州市分公司渠县城区综合网格��������������">达州市分公司渠县城区综合网格��������������</option>
                            
                                <option value="达州市分公司经开区综合网格�������������">达州市分公司经开区综合网格�������������</option>
                            
                                <option value="达州市分公司达川区乡镇综合网格1���������������">达州市分公司达川区乡镇综合网格1���������������</option>
                            
                                <option value="达州市分公司达川区城区综合网格���������������">达州市分公司达川区城区综合网格���������������</option>
                            
                                <option value="达州市分公司通川区城中综合网格���������������">达州市分公司通川区城中综合网格���������������</option>
                            
                                <option value="连界网格">连界网格</option>
                            
                                <option value="遂宁市分公司大英县综合网格">遂宁市分公司大英县综合网格</option>
                            
                                <option value="遂宁市分公司安居区综合网格">遂宁市分公司安居区综合网格</option>
                            
                                <option value="遂宁市分公司射洪县综合网格">遂宁市分公司射洪县综合网格</option>
                            
                                <option value="遂宁市分公司船山区综合网格">遂宁市分公司船山区综合网格</option>
                            
                                <option value="遂宁市分公司蓬溪县综合网格">遂宁市分公司蓬溪县综合网格</option>
                            
                                <option value="邛崃市综合网格">邛崃市综合网格</option>
                            
                                <option value="邻水乡镇网格">邻水乡镇网格</option>
                            
                                <option value="邻水城区网格">邻水城区网格</option>
                            
                                <option value="郫都区团结综合网格">郫都区团结综合网格</option>
                            
                                <option value="郫都区城区综合网格">郫都区城区综合网格</option>
                            
                                <option value="都江堰市综合网格">都江堰市综合网格</option>
                            
                                <option value="金堂县综合网格">金堂县综合网格</option>
                            
                                <option value="金牛区凤凰综合网格">金牛区凤凰综合网格</option>
                            
                                <option value="金牛区国宾综合网格">金牛区国宾综合网格</option>
                            
                                <option value="金牛区沙湾综合网格">金牛区沙湾综合网格</option>
                            
                                <option value="金鹅网格">金鹅网格</option>
                            
                                <option value="锦江区三圣综合网格">锦江区三圣综合网格</option>
                            
                                <option value="锦江区春熙综合网格">锦江区春熙综合网格</option>
                            
                                <option value="阿坝县综合网格">阿坝县综合网格</option>
                            
                                <option value="雅安市分公司名山区综合网格�������������">雅安市分公司名山区综合网格�������������</option>
                            
                                <option value="雅安市分公司石棉县综合网格�������������">雅安市分公司石棉县综合网格�������������</option>
                            
                                <option value="青白江区综合网格">青白江区综合网格</option>
                            
                                <option value="青羊区太升综合网格">青羊区太升综合网格</option>
                            
                                <option value="青羊区金沙综合网格">青羊区金沙综合网格</option>
                            
                                <option value="马尔康综合网格">马尔康综合网格</option>
                            
                                <option value="高新区孵化综合网格">高新区孵化综合网格</option>
                            
                                <option value="高新区紫荆综合网格">高新区紫荆综合网格</option>
                            
                                <option value="高新区西综合网格">高新区西综合网格</option>
                            
                                <option value="黄家网格">黄家网格</option>
                            
                                <option value="龙泉驿区城区综合网格">龙泉驿区城区综合网格</option>
                            
                                <option value="龙泉驿区经开综合网格">龙泉驿区经开综合网格</option>
                            
                                <option value="凉山州分公司喜德县综合网格">凉山州分公司喜德县综合网格</option>
                            
                                <option value="凉山州分公司甘洛县综合网格">凉山州分公司甘洛县综合网格</option>
                            
                                <option value="凉山州分公司美姑县综合网格">凉山州分公司美姑县综合网格</option>
                            
                                <option value="凉山州分公司越西县综合网格">凉山州分公司越西县综合网格</option>
                            
                                <option value="凉山州分公司金阳县综合网格">凉山州分公司金阳县综合网格</option>
                            
                                <option value="南充市分公司仪陇县新政综合网格">南充市分公司仪陇县新政综合网格</option>
                            
                                <option value="南充市分公司阆中市七里综合网格">南充市分公司阆中市七里综合网格</option>
                            
                                <option value="南充市分公司阆中市古城综合网格">南充市分公司阆中市古城综合网格</option>
                            
                                <option value="南充市分公司高坪区东观综合网格">南充市分公司高坪区东观综合网格</option>
                            
                                <option value="南充市分公司高坪区城区综合网格">南充市分公司高坪区城区综合网格</option>
                            
                                <option value="甘孜州分公司得荣县综合网格">甘孜州分公司得荣县综合网格</option>
                            
                                <option value="甘孜州分公司理塘县综合网格">甘孜州分公司理塘县综合网格</option>
                            
                                <option value="甘孜州分公司白玉县综合网格">甘孜州分公司白玉县综合网格</option>
                            
                                <option value="甘孜州分公司道孚县综合网格">甘孜州分公司道孚县综合网格</option>
                            
                                <option value="绵阳市分公司三台县东区综合网格">绵阳市分公司三台县东区综合网格</option>
                            
                                <option value="绵阳市分公司三台县西区综合网格">绵阳市分公司三台县西区综合网格</option>
                            
                                <option value="绵阳市分公司安县南区综合网格">绵阳市分公司安县南区综合网格</option>
                            
                                <option value="绵阳市分公司平武县综合网格">绵阳市分公司平武县综合网格</option>
                            
                                <option value="绵阳市分公司江油市北区一综合网格">绵阳市分公司江油市北区一综合网格</option>
                            
                                <option value="绵阳市分公司江油市北区二综合网格">绵阳市分公司江油市北区二综合网格</option>
                            
                                <option value="绵阳市分公司涪城区高水综合网格">绵阳市分公司涪城区高水综合网格</option>
                            
                                <option value="绵阳市分公司游仙区沈家坝综合网格">绵阳市分公司游仙区沈家坝综合网格</option>
                            
                                <option value="绵阳市分公司盐亭县城区综合网格">绵阳市分公司盐亭县城区综合网格</option>
                            
                                <option value="绵阳市分公司高新区普园综合网格">绵阳市分公司高新区普园综合网格</option>
                            
                        
                    </select>
                </div>
                <div class="form-group">
                    <label for="layerNameBS">给查询命名</label>
                    <input type="text" id="layerNameBB" class="form-control input-sm" style="width: 77px;">
                </div>
                <div class="form-group">
                    <a class="btn btn-danger btn-sm searchBtn">查询</a>

                </div>
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
    var hotMapSet = new Array();
    var plyCollections = new Array();
    var pointArray = new Array();
    var plyList = new Array();
    var datas = new Array();

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
    map.addEventListener("rightclick",function (e) {
        alert("rightClick:"+e.point.lng+","+e.point.lat);
    });

    $("#dataClass").bind("change", function () {
        var dataClass = $("#dataClass").val();
        if (dataClass === '签约渠道信息') {
            $(".baseStationConditions").hide();
            $(".socialChannelConditions").hide();
            $(".selfChannelConditions").hide();
            $(".broadBandCondition").hide();
            $(".channelConditions").show();
        } else if (dataClass === '基站信息') {
            $(".channelConditions").hide();
            $(".socialChannelConditions").hide();
            $(".selfChannelConditions").hide();
            $(".broadBandCondition").hide();
            $(".baseStationConditions").show();
        } else if (dataClass === '小微渠道信息') {
            $(".baseStationConditions").hide();
            $(".channelConditions").hide();
            $(".selfChannelConditions").hide();
            $(".broadBandCondition").hide();
            $(".socialChannelConditions").show();
        } else if (dataClass === '自有渠道信息') {
            $(".baseStationConditions").hide();
            $(".channelConditions").hide();
            $(".socialChannelConditions").hide();
            $(".broadBandCondition").hide();
            $(".selfChannelConditions").show();
        } else if (dataClass === '宽带信息') {
            $(".baseStationConditions").hide();
            $(".channelConditions").hide();
            $(".socialChannelConditions").hide();
            $(".selfChannelConditions").hide();
            $(".broadBandCondition").show();
        }
    })

    $(".searchBtn").bind("click", function () {
        var shape = $("#classOfShape").val();
        var size = $("#sizeChoice").val();
        var color = $("#colorChoice").val();
        var dataClass = $("#dataClass").val();

        var url = "../map/getCooChannels";//weloop.duapp.com/WeChat
        var data = $('#searchForm').serialize();
        if (dataClass === '签约渠道信息') {
            url = "../map/getCooChannels";
            data = $('#searchForm').serialize();
        } else if (dataClass === '基站信息') {
            url = "../map/getBaseStations";
            data = $('#searchBaseStationForm').serialize();
        } else if (dataClass === '小微渠道信息') {
            url = "../map/getSocChannels";
            data = $('#searchSocForm').serialize()
        } else if (dataClass === '自有渠道信息') {
            url = "../map/getSelfChannels";
            data = $('#searchSelfForm').serialize();
        } else if (dataClass === '宽带信息') {
            url = "../map/getBroadBands";
            data = $("#searchBroadBand").serialize();
        }
        zeroModal.loading(4);
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
            },
            success: function (data) {
                zeroModal.closeAll();
                var len = data.length;
                if (data.result!=null && data.result!=undefined && data.errcode=='-2') {
                    zeroModal.alert({content: data.result, width: '500px', height: '200', top: '100px'});
                }else {
                    zeroModal.success({content: "该次共查询" + len + "条数据", width: '500px', height: '200', top: '100px'});
                    if (len > 0) {
                        datas.push(data);
                        var points = new Array();
                        var shapeLocal = getShape(shape);
                        var sizeLocal = getSize(size);
                        var options = {
                            size: sizeLocal,
                            shape: shapeLocal,
                            color: color
                        }
                        for (var i = 0; i < len; i++) {
                            points.push(new BMap.Point(data[i].longitude, data[i].latitude));
                        }
                        drawData(points, options, data, dataClass);
                    }
                }
            }
        });
    });

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
            url: "../weChat/getCounty",
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

            //for (var j = 0; j < count; j++) {
            //strokeWeight 折线宽度 strokeColor:颜色 fillOpacity:填充  fillColor:填充颜色
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
    function drawData(points, options, data, dataClass) {
        if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
            var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
            var content;
            pointCollection.addEventListener('click', function (e) {
                for (var i = 0; i < data.length; i++) {
                    if (data[i].longitude == e.point.lng && data[i].latitude == e.point.lat) {
                        content = getContent(data[i], dataClass);
                    }

                }
                var point = new BMap.Point(e.point.lng, e.point.lat);
                var infowindow = new BMap.InfoWindow(content);
                map.openInfoWindow(infowindow, point);
                //alert('该点的坐标为：(' + e.point.lng + ',' + e.point.lat + ')');  // 监听点击事件
            });
            var heatmapOverlay = createHotMapSet(data, dataClass);
            hotMapSet.push(heatmapOverlay);
            map.addOverlay(pointCollection);  // 添加Overlay
            pointCollections.push(pointCollection);
            var id = pointCollections.length - 1;
            addLayerList(id, dataClass, data);
        } else {
            zeroModal.alert({
                content: "您的浏览器不支持绘制海量点数据,建议更换浏览器进行尝试", transition: true,
                width: '500px', height: '250px', top: '10px'
            });
        }
    }

    /**
     * 生成热力图数据集
     * */
    function createHotMapSet(data, dataClass) {
        var points = new Array();
        if (dataClass === '签约渠道信息') {
            for (var i = 0; i < data.length; i++) {
                points.push({"lng": data[i].longitude, "lat": data[i].latitude, "count": data[i].avgMonthDev});
            }
        }
        var heatmapOverlay = new BMapLib.HeatmapOverlay({"radius": 20});
        map.addOverlay(heatmapOverlay);
        heatmapOverlay.setDataSet({data: points, max: data[0].maxAvgMonthDev});
        heatmapOverlay.hide();
        return heatmapOverlay;
    }
    /**
     * 生成信息窗口的内容
     * */
    function getContent(obj, dataClass) {
        var content = "";
        if (dataClass === '签约渠道信息') {
            content =
                "<div style='width: 100%;'>" + obj.channelName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 11px;'>" +
                "<li>编码：" + obj.storeId + "</li>" +
                "<li>渠道编码：" + obj.channelNumber + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.gridName + "</li>" +
                "<li>渠道类型：" + obj.channelClass + "</li>" +
                "<li>门店类型_四级：" + obj.channelFourLevel + "</li>" +
                "<li>巡店人员电话: " + obj.xdPhone + "</li>" +
                "<li>月均发展量：" + obj.avgMonthDev + "</li>" +
                "<li>门店类型：" + obj.storeClass + "</li>" +
                "<li>经营类型：" + obj.classOfManage + "</li>" +
                "<li>业态：" + obj.typeOfOperation + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<li>店员人数：" + obj.countOfClerk + "</li>" +
                "<li>月终端销量：" + obj.proceedsMonthAvg + "</li>" +
                "<li>异网业务发展能力：" + obj.proceedsElseNet + "</li>" +
                "<input type='text' class='form-control input-sm' id='"+obj.storeId+"Coo'>" +
                "<button class='btn btn-danger btn-sm' onclick='updatePoint("+obj.storeId+")'>修改坐标</button> " +
                "</div>";
        } else if (dataClass === '基站信息') {
            content =
                "<div style='width: 100%;'>基站</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 12px;'>" +
                "<li>基站小区名称：" + obj.stationCommunityName + "</li>" +
                "<li>CGI：" + obj.CGI + "</li>" +
                "<li>网格：" + obj.grid + "</li>" +
                "<li>基站类别：" + obj.stationClass + "</li>" +
                "<li>资源利用率：" + obj.resourceUtilization + "</li>" +
                "<li>流量_GB: " + obj.quantityOfFlow + "</li>" +
                "<li>在线用户数：" + obj.numberOfUsersOnline + "</li>" +
                "<input type='text' class='form-control input-sm' id='"+obj.CGI+"BS'>" +
                "<button class='btn btn-danger btn-sm' id='"+obj.CGI+"' onclick='updateBSPoint(this.id)'>修改坐标</button> " +
                "</div>";
        } else if (dataClass === '小微渠道信息') {
            content =
                "<div style='width: 100%;'>" + obj.storeName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 11px;'>" +
                "<li>编码：" + obj.storeId + "</li>" +
                "<li>用户名称：" + obj.userName + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.gridName + "</li>" +
                "<li>门店类型：" + obj.storeClass + "</li>" +
                "<li>业态：" + obj.typeOfOperation + "</li>" +
                "<li>巡店人员电话: " + obj.xdPhone + "</li>" +
                "<li>C_累计：" + obj.allDays + "</li>" +
                "<li>C_30天发展：" + obj.thirtyDays + "</li>" +
                "<li>C_60天发展：" + obj.sixtyDays + "</li>" +
                "<li>地域：" + obj.ragion + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<input type='text' class='form-control input-sm' id='"+obj.storeId+"Soc'>" +
                "<button class='btn btn-danger btn-sm' onclick='updatePoint("+obj.storeId+")'>修改坐标</button> " +
                "</div>";
        } else if (dataClass === '自有渠道信息') {
            content =
                "<div style='width: 100%;'>" + obj.channelName + "</div>" +
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 11px;'>" +
                "<li>编码：" + obj.storeId + "</li>" +
                "<li>渠道编码：" + obj.channelNumber + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.gridName + "</li>" +
                "<li>门店类型：" + obj.storeClass + "</li>" +
                "<li>渠道类型_DB：" + obj.channelClass + "</li>" +
                "<li>门店类型_DB：" + obj.storeClassDB + "</li>" +
                "<li>运营方式_DB：" + obj.classOfManage + "</li>" +
                "<li>巡店人员电话: " + obj.xdPhone + "</li>" +
                "<li>业态：" + obj.typeOfOperation + "</li>" +
                "<li>面积：" + obj.measureOfArea + "</li>" +
                "<li>店员人数：" + obj.countOfClerk + "</li>" +
                "<input type='text' class='form-control input-sm' id='"+obj.storeId+"Self'>" +
                "<button class='btn btn-danger btn-sm' onclick='updatePoint("+obj.storeId+")'>修改坐标</button> " +
                "</div>";
        } else if (dataClass === '宽带信息') {
            content =
                "<div style='width: 100%;'>" + obj.projectName + "</div>" +
                "<div id='detailDivBB' class='BB' style='width: 100%; height: 500px; color: #555555; font-size: 10px;'>" +
                "<li>编码：" + obj.bbId + "</li>" +
                "<li>地址：" + obj.address + "</li>" +
                "<li>网格：" + obj.grid + "</li>" +
                "<li>区域类型：" + obj.classLocation + "</li>" +
                "<li>总楼宇数_栋：" + obj.countOfFloor + "</li>" +
                "<li>总住户数_商户数_户：" + obj.countOfHouse + "</li>" +
                "<li>总入住户数：" + obj.countOfHouseHold + "</li>" +
                "<li>建设方式: " + obj.methodOfProduce + "</li>" +
                "<li>接入方式：" + obj.methodOfJoinIn + "</li>" +
                "<li>责任社区经理：" + obj.societyManger + "</li>" +
                "<li>物业联系人：" + obj.propertyLinkMan + "</li>" +
                "<li>物业电话：" + obj.propertyLinkPhone + "</li>" +
                "<li>端口数：" + obj.countOfPort + "</li>" +
                "<li>装维情况：" + obj.conditionOfInstallAndMaintain + "</li>" +
                "<li>主要竞争对手：" + obj.mainCounter + "</li>" +
                "<li>拟主推产品：" + obj.mainProduce + "</li>" +
                "<li>存在问题：" + obj.existProblem + "</li>" +
                "<input type='text' class='form-control input-sm' id='"+obj.bbId+"BB'>" +
                "<button class='btn btn-danger btn-sm' onclick='updateBBPoint("+obj.bbId+")'>修改坐标</button> " +
                "</div>";
        }
        return content;
    }

    /**
     * 修改坐标
     * */
    function updatePoint(storeId) {
        var url;
        var textId;
        var point;
        if (storeId<1000000) {
            url="../map/updateSocPoint";
            textId=storeId+"Soc";
            point=$("#"+textId).val().replace(/(^s*)|(s*$)/g, "");
        }else if(storeId>1000000 && storeId<2000000) {
            url="../map/updateCooPoint";
            textId=storeId+"Coo";
            point=$("#"+textId).val().replace(/(^s*)|(s*$)/g, "");
        }else {
            url="../map/updateSelfPoint";
            textId=storeId+"Self";
            point=$("#"+textId).val().replace(/(^s*)|(s*$)/g, "");
        }
        if (point!=null && point!=undefined && point.length>0) {
            $.ajax({
                url: url,
                dataType: 'json',
                data: {"point": point, "storeId": storeId},
                //async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    zeroModal.closeAll();
                    zeroModal.error({
                        content: "出现错误" + errorThrown,
                        width: '500px',
                        height: '250',
                        top: '100px'
                    });
                },
                success: function (res) {
                    if (res.result == '修改成功') {
                        zeroModal.success({content: "修改成功", width: '500px', height: '200px', top: '10px'});
                    } else if (res.result == '修改失败') {
                        zeroModal.error({content: "修改失败", width: '500px', height: '200px', top: '10px'});
                    } else if (res.errcode == '-2') {
                        zeroModal.alert({content: res.result, width: '500px', height: '200px', top: '10px'});
                    }
                }
            });
        }else {
            zeroModal.alert({content:"坐标不能为空！！！", width: '500px', height: '200px', top: '10px'});
        }
    }

    /**
     * 修改基站坐标
     * **/
    function updateBSPoint(CGI) {
        var point=$("#"+CGI+"BS").val();
        $.ajax({
            url: "../map/updateBSPoint",
            dataType: 'json',
            data: {"point": point,"CGI":CGI},
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                zeroModal.closeAll();
                zeroModal.error({content: "出现错误" + errorThrown, width: '500px', height: '250', top: '100px'});
            },
            success: function (res) {
                if (res.result=='修改成功') {
                    zeroModal.success({content:"修改成功",width:'500px',height:'200px',top:'10px'});
                }else {
                    zeroModal.error({content:"修改失败",width:'500px',height:'200px',top:'10px'});
                }
            }
        });
    }

    /**
     * 修改宽带坐标
     * **/
    function updateBBPoint(bbid) {
        var point=$("#"+bbid+"BB").val();
        $.ajax({
            url: "../map/updateBBPoint",
            dataType: 'json',
            data: {"point": point,"bbId":bbid},
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                zeroModal.closeAll();
                zeroModal.error({content: "粗线错误" + errorThrown, width: '500px', height: '250', top: '100px'});
            },
            success: function (res) {
                if (res.result=='修改成功') {
                    zeroModal.success({content:"修改成功",width:'500px',height:'200px',top:'10px'});
                }else {
                    zeroModal.error({content:"修改失败",width:'500px',height:'200px',top:'10px'});
                }
            }
        });
    }
    /**
     * 添加图层列表
     * **/
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
    function addLayerList(id, dataClass, data) {
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
        if (dataClass === '签约渠道信息') {
            $("#layerList").prepend("<div id='" + id + "div' style='background-color: " + color + "'>" +
                "<li>" + content + "</li>" + "<li>" + dataClass + "</li>" + "<li id='" + id + "status'>状态：显示</li>" +
                "<li><input class='listBtn' id='" + id + "hide' type='button' value='隐藏' onclick='hide(this.id)'><input class='listBtn' id='" + id + "show' type='button' value='显示' onclick='show(this.id)'><input class='listBtn' id='" + id + "close' type='button' value='关闭' onclick='closeLayer(this.id)'></li>" +
                "<li><input class='listBtn' id='" + id + "hotMap' type='button' value='月均发展量热力图' onclick='showHotMap(this.id)'></li>" +
                "<li><input class='listBtn' id='" + id + "closeHotMap' type='button' value='关闭热力图' onclick='closeHotMap(this.id)'></li> </div>");
        } else {
            $("#layerList").prepend("<div id='" + id + "div' style='background-color: " + color + "'>" +
                "<li>" + content + "</li>" + "<li>" + dataClass + "</li>" + "<li id='" + id + "status'>状态：显示</li>" +
                "<li><input class='listBtn' id='" + id + "hide' type='button' value='隐藏' onclick='hide(this.id)'><input class='listBtn' id='" + id + "show' type='button' value='显示' onclick='show(this.id)'><input class='listBtn' id='" + id + "close' type='button' value='关闭' onclick='closeLayer(this.id)'></li> </div>");
        }
    }

    function showHotMap(id, data) {
        var index = id.substring(0, id.indexOf("h"));
        //hide(index+"h");
        var data = datas[index];
//        if (data!=null && data!=undefined) {
//            zeroModal.show({iframe:true,url:'../link/toColorChoice',width:'900px',height:'450px'});
//        }
        if (hotMapSet[index] != null) {
            setGradient(hotMapSet[index]);
            hotMapSet[index].show();
        }
    }

    function closeHotMap(id) {
        var index = id.substring(0, id.indexOf("c"));
        //show(index+"s");
        if (hotMapSet[index] != null) {
            hotMapSet[index].hide();
        }
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
        if (hotMapSet[index] != null) {
            map.removeOverlay(hotMapSet[index]);
        }
        $("#" + id).remove();
    }

    //判断浏览区是否支持canvas
    function isSupportCanvas() {
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }

    function setGradient(heatmapOverlay) {
        /**
         * 格式如下所示:
         * **/
        var gradient = {
            .25: '#0000FF',
            .5: '#00FF00',
            .75: '#FFF143',
            1: '#FF0000'
        };
        var colors = document.querySelectorAll("input[type='color']");
        colors = [].slice.call(colors, 0);
        colors.forEach(function (ele) {
            gradient[ele.getAttribute("data-key")] = ele.value;
        });
        heatmapOverlay.setOptions({"gradient": gradient});
    }

    function colorChange() {
        $("#colorChoice").css("background-color", $("#colorChoice").val());
    }

    $(".openChildMap").bind("click", function () {
        zeroModal.show({iframe: true, url: '../link/toChildMap', width: '950px', height: '490px',top:'10px'});
    });


</script>
