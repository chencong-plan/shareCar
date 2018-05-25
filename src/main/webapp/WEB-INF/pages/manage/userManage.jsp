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
    <script type="text/javascript" src="${basePath}/static/js/userManage.js"></script>
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
                    <a class="navbar-link" href="#">用户管理</a>&gt;
                    <a class="navbar-link" href="#">用户列表</a>
                </span>
                <br>
                <br>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="sr-only" for="username">用户名</label>
                                <input type="text" class="form-control" id="username" placeholder="账号/真实姓名">
                            </div>
                        </div>
                        <button class="btn btn-primary btn-search">搜索</button>
                    </div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-hover user-list">
                    <thead class="text-center">
                    <tr>
                        <th>序号</th>
                        <th>账号</th>
                        <th>真实姓名</th>
                        <th>身份证号</th>
                        <th>邮箱</th>
                        <th>出生年月日</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody class="user-tbody">
                    <tr>
                        <td>1</td>
                        <td>liuquanhui</td>
                        <td>刘二狗</td>
                        <td>420117199603213139</td>
                        <td>liuquanhui@163.com</td>
                        <td>1996-03-21</td>
                        <td>
                            <a class="btn btn-info btn-sm">重置密码</a>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <div class="box">
                    <div id="myPagination" class="page fl"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#myPagination").pagination({
        currentPage: 1,
        totalPage: 7,
        callback: function (current) {

        }
    });
</script>
</body>
</html>