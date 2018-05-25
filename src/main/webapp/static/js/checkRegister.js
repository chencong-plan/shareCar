/**
 * 检测注册页面的信息填写是否符合基本要求
 */

function checkName() {
	var re_name_txt = document.getElementById("re_name_txt").value;
	if (re_name_txt == "" || re_name_txt == null) {
		document.getElementById("re_div1").innerText = "*姓名不能为空";
		return false;
	} else {
		document.getElementById("re_div1").innerText = "";
		return true;
	}
}
function checkAccount() {
	var reAccount = $("#re_account").val();
	if(reAccount === ""){
		$("#re_div2").html("用户名不能为空");
		return false;
	}
	var phoneRegx = /^[1][3,4,5,7,8][0-9]{9}$/;
	if(!phoneRegx.test(reAccount)){
		//不通过正则校验 手机号格式错误
		$("#re_div2").html("账户名必须为11位手机号");
		return false;
	}
	// ajax 验证用户名
	$.ajax({
		url : "CheckUserServlet",
		data:{
			username : reAccount
		},
		success : function(result) {
			$("#re_div2").html(result);
		}
	});
	return true;
}
function checkPass() {
	var re_pass_txt = document.getElementById("re_pass_txt").value;
	if (re_pass_txt == "" || re_pass_txt == null) {
		document.getElementById("re_div3").innerText = "*密码不能为空";
		return false;
	} else {
		document.getElementById("re_div3").innerText = "";
		return true;
	}
}
function checkRepass() {
	var repass_txt = document.getElementById("repass_txt").value;
	var re_pass_txt = document.getElementById("re_pass_txt").value;
	if (repass_txt != re_pass_txt) {
		document.getElementById("re_div4").innerText = "*两次密码不一致";
		return false;
	} else if (re_pass_txt == "" || re_pass_txt == null) {
		document.getElementById("re_div4").innerText = "*请再次输入密码";
		return false;
	} else {
		document.getElementById("re_div4").innerText = "";
		return true;
	}
}
function checkIDCard() {
	var ID_card_txt = document.getElementById("ID_card_txt").value;
	if (ID_card_txt == "" || ID_card_txt == null) {
		document.getElementById("re_div5").innerText = "*身份证不能为空";
		return false;
	} else if (ID_card_txt.length != 18 && ID_card_txt.length != 15) {
		document.getElementById("re_div5").innerText = "*身份证位数有误";
		return false;
	} else {
		document.getElementById("re_div5").innerText = "";
		return true;
	}
}
function checkDriverCard() {
	var driver_card_txt = document.getElementById("driver_card_txt").value;
	if (driver_card_txt == "" || driver_card_txt == null) {
		document.getElementById("re_div6").innerText = "*驾驶证编号不能为空";
		return false;
	} else {
		document.getElementById("re_div6").innerText = "";
		return true;
	}
}
function checkEmail() {
	var email_txt = document.getElementById("email_txt").value;
	var reg = new RegExp(
			"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	if (email_txt == "" || email_txt == null) {
		document.getElementById("re_div8").innerText = "*邮箱不能为空";
		return false;
	} else if (!reg.test(email_txt)) {
		document.getElementById("re_div8").innerText = "*邮箱有误";
		return false;
	} else {
		document.getElementById("re_div8").innerText = "";
		return true;
	}
}
function checkAddress() {
	var address_txt = document.getElementById("address_txt").value;
	if (address_txt == "" || address_txt == null) {
		document.getElementById("re_div9").innerText = "*地址不能为空";
		return false;
	} else {
		document.getElementById("re_div9").innerText = "";
		return true;
	}

}
function checkSubmit() {
	var re_name_txt = document.getElementById("re_name_txt").value;
	var re_pass_txt = document.getElementById("re_pass_txt").value;
	var ID_card_txt = document.getElementById("ID_card_txt").value;
	var driver_card_txt = document.getElementById("driver_card_txt").value;
	var address_txt = document.getElementById("address_txt").value;
	var email_txt = document.getElementById("email_txt").value;
	if(re_name_txt =="" || re_pass_txt=="" || ID_card_txt=="" || driver_card_txt=="" || address_txt=="" || email_txt==""){
		alert("请将信息输入完整!");
		return false;
	}
	return true;
}