<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>共享汽车预约管理平台</title>
    <link href="${basePath}/static/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/jquery.pagination.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>

    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/orderManage.js"></script>

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

        /*表格居中*/
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }

        /**字符串过长 转化为 。。。**/
        .order-detail table {
        table-layout: fixed; /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        }

        .order-detail td {
        width: 100%;
        word-break: keep-all; /* 不换行 */
        white-space: nowrap; /* 不换行 */
        overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
        text-overflow: ellipsis; /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
        -o-text-overflow: ellipsis;
        -icab-text-overflow: ellipsis;
        -khtml-text-overflow: ellipsis;
        -moz-text-overflow: ellipsis;
        -webkit-text-overflow: ellipsis;
        }

        /*金额*/
        .order-detail-pay-rmb{
            font-size: 14px;
            color: #e80012;
        }
        .order-detail-pay-price{
            font-size: 20px;
            color: #e80012;
        }
        .order-detail-btn{
            float: right;
            margin-right: 20px;
        }
        .order-detail-price{
            float: left;
            margin-left: 10px;
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
                <form action="#" method="" class="">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="sr-only" for="username">用户名</label>
                                <input type="text" class="form-control" id="username" placeholder="订单编号">
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">搜索</button>
                    </div>

                </form>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-hover user-list">
                    <thead class="text-center">
                    <tr>
                        <th>订单编号</th>
                        <th>姓名</th>
                        <th>金额</th>
                        <th>预约时间</th>
                        <th>预约地点</th>
                        <th>到期时间</th>
                        <th>还车地点</th>
                        <th>订单状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody class="orderBody">
                    <%--渲染数据--%>
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


<%--订单详情模态框--%>
<div class="modal fade" id="order-item-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4>订单详情(1527219655305)</h4>
            </div>
            <div class="modal-body order-detail">
                <table class="table table-hover">
                    <thead class="text-center">
                    <tr>
                        <th>序号</th>
                        <th>汽车名称</th>
                        <th>金额</th>
                        <th>预约地点</th>
                        <th>还车地点</th>
                    </tr>
                    </thead>
                    <tbody class="order-detail-body">
                   <%--渲染数据--%>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <div class="order-detail-price">
                    <span class="order-detail-pay-rmb">总金额 <i class="fa fa-rmb"></i></span>
                    <span class="order-detail-pay-price"></span>
                    <span class="order-detail-pay-rmb"> 元</span>
                </div>
                <div class="order-detail-btn">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>