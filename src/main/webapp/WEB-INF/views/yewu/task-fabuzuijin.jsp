<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>发布任务</title>
    <%@ include file="ywinclude.jsp" %>
    <!--[endif]-->
    <style type="text/css" rel="stylesheet">
        body {
            font-family: 华文中宋;
        }
        * {
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }
        .tbDiv {
            width: 900px;
            overflow-x: auto;
        }
        .table {
            font-size: 13px;
            width: 100%;
            border-bottom: solid 1px #eeeeee;
            border-top: none;
            overflow-x: auto;
        }
        .table tr th,.table tr td{
            width:12.5% !important;
            vertical-align: middle;
            text-align: center;
        }
        .headerTab tr th,.table tr td{
            width:9% !important;
        }
        .success{
            color: #00FF00;
        }
        .failed{
            color: #FF0000;
        }
        #bodyTab{
            height: 400px;
            overflow-y: scroll;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var element = $("#bp");
            options = {
                bootstrapMajorVersion: 3, //对应的bootstrap版本
                currentPage: 1, //当前页数，这里是用的EL表达式，获取从后台传过来的值
                numberOfPages: 13, //每页页数
                totalPages:5, //总页数，这里是用的EL表达式，获取从后台传过来的值
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
                    location.href = "../task/getThisTask?page=" + page;
                }
            };
            element.bootstrapPaginator(options);

            $("#publicBtn").bind("click",function () {
                //验证当前页面数据是否为未发布的任务，若已发布则将发布按钮置为不可点击状态
                var status=$("#taskTab td:eq(6)").text().replace(/(^\s*)|(\s*$)/g, '');
                if (1==1) {
                    if (confirm("确定发布任务吗？")==false) {
                        return false;
                    }
                }else {
                    alert("暂无未发布的任务");
                    return false;
                }
            });

        });
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-body">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="padding-right:60px;padding-bottom: 0px; height: 25px; margin-left: 20px;margin-right: 20px;">
                <div class="container">
                    <table class="table headerTab" style="width: 98%; margin-left: 30px;border-bottom: none">
                        <tr>
                            <th>店铺ID</th>
                            <th>店铺名称</th>
                            <th>任务详情</th>
                            <th>地址</th>
                            <th>联系方式</th>
                            <th>状态</th>
                            <th>批次</th>
                        </tr>
                    </table>
                </div>
            </nav>
            <div class="container" style="margin-top:40px;"  id="bodyTab">
                <table class="table" style="width: 100%">
                    
                        
                            <tr>
                                <td>2000369</td>
                                <td>A姑咱自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>甘孜(828)市城区业务部(812149)区县姑咱镇文化路11号</td>
                                <td>13111817778</td>
                                <td>
                                    
                                        
                                        
                                        已完成
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000375</td>
                                <td>A攀枝花炳二网格炳三区营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>攀枝花(813)市东区分公司(814005)区县机场路341号附11号</td>
                                <td>13154916088</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000373</td>
                                <td>A攀枝花市东区炳二网格江南营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>攀枝花(813)市东区分公司(814005)区县攀枝花大道东段399号</td>
                                <td>13154916088</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000374</td>
                                <td>A攀枝花炳二网格金联御都自有厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>攀枝花(813)市东区分公司(814005)区县瓜子坪隆庆路172号</td>
                                <td>13154916088</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000372</td>
                                <td>A攀枝花东区瓜子坪自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>攀枝花(813)市东区分公司(814005)区县瓜子坪隆庆路237号</td>
                                <td>13154916088</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000355</td>
                                <td>A中江龙台网格兴隆自有厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>德阳(825)市中江县分公司(812041)区县人民东路51号</td>
                                <td>13219897555</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000285</td>
                                <td>A顺庆新世纪营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>南充(822)市顺庆区分公司(812083)区县人民中路132号</td>
                                <td>15508105111</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000286</td>
                                <td>A顺庆3G品牌店</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>南充(822)市顺庆区分公司(812083)区县人民中路</td>
                                <td>15508105111</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000405</td>
                                <td>A绵竹土门网格土门自有厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>德阳(825)市绵竹县分公司(812045)区县土门镇下场</td>
                                <td>15608103520</td>
                                <td>
                                    
                                        
                                        
                                        已完成
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000406</td>
                                <td>A绵竹富新营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>德阳(825)市绵竹县分公司(812045)区县富新镇新兴路64-66号</td>
                                <td>15608103520</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000407</td>
                                <td>A绵竹拱星营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>德阳(825)市绵竹县分公司(812045)区县拱星镇复兴西街60号</td>
                                <td>15608103520</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000289</td>
                                <td>A西充北街自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>南充(822)市西充县分公司(812090)区县四川省西充县晋城镇晋城大道一段127号</td>
                                <td>15608270853</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000343</td>
                                <td>A通江县城郊自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>巴中(827)市通江县分公司(812129)区县通江县烟溪乡街道</td>
                                <td>15608290223</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000348</td>
                                <td>A南江县城郊网格自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>巴中(827)市南江县分公司(812130)区县南江县南江镇正直镇中街227号</td>
                                <td>15608290277</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000416</td>
                                <td>A广汉小汉镇营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>德阳(825)市广汉县分公司(812043)区县小汉镇汉源街22号</td>
                                <td>15609021110</td>
                                <td>
                                    
                                        
                                        
                                        已完成
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000429</td>
                                <td>A康定县彩虹桥自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>甘孜(828)市城区业务部(812149)区县区县炉城镇沿河西路25号</td>
                                <td>15681811166</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000427</td>
                                <td>A康定下桥自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>甘孜(828)市城区业务部(812149)区县康定县</td>
                                <td>15681811166</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000428</td>
                                <td>A康定中桥自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>甘孜(828)市城区业务部(812149)区县沿河东路29号铺面</td>
                                <td>15681811166</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000164</td>
                                <td>A成华双庆路自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>成都(810)市成华南分公司(812005)区县成华区双庆路99号5栋1层19号</td>
                                <td>18502855016</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                            <tr>
                                <td>2000796</td>
                                <td>A中华锦绣自有营业厅</td>
                                <td>自有厅规划_自有厅普查</td>
                                <td>成都(810)市武侯南区分公司(813222)区县武侯区潮音路119号附4-5号1层</td>
                                <td>18508108866</td>
                                <td>
                                    
                                        
                                        已发布
                                        
                                        
                                    
                                </td>
                                <td>3</td>
                            </tr>
                        
                    
                </table>
            </div>

            
            
            <a id="publicBtn" href="../task/publicThisTask" class="btn btn-danger">发布</a><br>
            <ul id="bp" class="col-sm-6"></ul>
        </div>
    </div>
</div>
</body>
</html>
