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
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
            
	<script type="text/javascript" src="js/lrscroll_1.js"></script>   
     
    
	<script type="text/javascript" src="js/n_nav.js"></script>
    
    <link rel="stylesheet" type="text/css" href="css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="css/MagicZoom.css" />
    <script type="text/javascript" src="js/MagicZoom.js"></script>
    
    <script type="text/javascript" src="js/num.js">
    	var jq = jQuery.noConflict();
    </script>
        
    <script type="text/javascript" src="js/p_tab.js"></script>
    
    <script type="text/javascript" src="js/shade.js"></script>
    <script>
    	$(function(){
    		$(".mya").click(function(){
    		 <c:if test="${user==null}">
    			 	 location.href="Login.jsp?tz=1";
    			 </c:if>
    			$.ajax({
        			url:"/EasyBuy/ProductServlet?id="+${product.id }+"&type=gwc&pcount="+$("#myinput").val(),
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
<!--Begin Header Begin-->

<c:set var="url" scope="request" value="Product.jsp"> </c:set>
<%@ include file="children/title.jsp" %>
<!--End Menu End--> 
<div class="i_bg">
   
    <div class="content">
    	    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="images/${product.fileName }" title="Images" class="MagicZoom" id="MagicZoom"><img src="images/${product.fileName }" width="390" height="390" /></a></div>
            <img class="MagicZoomLoading" width="16" height="16" src="images/loading.gif" alt="Loading..." />				
        </div>
        
        <div class="pro_des">
        	<div class="des_name">
            	<p>${product.name }</p>
                “开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！
            </div>
            <div class="des_price">
            	本店价格：<b>${product.price }</b><br />
                消费积分：<span>28R</span>
            </div>
            <div class="des_choice">
            	<span class="fl">型号选择：</span>
                <ul>
                	<li class="checked">30ml<div class="ch_img"></div></li>
                    <li>50ml<div class="ch_img"></div></li>
                    <li>100ml<div class="ch_img"></div></li>
                </ul>
            </div>
            <div class="des_choice">
            	<span class="fl">颜色选择：</span>
                <ul>
                	<li>红色<div class="ch_img"></div></li>
                    <li class="checked">白色<div class="ch_img"></div></li>
                    <li>黑色<div class="ch_img"></div></li>
                </ul>
            </div>
            <div class="des_share">
            	<div class="d_sh">
                	分享
                    <div class="d_sh_bg">
                    	<a href="#"><img src="images/sh_1.gif" /></a>
                        <a href="#"><img src="images/sh_2.gif" /></a>
                        <a href="#"><img src="images/sh_3.gif" /></a>
                        <a href="#"><img src="images/sh_4.gif" /></a>
                        <a href="#"><img src="images/sh_5.gif" /></a>
                    </div>
                </div>
                <div class="d_care"><a onclick="ShowDiv('MyDiv','fade')">关注商品</a></div>
            </div>
            <div class="des_join">
            	<div class="j_nums">
                	<input type="text" value="1" name="" id="myinput" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />   
                </div>
                <span class="fl mya"><a  href="#"><img src="images/j_car.png" /></a></span>
            </div>            
        </div>    
        
        <div class="s_brand">
        	<div class="s_brand_img"><img src="images/sbrand.jpg" width="188" height="132" /></div>
            <div class="s_brand_c"><a href="#">进入品牌专区</a></div>
        </div>    
        
        
    </div>
    <div class="content mar_20">
  <%@ include file="children/left.jsp" %>
        <div class="l_list">        	
            <div class="des_border">
            	<div class="des_tit">
                	<ul>
                    	<li class="current">推荐搭配</li>
                    </ul>
                </div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_1.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">倩碧补水组合套装8折促销</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_2.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_3.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/equl.gif" /></div>
                <div class="team_sum">
                	套餐价：￥<span>1517</span><br />
                    <input type="text" value="1" class="sum_ipt" /><br />
                    <a href="#"><img src="images/z_buy.gif" /></a> 
                </div>
                
            </div>
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                        <li><a href="#p_comment">商品评论</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>商品名称：迪奥香水</td>
                        <td>商品编号：1546211</td>
                        <td>品牌： 迪奥（Dior）</td>
                        <td>上架时间：2015-09-06 09:19:09 </td>
                      </tr>
                      <tr>
                        <td>商品毛重：160.00g</td>
                        <td>商品产地：法国</td>
                        <td>香调：果香调香型：淡香水/香露EDT</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>容量：1ml-15ml </td>
                        <td>类型：女士香水，Q版香水，组合套装</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
            
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                	<table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="265"><img src="images/de1.jpg" width="206" height="412" /></td>
                        <td>
                        	<b>迪奥真我香水(Q版)</b><br />
                            【商品规格】：5ml<br />
                            【商品质地】：液体<br />
                            【商品日期】：与专柜同步更新<br />
                            【商品产地】：法国<br />
                            【商品包装】：无外盒 无塑封<br />
                            【商品香调】：花束花香调<br />
                            【适用人群】：适合女性（都市白领，性感，有女人味的成熟女性）<br />
                        </td>
                      </tr>
                    </table>
                    
                    <p align="center">
                    <img src="images/de2.jpg" width="746" height="425" /><br /><br />
                    <img src="images/de3.jpg" width="750" height="417" /><br /><br />
                    <img src="images/de4.jpg" width="750" height="409" /><br /><br />
                    <img src="images/de5.jpg" width="750" height="409" />
					</p>
                    
                </div>
          	</div>  
            
            <div class="des_border" id="p_comment">
            	<div class="des_t">商品评论</div>
                
                <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="175" class="jud_per">
                    	<p>80.0%</p>好评度
                    </td>
                    <td width="300">
                    	<table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="90">好评<font color="#999999">（80%）</font></td>
                            <td><img src="images/pl.gif" align="absmiddle" /></td>
                          </tr>
                          <tr>
                            <td>中评<font color="#999999">（20%）</font></td>
                            <td><img src="images/pl.gif" align="absmiddle" /></td>
                          </tr>
                          <tr>
                            <td>差评<font color="#999999">（0%）</font></td>
                            <td><img src="images/pl.gif" align="absmiddle" /></td>
                          </tr>
                        </table>
                    </td>
                    <td width="185" class="jud_bg">
                    	购买过雅诗兰黛第六代特润精华露50ml的顾客，在收到商品才可以对该商品发表评论
                    </td>
                    <td class="jud_bg">您可对已购买商品进行评价<br /><a href="#"><img src="images/btn_jud.gif" /></a></td>
                  </tr>
                </table>
                
                
                				
                <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="160"><img src="images/peo1.jpg" width="20" height="20" align="absmiddle" />&nbsp;向死而生</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	产品很好，香味很喜欢，必须给赞。 <br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo2.jpg" width="20" height="20" align="absmiddle" />&nbsp;就是这么想的</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	送朋友，她很喜欢，大爱。 <br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo3.jpg" width="20" height="20" align="absmiddle" />&nbsp;墨镜墨镜</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	大家都说不错<br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo4.jpg" width="20" height="20" align="absmiddle" />&nbsp;那*****洋 <br /><font color="#999999">（匿名用户）</font></td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	下次还会来买，推荐。<br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                </table>

                	
                    
                <div class="pages">
                    <a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
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

<script src="js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>