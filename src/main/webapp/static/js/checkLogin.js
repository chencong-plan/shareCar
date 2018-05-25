/**
 * 检测验证登录页面是否符合基本规范
 */
    function checkLogin(){
    	var usertxt = document.getElementById("uname").value;
    	
    	var passtxt = document.getElementById("upass").value;
    	var codetxt = document.getElementById("code").value;
    	var role = document.getElementById("role").value;
    	/*if(role!=1&&role!=2){
    		alert("请选择登录身份！");
    		return false;
    	}else */
    	if(usertxt==""||usertxt==null){
    		alert("账号不能为空！");
    		return false;
    	}
    	else if(passtxt==""||passtxt==null){
    		alert("密码不能为空！");
    		return false;
    	}else if(codetxt==""||codetxt==null){
    		alert("请输入验证码！");
    		return false;
    	}else{
    		return true;
    	}
    	
    }