<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>添加账号</title>
    <%@ include file="ywinclude.jsp" %>
    <script type="text/javascript">
        $(function () {

            $("#permissionLevel").bind("change",function () {
               var level=$("#permissionLevel").val();
               if (level=="province") {
                   $("#cityDiv").hide();
               }else if (level=="city") {
                   $("#cityDiv").show();
               }
            });

            $("#submitBtn").bind("click",function () {
                var adminName=$("#adminName").val().replace(/(^\s*)|(\s*$)/g, '');
                var phone=$("#phone").val().replace(/(^\s*)|(\s*$)/g, '');
                if (adminName==null || adminName=="" || adminName==undefined || phone==null || phone=="" || phone==undefined) {
                    zeroModal.alert(content="请补充完整信息");
                }else {
                    $("#inForm").submit();
                }
            });
            function submitCheck() {

            }
        });
    </script>
    <style type="text/css">
        body {
            font-family: 华文中宋;
        }
        li{
            list-style: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel">
        <div class="panel-body">
            <form action="../admin/addAdmin" method="post" id="inForm" class="form-inline">
                <div class="form-group">
                    <label for="adminName">姓名</label>
                    <input type="text" id="adminName" name="adminName" class="form-control">
                </div>
                <div class="form-group">
                    <label for="phone">电话</label>
                    <input type="text" id="phone" name="phone" class="form-control">
                </div>
                <div class="form-group">
                    <label for="permissionLevel">权限级别</label>
                    <select id="permissionLevel" name="permissionLevel" class="form-control">
                        <option value="city">地市管理员</option>
                        <option value="province">省级管理员</option>
                    </select>
                </div>
                <div class="form-group" id="provinceDiv">
                    <label for="province">省</label>
                    <select id="province" name="province" class="form-control">
                        <option value="四川">四川</option>
                        
                            
                                
                            
                        
                    </select>
                </div>
                <div class="form-group" id="cityDiv">
                    <label for="city">地市</label>
                    <select id="city" name="city" class="form-control">
                        
                            
                                <option value="成都">成都</option>
                            
                                <option value="自贡">自贡</option>
                            
                                <option value="攀枝花">攀枝花</option>
                            
                                <option value="泸州">泸州</option>
                            
                                <option value="德阳">德阳</option>
                            
                                <option value="绵阳">绵阳</option>
                            
                                <option value="广元">广元</option>
                            
                                <option value="遂宁">遂宁</option>
                            
                                <option value="内江">内江</option>
                            
                                <option value="乐山">乐山</option>
                            
                                <option value="南充">南充</option>
                            
                                <option value="眉山">眉山</option>
                            
                                <option value="宜宾">宜宾</option>
                            
                                <option value="广安">广安</option>
                            
                                <option value="达州">达州</option>
                            
                                <option value="雅安">雅安</option>
                            
                                <option value="巴中">巴中</option>
                            
                                <option value="资阳">资阳</option>
                            
                                <option value="阿坝藏族羌族自治州">阿坝藏族羌族自治州</option>
                            
                                <option value="甘孜藏族自治州">甘孜藏族自治州</option>
                            
                                <option value="凉山彝族自治州">凉山彝族自治州</option>
                            
                        
                    </select>
                </div>
                <input type="button" id="submitBtn" class="btn btn-danger" value="添加">
            </form>
            <hr>
            <li></li>
        </div>
    </div>
</div>
</body>
</html>