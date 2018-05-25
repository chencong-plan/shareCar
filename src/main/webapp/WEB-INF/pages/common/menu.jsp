<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<script type="text/javascript">
    window.onload = function () {
        var menu_left = document.getElementById("manager_left");
        var ps = menu_left.getElementsByTagName("p");
        var uls = menu_left.getElementsByTagName("ul");
        for (var i = 0; i < ps.length; i++) {
            ps[i].id = i;
            ps[i].onclick = function () {
                var ul = uls[this.id];
                if (ul.style.display == "block") {
                    ul.style.display = "none";
                } else {
                    ul.style.display = "block";
                }
            }
        }
    }
</script>
<div id="manager_left" class="manager_left">
    <div>
        <p><input type="button" value="订单管理" class="manager_btn"></p>
        <ul>
            <li><a class="link" href="${basePath}/manage/order">订单查询</a></li>
        </ul>
    </div>
    <div>
        <p><input type="button" value="用户管理" class="manager_btn"></p>
        <ul>
            <li><a class="link" href="${basePath}/manage/user">查询用户</a></li>
            <li><a class="link" href="${basePath}/manage/admin">新增管理员</a></li>

        </ul>
    </div>
    <div>
        <p><input type="button" value="汽车管理" class="manager_btn"></p>
        <ul>
            <li><a class="link" href="${basePath}/manage/car/">查询汽车</a></li>
            <li><a class="link" href="${basePath}/manage/car/add">新增汽车</a></li>
        </ul>
    </div>
    <%--<div>--%>
        <%--<p><input type="button" value="分组统计管理" class="manager_btn"></p>--%>
        <%--<ul>--%>
            <%--<li>预约地区统计</li>--%>
            <%--<li>车辆类别统计</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <%--<p><input type="button" value="设置" class="manager_btn"></p>--%>
</div>