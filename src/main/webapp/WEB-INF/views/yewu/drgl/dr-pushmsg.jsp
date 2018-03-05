<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>导入推送消息</title>
    <%@ include file="../ywinclude.jsp" %>
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
            $("#importPushMsg").bind("click",function () {
                var file=$("#taskFile").val();
                if (file==null || file=="") {
                    alert("请先选择文件");
                }else {
                    if (confirm("确定导入吗？")) {
                        $("#importForm").submit();
                    }
                }
            });

        });
    </script>
</head>
<body>
    <div class="container container-fluid">
        <div class="panel panel-defalut">
            
            <div class="panel-body">
                <form id="importForm" action="../file/importPushMsg" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="importCount">导入几行几列<h6>(默认为0，表示全部导入)</h6></label>
                        <input type="text" id="importCount" class="form-control" name="rowNumber" value="0" readonly>行
                        <input type="text" class="form-control" name="cellNumber" value="0" readonly>列
                    </div>
                    <div class="form-group">
                        <label for="taskFile">excel文件</label>
                        <input type="file" id="taskFile" name="multipartFile">
                        <p class="help-block">支持.xlsx格式的excel表格文件,导入的表格文件请严格按照模板填写数据，否则导入可能出现意外！！！</p>
                    </div><hr>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="button" id="importPushMsg" class="btn btn-danger" value="导入消息数据"/>
                        </div>
                    </div>
                    <a class="btn btn-danger" href="../pushMsg/readyToPush">推送最近导入的信息</a>
                </form>
                <br>
                <hr>
            </div>
        </div>
    </div>
</body>
</html>
