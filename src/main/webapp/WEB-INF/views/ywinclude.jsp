<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
        String ctx = request.getContextPath();
        request.setAttribute("staticPath", ctx) ;
        request.setAttribute("ctx", ctx) ;
%>
<link rel="shortcut icon" href="${staticPath}/images/yewu.png">
<link rel="stylesheet" href="${staticPath}/css/yewu/bootstrap.min.css">
<link rel="stylesheet" href="${staticPath}/css/yewu/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="${staticPath}/css/yewu/mycommon.css">
<%--<link rel="stylesheet"  href="${staticPath}/css/yewu/bootstrap-select.min.css">--%>
<%--<script src="${staticPath}/lib/yewu/bootstrap-select.min.js"></script>--%>
<script src="${staticPath}/script/jquery-1.11.3.min.js"></script>
<script src="${staticPath}/lib/yewu/bootstrap.min.js"></script>
<%--<script src="${staticPath}/lib/yewu/zeroModal/zeroModal.min.js"></script>--%>
<script src="${staticPath}/lib/yewu/bootstrap-paginator.js"></script>
<script src="${staticPath}/lib/yewu/jedate.js"></script>
<script src="${staticPath}/script/md5.js"></script>

<script src="${staticPath}/lib/My97DatePicker/WdatePicker.js"></script>

<link rel="stylesheet" type="text/css" href="${staticPath}/lib/layer/skin/layer.css">
<link rel="stylesheet" type="text/css" href="${staticPath}/lib/layer/skin/layer.ext.css">

<script src="${staticPath}/lib/layer/layer.js"></script>
<script src="${staticPath}/lib/layer/extend/layer.ext.js"></script>