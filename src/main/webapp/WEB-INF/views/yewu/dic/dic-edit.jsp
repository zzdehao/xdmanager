<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典维护</title>
<%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-15">
	<form action="" method="post" class="form form-horizontal" id="form-dic-add">
		<input type="hidden" name="id" id="id" value="${dic.id}">
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>字典类型：</label>
            <div class="formControls col-6">
                <select class="input-text" name="showtype" id="showtype" style="width: 130px;" onchange="javascript:chanageType();">
                    <option value="-1">自定义类型</option>
                    <c:forEach items="${pdics}" var="item">
                        <c:if test="${dic.type==item.type}">
                        <option value="${item.type}" selected>${item.description}</option>
                        </c:if>
                        <c:if test="${dic.type!=item.type}">
                            <option value="${item.type}">${item.description}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="col-4">
            </div>
        </div>
        <div class="row cl" id="writeDic">
            <label class="form-label col-2"><span class="c-red">*</span>类型码值：</label>
            <div class="formControls col-2">
                <input type="text" class="input-text" id="type" value="${dic.type}" placeholder="请输入类型码值" name="type" nullmsg="不能为空">
            </div>
            <label class="form-label col-2"><span class="c-red">*</span>类型描述：</label>
            <div class="col-3">
                <input type="text" class="input-text" id="description" value="${dic.description}" placeholder="请输入类型描述" name="description" nullmsg="不能为空">
            </div>
            <div class="col-4"></div>
        </div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>字典名称：</label>
			<div class="formControls col-6">
				<input type="text" class="input-text" value="${dic.name}" placeholder="请输入字典名称" name="name" datatype="*1-16" nullmsg="字典名称不能为空">
			</div>
			<div class="col-4"> </div>
		</div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>字典值：</label>
            <div class="formControls col-6">
                <input type="text" class="input-text" value="${dic.value}" placeholder="请输字典值" name="value" nullmsg="字典值不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>排序：</label>
            <div class="formControls col-6">
                <input type="number" class="input-text" value="${dic.sort}" placeholder="请输入排序号" name="sort" nullmsg="排序号不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
		<div class="row cl">
			<label class="form-label col-2">描述：</label>
			<div class="formControls col-6">
				<input type="text" class="input-text" value="${dic.remarks}" placeholder="请输入备注" name="remarks">
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button type="submit" class="btn btn-success radius" id="dic-save" name="dic-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</div>

<%@include file="/footer.jsp" %>

<script type="text/javascript">
function chanageType(){
        var obj = $("#showtype option:selected");
        var  vals  = obj.val();
        var  texts  = obj.text();
        if(vals=='-1'){
            $("#writeDic").show();
            $("#type").val("");
            $("#description").val("");
        }else{
            $("#writeDic").hide();
            $("#type").val(vals);
            $("#description").val(texts);
        }
    }
$(function(){
	var id = $("#id").val();
    if(id>0){
        $("#writeDic").hide();
    }
	$("#form-dic-add").Validform({
		tiptype:2,
		callback:function(form){
			var index = parent.layer.load();
			$.ajax({
				url:"yewu/dic/save" ,
				type:'post',
				async:true ,
				cache:false ,
				data:$(form).serialize(),
                dataType:"json",
				success:function(data){
					parent.layer.close(index);
					if(data.s == true){
						index = parent.layer.getFrameIndex(window.name);
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

}) ;
</script>
</body>
</html>