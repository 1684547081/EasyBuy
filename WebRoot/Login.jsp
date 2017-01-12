<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/select.js"></script>
<script type="text/javascript" src="js/lrscroll.js"></script>
<script type="text/javascript" src="js/iban.js"></script>
<script type="text/javascript" src="js/fban.js"></script>
<script type="text/javascript" src="js/f_ban.js"></script>
<script type="text/javascript" src="js/mban.js"></script>
<script type="text/javascript" src="js/bban.js"></script>
<script type="text/javascript" src="js/hban.js"></script>
<script type="text/javascript" src="js/tban.js"></script>
<script type="text/javascript" src="js/lrscroll_1.js"></script>
<script type="text/javascript">
	//更换验证码
	$(function() {
		$("#myid").click(function() {
			$.ajax({
				url : "/EasyBuy/AuthCodeServlet",
				type : "get",
				success : function(dom) {
					document.getElementById("authImg").src = "AuthCodeServlet";
				}
			});
		});	
	});
	$(function(){
	var erro=0;
		$(".l_user").focus(function() {
			$("#lid").html("请输入用户名");
				});
		$(".l_user").blur(function(){
			if($(this).val()==""){
				$("#lid").html("");
			}else if ($(this).val() != ""
							&& /^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test($(this).val())) {
						$("#lid").html("");
			} else {
				$("#lid").html("请输入正确的用户名(首字母为英文,5-15位)");
			}
		});
		
		$(".l_pwd").focus(function(){
			$("#pid").html("请输入密码");
		});
		$(".l_pwd").blur(function(){
			if($(this).val()==""){
			erro=1;
				$("#pid").html("");
			}else if ($(this).val() != ""
							&& /^[a-zA-Z]{1}([a-zA-Z]|[0-9]){4,15}$/.test($(this).val())) {
							erro=0;
						$("#pid").html("");
			} else {
				$("#pid").html("密码格式不正确(首字母为英文,5-15位)");
				erro=1;
			}
		});
	});
	
	
	function checks(myform) {
		if (myform.luser.value == "") {
			$("#lid").html("请输入用户名");
			return false;
		}else if (myform.lpwd.value =="") {
			$("#pid").html("请输入密码");
			return false;
		}
		return true;
	}
</script>

<title>尤洪</title>
</head>
<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<span class="fr"> <span class="fl">你好，请<a
					href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp"
					style="color:#ff4e00;">免费注册</a>&nbsp;
			</span> <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
					href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span> <span
				class="fr">|&nbsp;<a href="#">手机版&nbsp;<img
						src="images/s_tel.png" align="absmiddle" /></a></span>
			</span>
		</div>
	</div>
	<!--End Header End-->
	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<a href="Index.jsp"><img src="images/logo.png" /></a>
			</div>
		</div>
		<div class="login">
			<div class="log_img">
				<img src="images/l_img.png" width="611" height="425" />
			</div>
			<div class="log_c">
				<form action="user?title=login" method="post"
					onsubmit="return checks(this)" id="myform">
					<table border="0"
						style="width:370px; font-size:14px; margin-top:30px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="55">&nbsp;</td>
							<td><span class="fl" style="font-size:24px;">登录</span> <span
								class="fr">还没有商城账号，<a href="Regist.jsp"
									style="color:#ff4e00;">立即注册</a></span></td>
						</tr>
						<tr height="70">
							<td>用户名</td>
							<td><input type="text" value="" class="l_user" id="user" name="luser" /><font color="#ff4e00"><span
								id="lid"></span></font></td>
						</tr>
						<tr height="70">
							<td>密&nbsp; &nbsp; 码</td>
							<td><input type="password" value="" class="l_pwd"
								name="lpwd" id="first" /><font color="#ff4e00"><span id="pid"></span></font></td>
						</tr>
						<tr height="70">
							<td>验证码&nbsp; &nbsp;</td>
							<td><input type="text" value="" class="l_yzm" name="yzm" />
								<a href="#" style="font-size:12px; font-family:'宋体';" id="myid"><img
									src="${pageContext.request.contextPath }/AuthCodeServlet"
									id="authImg" />看不清</a><span id="msg"> <c:choose>
										<c:when test="${mm==null}">
											<script>
												$("#msg").html("");
											</script>
										</c:when>
										<c:otherwise>
											<script>
												$("#msg").html("验证码不一致");
											</script>
										</c:otherwise>
									</c:choose>

							</span></td>
						</tr>
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="登录" class="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<!--Begin Footer Begin-->
	<div class="btmbg">
		<div class="btm">
			备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018
			尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
			<img src="images/b_1.gif" width="98" height="33" /><img
				src="images/b_2.gif" width="98" height="33" /><img
				src="images/b_3.gif" width="98" height="33" /><img
				src="images/b_4.gif" width="98" height="33" /><img
				src="images/b_5.gif" width="98" height="33" /><img
				src="images/b_6.gif" width="98" height="33" />
		</div>
	</div>
	<!--End Footer End -->

</body>
</html>
