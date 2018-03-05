<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>修改密码</title>
    <%@ include file="ywinclude.jsp" %>
    <script type="text/javascript">
        //日期选择
        $(function () {
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

            $("#searchBtn").bind("click",function (){
                zeroModal.loading(4);
                $.ajax({
                    url: "../logger/getLogger",//weloop.duapp.com/WeChat
                    dataType: 'json',
                    data: $("#searchForm").serialize(),
                    //async: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        zeroModal.closeAll();
                        zeroModal.error({content:"发生错误,登录可能失效,请重新登录"+errorThrown,width:'500px',height:'200px',top:'10px'});
                    },
                    success: function (res) {
                        zeroModal.closeAll();
                        var len=res.length;
                        var table='<table class="table table-hover">'+
                        '<thead>'+
                        '<tr>'+
                        '<td>用户</td><td>日期</td><td>时间</td><td>详情</td><td>类型</td>'+
                        '</tr>'+
                        '</thead>'+
                        '<tbody>';
                        for (var i=0; i<len; i++) {
                            table=table+
                                '<tr>'+
                                '<td>'+res[i].who+'</td>'+
                                '<td>'+res[i].day+'</td>'+
                                '<td>'+res[i].time+'</td>'+
                                '<td>'+res[i].doWhat+'</td>'+
                                '<td>'+res[i].eventType+'</td>'+
                                '</tr>';
                        }
                        table=table+'</tbody></table>';
                        document.getElementById("tabDiv").innerHTML=table;
                    }
                });
            });
        });
    </script>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }
        li{
            list-style: none;
        }
        #tabDiv {
            width: 100%;
            height: 400px;
            overflow-y: auto;
            overflow-x: auto;
        }
        li{
            padding-bottom: 10px;
            border-bottom: solid rgba(200,200,200,0.98);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel">
        <div class="panel-body">
            <li>
                <form class="form-inline col-sm-5" id="searchForm">
                    <div class="form-group">
                        <label for="startTime">时间段</label>
                        <input type="text" class="form-control input-sm" id="startTime" name="timeStart" readonly style="width: 130px">
                        -
                        <input type="text" class="form-control input-sm" id="endTime" name="timeEnd" readonly style="width: 130px">
                    </div>
                </form>
                <button id="searchBtn" class="btn btn-danger btn-sm" >查询</button>
            </li>
            <div id="tabDiv">
            </div>
        </div>
    </div>
</div>
</body>
</html>