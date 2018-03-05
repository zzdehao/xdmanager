<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <LINK rel="Bookmark" href="/favicon.ico">
    <LINK rel="Shortcut Icon" href="/favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="css/skin/red/skin.css" rel="stylesheet" type="text/css" id="skin"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <title>巡店管理系统</title>
</head>
<body>
<header class="Hui-header cl" style="border-bottom:2px solid #890800;height: 58px;">
    <a class="Hui-logo l" title="巡店管理" href="/" style="margin-top: 10px;">&nbsp;&nbsp;巡店管理&nbsp;V1.0</a>
    <span class="Hui-subtitle l" style="margin-right: 6px;">
        <img src="images/yewu/yewu.png" class="icon" style="width:30px;height: 32px;margin-left: 6px;">
    </span>
    <nav class="mainnav cl" id="Hui-nav" style="height: 32px;margin-top: 10px;width: 12px;">
        <ul>
            <li class="dropDown">
                <a href="javascript:;" onClick="displaynavbar(this)" class="dropDown_A">
                <i class="Hui-iconfont">&#xe681;</i></a>
            </li>
        </ul>
    </nav>

    <ul class="Hui-userbar" style="right: 60px;">
        <li>${loginUser.name}[${loginUser.roleName}]</li>
        <li class="dropDown dropDown_hover">
            <a href="javascript:void(0)" class="dropDown_A">
            <i class="Hui-iconfont">&#xe6d5;</i></a>
            <ul class="dropDown-menu radius box-shadow">
                <li><a href="javascript:logout()">退出</a></li>
            </ul>
        </li>
    </ul>
    <a aria-hidden="false" class="Hui-nav-toggle" href="#"></a>
</header>
<aside class="Hui-aside" style="border-right: 1px solid #8c8c8c;">
    <input runat="server" id="divScrollValue" type="hidden" value=""/>
    <div class="menu_dropdown bk_2" style="margin-top: 12px;">
        ${menu}
    </div>
</aside>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav" style="margin-top: 9px;">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="快速导航" data-href="#">快速导航</span><em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group">
            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
                &#xe6d4;</i></a>
            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
                &#xe6d7;</i></a>
        </div>
    </div>
    <div id="iframe_box" class="Hui-article" style="margin-top: 10px;">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" id="myframe" src="admin/navigate"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/layer.js"></script>
<script type="text/javascript" src="script/H-ui.js"></script>
<script type="text/javascript" src="script/H-ui.admin.js"></script>
<script type="text/javascript">
    function logout() {
        $.post("admin/logout", function () {
            layer.msg("退出成功,正在跳转请稍后……", {icon: 1, time: 2000, shade: [0.1, '#fff']}, function () {
                window.location.href = "admin/login";
            });
        });
    }
</script>
</body>
</html>