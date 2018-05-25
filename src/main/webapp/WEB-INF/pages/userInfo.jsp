<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心</title>
</head>
<style type="text/css">
	*{
	margin:0;
	padding:0;
	}
	.main{
	postion:absolute;
	width:60%;
	height:600px;
	background-color:#FFDAB9;
	margin:0 auto;
	border-left:2px dashed #0F0;
	border-right:2px dashed #0F0
	}
	.header{
	postion:absolute;
	width:100%;
	height:200px;
	margin:0 auto;
	background-color:#FFFFFF;
	}
	.userlogo{
	postion:absolute;
	float:left;
	width:200px;
	height:200px;
	background-color:#FFA54F;
	}
	.user{
	postion:absolute;
	width:300px;
	height:200px;
	float:left;
	margin-left:150px;
	
	text-align:center;
	}
	.homeform{
	position: absolute; /*绝对定位*/
	width: 600px;
	height:400px;
	

	top: 50%;
	left: 50%;
	margin-top: -110px;
	margin-left: -300px;
	
	}
	.message{
	margin-top:30px;
	margin-left:100px;
	}
	.center{
	font-size:8px;
	}
	.center_tr{
	background-color:#D6D6D6;
	}
	.btn{
	margin-top:50px;
	margin-left:100px;
	}
	.save{
	width:200px;
	}
	input{
	width:50px;
	}
</style>
<body>
<div class="main">
	<div class="header">
		<div class="userlogo"><img src="${basePath}/static/img/userlogo.jpg"></div>
		<div class="user"><br/><br/><br/><br/><h3>${user.username}(${user.realName})</h3></div>
	</div>
	<div class="content">
		<form class="homeform">
		<div class="message">
			身份证号：&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.idCard}</label>&nbsp;&nbsp;<input type="button" value="编辑">
			<br/><br/>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.email}</label>&nbsp;&nbsp;<input type="button" value="编辑">
		    <br/><br/>联系地址:&nbsp;&nbsp;&nbsp;&nbsp;<label>${user.homeAddress}</label>&nbsp;&nbsp;<input type="button" value="编辑">
			<br/><br/>我的预约<div class="center">
				<table>
					<tr class="center_tr">
						<th>订单编号</th>
						<th>预约车型</th>
						<th>预约时间</th>
						<th>预约地点</th>
						<th>预支付</th>
						<th>操作</th>
					</tr>
					<tr>
						<td>20180516093006</td>
						<td>迷你双人版</td>
						<td>2018-5-16 9:30</td>
						<td>汉阳区万达广场</td>
						<td>¥50</td>
						<td><input type="button" value="撤销"></td>
					</tr>
				</table>
			
			</div>
			<div class="btn"><input type="submit" value="保存" class="save"><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${basePath}/">返回首页</a>
			</div>
		</div>
		</form>
	
	</div>
</div>
</body>
</html>