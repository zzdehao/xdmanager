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
	<title>巡店人员编辑</title>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="lib/html5.js"></script>
	<script type="text/javascript" src="lib/respond.min.js"></script>
	<script type="text/javascript" src="lib/PIE_IE678.js"></script>
	<![endif]-->
	<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="css/H-ui.xuser.css" rel="stylesheet" type="text/css" />
	<link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pd-20">
	<form action="" method="post" class="form form-horizontal" id="form-xuser-add">
		<input type="hidden" name="id" id = "id"  value="${xuser.id}">
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" readonly value="${xuser.trueName}" placeholder="" id="trueName" name="trueName" datatype="*2-16" nullmsg="姓名不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" readonly value="${xuser.name}" placeholder="" id="name" name="name" datatype="*5-16" nullmsg="账号不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl prow">
			<label class="form-label col-3"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls col-5">
				<input type="password" name="password" id ="password" placeholder="密码" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="${xuser.tel}" placeholder="请输入手机号码 " id="tel" name="tel"  datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red"></span>邮箱：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" placeholder="@" value="${xuser.email}" name="email" id="email"  datatype="e" >
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">省：</label>
			<div class="formControls col-5" id = "provinceDiv">
				<select id="provinceCode"  name="provinceCode" class="input-text" style="width: 145px;">
					<option value="" id="oppro">请选择省份:</option>
				</select>
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">市：</label>
			<div class="formControls col-5" id = "cityDiv">
				<select id="cityCode" name="cityCode" class="input-text" style="width: 145px;">
					<option value="">请选择城市:</option>
				</select>
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">备注：</label>
			<div class="formControls col-5">
				<textarea name="remark" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="textarealength(this,100)">${xuser.remark}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				&nbsp;&nbsp;
				<input class="btn btn-primary radius" onclick="javascript:backgo();" type="button" value="&nbsp;&nbsp;返回&nbsp;&nbsp;">
			</div>
			</div>
		</div>
	</form>
</div>
<%@include file="/footer.jsp" %>
<script type="text/javascript">
	function backgo(){
		window.location.href="import/toXuserList";
	}
	function loadP(provinceCode) {
		if(provinceCode=='all'){
			return;
		}
		$.ajax({
			type : "get",
			url : "yewu/province/getProvince",
			cache : false,
			async : true,
			data:{code:''},
			dataType : "json",
			success : function(datas) {
				if (datas.length > 0) {
					for ( var i = 0; i < datas.length; i++) {
						var code = datas[i].code;
						var name=datas[i].name;
						if(provinceCode) {
							if(code==provinceCode) {
								$("#provinceCode").append("<option value=" + code + " selected>" + name + "</option>");
							}else{
								$("#provinceCode").append("<option value=" + code + ">" + name + "</option>");
							}
						}else{
							$("#provinceCode").append("<option value=" + code + ">" + name + "</option>");
						}
					}
				}
			},
			error : function() {
				alert("operation failed!");
			}
		});
	}
	function loadC(cityCode,provinceCode) {
		if(!provinceCode){
			return;
		}
		if(provinceCode=='all'){
			return;
		}
		$.ajax({
			type : "get",
			url : "yewu/province/getCity",
			cache : false,
			async : true,
			data:{provinceCode:provinceCode},
			dataType : "json",
			success : function(datas) {
				if (datas.length > 0) {
					$("#cityCode").empty();
					$("#cityCode").append("<option value=0>请选择市</option>");
					for ( var i = 0; i < datas.length; i++) {
						var code = datas[i].code;
						var name=datas[i].name;
						if(provinceCode!='') {
							if(code==cityCode) {
								$("#cityCode").append("<option value=" + code + " selected>" + name + "</option>");
							}else{
								$("#cityCode").append("<option value=" + code + ">" + name + "</option>");
							}
						}else{
							$("#cityCode").append("<option value=" + code + ">" + name + "</option>");
						}
					}
				}
			},
			error : function() {
				alert("operation failed!");
			}
		});
	}
	$(function(){
		var status = '${xuser.status}' ;
		var id = $("#id").val();
		if(id){
			$(".prow").remove();
			$("#status").val(status);

			textarealength($("textarea[name=remark]"),100)

			$.post("role/getuserrole/" + id , function(data){
				$.each(data , function(i,n){
					$("#roles input[value="+n.roleId+"]").attr("checked","checked");
				});
			}) ;

		}
		loadP('${xuser.provinceCode}');
		loadC('${xuser.cityCode}','${xuser.provinceCode}');
		$("#provinceCode").change(function(){
			var pcode = $("#provinceCode").val();
			//$("#cityCode").empty();
			loadC('',pcode);
		});

		$("#form-xuser-add").Validform({
			tiptype:2,
			callback:function(form){
				var index = parent.layer.load();
				$.ajax({
					url:"yewu/user/save" ,
					type:'post',
					async:true ,
					cache:false ,
					data:$(form).serialize(),
					dataType:"json",
					success:function(data){
						parent.layer.close(index);
						if(data.s == true){
							index = parent.layer.getFrameIndex(window.name);
							//alert(parent.$(".show_iframe:visible > iframe")[0].window);
							//parent.$(".show_iframe:visible > iframe").attr("src" ,parent.$(".show_iframe:visible > iframe")[0].src );
							parent.layer.msg("保存成功,正在刷新数据请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
								/**
								parent.$(".show_iframe:visible > iframe").contents().find("#search").click() ;
								parent.layer.close(index);
							    **/
								window.location.href="import/toXuserList";
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