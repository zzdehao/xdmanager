<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
    String ctx = request.getContextPath();
    request.setAttribute("ctx", ctx) ;

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>管理员编辑</title>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pd-20">
    <form action="" method="post" class="form form-horizontal" id="form-pass-modify">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>旧密码：</label>
            <div class="formControls col-5">
                <input type="password" class="input-text" value="" placeholder="旧密码" id="oldPw" name="oldPw"  datatype="*6-20" nullmsg="密码不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>新密码：</label>
            <div class="formControls col-5">
                <input type="password" class="input-text" value="" placeholder="新密码" id="newPw" name="newPw" datatype="*6-20" nullmsg="密码不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl prow">
            <label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-5">
                <input type="password" name="repeatPw" id ="repeatPw" placeholder="密码" autocomplete="off"
                       value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空" recheck="newPw" id="repeatPw" name="repeatPw">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<%@include file="/footer.jsp" %>
<script type="text/javascript">
    $(function(){
        $("#form-pass-modify").Validform({
            tiptype:2,
            callback:function(form){
                var index = parent.layer.load();
                $.ajax({
                    url:"yewu/user/updatepw" ,
                    type:'get',
                    async:true ,
                    cache:false ,
                    data:{'oldPw': MD5($("#oldPw").val()),'newPw': MD5($("#newPw").val()),'repeatPw': MD5($("#repeatPw").val())},
                    dataType:"json",
                    success:function(data){
                        parent.layer.close(index);
                        if(data.s == true){
                            index = parent.layer.getFrameIndex(window.name);
                            //alert(parent.$(".show_iframe:visible > iframe")[0].window);
                            //parent.$(".show_iframe:visible > iframe").attr("src" ,parent.$(".show_iframe:visible > iframe")[0].src );
                            parent.layer.msg("保存成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
                                parent.$(".show_iframe:visible > iframe").contents().find("#search").click() ;
                                parent.layer.close(index);
                            }) ;

                        }else{
                            parent.layer.alert(data.m , {icon: 2,title:"系统提示"});
                        }
                    },
                }) ;
                return false ;
            }
        });

    });
</script>
</body>
</html>