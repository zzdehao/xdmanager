<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>导入人员信息</title>
    <%@ include file="../../yewu/ywinclude.jsp" %>
    <!--[endif]-->
    <style type="text/css" rel="stylesheet">
        body {
            font-family: 华文中宋;
        }
        .container{
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }
    </style>
    <script>
        $(function () {
            //给提交按钮绑定事件
            $("#impUserBtn").bind("click",function () {
                var file=$("#userFile").val();
                if (file==null || file=="") {
                    alert("请先选择文件");
                }else {
                    if (confirm("确定导入吗？")) {
                        $("#importForm").submit();
                    }
                }
            });
            $("#backBtn").bind("click",function () {
                window.location.href="<%=request.getContextPath()%>/import/userIndex";
            });

        });
    </script>
</head>
<body>
<div class="container container-fluid">
    <div class="panel panel-defalut">
        <div class="panel-body">
            <form id="importForm" action="<%=request.getContextPath()%>/import/importUser" method="post" enctype="multipart/form-data">
                <div class="form-group">
                   <h4>导入人员信息</h4>
                </div>
                <div class="form-group">
                    <label for="userFile">excel文件</label>
                    <input type="file" id="userFile" name="multipartFile">
                    <p class="help-block">支持.xlsx,xls格式的excel表格文件</p>
                </div><hr>
                <div class="form-group">
                    <div class="col-sm-2">
                        <input type="button" id="impUserBtn" class="btn btn-danger" value="确认导入"/>
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="backBtn" class="btn btn-danger" value="返回"/>
                     </div>
                </div>
            </form>
            <br>
            <hr>
        </div>
    </div>
</div>
</body>
</html>
