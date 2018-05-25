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
    <link href="${basePath}/static/css/bootstrap-select.css" rel="stylesheet" media="screen">

    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>

    <script type="text/javascript" src="${basePath}/static/js/bootstrap-select.js"></script>

    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.2&key=a12d33be94f50f1fb9fe6dfe847a036a"></script>

    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/userInfo.js"></script>
</head>
<style type="text/css">
    .main {
        width: 1080px;
        margin: 0 auto;
    }

    .user-info {
        width: 100%;
        height: 250px;
    }

    .user-info .user-info-headImg {
        width: 25%;
        height: 170px;
        float: left;
    }

    .user-info .user-info-basic {
        width: 75%;
        float: right;
        height: 170px;
    }

    /*头像*/
    .user-info-headImg img {
        width: 150px;
        height: 150px;
        margin-top: 10px;
        margin-left: 50px;
    }

    .user-info-header .user-info-basic {
        background: #666666;
    }

    .user-info-header .user-info-name {
        background: #2aabd2;
    }

    /*表格居中*/
    .table th, .table td {
        text-align: center;
        vertical-align: middle !important;
    }

    .td-black {
        font-weight: bolder;
        font-size: 14px;
    }

    .user-info-input.error {
        border: 1px solid #e80012;
    }

    .user-info-input-select.error {
        border: 1px solid #e80012;
    }
</style>
<body>
<div class="main">
    <div class="content">
        <div class="panel panel-default">
            <div class="panel panel-heading text-center">
                <h4>用户中心</h4>
            </div>
            <div class="panel panel-body">
                <div class="user-info">
                    <div class="user-info-headImg">
                        <%--隐藏用户id--%>
                        <input type="text" value="${user.id}" hidden="" class="userInfo-id">
                        <img class="img-rounded" src="${basePath}/static/img/userlogo.jpg">
                    </div>
                    <div class="user-info-basic">
                        <table class="table  table-hover">
                            <tr>
                                <td class="td-black">姓名</td>
                                <td><input type="text" class="form-control user-info-input text-danger" id="realName"
                                           placeholder="真实姓名" value="${user.realName}"></td>
                                <td><input type="text" class="form-control user-info-input" id="username"
                                           placeholder="用户名" value="${user.username}"></td>
                                <td><input type="password" class="form-control user-info-input" id="password"
                                           placeholder="用户密码" value="${user.password}"></td>

                            </tr>
                            <tr>
                                <td class="td-black">性别</td>
                                <td>
                                    <select class="selectpicker user-info-input-select" id="gender" title="${user.gender}">
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </td>
                                <td class="td-black">年龄</td>
                                <td><input type="text" class="form-control" id="born" placeholder="年龄" value="22"
                                           disabled></td>
                            </tr>
                            <tr>
                                <td class="td-black">身份证</td>
                                <td colspan="3">420117199603213139</td>
                            </tr>
                            <tr>
                                <td class="td-black">联系地址</td>
                                <td colspan="3"><input type="text" class="form-control user-info-input" id="homeAddress"
                                                       placeholder="家庭住址" value="${user.homeAddress}"></td>
                            </tr>
                            <tr>
                                <td class="td-black">驾驶证类型</td>
                                <td colspan="3">
                                    <select class="selectpicker user-info-input-select" id="driverCardType" title="${user.driverCardType}">
                                        <option>C1</option>
                                        <option>C2</option>
                                        <option>C3</option>
                                        <option>A1</option>
                                        <option>A2</option>
                                        <option>A3</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="user-order-list">
                    <div class="panel-title text-center">
                        <h4>用户订单列表信息</h4>
                    </div>
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
                </div>

            </div>
            <div class="panel panel-footer">
                <a class="navbar-link text-left" href="${basePath}/index">&lt;回到首页</a>
                <div class="box text-right">
                    <div id="myPagination" class="page fl"></div>
                </div>
            </div>
        </div>

    </div>
    <div class="footer"></div>
</div>
<%--<script type="text/javascript">--%>
<%--$("#myPagination").pagination({--%>
<%--currentPage: 1,--%>
<%--totalPage: 7,--%>
<%--callback: function (current) {--%>
<%--}--%>
<%--});--%>
<%--</script>--%>
</body>
</html>