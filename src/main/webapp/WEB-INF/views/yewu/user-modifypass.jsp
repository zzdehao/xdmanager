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
        $(function () {
            var cansubmit=false;
            $("#repeatPw").bind("blur",function () {
               var newPw=$("#newPw").val();
               var repeatPw=$("#repeatPw").val();
               if (newPw!=null && newPw!='' && newPw===repeatPw) {
                   $("#repeatPwIsRight").css("color",'#00ff00');
                   $("#repeatPwIsRight").text("✔");
                   cansubmit=true;
               }else {
                   $("#repeatPwIsRight").css("color","#ff0000");
                   $("#repeatPwIsRight").text("✘ 两次输入不一致");
                   cansubmit=false;
               }
            });
            $("#newPw").bind("blur",function () {
                var newPw=$("#newPw").val();
                var repeatPw=$("#repeatPw").val();
                if (newPw!=null && newPw!='' && newPw===repeatPw) {
                    $("#repeatPwIsRight").css("color",'#00ff00');
                    $("#repeatPwIsRight").text("✔");
                    cansubmit=true;
                }else {
                    $("#repeatPwIsRight").css("color","#ff0000");
                    $("#repeatPwIsRight").text("✘ 两次输入不一致");
                    cansubmit=false;
                }
            });

            function submitCheck() {
                return cansubmit;
            }
        });
    </script>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel">
        <div class="panel-body">
            <form action="../admin/updatePw" method="post" class="form-inline">
                <div class="form-group">
                    <label for="oldPw">旧密码</label>
                    <input type="text" id="oldPw" name="oldPw" class="form-control">
                </div>
                <div class="form-group">
                    <label for="newPw">新密码</label>
                    <input type="password" id="newPw" name="newPw" class="form-control">
                </div>
                <div class="form-group">
                    <label for="repeatPw">确认新密码</label>
                    <input type="password" id="repeatPw" class="form-control">
                    <label id="repeatPwIsRight"></label>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-danger" value="修改" onsubmit="return true">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>