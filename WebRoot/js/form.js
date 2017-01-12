function checks(myform) {
	if (myform.luser.value == "") {
		$("#uid").html("请输入用户名(首字母为英文,5-15位)").css("color","red");
		return false;
	} else if (!/^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test(myform.luser.value)) {
		$("#uid").html("用户名格式不对");
		return false;
	} else if (myform.lpwd.value == "") {
		$("#pid").html("请输入密码(首字母为英文,5-15位)");
		return false;
	} else if (!/^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test(myform.lpwd.value)) {
		$("#pid").html("密码格式不正确");
		return false;
	} 
	 else if (!/^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test(myform.pwd.value)) {
			$("#ppid").html("密码格式不正确");
			return false;
		} else if (myform.lpwds.value == "") {
		$("#psid").html("请再次输入密码");
		return false;
	} else if (myform.lpwd.value != myform.lpwds.value) {
		$("#psid").html("两次输入的密码不一致");
		return false;
	} else if (myform.lname.value == "") {
		$("#nid").html("请输入姓名");
		return false;
	} else if (!/^[\u4E00-\u9FFF]+$/.test(myform.lname.value)) {
		$("#nid").html("请输入汉字");
		return false;
	} else if (myform.sex.value == "") {
		$("#sid").html("请选择性别");
		return false;
	} else if (myform.lidentity.value == "") {
		$("#did").html("请输入身份证号");
		return false;
	} else if (!/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}(x|\d|X)$/
			.test(myform.lidentity.value)) {
		$("#did").html("身份证号输入错误");
		return false;
	} else if (myform.lemail.value == "") {
		$("#eid").html("请输入邮箱");
		return false;
	} else if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/
			.test(myform.lemail.value)) {
		$("#eid").html("邮箱格式输入错误");
		return false;
	} else if (myform.ltel.value == "") {
		$("#tid").html("请输入手机号");
		return false;
	} else if (!/^[0-9]{11}$/.test(myform.ltel.value)) {
		$("#tid").html("手机号位数不符");
		return false;
	} else if (!/^[0-9]{11}$/.test(myform.ltel1.value)) {
		$("#tid1").html("手机号位数不符");
		return false;
	} else if (myform.yzm.value == "") {
		alert("请输入验证码");
		return false;
	}else if(!document.getElementsByName("checkbox")[0].checked){
		$("#mycks").html("请仔细阅读协议");
		return false;
	}
	return true;
};

function checkChinese(str) {
	for (var i = 0; i < str < length; i++) {
		if (str.charCodeAt(i) > 255) {
			return true;
		} else {
			return false;
		}
	}
}

$(function() {
	$(".l_name").focus(function() {
		$("#nid").html("请输入姓名");	
	});
	
	$(".l_name").blur(function(){
		if($(this).val()==""){
			$(this).parent().prev().children().attr("color", "red");
			$("#nid").html("");
		}else if ($(this).val() != ""&&/^[\u4E00-\u9FFF]+$/.test($(this).val())) {
			$(this).parent().prev().children().attr("color", "green");
			$("#nid").html("");
		} else {
			$(this).parent().prev().children().attr("color", "red");
			$("#nid").html("请输入汉字");
		}
	});
	
	
	
	$(".l_user").focus(function() {
			$("#uid").html("请输入用户名(首字母为英文,5-15位)");	
    });
	
	$(".l_user").blur(function(){
			if($(this).val()==""){
				$(this).parent().prev().children().attr("color", "red");
				$("#uid").html("");
			}else if ($(this).val() != ""
					&& /^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test($(this)
							.val())) {
				$(this).parent().prev().children().attr("color", "green");
				$("#uid").html("");
			} else {
				$(this).parent().prev().children().attr("color", "red");
				$("#uid").html("用户名格式不符");
			}
	});
	
	
	
	$(".l_pwd#first").focus(function() {
			$("#pid").html("请输入密码(首字母为英文,5-15位)");
			});
    $(".l_pwd#first").blur(function(){
    		if($(this).val()==""){
    			$(this).parent().prev().children().attr("color", "red");
    			$("#pid").html("");
    		}else if ($(this).val() != $(".l_pwd#second").val()) {
				$(".l_pwd#second").parent().prev().children().attr("color",
						"red");
				
			} else {
				$(".l_pwd#second").parent().prev().children().attr("color",
						"green");
				$("#psid").html("");
			}
    		if($(this).val()==""){
    			$(this).parent().prev().children().attr("color", "red");
    			$("#pid").html("");
    		}else if ($(this).val() != ""
					&& /^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test($(this)
							.val())) {
				$(this).parent().prev().children().attr("color", "green");
				$("#pid").html("");
			} else {
				$(this).parent().prev().children().attr("color", "red");
				$("#pid").html("密码格式不符");
			}
    });
    
    
    
    
	$(".l_pwd#second").focus(function() {
		$("#psid").html("请再次输入密码");
	});
	$(".l_pwd#second").blur(function(){
		if($(this).val()==""){
			$(this).parent().prev().children().attr("color", "red");
			$("#psid").html("");
		}else if ($(this).val() != "" && $(this).val() == $(".l_pwd#first").val()) {
			$(this).parent().prev().children().attr("color", "green");
			$("#psid").html("");
		} else {
			$(this).parent().prev().children().attr("color", "red");
			$("#psid").html("请再次输入密码");
			$("#psid").html("两次输入的密码不一致");
		}
	});
	
	
	
	
	
	$(".l_email").focus(function() {
			$("#eid").html("请输入邮箱");
			
			});
	$(".l_email").blur(function(){

			if($(this).val()==""){
				$(this).parent().prev().children().attr("color", "red");
				$("#eid").html("");
			}else if ($(this).val() != ""
					&& /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test($(this)
							.val())) {
				$(this).parent().prev().children().attr("color", "green");
				$("#eid").html("");
			} else {
				$(this).parent().prev().children().attr("color", "red");
				$("#eid").html("邮箱格式不符");
			}
	});
	
	
	
	
	
	
	
	$(".l_tel").focus(function() {
		$("#tid").html("请输入手机号");
	});
	$(".l_tel").blur(function(){
		if($(this).val()==""){
			$(this).parent().prev().children().attr("color", "red");
			$("#tid").html("");
		}else if ($(this).val() != "" && /^[0-9]{11}$/.test($(this).val())) {
			$(this).parent().prev().children().attr("color", "green");
			$("#tid").html("");
		} else {
			$(this).parent().prev().children().attr("color", "red");
			$("#tid").html("手机号位数不符");
		}
	});
	
	
	
	
	$(".l_identitycode").focus(function() {
		$("#did").html("请输入身份证号");
		
					});
	$(".l_identitycode").blur(function(){
		if($(this).val()==""){
			$(this).parent().prev().children().attr("color","red");
			$("#did").html("");
		}else if ($(this).val() != ""&& /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}(x|\d|X)$/
						.test($(this).val())) {
			$(this).parent().prev().children().attr("color","green");
			$("#did").html("");
		} else {
			$(this).parent().prev().children().attr("color","red");
			$("#did").html("身份证号格式不符");
		}
	});
	
	
	
	$(".l_gender").keyup(function() {
		if ($(this).val() != "") {
			$(this).parent().prev().children().attr("color", "green");
		} else {
			$(this).parent().prev().children().attr("color", "red");
		}
	});
});
