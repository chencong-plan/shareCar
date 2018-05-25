<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
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

        .error-msg {
            font-size: 15px;
            color: red;
        }

        .admin-list td {
            text-align: center;
        }

        .admin-list th {
            text-align: center;
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
    <%@include file="../common/menu.jsp" %>
    <div class="manager-right container ">
        <div class="content panel panel-default">
            <div class="panel-heading">
                <span class="page-header">
                    <a class="navbar-link" href="#">用户管理</a>&gt;
                    <a class="navbar-link" href="#">管理员列表</a>
                </span>
                <br><br>
                <form action="#" method="" class="">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="sr-only" for="username">用户名</label>
                                <input type="text" class="form-control" id="username" placeholder="管理员账号/真实姓名">
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit" id="admin-search">搜索</button>
                        <a href="javascript:void(-1);" class="btn btn-success" id="admin-add">新增</a>
                    </div>
                </form>
            </div>
            <div class="panel-body">
                <div class="msg-alert" style="display: none">

                </div>
                <table class="table table-striped table-hover admin-list text-center">
                    <thead class="text-center">
                    <tr>
                        <th>编号</th>
                        <th>账号</th>
                        <th>密码</th>
                        <th>真实姓名</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody class="admin-data">

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


<%--新增管理员模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" id="myModalLabel">
                    新增管理员信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="error-item">
                    <span class="error-msg"></span>
                </div>
                <form role="form" action="" id="form-register" method="post" accept-charset="UTF-8">
                    <div class="input-group">
                        <span class="input-group-addon" id="md-username">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input class="md-id" hidden="">
                        <input type="text" class="form-control md-username" placeholder="账号" name="md-username">
                    </div>
                    <br>
                    <div class="input-group  modal-password-input">
                        <span class="input-group-addon" id="md-password">
                            <i class="glyphicon glyphicon-pencil"></i>
                        </span>
                        <input type="password" class="form-control md-password" placeholder="密码" name="md-password">
                    </div>
                    <br>
                    <div class="input-group modal-password-input">
                        <span class="input-group-addon" id="md-re-password">
                            <i class="glyphicon glyphicon-pencil"></i>
                        </span>
                        <input type="password" class="form-control md-re-password" placeholder="确认密码"
                               name="md-re-password">
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon born-date" id="md-re-realname">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" class="form-control md-re-realname" placceholder="真实姓名"
                               name="md-re-realname">
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon born-date" id="md-email">
                            <i class="glyphicon glyphicon-envelope"></i>
                        </span>
                        <input type="text" class="form-control md-email" placceholder="邮箱地址" name="md-email">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="admin-submit">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--确定模态框--%>
<%@ include file="../common/msgModal.jsp" %>
<script type="text/javascript" src="${basePath}/static/js/adminManage.js"></script>
</body>
</html>