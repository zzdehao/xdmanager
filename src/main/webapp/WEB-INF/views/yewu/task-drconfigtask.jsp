<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>导入</title>
    <%@ include file="ywinclude.jsp" %>
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
            $(".import").bind("click",function () {
                var file=$("#taskFile").val();
                if (file==null || file=="") {
                    zeroModal.alert({content:"请先选择文件",transition:true,width:'500px',height:'200px',top:'10px',transition:1});
                }else {
                    var id=this.id;
                    var excelName;
                    var action="";
                    if (id=="importTask") {
                        excelName="任务详情表";
                        action="../file/uploadUserExcel";
                    }else if (id=="importUser") {
                        excelName="人员配置表";
                        action="../file/importUser";
                    }else if (id=="importStore"){
                        excelName="店铺详情表";
                        action="../file/importStore";
                    }else if (id=="importGrid") {
                        excelName="网格数据表";
                        action="../file/importGrid";
                    }else if (id=="importCooChannel") {
                        excelName="签约渠道数据表";
                        action="../file/importCooChannel";
                    }else if (id=="importSocialChannel") {
                        excelName="小微渠道数据表";
                        action="../file/importSocChannel";
                    }else if (id=="importSelfChannel") {
                        excelName="自有渠道数据表";
                        action="../file/importSelfChannel";
                    }else if (id=="importBaseStation") {
                        excelName="基站数据表";
                        action="../file/importBaseStation";
                    }else if (id=="importBroadBand") {
                        excelName="宽带数据表";
                        action="../file/importBroadBand";
                    }
                    zeroModal.confirm({content:"确定导入"+excelName+"吗？", okFn:function () {
                        zeroModal.loading(4);
                        $("#importForm").attr("action",action).submit();
                    },width:'500px',height:'200px',top:'10px'});
                }
            });

        });
    </script>
</head>
<body>
    <div class="container container-fluid">
        <div class="panel panel-defalut">
            
            <div class="panel-body">
                <form id="importForm" action="../file/uploadUserExcel" method="post" enctype="multipart/form-data">
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
                            <input type="button" id="importTask" class="btn btn-danger import" value="导入任务详情表"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importUser" class="btn btn-danger import" value="导入巡店人员表"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importStore" class="btn btn-danger import" value="导入店铺详情表"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importGrid" class="btn btn-danger import" value="导入网格数据表"/>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="button" id="importCooChannel" class="btn btn-danger import" value="导入签约渠道表"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importSocialChannel" class="btn btn-danger import" value="导入小微渠道表"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importSelfChannel" class="btn btn-danger import" value="导入自有渠道表"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-2">
                            <input type="button" id="importBaseStation" class="btn btn-danger import" value="导入基站数据表"/>
                        </div>
                    </div><hr>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="button" id="importBroadBand" class="btn btn-danger import" value="导入宽带数据表"/>
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
