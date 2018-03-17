<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String ctx = request.getContextPath();
    request.setAttribute("ctx", ctx);

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>巡店人员编辑</title>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <script type="text/javascript" src="script/biz/checkCode.js"></script>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .wrapper {
            width: 70%;
            padding: 100px 0;
            margin: 40px auto;
            background: #efefef;
            border: 1px solid #bbb;
            border-radius: 4px;
        }

        .line-box {
            width: 100%;
            padding: 10px 20px;
            margin: 0 auto;
            box-sizing: border-box;
            /*background: pink;*/
        }

        .item-div {
            width: 48%;
            display: inline-block;
        }

        .item-left {
            text-align: right;
        }

        .item-div label {
            display: inline-block;
            width: 80px;
            text-align: right;
            vertical-align: top;
            /*background: paleturquoise;*/
        }

        .item-div div {
            display: inline-block;
            width: 160px;
            text-align: left;
            vertical-align: top;
            /*background: bisque;*/
        }
    </style>
</head>
<body>
<div id="wrapper" class="wrapper"></div>

<div id="tempLine" style="display: none">
    <div class="line-box">
        <div class="item-div item-left">
            <label name="title0"></label>
            <div name="content0"></div>
        </div>
        <div class="item-div item-righ-t">
            <label name="title1"></label>
            <div name="content1"></div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
<script type="text/javascript">

    function backgo() {
        window.location.href = "import/toXuserList";
    }

    $(function () {
        getCheckDetail();
    });

    function getCheckDetail() {
        var id = "${id}";
        var index = parent.layer.load();
        $.ajax({
            type: "get",
            url: "check/detail/query/" + id,
            cache: false,
            async: true,
            dataType: "json",
            success: function (data) {
                console.info(data);
                parent.layer.close(index);
                var tempLineStr = $("#tempLine").html();
                var wrapper = $("#wrapper");
                var $tempLine = null;
                for (var i = 0; i < keyAndValueList.length; i++) {
                    var obj = keyAndValueList[i];
                    var n = i % 2;
                    if (n == 0) {
                        $tempLine = $(tempLineStr);
                        wrapper.append($tempLine);
                    }
                    $tempLine.find("[name='title"+n+"']").html(obj.title);
                    var arr = obj.key.split(".");
                    var value = data[arr[0]][arr[1]];
                    if(obj.map && $.trim(obj.map) != ""){
                        value = window[obj.map](value);
                    }
                    $tempLine.find("[name='content"+n+"']").html(value);
                }
            },
            error: function () {
                alert("operation failed!");
            }
        });
    }


</script>
</body>
</html>