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
<title>main</title>
<%@include file="/header.jsp" %>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
  <table class="table table-border table-bordered table-bg">
    <thead>
      <tr>
        <th colspan="2" scope="col">服务器信息</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th width="200">服务器计算机名</th>
        <td><span id="lbServerName">${env.COMPUTERNAME}</span></td>
      </tr>
      <tr>
        <th>JDK版本</th>
        <td>${javaVersion}</td>
      </tr>
    </tbody>
  </table>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>