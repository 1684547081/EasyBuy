<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
        
	<script type="text/javascript" src="js/select.js"></script>
	<c:if test="${erro!=null }">
	<script>
	alert("设定成功");
	</script>
	</c:if>
	<c:if test="${xg!=null }">
	<script>
	alert("修改成功");
	</script>
	
	</c:if>
	<c:if test="${delete!=null }">
	<script>
	alert("删除成功");
	</script>
	
	</c:if>
    <script>
    	$(function(){
    	$("#add").hide();
    		$("#addbutten").click(function(){
    		$("input[name='remark']").val("");
    			$("input[name='address']").val("");
    			$("#butten").text("确认添加");
    			$("#form1").attr("action","RessServlet?type=add");
    			$("#add").slideDown(500);
    			$(this).hide();
    		});
    
    		$("#qx").click(function(){
    		$("input[name='remark']").val("");
    			$("input[name='address']").val("");
    			$("#add").slideUp(500);
    			$("#addbutten").show();
    		});
    		$("#bj").click(function(){
    			$("#butten").text("确认修改");
    			$("input[name='remark']").val($("#remark").text());
    			$("input[name='address']").val($("#address").text());
    			$("#form1").attr("action","RessServlet?type=xg&id="+$(this).attr("val"));
    			$("#add").slideDown(500);
    		});
    		$("#butten").click(function(){
    			 $("#form1").submit() ;
    		});
    	});
    </script>
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<c:set var="url" scope="request" value="Member_Address.jsp"> </c:set>
<%@ include file="children/title.jsp" %>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		 <%@ include file="children/Mleft.jsp" %>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">收货地址</div>
				<c:forEach var="item" items="${page.pageList}">
				<div class="address">
				<div class="a_close"><a href="RessServlet?type=delete&id=${item.id }"><img src="images/a_close.png" /></a></div>
				<table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2" style="font-size:14px; color:#ff4e00;" id="remark">${item.remark }</td>
                  </tr>
                  <tr>
                    <td align="right" width="80">收货人姓名：</td>
                    <td>${item.user.userName}</td>
                  </tr>
                  <tr>
                    <td align="right">详细地址：</td>
                    <td id="address">${item.address }</td>
                  </tr>
           
                  <tr>
                    <td align="right">手机：</td>
                    <td>${item.user.mobile }</td>
                  </tr>
       
                  <tr>
                    <td align="right">电子邮箱：</td>
                    <td>${item.user.email }</td>
                  </tr>
                </table>
                <p align="right">
                	<a href="RessServlet?type=moren&id=${item.id }" style="color:#ff4e00;">设为默认</a>&nbsp; &nbsp; &nbsp; &nbsp; <a href="#" id="bj" val="${item.id }" style="color:#ff4e00;">编辑</a>&nbsp; &nbsp; &nbsp; &nbsp; 
                </p>
                  </div>
                   </c:forEach> 
              
          

            <div class="mem_tit">
            	<a href="#"><img id="addbutten" src="images/add_ad.gif" /></a>
            </div>
            <div id="add">
            <form  id="form1" action="RessServlet?type=add" method="post" >
            <table border="0" class="add_tab" style="width:930px;"  cellspacing="0" cellpadding="0">
              <tr>
                <td align="right">地址标题</td>
                <td style="font-family:'宋体';"><input type="text" name="remark" value="" class="add_ipt" />（必填）</td>
                 <td align="right">详细地址</td>
                <td style="font-family:'宋体';"><input type="text" name="address" value="" class="add_ipt" />（必填）</td>
                
              </tr>
              <tr>
               <td align="right">收货人姓名</td>
                <td style="font-family:'宋体';"><input type="text" value="${user.userName }" readonly="readonly" class="add_ipt" />（必填）</td>
               <td align="right">手机</td>
                <td style="font-family:'宋体';"><input type="text"  value="${user.mobile }" readonly="readonly" class="add_ipt" />（必填）</td>
               
              </tr>
              <tr>
                  <td align="right">电子邮箱</td>
                <td style="font-family:'宋体';"><input type="text" readonly="readonly" value="${user.email }" class="add_ipt" />（必填）</td>
              </tr>
            </table> 
            </form>  
           	<p align="right">
            	<a href="#" id="qx">取消</a>&nbsp; &nbsp; <a href="#" class="add_b" id="butten">确认修改</a>
            </p> 
            </div>
              <div class="pages">
              
               <c:if test="${page.pageIndex>1}">
				<a href="RessServlet?pageindex=1&type=cx${pid}" class="p_pre">首页</a><a href="RessServlet?pageindex=${page.pageIndex-1 }&type=cx${pid}" class="p_pre">上一页</a>
				</c:if>
				<c:if test="${page.pageCount<=4 }">
				<c:forEach var="i" begin="1" end="${page.pageCount }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="RessServlet?pageindex=${i }&type=cx${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="RessServlet?pageindex=${i }&type=cx${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				
				</c:if>
				
				
				<c:if test="${page.pageCount>4&&page.pageIndex>1&&page.pageIndex<page.pageCount }">
				<c:forEach var="i" begin="${page.pageIndex-1 }" end="${page.pageIndex+1 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="RessServlet?pageindex=${i }&type=cx${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="RessServlet?pageindex=${i }&type=cx${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==page.pageCount}">
				<c:forEach var="i" begin="${page.pageIndex-2 }" end="${page.pageIndex }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="RessServlet?pageindex=${i }&type=cx${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="RessServlet?pageindex=${i }&type=cx${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==1 }">
				<c:forEach var="i" begin="${page.pageIndex }" end="${page.pageIndex+2 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="RessServlet?pageindex=${i }&type=cx${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="RessServlet?pageindex=${i }&type=cx${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				<c:if test="${page.pageCount>4&&page.pageIndex<=page.pageCount-2 }">
				...<a href="RessServlet?pageindex=${page.pageCount }&type=cx${pid}">${page.pageCount }</a>
				</c:if>
				<c:if test="${page.pageIndex<page.pageCount}">
  				<a href="RessServlet?pageindex=${page.pageIndex+1 }&type=cx${pid}" class="p_pre">下一页</a><a href="RessServlet?pageindex=${page.pageCount }&type=cx${pid}" class="p_pre">末页</a>
  				</c:if>
                </div>
           

            
        </div>
    </div>
	<!--End 用户中心 End--> 
	          
                
    <!--Begin Footer Begin -->
    <div class="b_btm_bg b_btm_c">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
    	<dl>                                                                                            
        	<dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
        	<a href="#" class="b_sh1">新浪微博</a>            
        	<a href="#" class="b_sh2">腾讯微博</a>
            <p>
            服务热线：<br />
            <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="images/er.gif" width="118" height="118" /></div>
            <img src="images/ss.png" />
        </div>
    </div>    
    <div class="btmbg">
		<div class="btm">
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
