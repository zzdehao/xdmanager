<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>GIS-巡店轨迹</title>
    <%@ include file="ywinclude.jsp" %>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=VN0SG164b04AZFb2BBmpbgKI8Uh5i11O"></script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: "华文中宋";
            background-color: #EEEEEE;
        }

        .left {
            float: left;
            height: 100%;
            width: 12%;
            border-right-color: #CF4646;
        }

        .first {
            height: 6%;
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
            width: 88%;
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
        #detailDiv li{
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
        .layerList{
            font-size: 12px;
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
<div class="first">
    <div class="left">
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

            </div>
        </li>
    </div>
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
                    &nbsp;
                    <div class="form-group">
                        <label for="grid">网格</label>
                        <select id="grid" class="form-control input-sm" name="grid" style="width: 70px;">
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
                    </div>&nbsp;
                    <div class="form-group">
                        <label for="startTime">时间段</label>
                        <input type="text" class="form-control input-sm" id="startTime" name="startTime" value="2017年12月23日" readonly style="width: 110px">
                        -
                        <input type="text" class="form-control input-sm" id="endTime" name="endTime" value="2017年12月23日" readonly style="width: 110px">
                    </div>
                    <div class="form-group">
                        <a id="searchBtn" class="btn btn-danger btn-sm">查询</a>
                    </div>
                    <input id="getXzArea" type="button" class="btn btn-danger btn-sm" value="获取行政区域">
                </li>
            </form>
        </div>
    </div>
</div>
<div class="second">
    <div class="left" id="layerList" style="overflow-y: auto">

    </div>
    <div id="allmap" class="right right_bottom"></div>
</div>
</body>
</html>
<script type="text/javascript">

    var pointCollections = new Array();
    var polygens=new Array();
    var labels=new Array();
    var plyCollections=new Array();
    var pointArray=new Array();
    var plyList=new Array();

    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom("成都", 12);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity("成都");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var stCtrl = new BMap.PanoramaControl();//添加全景按钮
    stCtrl.setOffset(new BMap.Size(30, 60));
    map.addControl(stCtrl);
    //添加控件和比例尺
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    //颜色数组
    var colors=["#FF2D2D","#600000","#900041","#FF359A","#460046","#930093","#FF00FF",
        "#3A006F","#8600FF","#CA8EFF","#000093","#4A4AFF","#0072E3","#003E3E","#00CACA","#006030",
        "#02F78E","#00BB00","#53FF53","#FFFF37","#977C00","#FFD306","#9F5000","#FF9225","#A23400",
        "#5151A2","#3D7878","#616130","#AD5A5A"];
    //形状数组
    var shapes=[BMAP_POINT_SHAPE_STAR,BMAP_POINT_SHAPE_CIRCLE,BMAP_POINT_SHAPE_SQUARE,
        BMAP_POINT_SHAPE_RHOMBUS];
    $("#searchBtn").bind("click", function () {

        var storeClass=$("#storeClass").val();

        var url="../data/dataToLoopTrack";//weloop.duapp.com/WeChat
        var data=$('#searchForm').serialize();
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
                zeroModal.error({content:"出错了"+errorThrown,width:'500px',height:'250',top:'100px'});
            },
            success: function (data) {
                zeroModal.closeAll();
                var len = data.length;
                if (data.result!=null && data.result!=undefined && data.errcode=='-2') {
                    zeroModal.alert({content: data.result, width: '500px', height: '200', top: '100px'});
                }else {
                    zeroModal.success({content: "该次共查询" + len + "天的数据", width: '500px', height: '200', top: '100px'});
                    if (len > 0) {
                        var sizeLocal = BMAP_POINT_SIZE_BIG;
                        for (var i = 0; i < len; i++) {
                            var length = data[i].length;
                            var list = data[i];
                            var day = list[0].day;
                            var points = new Array();
                            var colorIndex = i % colors.length;
                            var color = colors[colorIndex];
                            var shapeLocal = shapes[i % 4];
                            var options = {
                                size: sizeLocal,
                                shape: shapeLocal,
                                color: color
                            }
                            for (var j = 0; j < length; j++) {
                                var baiduCoordinate = list[j].baiduCoordinate;
                                if (baiduCoordinate != null && baiduCoordinate != "" && baiduCoordinate != undefined) {
                                    var longitude = baiduCoordinate.substring(0, baiduCoordinate.indexOf(","));
                                    var latitude = baiduCoordinate.substring(baiduCoordinate.indexOf(",") + 1, baiduCoordinate.length);
                                    //alert(longitude+":"+latitude);
                                    points.push(new BMap.Point(longitude, latitude));
                                }
                            }
                            drawData(points, options, list, day, length, color);
                        }
                    }
                }
            }
        });
    })

    $("#getXzArea").bind("click",function () {
        var cityId=$("#xzCity").val();
        var color=$("#colorChoice").val();
        pointArray.length=0;
        zeroModal.loading(4);
        $.ajax({
            url: "../weChat/getCounty",//weloop.duapp.com/WeChat
            dataType: 'json',
            data: {"cityId": cityId},
            //async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                zeroModal.closeAll();
                zeroModal.error({content:"出错了"+errorThrown,width:'500px',height:'250',top:'100px'});
            },
            success: function (res) {
                zeroModal.closeAll();
                var length = res.length;
                if (res.result!=null && res.result!=undefined && ress.errcode=='-2') {
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
                alert('未能获取当前输入行政区域');
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
    function drawData(points, options, data,day,length,color) {
        if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
            var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
            var content;
            pointCollection.addEventListener('click', function (e) {
                for (var i = 0; i < data.length; i++) {
                    var baiduCoordinate=data[i].baiduCoordinate;
                    if (baiduCoordinate!=null && baiduCoordinate!="" && baiduCoordinate!=undefined) {
                        var longitude=baiduCoordinate.substring(0,baiduCoordinate.indexOf(","));
                        var latitude=baiduCoordinate.substring(baiduCoordinate.indexOf(",")+1,baiduCoordinate.length);
                        if (longitude==e.point.lng && latitude==e.point.lat) {
                            content=getContent(data[i]);
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
            addLayerList(id,day,color,length);
            var polylineList=new Array();
            var labelList=new Array();
            var xdPhone=$("#xdPhone").val().replace(/(^\s*)|(\s*$)/g, '');
            if (xdPhone!=null && xdPhone!="" && xdPhone!=undefined) {
                var preCoordinate=data[0].baiduCoordinate;
                var prePoint=getPoint(preCoordinate);
                var lable=addLable(prePoint,"1",color);
                labelList.push(lable);
                var nextPoint;
                for (var j=1; j<data.length; j++) {

                    var nextCoordinate=data[j].baiduCoordinate;
                    if (nextCoordinate!=null && nextCoordinate!="" && nextCoordinate!=undefined) {
                        nextPoint=getPoint(nextCoordinate);
                        var lable=addLable(nextPoint,j+1,color);
                        var polyline=drawPolyLine(prePoint,nextPoint,color);
                        labelList.push(lable);
                        polylineList.push(polyline);
                        prePoint=nextPoint;
                    }
                }
            }
            polygens.push(polylineList);
            labels.push(labelList);
        } else {
            alert('您的浏览器不支持绘制海量点数据,建议更换浏览器进行尝试');
        }
    }

    function addLable(point,content,color) {
        var opts = {
            position : point,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(3, -5)    //设置文本偏移量
        }
        var label = new BMap.Label(content, opts);  // 创建文本标注对象
        label.setStyle({
            color : color,
            fontSize : "20px",
            height : "0px",
            lineHeight : "0px",
            fontFamily:"华文中宋"
        });
        map.addOverlay(label);
        return label;
    }
    function drawPolyLine(prePoint,nextPoint,color) {
        var polyline = new BMap.Polyline([
                prePoint,
                nextPoint
            ],
            {strokeColor:color, strokeWeight:3, strokeOpacity:0.8}
        );
        map.addOverlay(polyline);
        return polyline;
    }
    function getPoint(baiduCoordinate) {
        var point;
        if (baiduCoordinate!=null && baiduCoordinate!="" && baiduCoordinate!=undefined) {
            var longitude=baiduCoordinate.substring(0,baiduCoordinate.indexOf(","));
            var latitude=baiduCoordinate.substring(baiduCoordinate.indexOf(",")+1,baiduCoordinate.length);
            point=new BMap.Point(longitude,latitude);
        }
        return point;
    }

    /*
     生成信息窗口的内容
     */
    function getContent(obj) {
        var content=
                "<div style='width: 100%;'>"+obj.storeName+"</div>"+
                "<div id='detailDiv' style='width: 100%; height: 500px; color: #555555; font-size: 12px;'>"+
                "<li>地址："+obj.address+"</li>"+
                "<li>网格："+obj.gridName+"</li>"+
                "<li>渠道类型："+obj.storeClass+"</li>"+
                "<li>巡店人员电话: "+obj.submitPerson+"</li>"+
                "<li>最近巡店时间："+obj.updateTime+"</li>"+
                "</div>";
        return content;
    }

    function addPlyList(id) {
        var cityName=$("#xzCity").find("option:selected").text();
        var color=$("#colorChoice").val();
        $("#layerList").prepend("<div id='" + id + "plyDiv' style='background-color: " + color + "'>" +
            "<li>" + cityName + "行政区划</li>"+
            "<li><input class='listBtn' id='" + id + "close' type='button' value='关闭所有' onclick='closePly(this.id)'></li> </div>");
    }

    /***
     *关闭行政区划图层
     **/
    function closePly(id) {
        var index = id.substring(0, 1);
        if (plyCollections[index] != null) {
            for (var i=0; i<plyCollections[index].length; i++) {
                var plys=plyCollections[index];
                map.removeOverlay(plys[i]);
            }
        }
        for (var i=0;i<plyCollections.length; i++) {
            $("#" + i+"plyDiv").remove();
        }

    }
    function addLayerList(id,day,color,length) {
        $("#layerList").prepend("<div id='" + id + "div' class='layerList' style='background-color: " + color + "'>" +
            "<li>"+day+":"+length+"个</li>"+"<li id='"+id+"status'>状态：显示</li>"+
            "<li><input class='listBtn' id='" + id + "hide' type='button' value='隐藏' onclick='hide(this.id)'><input class='listBtn' id='" + id + "show' type='button' value='显示' onclick='show(this.id)'><input class='listBtn' id='" + id + "close' type='button' value='关闭' onclick='closeLayer(this.id)'></li> </div>");
    }

    function hide(id) {
        var index = id.substring(0, id.indexOf("h"));
        if (pointCollections[index] != null) {
            $("#"+index+"status").text("状态：已隐藏");
            pointCollections[index].hide();
        }
        if (polygens[index]!=null) {
            var pList=polygens[index];
            for (var i=0; i<pList.length; i++) {
                pList[i].hide();
            }
        }
        if (labels[index]!=null) {
            var lList=labels[index];
            for (var j=0; j<lList.length; j++) {
                lList[j].hide();
            }
        }
    }

    function show(id) {
        var index = id.substring(0, id.indexOf("s"));
        if (pointCollections[index] != null) {
            $("#"+index+"status").text("状态：显示");
            pointCollections[index].show();
        }
        if (polygens[index]!=null) {
            var pList=polygens[index];
            for (var i=0; i<pList.length; i++) {
                pList[i].show();
            }
        }
        if (labels[index]!=null) {
            var lList = labels[index];
            for (var j = 0; j < lList.length; j++) {
                lList[j].show();
            }
        }
    }

    function closeLayer(id) {
        var index = id.substring(0, id.indexOf("c"));
        id = index + "div";
        if (pointCollections[index] != null) {
            map.removeOverlay(pointCollections[index]);
        }
        if (polygens[index]!=null) {
            var pList=polygens[index];
            for (var i=0; i<pList.length; i++) {
                map.removeOverlay(pList[i]);
            }
        }
        if (labels[index]!=null) {
            var lList = labels[index];
            for (var j = 0; j < lList.length; j++) {
                map.removeOverlay(lList[j]);
            }
        }
        $("#" + id).remove();
    }
</script>
