<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>共享汽车预约管理平台</title>
    <link href="${basePath}/static/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/jquery.pagination.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>

    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/carListManage.js"></script>
    <style type="text/css">
        .manager_btn {
            width: 300px;
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
            margin-bottom: 5px;
        }

        .manager_btn {
            background: #FFF0F5;
            width: 120px;
            height: 32px;

        }

        .link {
            color: #ffffff;
            cursor: pointer;
            text-decoration: none;
        }

        .link:hover {
            color: #e80012;
        }
        .car-info img{
            width: 100px;
            height: 75px;
            margin-right: 10px;
        }
        .car-info span {
            font-size: 14px;
            color: #000000;
            margin-right: 10px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }
    </style>
</head>
<body>
<div id="manager_header">
    <div id="logo"><img src="${basePath}/static/img/menulogo.gif"></div>
    <div id="managerTitle"><h1>共享汽车预约管理平台</h1></div>
    <span class="header_info">欢迎您,${user.realname}</span>
</div>
<div id="manager_body">
    <%@include file="../common/menu.jsp"%>
    <div class="manager-right container ">
        <div class="content panel panel-default">
            <div class="panel-heading">
                <span class="page-header">
                    <a class="navbar-link" href="#">汽车管理</a>&gt;
                    <a class="navbar-link" href="#">汽车查询</a>
                </span>
                <br>
                <br>
                <form action="#" method="" class="">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="sr-only" for="keyword">关键字</label>
                                <input type="text" class="form-control" id="keyword" placeholder="您要查询的内容">
                            </div>
                        </div>
                        <button class="btn btn-primary btn-car-search" type="submit">搜索</button>
                    </div>
                </form>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-hover user-list">
                    <thead>
                    <tr>
                        <th></th>
                        <th>车辆信息</th>
                        <th>厂商</th>
                        <th>运营商</th>
                        <th>押金</th>
                        <th>状态</th>
                        <th>上线时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody class="car-info-body">

                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <div class="box">
                    <div id="myPagination" class="page fl">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>