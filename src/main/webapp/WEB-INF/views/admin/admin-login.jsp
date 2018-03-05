<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="lib/layer/skin/layer.css">
    <link rel="stylesheet" type="text/css" href="lib/layer/skin/layer.ext.css">
    <script type="text/javascript" src="script/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="lib/layer/layer.js"></script>
    <script type="text/javascript" src="lib/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="script/md5.js"></script>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }

        .input-group {
            margin: 10px 0px;
        / / 输入框上下外边距为10px, 左右为0px
        }

        h3 {
            padding: 5px;
            border-bottom: 1px solid #ddd;
        / / h3字体下边框
        }

        li {
            list-style: none;
            margin: 10px 0;
        / / 上下外边距是10px
        }

        em {
        / / 强调的样式 color: #c7254e;
            font-style: inherit;
            background-color: #f9f2f4;
        }

        .jumbotron {
            /*#CF4646*/
            background-color: #CF4646;
            margin-bottom: 0px;
            height: 160px;
            padding-top: 20px;
            color: #FFFFFF;
        }

        .icon {
            width: 111.3px;
            height: 105.9px;
            margin-top: 30px;
        }

        .title {
            font-family: 方正舒体;
            font-size: 50px;
        }

        .welcome {
            font-size: 35px;
            margin-left: 30px;
        }

        * {
            padding: 0px;
            margin: 0px;
        }

        .ipt {
            border: 1px solid #d3d3d3;
            padding: 10px 10px;
            width: 290px;
            border-radius: 4px;
            padding-left: 35px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }

        .ipt:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
        }

        .error {
            border-color: #ffa8a8;
            background-color: #fff3f3;
        }

        .u_logo {
            background: url("images/username.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 43px;
            left: 40px;
        }

        .p_logo {
            background: url("images/password.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 12px;
            left: 40px;
        }

        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //得到焦点
            $("#password").focus(function () {
            });
            //失去焦点
            $("#password").blur(function () {
                if ($(this).val().length < 6) {
                    $(this).addClass('error');
                }
            });

            $("#uname,#password").focus(function () {
                if ($(this).is('.error')) {
                    $(this).removeClass('error');
                }
            });

            $("#uname").blur(function () {
                if ($(this).val() == '') {
                    $(this).addClass('error');
                }
            });
        });


        function login() {
            if ($("#uname,#password").is(".error")) {
                return false;
            }
            if ($("#uname").val() == '') {
                $("#uname").addClass('error');
                return false;
            }
            if ($("#password").val().length < 6) {
                $("#password").addClass('error');
                return false;
            }
            var index = layer.load(0, {shade: [0.1, '#fff']}); //0代表加载的风格，支持0-2
            var plevel=$("input[name='permissionLevel']:checked").val();
            $.ajax({
                url: 'admin/login',
                data: {'uname': $("#uname").val(),'plevel':plevel,'password': MD5($("#password").val())},
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    layer.close(index);
                    if (data.r == true) {
                        layer.msg("登录成功,正在跳转请稍后……", {icon: 1, time: 2000, shade: [0.1, '#fff']}, function () {
                            window.location.href = "<%=request.getContextPath()%>/admin/main";
                        });
                    } else {
                        layer.alert(data.m, {icon: 2, title: "系统提示"});
                    }
                },
                error: function () {
                    layer.close(index);
                    layer.alert("系统异常,请稍后再试....", {icon: 2, title: "系统提示"});
                }
            });
        }
    </script>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <div style="float: left;margin-top: 20px;">
            <h1><font class="title" style="margin-left: 50px;">巡店管理</font><font class="welcome"> 欢迎您！</font></h1>
            <p>
            <li class="little_title" style="margin-left: 260px;">———互联网化运营转型支撑系统v1.0</li>
            <p>
        </div>
        <img src="images/yewu/yewu.png" style="float: right;margin-right: 80px;" class="icon">
    </div>
</div>
<div  style="background: rgb(255, 255, 255); margin: -10px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 240px; text-align: center;">
    <p style="padding: 30px 0px 10px; position: relative;">
        <span class="u_logo"></span> <input class="ipt" id="uname" type="text"
                                            placeholder="请输入用户名" value="admin">
    </P>
    <p style="position: relative;">
        <span class="p_logo"></span> <input class="ipt" id="password"
                                            type="password" placeholder="请输入至少六位密码" value="123456">
    </p>
   <div style="height: 30px; line-height: 50px; margin-top: 10px; border-top-color: rgb(231, 231, 231);">
       <input type="radio" name="permissionLevel" value="manager">管理员
       <input type="radio" name="permissionLevel" value="province"> 省
       <input type="radio" name="permissionLevel" value="city"> 地市
       <input type="radio" name="permissionLevel" value="grid">网格
       <input type="radio" name="permissionLevel" value="qita" checked>其他
   </div>
    <div
            style="height: 80px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
        <P style="margin: 0px 35px 20px 45px;">
				<span style="float: left;">
					<a style="color: rgb(204, 204, 204); margin-left: 20px ;"
                       href="javascript:layer.alert('请联系管理员' , {icon:5 , title:'系统提示'});">忘记密码?</a>
					</span> <span style="float: right;">
					<a style="background: #CF4646; padding: 7px 40px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
                       href="javascript:login();">登&nbsp;&nbsp;&nbsp;&nbsp;录</a> </span>
        </P>
    </div>
</div>
<div style="text-align: center;"></div>
</body>
</html>