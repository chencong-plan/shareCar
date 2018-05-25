<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>预约汽车</title>
    <link href="${basePath}/static/css/ordercar.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/font-awesome.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <%--地图所需 star--%>
    <%@ include file="map/common.jsp" %>
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <%--<script type="text/javascript" src="${basePath}/static/js/map.js"></script>--%>
    <%--地图所需 end--%>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.zh-CN.js"
            charset="UTF-8"></script>
    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/ordercar.js"></script>
    <style>
        .center {
            postion: absolute;
            background-color: #FFFFFF;
            width: 100%;
            height: 500px;
            margin: 0 auto;
        }

        .ordercar_table th, td {
            border: 1px solid blue;
        }

        th {
            float: left;
            width: 200px;
        }

        td {
            width: 400px;
        }

        .showCar_img {
            height: 200px;
        }

        .orderCar_btn {
            margin-top: 20px;
        }

        .divForm {
            position: absolute; /*绝对定位*/
            width: 600px;
            height: 500px;
            /*border: 1px solid red;*/
            text-align: center; /*(让div中的内容居中)*/
            top: 50%;
            left: 50%;
            margin-top: -210px;
            margin-left: -350px;
        }

        .center_left {
            margin-top: 50px;
            margin-left: 100px;
            font-size: 48px;
            float: left;
            font-size: 48px;
        }

        .select_type {
            width: auto;
            padding: 0 2%;
            margin: 0;
        }

        option {
            text-align: center;
        }

        .center_right {
            float: right;
            margin-top: 200px;
        }

        /*新增样式 模态框*/
        .car-info-item {
            margin-bottom: 10px;
        }

        .car-info-title {
            font-size: 16px;
            color: #666666;
        }
        .error-msg {
            font-size: 15px;
            color: red;
        }
    </style>
</head>
<body>
<div id="order_header">
    <div id="logo">
        <img src="${basePath}/static/img/menulogo.gif">
    </div>
    <div id="headerTitle">
        <h1>共享汽车预约系统</h1>
    </div>
    <span class="header_info">欢迎您,${realname}</span>
</div>
<div class="center">
    <div class="center_left">
        <img src="${basePath}/static/img/001.PNG"><br/> &nbsp;&nbsp; <img
            src="${basePath}/static/img/002.PNG"><br/> <img src="${basePath}/static/img/003.PNG"><br/>
        &nbsp; <img src="${basePath}/static/img/004.PNG"><br/>

    </div>
    <div class="divForm">
        <table class="ordercar_table">
            <tr>
                <th>汽车信息</th>
                <td>
                    ${carVo.name} &gt; ${carVo.productName} &gt; ${carVo.operation}
                    <input value="${carVo.id}" type="text" hidden="" id="car-id">
                    <input value="${carVo.name}/${carVo.productName}/${carVo.operation}" type="text" hidden=""
                           id="car-info">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="showCar_img">
                    <%--地图--%>
                    <div id="mapContainer"></div>
                </td>
            </tr>
            <tr>
                <th>预约地点</th>
                <td>
                    <div id="tip">
                        <input type="text" class="form-control" id="keyword-get-car" name="keyword" value="预约地点"
                               placceholder="搜索一下" onfocus='this.value=""'/>
                    </div>
                </td>
            </tr>
            <tr>
                <th>还车地点</th>
                <td>
                    <input type="text" class="form-control" id="keyword-return-car" name="keyword" value="还车地点"
                           placceholder="搜索一下" onfocus='this.value=""'/>
                </td>
            </tr>
            <tr>
                <th>预约时间</th>
                <td>
                    <div>
                        <input type="text" placceholder="开始时间" class=" order-car-begin-time">
                        <input type="text" placceholder="结束时间" class="order-car-end-time">
                    </div>
                </td>
            </tr>
            <tr>
                <th>押金</th>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                        <input type="text" disabled class="form-control order-car-pay" value="${carVo.pay}"
                               name="order-car-pay">
                        <span class="input-group-addon"><i class="glyphicon">元</i></span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>计费说明</th>
                <td> ${carType.price} 元/h <input class="order-car-type-price" value="${carType.price}" hidden></td>
            </tr>
            <tr>
                <th>预约支付</th>
                <td>${carVo.pay}</td>
            </tr>
        </table>
        <div class="orderCar_btn">
            <input type="submit" name="order" class="btn btn-primary btn-order-car" value="预约"/> <input
                type="reset" name="reset" class="btn btn-warning btn-order-reset" value="重置"/> <br/>
            <a class="navbar-link" href="${basePath}/index">返回首页</a>
        </div>
    </div>
    <div class="center_right">
        <img src="${basePath}/static/img/car.gif"/>
    </div>
</div>

<%--确认约定页面--%>
<div class="modal fade bs-example-modal-lg" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4>确认预约信息</h4>
            </div>
            <div class="modal-body">
                <div class="car-info-item md-car-info">
                    <span class="car-info-title">车辆信息：</span>
                    <span class="car-info-name">社会大本/长安马自达 /运营商2</span>
                </div>
                <div class="car-info-item md-car-begin-info">
                    <span class="car-info-title">预约信息：</span>
                    <i class="fa fa-location-arrow"></i><span class="car-info-begin-place">中间康城西区</span>
                    <i class="fa fa-clock-o"></i><span class="car-info-begin-time"> 2018-5-24 12:14:03</span>
                </div>
                <div class="car-info-item md-car-end-info">
                    <span class="car-info-title">还车信息：</span>
                    <i class="fa fa-map-marker"></i><span class="car-info-end-place">江汉大学</span>
                    <i class="fa fa-clock-o"></i><span class="car-info-end-time"> 2018-5-24 12:14:03</span>
                </div>
                <div class="car-info-item md-car-pay">
                    <span class="car-info-title">计费方式：</span>
                    押金￥<span class="car-info-pay-money">900</span>元
                    <span class="car-info-car-type-price">5</span>元/h
                </div>
            </div>
            <div class="modal-footer text-center">

                <form class="form-inline text-center">
                    <div class="error-item">
                        <span class="error-msg"></span>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control pay-money"  placeholder="预约押金">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control pay-password" placeholder="支付密码">
                    </div>
                </form>
                <button class="btn btn-primary btn-confirm-order">确认预定</button>
                <button class="btn btn-warning" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    $(".order-car-begin-time").datetimepicker({
        language: 'zh-CN',
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd hh:mm",//日期格式
        todayBtn: true//今日按钮
    });
    $(".order-car-end-time").datetimepicker({
        language: 'zh-CN',
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd hh:mm",//日期格式
        todayBtn: true//今日按钮
    });
</script>
</body>
</html>