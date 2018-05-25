<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="common/tag.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${basePath}/static/css/menu.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/jquery.pagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jquery.pagination.min.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/util.js"></script>
    <title>首页</title>
</head>
<body id="menu_body">
<div id="menu_header">
    <div id="logo">
        <img src="${basePath}/static/img/menulogo.gif">
    </div>
    <div id="headerTitle">
        <h1>共享汽车预约系统</h1>
    </div>
    <c:choose>
        <c:when test="${empty current_user}">
            <span class="header_info">您好，欢迎您</span>
        </c:when>
        <c:otherwise>
            <span class="header_info">您好，${current_user.realName}</span>
        </c:otherwise>
    </c:choose>

</div>


<div class="w">
    <ul class="menu-ul">
        <li><a class="on" href="#">首页</a></li>
        <%--<li><a href="">汽车资讯</a></li>--%>
        <li><a class="menu-ul-li" href="">预约汽车</a></li>
        <li><a class="menu-ul-li" href="${basePath}/user/${current_user.id}">用户中心</a></li>
        <li><a class="menu-ul-li" href="">关于我们</a></li>
        <li><a class="menu-ul-li" href="${basePath}/user/login">登录</a></li>
        <li><a class="menu-ul-li" href="${basePath}/user/register">注册</a></li>
        <li><a class="menu-ul-li" href="${basePath}/user/logout">注销</a></li>
    </ul>
</div>
<div id="menu_center" class="w">

    <div class="menu-content">
        <div class="menu-header">
            <div class="marquee_css">
                <marquee direction="left" scrollamount="3" loop="-1">畅想共享汽车新时代，享受绿色低碳出行</marquee>
            </div>
        </div>
        <div class="menu-wrap">
            <c:forEach items="${carVoList}" var="carVo">
                <div class="car-item">
                    <div class="car-img">
                        <a href="${basePath}/orderCar/${carVo.id}">
                            <img src="${basePath}${carVo.imageUrl}" alt="${carVo.name}">
                        </a>
                    </div>
                    <div class="car-item-con">
                        <div class="car-pay-con">
                            <span class="car-pay">￥${carVo.pay}</span>
                            <span class="car-pay-time">(押金) 5元/h</span>
                            <span class="car-create-time">
                            <i class="fa fa-clock-o">${carVo.createTime}</i>
                        </span>
                        </div>
                        <div class="car-label-info">
                            <span class="car-product-name">生产商：${carVo.productName}</span>
                            <span class="car-product-name">运营商：${carVo.operation}</span>
                        </div>

                        <div class="car-name-con">
                            <a href="${basePath}/orderCar/${carVo.id}">
                                <span class="car-name">${carVo.name}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
        <div class="menu-pagination">
            <%--<div class="box">--%>
            <%--<div id="myPagination" class="page fl"></div>--%>
            <%--</div>--%>
        </div>
    </div>

</div>
<div class="menu-floor w">

</div>

<script type="text/javascript">
    $("#myPagination").pagination({
        currentPage: 1,
        totalPage: 7,
        callback: function (current) {
            // _this.pageInfo.pageNum = current;
            // console.log(_this.pageInfo);
            // _this.reloadList(_this.pageInfo);
        }
    });
</script>
</body>
</html>