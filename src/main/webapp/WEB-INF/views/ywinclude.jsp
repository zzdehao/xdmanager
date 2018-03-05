<%
        String ctx = request.getContextPath();
        request.setAttribute("staticPath", ctx) ;
        request.setAttribute("ctx", ctx) ;
%>
<link rel="shortcut icon" href="${staticPath}/images/yewu.png">
<link rel="stylesheet" href="${staticPath}/css/yewu/bootstrap.min.css">
<link rel="stylesheet" href="${staticPath}/css/yewu/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="${staticPath}/css/yewu/mycommon.css">
<link rel="stylesheet"  href="${staticPath}/css/yewu/bootstrap-select.min.css">
<script src="${staticPath}/lib/yewu/bootstrap-select.min.js"></script>
<script src="${staticPath}/lib/yewu/jquery.min.js"></script>
<script src="${staticPath}/lib/yewu/bootstrap.min.js"></script>
<script src="${staticPath}/lib/yewu/zeroModal/zeroModal.min.js"></script>
<script type="text/javascript" src="${staticPath}/lib/yewu/bootstrap-paginator.js"></script>
<script type="text/javascript" src="${staticPath}/lib/yewu/jedate.js"></script>
<script type="text/javascript" src="${staticPath}/script/md5.js"></script>