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
        * {
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }

        .table {
            font-size: 13px;
            border-bottom: solid 1px #eeeeee;
            border-top: none;
        }

        .shortTd {
            min-width: 90px;
        }

        .longTd {
            min-width: 200px;
        }

        .tabDiv {
            width: 100%;
            height: 400px;
            overflow-y: auto;
            overflow-x: auto;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        .selectConditionDiv {
            width: 100%;
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var element = $("#bp");
            options = {
                bootstrapMajorVersion: 3, //对应的bootstrap版本
                currentPage: 1, //当前页数，这里是用的EL表达式，获取从后台传过来的值
                numberOfPages: 13, //每页页数
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
                    location.href = "../data/getBackData?page=" + page;
                }
            };
            element.bootstrapPaginator(options);
        });
    </script>
</head>


    
        
            <div class="selectConditionDiv">
                <!--条件区域-->
            </div>
            <hr>
            <div class="tabDiv">
                
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td class="shortTd">编号</td>
                            <td class="longTd">分类</td>
                            <td class="longTd">分级</td>
                            <td class="longTd">接收人</td>
                            <td class="longTd">接收人电话</td>
                            <td class="shortTd">要求推送时间</td>
                            <td class="longTd">推送内容1</td>
                            <td class="longTd">推送内容2</td>
                            <td class="longTd">推送内容3</td>
                            <td class="longTd">推送内容4</td>
                            <td class="longTd">推送内容5</td>
                            <td class="longTd">推送内容6</td>
                            <td class="longTd">推送内容7</td>
                            <td class="longTd">推送内容8</td>
                            <td class="longTd">推送内容9</td>
                            <td class="longTd">推送内容10</td>
                        </tr>
                        </thead>
                        <tbody>
                        
                            <tr>
                                <td class="shortTd">2017041501</td>
                                <td class="longTd">绩效指标</td>
                                <td class="longTd">市公司营销网格</td>
                                <td class="longTd">YAN</td>
                                <td class="longTd">18610612126</td>
                                <td class="shortTd">20170801163000</td>
                                <td class="longTd">时间：8月1日；开户数：22户；积分：35</td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                            </tr>
                        
                            <tr>
                                <td class="shortTd">2017041501</td>
                                <td class="longTd">绩效指标</td>
                                <td class="longTd">市公司营销网格</td>
                                <td class="longTd">CHEN</td>
                                <td class="longTd">18628001099</td>
                                <td class="shortTd">20170801163000</td>
                                <td class="longTd">时间：8月1日；开户数：21户；积分：23</td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                            </tr>
                        
                            <tr>
                                <td class="shortTd">2017041501</td>
                                <td class="longTd">绩效指标</td>
                                <td class="longTd">市公司营销网格</td>
                                <td class="longTd">刘伟</td>
                                <td class="longTd">18702832364</td>
                                <td class="shortTd">20170801163000</td>
                                <td class="longTd">时间：8月1日；开户数：18户；积分：43</td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                            </tr>
                        
                            <tr>
                                <td class="shortTd">2017041501</td>
                                <td class="longTd">绩效指标</td>
                                <td class="longTd">市公司营销网格</td>
                                <td class="longTd">WANG</td>
                                <td class="longTd">18608000819</td>
                                <td class="shortTd">20170801163000</td>
                                <td class="longTd">时间：8月1日；开户数：16户；积分：19</td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                                <td class="longTd"></td>
                            </tr>
                        
                        </tbody>
                    </table>
                
                
            </div>
            
            <hr>
            <a href="../pushMsg/pushLastMsg" class="btn btn-danger col-sm-2 col-sm-offset-1">推送</a>
            <ul id="bp" class="col-sm-8 col-sm-offset-2"></ul>
        
    

</body>
</html>
