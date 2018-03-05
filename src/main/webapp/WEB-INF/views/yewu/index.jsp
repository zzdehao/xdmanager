<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>首页</title>
    <%@ include file="ywinclude.jsp" %>
    <![endif]-->
    <style type="text/css" rel="stylesheet">
        body {
            /*background-color: #EBEBEB;*/
            padding-top: 45px;
            font-family: 华文中宋;
        }

        * {
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }

        li {
            list-style: none;
        }

        .jumbotron {
            /*#CF4646*/
            background-color: #CF4646;
            margin-bottom: 0px;
            height: 140px;
            padding-top: 0px;
            color: #FFFFFF;
        }

        .icon {
            width: 101.3px;
            height: 60.9px;
            margin-top: 20px;
        }

        .navbar {
            background-color: #FFFFFF;
            border-bottom-width: 0px;
            padding-top: 0px;
            padding-bottom: 0px;
            /*padding-left: 160px;*/
            /*padding-right: 160px;*/
            font-size: 15px;
        }

        #iframeDiv {
            width: 100%;
            height: 800px;
            overflow: hidden;
        }

        .title {
            font-family: 方正舒体;
            font-size: 65px;
        }

        .welcome {
            font-size: 35px;
            margin-left: 30px;
        }

        .little_title {
            margin-left: 75px;
        }

    </style>
    <script>
        $(function () {
            window.frames['showArea'].location.href = '${ctx}/yewu/drconfigtask';
        });
    </script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/yewu/drconfigtask" target="showArea">导入配置和任务<span
                        class="sr-only">(current)</span></a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">任务管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/yewu/task-fabuzuijin" target="showArea">发布最近一次导入的任务</a></li>
                        <li><a href="${ctx}/yewu/dcnofinish" target="showArea">导出未完成任务清单</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        许景玉
                        (四川)

                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="../admin/logout" target="showArea">退出登录</a></li>
                        <li><a href="${ctx}/yewu/modifypass" target="showArea">修改密码</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        用户管理
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/yewu/addadmin" target="showArea">账号添加</a></li>
                        <li><a href="${ctx}/yewu/listadmin" target="showArea">人员管理</a></li>
                        <li><a href="${ctx}/yewu/loglist" target="showArea">日志管理</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="../link/toCount" target="showArea">巡店统计<span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">发布信息导入和推送<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/yewu/fabu-pushmsg" target="showArea">导入消息数据</a></li>
                        <li><a href="${ctx}/yewu/fabu-sendpushmsg" target="showArea">推送最近导入的消息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">导出巡店数据<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/yewu/xddata" target="showArea">巡店数据</a></li>
                        <li><a href="${ctx}/yewu/xdtrackdata" target="_blank">巡店轨迹</a></li>
                        <li><a href="${ctx}/yewu/xdvdmshow" target="_blank">巡店数据展示</a></li>
                        <li><a href="${ctx}/yewu/drxdtovdm" target="_blank">导入数据展示</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="jumbotron">
    <div class="container">
        <div style="float: left">
            <h1><font class="title">巡店管家</font><font class="welcome"> 欢迎您！</font></h1>
            <p>
            <li class="little_title"></li>
            <p>
        </div>
        <img src="${staticPath}/images/yewu/yewu.png" style="float: right;height: 50px;" class="icon">
    </div>
</div>
<iframe name="showArea" id="iframeDiv" frameborder="no" marginheight="0" marginwidth="0" scrolling="no">
</iframe>
</div>
</body>
</html>
