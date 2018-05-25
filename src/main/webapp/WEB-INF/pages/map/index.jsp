<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>输入提示后查询</title>
    <%--<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main.css"/>--%>
    <%@ include file="common.jsp"%>
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/map.js"></script>
</head>
<body>
<div id="mapContainer"></div>
<div id="tip">
    <input type="text" id="keyword" name="keyword" value="搜索一下" placceholder="搜索一下" onfocus='this.value=""'/>
</div>

</body>
</html>