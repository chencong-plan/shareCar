<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../common/tag.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>共享汽车预约管理平台</title>
    <link href="${basePath}/static/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/bootstrap-select.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/jquery.pagination.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/fileinput.css">

    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/bootstrap-select.js"></script>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/defaults-zh_CN.js"></script>
    <%--fileinput--%>
    <script type="text/javascript" src="${basePath}/static/js/fileinput.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/zh.js"></script>

    <%--addCar.js--%>
    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/addCar.js"></script>

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

        .car-info img {
            width: 100px;
            height: 75px;
            margin-right: 10px;
        }

        .car-info span {
            font-size: 14px;
            color: #000000;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }

        .add-car-title {
            font-size: 20px;
            color: #000000;
        }

        .error-item {
            position: relative;
            padding: 4px 0 4px 40px;
            margin-bottom: 15px;
            border: 1px solid red;
            color: red;
            background: #fde9e9;
            display: none;
        }

        .error-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            font-size: 14px;
            margin-top: -7px;
        }

        .add-car-content {
            width: 70%;
            margin: 0 auto;
        }

        .add-car-content .add-car-msg {
            width: 60%;
            margin: 0 auto;
        }

        .add-car-content .add-car-body {
            width: 80%;
            margin: 0 auto;
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
    <div class="manager-right container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <span class="add-car-title">新增汽车</span>
            </div>
            <div class="panel-body">
                <div class="add-car-content">
                    <div class="add-car-msg">
                        <div class="error-item">
                            <i class="glyphicon glyphicon-ban-circle error-icon"></i>
                            <span class="error-msg">错误信息提示</span>
                        </div>
                    </div>
                    <div class="add-car-body">
                            <div class="input-group">
                                <span class="input-group-addon" id="car-name">
                                    <i class="fa fa-car"></i>
                                </span>
                                <input type="text" class="form-control car-name" placeholder="汽车名称" name="car-name">
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon" id="car-type">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </span>
                                <select class="selectpicker form-control"  id="car-type-select"  data-live-search="true" data-live-search-placeholder="搜索汽车类型" title="选择汽车类型" name="car-type">

                                </select>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon" id="car-product-name">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </span>
                                <select class="form-control selectpicker car-product-name" data-live-search-placeholder="搜索厂商" data-live-search="true" title="选择厂商"
                                        name="car-product-name">
                                    <option value="0">长安马自达</option>
                                    <option value="1">北京现代</option>
                                    <option value="2">大众</option>
                                    <option value="3">上海通用</option>
                                    <option value="3">哈弗</option>
                                    <option value="3">梅赛德斯奔驰</option>
                                    <option value="3">宝马</option>
                                </select>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon" id="car-operation">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </span>
                                <select class="form-control selectpicker car-operation" data-live-search-placeholder="搜索运营商" data-live-search="true" title="选择运营商"
                                        name="car-operation">
                                    <option value="0">大家族集团武汉分公司</option>
                                    <option value="1">大家族集团上海分公司</option>
                                    <option value="2">运营商1</option>
                                    <option value="3">关谷特别营销店</option>
                                    <option value="4">运营商2</option>
                                    <option value="5">汉阳江大店</option>
                                </select>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-rmb"></i>
                                </span>
                                <input type="number" class="form-control car-pay" placeholder="租赁押金" name="car-pay">
                                <span class="input-group-addon">
                                    <i class="glyphicon">元</i>
                                </span>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon car-image">
                                    <i class="fa fa-upload"></i>
                                </span>
                                <input type="text" readonly="readonly" class="form-control  car-image"
                                       placeholder="汽车图片" name="car-image">
                                <span class="input-group-addon car-image">
                                    <i class="fa fa-file-image-o"></i>
                                </span>
                            </div>
                            <br>
                            <a type="button" id="btn-add-car" class="btn btn-primary">立即添加</a>
                            <br>
                            <a href="${basePath}/manage/car/" class="navbar-link" style="float: right">查看所有&gt;&gt;</a>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="box">
                    <div id="myPagination" class="page fl"></div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>


<%--新增管理员模态框--%>
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4>上传图片</h4>
            </div>
            <div class="modal-body">
                <input id="modal-car-image" class="file" data-show-caption="true" type="file">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    // $("#myPagination").pagination({
    //     currentPage: 1,
    //     totalPage: 7,
    //     callback: function (current) {
    //
    //     }
    // });
    $('.car-image').click(function () {
        $('#myModal').modal('show');
    });

</script>
</body>
</html>