<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<script type="text/javascript" src="js/form.js"></script>
    <script>  
    $(function(){
    	$("#myid").click(function(){
    		$.ajax({
    			url:"/EasyBuy/AuthCodeServlet",
    			type:"get",
    			success:function(){
    				document.getElementById("authImg").src ="AuthCodeServlet";
    			}
    		});
    	});
    	
    	$(".l_user").blur(function(){
    		$.ajax({
    			type:"get",
    			url:"<%=path%>/LoginServlet?login="+$(".l_user").val(),
    			success:function(dom){
    				if(dom){
    					$("#uid").html("用户名已被注册，请重新命名");	
    				}
    					
    			}
    		});
    	});
	
    });  	 
</script>  

<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="Index.jsp"><img src="images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="images/l_img.png" width="611" height="500" /></div>
		<div class="reg_c" style="height: 783px; width: 513px; ">
        	<form action="user?title=regist" method="post" enctype="multipart/form-data" id="myform" onsubmit="return checks(this)" style="height: 726px; width: 536px; ">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有商城账号，<a href="Login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;登录用户名 &nbsp;</td>
                <td><input type="text" value="" class="l_user" id="user" name="luser"/><font color="#ff4e00"><span id="uid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" value="" class="l_pwd" name="lpwd" id="first"/><font color="#ff4e00"><span id="pid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" value="" class="l_pwd" name="lpwds" id="second"/><font color="#ff4e00"><span id="psid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;真实姓名 &nbsp;</td>
                <td><input type="text" value="" class="l_name" id="uname" name="lname"/><font color="#ff4e00"><span id="nid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;性别&nbsp;</td>
                <td>&nbsp;&nbsp;<input class="l_gender" type="radio" value="man" name="sex"/>男&nbsp;&nbsp;<input class="l_gender" type="radio" value="woman" name="sex"/>女<span id="sid"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;身份证号 &nbsp;</td>
                <td><input type="text" value="" class="l_identitycode" name="lidentity"/><font color="#ff4e00"><span id="did"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" value="" class="l_email" name="lemail"/><font color="#ff4e00"><span id="eid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                <td><input type="text" value="" class="l_tel" name="ltel"/><font color="#ff4e00"><span id="tid"></span></font></td>
              </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input type="text" value="" class="l_ipt" name="yzm" />
                    <a href="#" style="font-size:12px; font-family:'宋体';" id="myid"><img src="${pageContext.request.contextPath }/AuthCodeServlet" id="authImg"/>看不清</a><span id="msg">
                    <c:choose>
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
                    </span>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" name="checkbox"/></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    	<span id="mycks"></span>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="立即注册" class="log_btn" /></td>
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
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
