<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="script/jquery.areaSelect.js"></script>
<style type="text/css">
#area select{
	width: 200px ;
	font-size: 14px ;
	height: 31px;
	cursor: pointer;
}
</style>
</head>
<body>
<div id="area" style="margin: 10px ;">
		<select l = "1"></select>
		<select l = "2"></select>
		<select l = "3"></select>
		<select l = "4"></select>
</div>
<script type="text/javascript">
/*调用插件*/
$(function(){
	$("#area").AreaSelect();
});
</script>
</body>
</html>