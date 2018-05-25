<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户中心</title>
    <link href="${basePath}/static/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/jquery.pagination.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>

    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/userInfo.js"></script>
</head>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    .main {
        postion: absolute;
        width: 60%;
        height: 800px;
        background-color: #FFDAB9;
        margin: 0 auto;
        border-left: 2px dashed #0F0;
        border-right: 2px dashed #0F0
    }

    .header {
        postion: absolute;
        width: 100%;
        height: 200px;
        margin: 0 auto;
        background-color: #FFFFFF;
    }

    .userlogo {
        postion: absolute;
        float: left;
        width: 200px;
        height: 200px;
        background-color: #FFA54F;
    }

    .user {
        postion: absolute;
        width: 300px;
        height: 200px;
        float: left;
        margin-left: 150px;

        text-align: center;
    }

    .homeform {
        position: absolute; /*绝对定位*/
        width: 870px;
        height: 400px;

        top: 55%;
        left: 44%;
        margin-top: -110px;
        margin-left: -300px;

    }

    .message {
        margin-top: 30px;
        margin-left: 50px;
    }

    .center {
        font-size: 14px;
    }

    .save {
        width: 200px;
    }

    input {
        width: 50px;
    }

    /*表格居中*/
    .table th, .table td {
        text-align: center;
        vertical-align: middle !important;
    }
</style>
<body>
<div class="main">
    <div class="header">
        <div class="userlogo"><img src="${basePath}/static/img/userlogo.jpg"></div>
        <div class="user"><br/><br/><br/><br/>
            <h3>${user.username}(${user.realName})</h3>
            <input type="text" value="${user.id}" hidden="" class="userInfo-id">
        </div>
    </div>
    <div class="content">
        <form class="homeform">
            <div class="message">
                身份证号：&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.idCard}</label>&nbsp;&nbsp;<input type="button" value="编辑">
                <br/><br/>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.email}</label>&nbsp;&nbsp;<input
                    type="button" value="编辑">
                <br/><br/>联系地址:&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.homeAddress}</label>&nbsp;&nbsp;<input
                    type="button" value="编辑">
                <br/><br/>我的预约
                <div class="center">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>订单编号</th>
                            <th>预约时间</th>
                            <th>预约地点</th>
                            <th>还车地点</th>
                            <th>预支付</th>
                            <th>订单状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody class="userInfo-order">
                        <%--渲染数据--%>
                        </tbody>
                    </table>
                    <div class="box">
                        <div id="myPagination" class="page fl"></div>
                    </div>
                    <a class="navbar-link" href="${basePath}/index">返回首页</a>
                </div>
            </div>
        </form>

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