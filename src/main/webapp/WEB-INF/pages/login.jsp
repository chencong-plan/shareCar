<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>共享汽车预约系统</title>
    <script type="text/javascript" src="${basePath}/static/js/checkLogin.js"></script>
    <link href="${basePath}/static/css/style.css" rel="stylesheet">
    <script type="text/javascript">
        function reloadCode() {
            var time = new Date().getTime();
            document.getElementById("img_check").src = "${basePath}/user/code?d=" + time;
        }
    </script>
</head>
<body id="login_body">
<div class="header">
    <marquee scrollamount="4"><h2><img src="${basePath}/static/img/cloud1.gif"></h2></marquee>
</div>
<div class="header">
    <marquee scrollamount="3"><h2><img src="${basePath}/static/img/cloud2.gif"></h2></marquee>
</div>
<div class="header">
    <marquee scrollamount="2"><h2><img src="${basePath}/static/img/cloud3.gif"></h2></marquee>
</div>
<div class="header">
    <marquee scrollamount="1"><h2><img src="${basePath}/static/img/cloud4.gif"></h2></marquee>
</div>
<div id="div_1">
    <div><h2>共享汽车预约系统欢迎您</h2></div>
    <hr>
    <span class="msg-error">${msg}</span>
    <form id="f_login" action="${basePath}/user/doLogin" method="post" onsubmit="return checkLogin()">
        类型<select name="role" id="role">
        <option value="0">身份类型</option>
        <option value="1">用户</option>
        <option value="2">管理员</option>
    </select><br/>
        账户&nbsp;&nbsp;<input type="text" name="username" id="uname"/><br/>
        密码&nbsp;&nbsp;<input type="password" name="password" id="upass"/><br/>
        &nbsp;请输入验证码&nbsp;&nbsp;<input id="code" type="text" name="checkcode" style="width:60px"/>
        <img id="img_check" alt="验证码" onclick="reloadCode()" src="${basePath}/user/code"/>
        <br>
        <%--<br/><a href="javascript:reloadCode();">看不清，换一个</a><br>--%>
        <input class="d1" type="submit" value="登   录"><br/>
        <input class="d1" type="button" onclick="window.location.href='${basePath}/user/register'" value="注  册">

    </form>
</div>
</body>
</html>