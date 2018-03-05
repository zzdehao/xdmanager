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
            function updateAdmin(id) {
                var formId = id.substring(0, id.indexOf("U")) + "Form";
                zeroModal.confirm({content:"确定修改吗？", okFn:function () {
                    $.ajax({
                        url: "../admin/updateAdmin",//weloop.duapp.com/WeChat
                        dataType: 'json',
                        data: $('#' + formId).serialize(),
                        //async: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            zeroModal.error({content:"发生错误,登录可能失效,请重新登录"+errorThrown,width:'500px',height:'200px',top:'10px'});
                        },
                        success: function (res) {
                            if (res.result=='修改成功') {
                                zeroModal.success({content:"修改成功",width:'500px',height:'200px',top:'10px'});
                            }else {
                                zeroModal.error({content:"修改失败",width:'500px',height:'200px',top:'10px'});
                            }

                        }
                    });
                },width:'500px',height:'200px',top:'10px'});

            }

            function deleteAdmin(id) {
                var formId = id.substring(0, id.indexOf("D")) + "Form";
                var trId = id.substring(0, id.indexOf("D")) + "Tr";
                zeroModal.confirm({content:"确定删除吗？", okFn:function () {
                    $.ajax({
                        url: "../admin/deleteAdmin",//weloop.duapp.com/WeChat
                        dataType: 'json',
                        data: $('#' + formId).serialize(),
                        //async: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            zeroModal.error({content:"发生错误,登录可能失效,请重新登录"+errorThrown,
                                width:'500px',height:'250px',top:'10px'});
                        },
                        success: function (res) {
                            if (res.result == "删除成功") {
                                zeroModal.success({content:'删除成功',width:'500px',height:'200px',top:'10px'});
                                $("#" + trId).remove();
                            }else {
                                zeroModal.error({content:'删除失败',width:'500px',height:'200px',top:'10px'});
                            }
                        }
                    });
                },width:'500px',height:'200px',top:'10px'});

            }
    </script>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }
        li{
            list-style: none;
        }
        .tdIn {
            border: none;
        }
        .opBtn{
            border: none;
            background-color: #CF4646;
            color: #EEEEEE;
        }
        .opBtn:hover {
            background-color: #002aa0;
        }
        .tabDiv {
            width: 100%;
            height: 400px;
            overflow-y: auto;
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel">
        <div class="panel-body">

            <div class="tabDiv">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>姓名</td><td>账号</td><td>密码</td><td>权限</td><td>省</td><td>地市</td><td>操作</td>
                        </tr>
                    </thead>
                    <tbody>
                        
                            
                                <tr id="1Tr">
                                    <form id="1Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="1" name="id"><input type="text" value="刘伟" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="17608296081" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>super</td>
                                        <td>四川省</td>
                                        <td>all</td>
                                    </form>
                                    <td>
                                        <button id="1Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="1Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="3Tr">
                                    <form id="3Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="3" name="id"><input type="text" value="阎海山" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18610612126" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="797908" name="password" class="tdIn"></td>
                                        <td>super</td>
                                        <td>四川</td>
                                        <td>all</td>
                                    </form>
                                    <td>
                                        <button id="3Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="3Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="4Tr">
                                    <form id="4Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="4" name="id"><input type="text" value="陈骄" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18628001099" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="19900629" name="password" class="tdIn"></td>
                                        <td>super</td>
                                        <td>四川</td>
                                        <td>all</td>
                                    </form>
                                    <td>
                                        <button id="4Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="4Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="47Tr">
                                    <form id="47Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="47" name="id"><input type="text" value="蔡媛" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18608000170" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>city</td>
                                        <td>四川</td>
                                        <td>成都</td>
                                    </form>
                                    <td>
                                        <button id="47Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="47Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="48Tr">
                                    <form id="48Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="48" name="id"><input type="text" value="李照奇" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18628052761" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="089991lzq" name="password" class="tdIn"></td>
                                        <td>city</td>
                                        <td>四川</td>
                                        <td>成都</td>
                                    </form>
                                    <td>
                                        <button id="48Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="48Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="49Tr">
                                    <form id="49Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="49" name="id"><input type="text" value="白正海" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18608220796" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>city</td>
                                        <td>四川</td>
                                        <td>眉山</td>
                                    </form>
                                    <td>
                                        <button id="49Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="49Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="50Tr">
                                    <form id="50Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="50" name="id"><input type="text" value="杨凤" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18602899766" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>province</td>
                                        <td>四川</td>
                                        <td>all</td>
                                    </form>
                                    <td>
                                        <button id="50Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="50Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="51Tr">
                                    <form id="51Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="51" name="id"><input type="text" value="许景玉" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="17600180016" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>province</td>
                                        <td>四川</td>
                                        <td>all</td>
                                    </form>
                                    <td>
                                        <button id="51Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="51Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                                <tr id="52Tr">
                                    <form id="52Form" action="../admin/updateAdmin">
                                        <td><input type="hidden" value="52" name="id"><input type="text" value="黄俊" name="adminName" class="tdIn"></td>
                                        <td><input type="text" value="18602858623" name="phone" class="tdIn"></td>
                                        <td><input type="password" value="111111" name="password" class="tdIn"></td>
                                        <td>city</td>
                                        <td>四川</td>
                                        <td>成都</td>
                                    </form>
                                    <td>
                                        <button id="52Update" class="opBtn" onclick="updateAdmin(this.id)">修改</button>
                                        <button id="52Delete" class="opBtn" onclick="deleteAdmin(this.id)">删除</button>
                                    </td>
                                </tr>
                            
                        

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>