<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<html>
<head>
    <title>用户注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/bootstrap-select.css" rel="stylesheet" media="screen">
    <style>
        .wrap-content {
            width: 1080px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            background-image: url("https://ss3.bdstatic.com/lPoZeXSm1A5BphGlnYG/skin/8.jpg");
        }
        .login-bg{
            z-index: -1;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background-size: cover;
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

        .login {
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
    <div class="login panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">用户登录</h3>
        </div>
        <div class="panel-body">
            <div class="error-item">
                <i class="glyphicon glyphicon-ban-circle error-icon"></i>
                <span class="error-msg"></span>
            </div>
            <form role="form" action="" id="form-register" method="post" accept-charset="UTF-8">
                <div class="input-group">
                        <span class="input-group-addon" id="role">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                    <select class="selectpicker form-control">
                        <option class="filter-option">管理员</option>
                        <option class="filter-option">用户</option>
                    </select>
                </div>
                <br>
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
                    <input type="text" class="form-control password" placeholder="密码" name="password">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" id="pic-code">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </span>
                    <input type="text" class="form-control pic-code" placeholder="验证码" name="pic-code">
                </div>
                <br>
                <a type="button" id="btn-register" class="btn btn-primary btn-block">立即登录</a>
                <br>
                <a href="${basePath}/user/register" class="navbar-link" style="float: right">免费注册</a>

            </form>
        </div>
    </div>
    <div class="login-bg"></div>
</div>

<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap-select.js"></script>

<script type="text/javascript" src="${basePath}/static/js/util.js"></script>
<script type="text/javascript">
    $('.selectpicker').selectpicker({
        style: 'btn-info',
        size: 4
    });

</script>
</body>
</html>
