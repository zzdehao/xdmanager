<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>用户登录</title>
    <%@ include file="ywinclude.jsp" %>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }
        .input-group{
            margin:10px 0px;//输入框上下外边距为10px,左右为0px
        }
        h3{
            padding:5px;
            border-bottom:1px solid #ddd;//h3字体下边框
        }
        li{
            list-style: none;
            margin:10px 0;//上下外边距是10px
        }
        em{//强调的样式
        color:#c7254e;
            font-style: inherit;
            background-color: #f9f2f4;
        }
        .jumbotron{
            /*#CF4646*/
            background-color: #CF4646;
            margin-bottom: 0px;
            height: 220px;
            padding-top: 20px;
            color: #FFFFFF;
        }
        .icon{
            width: 111.3px;
            height:105.9px;
            margin-top: 30px;
        }
        .title{
            font-family: 方正舒体;
            font-size: 75px;
        }
        .welcome{
            font-size: 35px;
            margin-left: 30px;
        }
        .little_title{
            margin-left: 75px;
        }
    </style>
</head>
<body>
<div class="jumbotron">
    <div class="container">

        <div style="float: left">
            <h1><font class="title">微运营</font><font class="welcome"> 欢迎您！</font></h1>
            <p>
            <li class="little_title">———互联网化运营转型支撑系统v1.0.3 &nbsp; [&nbsp;北京信德泰康信息科技有限公司&nbsp;]</li>
            <p>
        </div>
        <img src="images/icon1.png" style="float: right" class="icon">
    </div>
</div>
<div class="container">
<div class="row" style="margin-top:30px;">
    <div class="col-md-6" style="border-right:1px solid #ddd;">
        <div class="well col-md-10">
            <h3>用户登录</h3>
            <form action="admin/login" method="post">
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" name="phone" class="form-control" placeholder="电话" aria-describedby="sizing-addon1">
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="密码" aria-describedby="sizing-addon1">
                </div>
                <div class="well well-sm" style="text-align:center;">
                    <input type="radio" name="permissionLevel" value="manager">管理员
                    <input type="radio" name="permissionLevel" value="province" checked> 省
                    <input type="radio" name="permissionLevel" value="city"> 地市
                    <input type="radio" name="permissionLevel" value="grid">网格
                </div>
                <button type="submit" class="btn btn-danger btn-block">
                    登录
                </button>
            </form>
        </div>
    </div>
    <div class="col-md-6">
        <h3>
            欢迎使用"微巡店"管理系统
        </h3>
        <ul>
            <li>省级管理员请选择<font color="#b22222">省</font>进行登录，初始密码为<font color="#b22222">6个1</font>，登录后请及时修改密码</li>
            <li>地市管理员请选择<font color="#b22222">地市</font>进行登录，初始密码为<font color="#b22222">6个1</font>，登录后请及时修改密码</li>
            <li>网格管理员请选择<font color="#b22222">网格</font>进行登录，初始密码为<font color="#b22222">6个1</font>，登录后请及时修改密码</li>
            <li>已修改过密码请使用修改过后的密码进行登录</li>
            <li>若登录失败请核验自己的帐号或密码以及对应的登录级别是否正确</li>
            <li>若忘记密码请联系管理员重置密码</li>
        </ul>
    </div>
</div>
</div>
</body>
</html>