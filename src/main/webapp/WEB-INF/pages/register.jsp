<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<html>
<head>
    <title>用户注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <style>
        .wrap-content {
            width: 1080px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }

        @keyframes in_am {
            0% {
                left: 125px;
                top: 935px;
                transform: rotate(109deg);
            }
            50% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        .register {
            position: absolute;
            width: 450px;
            margin-top: -200px;
            margin-left: -150px;
            left: 50%;
            top: 40%;
            background-color: rgba(255,255,255,0.8);
            animation: in_am .8s both;
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
    </style>
</head>
<body>
<div class="container">
    <div class="register panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">用户注册</h3>
        </div>
        <div class="panel-body">
            <div class="error-item">
                <i class="glyphicon glyphicon-ban-circle error-icon"></i>
                <span class="error-msg"></span>
            </div>
            <form role="form" action="" id="form-register" method="post" accept-charset="UTF-8">
                <div class="input-group">
                        <span class="input-group-addon" id="username">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                    <input type="text" class="form-control username" placeholder="账号" name="username">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="password">
                            <i class="glyphicon glyphicon-pencil"></i>
                        </span>
                    <input type="password" class="form-control password" placeholder="密码" name="password">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="re-password">
                            <i class="glyphicon glyphicon-pencil"></i>
                        </span>
                    <input type="password" class="form-control re-password" placeholder="确认密码" name="re-password">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="email">
                            <i class="glyphicon glyphicon-envelope"></i>
                        </span>
                    <input type="text" class="form-control email" placeholder="邮箱" name="email">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="realname">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                    <input type="text" class="form-control realname" placeholder="真实姓名" name="realname">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="id-card">
                            <i class="glyphicon glyphicon-credit-card"></i>
                        </span>
                    <input type="text" class="form-control id-card" placeholder="身份证号" name="id-card">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon" id="home-address">
                            <i class="glyphicon glyphicon-credit-card"></i>
                        </span>
                    <input type="text" class="form-control home-address" id="homeAddress" placeholder="家庭住址" name="home-address">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon born-date" id="born">
                            <i class="glyphicon glyphicon-calendar"></i>
                        </span>
                    <input type="text" class="form-control born-date" id="born-date" data-format="yyyy-MM-dd"   placeholder="出生年月日" name="born">
                </div>
                <br>
                <a type="button" id="btn-register" class="btn btn-primary btn-block">立即注册</a>
                <br>
                <a href="${basePath}/user/login2" class="navbar-link" style="float: right">已有账号?立即登录</a>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basePath}/static/js/register.js"></script>
<script type="text/javascript" src="${basePath}/static/js/util.js"></script>

<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.2&key=a12d33be94f50f1fb9fe6dfe847a036a"></script>

<script>
    $(".born-date").datetimepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true,
        minView: "month",//设置只显示到月份
        format: "yyyy-mm-dd",//日期格式
        autoclose: true,//选中关闭
        todayBtn: true//今日按钮
    });
</script>
</body>
</html>
