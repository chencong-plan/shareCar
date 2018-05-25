<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册</title>
    <link href="${basePath}/static/css/style.css" rel="stylesheet" type="text/css">


    <link href="${basePath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${basePath}/static/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
</head>
<body>
<div id="header">信息注册</div>
<div id="re_form">
    <form action="" method="post" id="re_message" onsubmit="return checkSubmit()">
        <table id="re_table">
            <tr>
                <td>&nbsp;&nbsp;姓名</td>
                <span class=""></span>
                <td class="re_td"><input type="text" name="realname"
                                         id="re_name_txt" onblur="checkName()"></td>
                <td>
                    <div id="re_div1"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;性别</td>
                <td class="re_td">
                    <input type="radio" name="gender" class="gender" value="男"/>男
                    <input type="radio" name="gender" class="gender" value="女"/>女
                </td>
                <td></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;出生年月</td>
                <td class="re_td"><input type="text" id="dateBox" name="born" class=" datetimepicker date"></td>
                <td></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;账号</td>
                <td class="re_td"><input type="text" name="username"
                                         id="re_account" onblur="checkAccount()"/></td>
                <td>
                    <div id="re_div2"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;密码</td>
                <td class="re_td"><input type="password" name="password"
                                         id="re_pass_txt" onblur="checkPass()"/></td>
                <td>
                    <div id="re_div3"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;确认密码</td>
                <td class="re_td"><input type="password" name="repass"
                                         id="repass_txt" onblur="checkRepass()"><br/></td>
                <td>
                    <div id="re_div4"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;身份证号</td>
                <td class="re_td"><input type="text" name="IDCard"
                                         id="ID_card_txt" onblur="checkIDCard()"></td>
                <td>
                    <div id="re_div5"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;驾驶证类型</td>
                <td class="re_td"><input type="text" name="drivercardtype"
                                         id="driver_card_txt" onblur="checkDriverCard()"></td>
                <td>
                    <div id="re_div6"></div>
                </td>
            </tr>

            <tr>
                <td>&nbsp;&nbsp;邮箱</td>
                <td class="re_td"><input type="text" name="email"
                                         id="email_txt" onblur="checkEmail()"></td>
                <td>
                    <div id="re_div8"></div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;家庭住址</td>
                <td class="re_td"><input type="text" name="homeaddress"
                                         id="address_txt" onblur="checkAddress()"></td>
                <td>
                    <div id="re_div9"></div>
                </td>
            </tr>
        </table>
        <div class="div_submit"><input type="submit" class="re_btn" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="返回" class="re_btn" onClick="window.location.href='${basePath}/user/login'">
        </div>
    </form>

</div>
<script type="text/javascript" src="${basePath}/static/js/checkRegister.js"></script>
<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${basePath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
    $("#dateBox").datetimepicker({
        format: "yyyy-mm-dd"
    });
</script>
</body>
</html>
