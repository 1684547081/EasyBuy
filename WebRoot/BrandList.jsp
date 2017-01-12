<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
	<script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
            
	<script type="text/javascript" src="js/lrscroll_1.js"></script>
    <script type="text/javascript" src="js/shade.js"></script>
    
	<script type="text/javascript" src="js/n_nav.js"></script>    
    <script type="text/javascript" src="js/milk_ban.js"></script>
    <script type="text/javascript" src="js/paper_ban.js"></script>
    <script type="text/javascript" src="js/baby_ban.js"></script>
    <script>
    	$(function(){
			$(".b_buy").click(function(){
				history.go(0);
    		});
    		$('.nav').addClass('nav_none');
    		$(".mya").click(function(){
    			 <c:if test="${user==null}">
    			 	 location.href="Login.jsp?tz=1";
    			 </c:if>
    			$.ajax({
        			url:"/EasyBuy/ProductServlet?id="+$(this).attr("val")+"&type=gwc",
        			type:"get",
        			dataType: "json",
        			success:function(data){
        			var li="";
        			var count=0;
        			var count1=0;
        			var price1=0;
        			$.each(data,function(i,item){
        				count++;
        			 	if(i==0){
        			 	$("#div").html("<div class='price_sum'>共计&nbsp; <font color='#ff4e00'>￥</font><span id='zj'>${pprice }</span></div><div class='price_a'><a href='#'>去购物车结算</a></div>");
        				$("#gw").text(item.count1);
    			 		$("#zj").text(item.price1);
    			 		count1=item.count1;
    			 		price1=item.price1;
    			 		
        			 	}
    			 		li+="<li><div class='img'><a href='ProductServlet?id="+${item.id }"+&type=xq'><img  src=images/"+item.fileName+" } width='58' height='58' /></a></div><div class='name'><a href='#'>"+item.name+"</a></div><div class='price'><font color='#ff4e00'>"+item.price+"</font> X"+item.count+"</div></li>   ";
        			});
        			$("#gwc").html("购物车共有"+count+"种宝贝（"+count1+"件） &nbsp; &nbsp; 合计："+price1+"元");
        			$("#ul").html(li);
        			ShowDiv('MyDiv1','fade1');
        			}
        				
        		});
 
    		});
    		
    	});
    </script>
   
<title>尤洪</title>
</head>
<body>  
<c:set var="url" scope="request" value="BrandList.jsp"> </c:set>
                <c:if test="${oneid!=null }">
				<c:set var="pid"  value="&oneid=${oneid }"></c:set>
				</c:if>
				<c:if test="${twoid!=null }">
				<c:set var="pid"  value="&twoid=${twoid }"></c:set>
				</c:if>
				<c:if test="${threeid!=null }">
				<c:set var="pid" value="&threeid=${threeid }"></c:set>
				</c:if>
				<c:if test="${ss!=null }">
				<c:set var="pid" value="&keywords=${ss }"></c:set>
				</c:if>

  <%@ include file="children/title.jsp" %>
<div class="i_bg">
    <div class="content mar_20">
    
  <%@ include file="children/left.jsp" %>
        <div class="l_list">
        	<table border="0" style="width:100%; margin-bottom:30px; border:1px solid #eaeaea;" cellspacing="0" cellpadding="0">
              <tr valign="top">
                <td width="248"><div class="brand_img"><img src="images/brand5.jpg" width="226" height="108" /></div></td>
                <td class="td_b" style="padding:15px 40px;">
                	所有分类<br />
                    <a href="#" class="now">香水（10）</a><a href="#">彩妆套装（2）</a><a href="#">洁面（1）</a><a href="#">精华（1）</a><a href="#">化妆水（2）</a><a href="#">嫩肤（3）</a>
                </td>
              </tr>
            </table>
        	<div class="list_t">
            	<span class="fl list_or">
                	<a href="#" class="now">默认</a>
                    <a href="#">
                    	<span class="fl">销量</span>                        
                        <span class="i_up">销量从低到高显示</span>
                        <span class="i_down">销量从高到低显示</span>                                                     
                    </a>
                    <a href="#">
                    	<span class="fl">价格</span>                        
                        <span class="i_up">价格从低到高显示</span>
                        <span class="i_down">价格从高到低显示</span>     
                    </a>
                    <a href="#">新品</a>
                </span>
                <span class="fr">共发现${count}件</span>
            </div>
            <div class="list_c">
            	
                <ul class="cate_list">
                   <c:forEach var="item" items="${page.pageList}">
                   	<li>
                    	<div class="img"><a href="ProductServlet?id=${item.id }&type=xq"><img src="images/${item.fileName }" width="210" height="185" /></a></div>
                        <div class="price">
                        ${item.id }
                            <font>￥<span>${item.price }</span></font> &nbsp; 26R
                        </div>
                        <div class="name"><a href="#">${item.name }</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">收藏</a>
                            <a href="#" class="j_car mya"  val="${item.id }">加入购物车</a>
                        </div>
                    </li>
                   </c:forEach>   
                   
                </ul>
                <div class="pages">
               <c:if test="${page.pageIndex>1}">
				<a href="ProductServlet?pageindex=1&type=fl${pid}" class="p_pre">首页</a><a href="ProductServlet?pageindex=${page.pageIndex-1 }&type=fl${pid}" class="p_pre">上一页</a>
				</c:if>
				<c:if test="${page.pageCount<4 }">
				
				
				<c:forEach var="i" begin="1" end="${page.pageCount }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="ProductServlet?pageindex=${i }&type=fl${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="ProductServlet?pageindex=${i }&type=fl${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				
				</c:if>
				
				
				<c:if test="${page.pageCount>4&&page.pageIndex>1&&page.pageIndex<page.pageCount }">
				<c:forEach var="i" begin="${page.pageIndex-1 }" end="${page.pageIndex+1 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="ProductServlet?pageindex=${i }&type=fl${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="ProductServlet?pageindex=${i }&type=fl${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==page.pageCount}">
				<c:forEach var="i" begin="${page.pageIndex-2 }" end="${page.pageIndex }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="ProductServlet?pageindex=${i }&type=fl${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="ProductServlet?pageindex=${i }&type=fl${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==1 }">
				<c:forEach var="i" begin="${page.pageIndex }" end="${page.pageIndex+2 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="ProductServlet?pageindex=${i }&type=fl${pid}" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="ProductServlet?pageindex=${i }&type=fl${pid}">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				<c:if test="${page.pageCount>4&&page.pageIndex<=page.pageCount-2 }">
				...<a href="ProductServlet?pageindex=${page.pageCount }&type=fl${pid}">${page.pageCount }</a>
				</c:if>
				<c:if test="${page.pageIndex<page.pageCount}">
  				<a href="ProductServlet?pageindex=${page.pageIndex+1 }&type=fl${pid}" class="p_pre">下一页</a><a href="ProductServlet?pageindex=${page.pageCount }&type=fl${pid}" class="p_pre">末页</a>
  				</c:if>
                </div>
                
                
                
            </div>
        </div>
    </div>      
    
    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                    	<a href="#">查看我的关注 >></a>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="#" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    
    
    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">宝贝已成功添加到购物车</span><br />
                    	<span id="gwc">购物车共有1种宝贝（3件） &nbsp; &nbsp; 合计：1120元</span>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="BuyCar.jsp" class="b_sure">去购物车结算</a><a href="#" class="b_buy">继续购物</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-加入购物车 End-->
      
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
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
