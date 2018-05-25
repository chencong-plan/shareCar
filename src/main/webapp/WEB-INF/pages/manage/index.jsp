<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../common/tag.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>共享汽车预约管理平台</title>
    <link href="${basePath}/static/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <style type="text/css">
        .link{
            color: #ffffff;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
        }
        .link:hover{
            color: #e80012;
        }
        .manager_left p {
            height: 25px;
            line-height: 25px;
            font-weight: bold;
            background: #E0FFFF;
            border-bottom: 1px solid #ccc;
            cursor: pointer;
            text-align: center;

        }

        ul {
            display: none;
        }

        li {
            text-align: center;
            margin-top: 10px;
        }

        .manager_btn {
            background: #FFF0F5;
            width: 120px;
            height: 32px;

        }
    </style>
</head>
<body>
<div id="manager_header">
    <div id="logo"><img src="${basePath}/static/img/menulogo.gif"></div>
    <div id="managerTitle"><h1>共享汽车预约管理平台</h1></div>
    <span class="header_info">欢迎您,${current_user.realname}</span>
</div>
<div id="manager_body">
    <%@include file="../common/menu.jsp" %>

</div>


<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
</body>
</html>