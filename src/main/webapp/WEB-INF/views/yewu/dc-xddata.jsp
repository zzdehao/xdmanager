<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>导入</title>
    <%@ include file="ywinclude.jsp" %>
    <!--[endif]-->
    <style type="text/css" rel="stylesheet">
        body{
            font-family: 华文中宋;
        }
        .container,.panel,.panel-body {
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }

        .table {
            font-size: 13px;
            border-bottom: none;
            border-top: none;
            color: #666666;
        }
        .shortTd {
            min-width: 90px;
        }
        .longTd{
            min-width: 200px;
        }
        .tabDiv {
            width: 100%;
            height: 400px;
            overflow-y: auto;
            overflow-x: auto;
        }
        td{
            text-align: center;
            vertical-align: middle;
            font-size: 13px;
            font-family: 华文中宋;
        }
        .selectConditionDiv{
            width: 100%;
            color: #999999;
        }
        label {
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        function selected(id,result) {
            result=result.replace(/(^\s*)|(\s*$)/g, '');
            if (result!=null && result!="" && result!=undefined) {
                $("#"+id).val(result);
            }

        }
        $(function () {
            //设置值
            var gridTxt=$("#gridTxt").val();
            var batchTxt=$("#batchTxt").val();
            var classLocalTxt=$("#classLocalTxt").val();
            var classOperationTxt=$("#classOperationTxt").val();
            var pageSizeTxt=$("#pageSizeTxt").val();
            var storeClassTxt=$("#storeClassTxt").val();
            var cityTxt=$("#cityTxt").val();
            selected("grid",gridTxt);
            selected("batch",batchTxt);
            selected("classLocal",classLocalTxt);
            selected("classOperation",classOperationTxt);
            selected("pageSize",pageSizeTxt);
            selected("storeClass",storeClassTxt);
            selected("city",cityTxt);
            //日期选择
            var start={
                skinCell:"jedatered",                       //风格颜色
                format:"YYYY年MM月DD日",                        //格式
                minDate:"1900-01-01 00:00:00",              //最小日期
                maxDate:$.nowDate({DD:0}),              //最大日期
                fixed:true,         //是否静止定位，为true时定位在输入框，为false时居中定位
                isinitVal:true,                            //是否初始化时间，默认不初始化时间
                zIndex:2099,                                //弹出层的层级高度
                language:{                                  //多语言设置
                    name  : "cn",
                    month : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
                    weeks : [ "日", "一", "二", "三", "四", "五", "六" ],
                    times : ["小时","分钟","秒数"],
                    clear : "清空",
                    today : "今天",
                    yes   : "确定",
                    close : "关闭"
                },
                isToday:false,
                choosefun: function(elem, val, date){
                    end.minDate = date; //开始日选好后，重置结束日的最小日期
                    endDates();
                }
            };
            var end={
                skinCell:"jedatered",                       //风格颜色
                format:"YYYY年MM月DD日",                        //格式
                minDate:$.nowDate({DD:0}),              //最小日期
                maxDate:"2099-12-31 12:59:59",              //最大日期
                fixed:true,         //是否静止定位，为true时定位在输入框，为false时居中定位
                isinitVal:true,                            //是否初始化时间，默认不初始化时间
                zIndex:2099,                                //弹出层的层级高度
                language:{                                  //多语言设置
                    name  : "cn",
                    month : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
                    weeks : [ "日", "一", "二", "三", "四", "五", "六" ],
                    times : ["小时","分钟","秒数"],
                    clear : "清空",
                    today : "今天",
                    yes   : "确定",
                    close : "关闭"
                },
                isToday:false,
                choosefun: function(elem, val, date){
                    start.maxDate = date; //将结束日的初始值设定为开始日的最大日期
                }
            };
            $("#startTime").jeDate(start);
            $("#endTime").jeDate(end);
            $("#searchBtn").bind("click",function () {
               $("#searchForm").attr("action","../data/allDataWithCds").submit();
            });
            $("#exportDataBtn").bind("click",function () {
               $("#searchForm").attr("action","../data/partExport").submit();
            });
            $("#clearExportDataBtn").bind("click",function () {
               if (confirm("数据删除后不可恢复,请在确保导出成功后谨慎删除!!!\n确定要继续删除吗？")) {

               }
            });
            //分页
            var element = $("#bp");
            var options = {
                bootstrapMajorVersion: 3, //对应的bootstrap版本
                currentPage: 1, //当前页数，这里是用的EL表达式，获取从后台传过来的值
                numberOfPages: 10, //每页条数
                totalPages:0, //总页数，这里是用的EL表达式，获取从后台传过来的值
                shouldShowPage: true,//是否显示该按钮
                itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                },
                //点击事件
                onPageClicked: function (event, originalEvent, type, page) {
                    location.href = "../data/allDataWithCds?page=" + page;
                }
            };
            element.bootstrapPaginator(options);
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="selectConditionDiv">
                <input type="hidden" id="gridTxt" value="all">
                <input type="hidden" id="batchTxt" value="0">
                <input type="hidden" id="classLocalTxt" value="all">
                <input type="hidden" id="classOperationTxt" value="all">
                <input type="hidden" id="pageSizeTxt" value="10">
                <input type="hidden" id="storeClassTxt" value="小微渠道">
                <input type="hidden" id="cityTxt" value="all">
                <!--条件区域-->
                <form class="form-inline" id="searchForm" method="get" action="../data/allDataWithCds">
                    <div class="form-group">
                        <label for="storeId">店铺ID</label>
                        <input type="text" class="form-control input-sm" id="storeId" value="" name="storeId" style="width: 60px;">
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="storeNumber">渠道编码</label>
                        <input type="text" class="form-control" id="storeNumber" name="storeNumber" value="" style="width: 60px;">
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <label for="storeName">店铺名称</label>
                        <input type="text" class="form-control input-sm" id="storeName" name="storeName" value="" style="width: 100px">
                    </div>&nbsp;
                    <div class="form-group">
                        <label for="xdPhone">巡店人员(手机号)</label>
                        <input type="text" class="form-control input-sm" id="xdPhone" name="xdPhone" value="" style="width: 95px">
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
                        <select id="grid" class="form-control input-sm" name="grid" style="width: 100px;">
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
                        <select id="classOperation" class="form-control input-sm" name="classOperation" style="width: 100px;">
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
                    <br><br>
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
                        <input type="text" class="form-control input-sm" id="startTime" name="startTime" value="2017年12月23日" readonly style="width: 110px">
                        -
                        <input type="text" class="form-control input-sm" id="endTime" name="endTime" value="2017年12月23日" readonly style="width: 110px">
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
                        <label for="pageSize">每页显示条数</label>
                        <select id="pageSize" class="form-control input-sm" name="pageSize">
                            <option value="10">10条</option>
                            <option value="20">20条</option>
                            <option value="30">30条</option>
                            <option value="50">50条</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a id="searchBtn" class="btn btn-danger btn-sm">查询</a>
                    </div>
                    &nbsp;
                    <div class="form-group">
                        <a id="exportDataBtn" class="btn btn-danger btn-sm">导出</a>
                    </div>
                </form>
            </div>
            <hr>
            <div class="tabDiv">
                
                    
                        <table class="table table-hover">
                            <thead>
                            <tr bgcolor="#c8c8c8">
                                <td class="shortTd">任务编码</td>
                                <td class="shortTd">店铺ID</td>
                                <td class="longTd">店铺名称</td>
                                <td class="longTd">用户名</td>
                                <td class="shortTd">省</td>
                                <td class="shortTd">地市</td>
                                <td class="longTd">地址</td>
                                <td class="longTd">网格名称</td>
                                <td class="shortTd">是否存在</td>
                                <td class="shortTd">不存在原因</td>
                                <td class="longTd">实际名称</td>
                                <td class="longTd">实际地址</td>
                                <td class="longTd">坐标</td>
                                <td class="longTd">实际所属网格</td>
                                <td class="shortTd">地域</td>
                                <td class="shortTd">门店类型</td>
                                <td class="shortTd">业态</td>
                                <td class="shortTd">店铺面积</td>
                                <td class="shortTd">是否有运营商门头</td>
                                <td class="shortTd">是否有灯箱</td>
                                <td class="shortTd">运营商标识二维码</td>
                                <td class="shortTd">联通宣传广告</td>
                                <td class="shortTd">是否有手机专柜</td>
                                <td class="longTd">反馈信息</td>
                                <td class="shortTd">店铺门头1</td>
                                <td class="shortTd">店铺门头2</td>
                                <td class="shortTd">店铺临街环境1</td>
                                <td class="shortTd">店铺临街环境2</td>
                                <td class="shortTd">店铺临街环境3</td>
                                <td class="shortTd">店铺内照片1</td>
                                <td class="shortTd">店铺内照片2</td>
                            </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                        </table>
                    
                    
                    
                    
                
            </div>
            <hr>
            <ul id="bp" class="col-sm-6"></ul><br>
        </div>
    </div>
</div>
</body>
</html>
