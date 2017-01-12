<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="ECSHOP v2.7.3" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<title>新手上路 _网店帮助分类_系统分类_朵购网-全民消费利润共享平台</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
</head>
<body>
	<div class="body_user ">
		<script type="text/javascript">
			var process_request = "正在处理您的请求...";
		</script>
		<script type="text/javascript">
			function AddFavorite(title, url) {
				try {
					window.external.addFavorite(url, title);
				} catch (e) {
					try {
						window.sidebar.addPanel(title, url, "");
					} catch (e) {
						alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
					}
				}
			}
		</script>
<style type="text/css">
.flowbox {
	position: fixed !important;
	_position: absolute;
	width: 460px;
	top: 50%;
	left: 50%;
	margin: -35px 0 0 -230px;
	z-index: 99999;
	height: 116px;
	border: 5px solid #999999;
	background: #ffffff;
}

.flowhide {
	display: none;
}

.flowbox a {
	color: #005EA7
}

</style>
		<div id='flowboxs' class='flowhide '>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2"
						style="background:#F3F3F3; border-bottom:solid 1px #CCCCCC; height:30px; font-weight:bold; font-size:14px; text-indent:10px;">提示</td>
				</tr>
				<tr>
					<td width="85" align="center" valign="middle"><img
						src="images/new_cart_left.gif"></td>
					<td align="left" valign="middle"
						style="text-indent:16px; line-height:200%">
						<p style="font-size:14px; font-weight:bold">已将 1 件商品添加到购物车</p>
						<p style="color:#990000">
							<a href="flow.php">去购物车结算>></a>&nbsp;&nbsp;<a href="JavaScript:;"
								onClick="close_flowbox();">继续购物</a>
						</p>
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript">
			function close_flowbox() {
				document.getElementById('flowboxs').className = 'flowhide';
			}
			function show_flowbox(result) {
				document.getElementById('flowboxs').className = 'flowbox';
				document.getElementById('i_car').innerHTML = result.content;
			}
			function delete_cart(id) {
				Ajax.call('flow.php?aaid=' + id, 'step=delete_cart', new_cart,
						'POST', 'JSON');
			}
			function new_cart(result) {
				document.getElementById('cartboxs').innerHTML = result.str;
				document.getElementById('cartsbox').style.display = '';
			}
			function boxshow(id) {
				document.getElementById(id).style.display = '';
			}
			function boxhide(id) {
				document.getElementById(id).style.display = 'none';
			}
		</script>
		<c:set var="url" scope="request" value="MyJsp.jsp"> </c:set>
  		<%@ include file="children/title.jsp" %>
		<script type="text/javascript">
			$('.nav').hover(function() {
				$(this).removeClass('nav_none');
			}, function() {
				$(this).addClass('nav_none');
			});
			$(document).ready(
					function() {
						$(".nav .leftNav li").hover(
								function() {
									var i = $(this).index();
									$(this).addClass("current-item").siblings()
											.removeClass("current-item");
									$(this).find(".zj").css({
										top : (-1) * i * 37
									});
								}, function() {
									$(this).removeClass("current-item");
								});
					});
		</script>
	</div>
	<div class="content ">
		<div class="contentBody ">
			<div class="block ">
				<div id="ur_here">
					<span>当前位置:</span> <a href=".">首页</a>
					<code>&gt;</code>
					<a href="article_cat.php?id=1">系统分类</a>
					<code>&gt;</code>
					<a href="article_cat.php?id=3">网店帮助分类</a>
					<code>&gt;</code>
					<a href="article_cat.php?id=5">新手上路 </a>
				</div>
				<div class="blank"></div>
				<div class="help_left bg_color">

					<div class="sideMenu" style="margin:0 auto ">
						<h2 class="on">
							<em></em><a href='article_cat.php?id=5' title="新手上路 ">新手上路 </a>
						</h2>
						<ul style="display:block">
							<li><a href="article.php?id=9" title="售后流程"> 售后流程</a></li>
							<li><a href="article.php?id=10" title="购物流程"> 购物流程</a></li>
							<li><a href="article.php?id=11" title="订购方式"> 订购方式</a></li>
							<li><a href="article.php?id=36" title="隐私声明"> 隐私声明</a></li>
							<li><a href="article.php?id=37" title="推荐分享说明"> 推荐分享说明</a></li>
						</ul>
						<h2 class=''>
							<em></em><a href='article_cat.php?id=7' title="配送与支付 ">配送与支付
							</a>
						</h2>
						<ul style="display:none">
							<li><a href="article.php?id=15" title="货到付款区域"> 货到付款区域</a></li>
							<li><a href="article.php?id=16" title="配送支付智能查询 ">
									配送支付智能查询</a></li>
							<li><a href="article.php?id=17" title="支付方式说明"> 支付方式说明</a></li>
						</ul>
						<h2 class=''>
							<em></em><a href='article_cat.php?id=10' title="会员中心">会员中心</a>
						</h2>
						<ul style="display:none">
							<li><a href="article.php?id=18" title="资金管理"> 资金管理</a></li>
							<li><a href="article.php?id=19" title="我的收藏"> 我的收藏</a></li>
							<li><a href="article.php?id=20" title="我的订单"> 我的订单</a></li>
						</ul>
						<h2 class=''>
							<em></em><a href='article_cat.php?id=8' title="服务保证 ">服务保证 </a>
						</h2>
						<ul style="display:none">
							<li><a href="article.php?id=21" title="退换货原则"> 退换货原则</a></li>
							<li><a href="article.php?id=22" title="售后服务保证 "> 售后服务保证</a></li>
							<li><a href="article.php?id=23" title="产品质量保证 "> 产品质量保证</a></li>
						</ul>
						<h2 class=''>
							<em></em><a href='article_cat.php?id=9' title="联系我们 ">联系我们 </a>
						</h2>
						<ul style="display:none">
							<li><a href="article.php?id=24" title="网站故障报告"> 网站故障报告</a></li>
							<li><a href="article.php?id=25" title="选机咨询 "> 选机咨询</a></li>
							<li><a href="article.php?id=26" title="投诉与建议 "> 投诉与建议</a></li>
						</ul>

					</div>
					<script type="text/javascript">
						jQuery(".sideMenu").slide({
							titCell : "h2", //鼠标触发对象
							targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
							effect : "slideDown", //targetCell下拉效果
							defaultIndex : 0,//默认是否执行效果（默认true）
							delayTime : 300,//鼠标从.sideMen移走后返回默认状态（默认false）
							trigger : "click"
						});
					</script>

				</div>
		<c:if test="${News!=null }">
  		<%@include file="children/news.jsp" %>
		</c:if>
		<c:if test="${page!=null }">
		<div class="help_right_out" >
  		<%@include file="children/NewsTable.jsp" %>
  		</div>
		</c:if>
		
	
	
				<div class="blank30"></div>
				<div class="pages">
				<c:if test="${page.pageIndex>1}">
				<a href="NewsServlet?pageindex=${page.pageIndex-1 }" class="p_pre">上一页</a><a href="NewsServlet?pageindex=1" class="p_pre">首页</a>
				</c:if>
				<c:if test="${page.pageCount<4 }">
				
				
				<c:forEach var="i" begin="1" end="${page.pageCount }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="NewsServlet?pageindex=${i }" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="NewsServlet?pageindex=${i }">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				
				</c:if>
				
				
				<c:if test="${page.pageCount>4&&page.pageIndex>1&&page.pageIndex<page.pageCount }">
				<c:forEach var="i" begin="${page.pageIndex-1 }" end="${page.pageIndex+1 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="NewsServlet?pageindex=${i }" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="NewsServlet?pageindex=${i }">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==page.pageCount}">
				<c:forEach var="i" begin="${page.pageIndex-2 }" end="${page.pageIndex }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="NewsServlet?pageindex=${i }" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="NewsServlet?pageindex=${i }">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				
				<c:if test="${page.pageCount>4&&page.pageIndex==1 }">
				<c:forEach var="i" begin="${page.pageIndex }" end="${page.pageIndex+2 }">
				
					<c:if test="${i==page.pageIndex}">
						 <a href="NewsServlet?pageindex=${i }" class="cur">${i }</a>
				 	</c:if>
				 
					 <c:if test="${i!=page.pageIndex}">
				 		<a href="NewsServlet?pageindex=${i }">${i }</a>
				 	</c:if>
				 
				</c:forEach>
				</c:if>
				<c:if test="${page.pageCount>4&&page.pageIndex<=page.pageCount-2 }">
				...<a href="NewsServlet?pageindex=${page.pageCount }">${page.pageCount }</a>
				</c:if>
				<c:if test="${page.pageIndex<page.pageCount}">
  				<a href="NewsServlet?pageindex=${page.pageIndex+1 }" class="p_pre">下一页</a><a href="NewsServlet?pageindex=${page.pageCount }" class="p_pre">末页</a>
  				</c:if>
     			</div>
				<div class="footer">
					<div class="b_btm_bg b_btm_c">
						<div class="b_btm">
							<table border="0"
								style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="72"><img src="images/b1.png" width="62"
										height="62" /></td>
									<td><h2>正品保障</h2>正品行货 放心购买</td>
								</tr>
							</table>
							<table border="0"
								style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="72"><img src="images/b2.png" width="62"
										height="62" /></td>
									<td><h2>满38包邮</h2>满38包邮 免运费</td>
								</tr>
							</table>
							<table border="0"
								style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="72"><img src="images/b3.png" width="62"
										height="62" /></td>
									<td><h2>天天低价</h2>天天低价 畅选无忧</td>
								</tr>
							</table>
							<table border="0"
								style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="72"><img src="images/b4.png" width="62"
										height="62" /></td>
									<td><h2>准时送达</h2>收货时间由你做主</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="b_nav">
						<dl>
							<dt>
								<a href="article_cat.php?id=5">新手上路 </a>
							</dt>
							<dd>
								<a href="article.php?id=9" title="售后流程">售后流程</a>
							</dd>
							<dd>
								<a href="article.php?id=10" title="购物流程">购物流程</a>
							</dd>
							<dd>
								<a href="article.php?id=11" title="订购方式">订购方式</a>
							</dd>
							<dd>
								<a href="article.php?id=36" title="隐私声明">隐私声明</a>
							</dd>
							<dd>
								<a href="article.php?id=37" title="推荐分享说明">推荐分享说明</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="article_cat.php?id=7">配送与支付 </a>
							</dt>
							<dd>
								<a href="article.php?id=15" title="货到付款区域">货到付款区域</a>
							</dd>
							<dd>
								<a href="article.php?id=16" title="配送支付智能查询 ">配送支付智能查询</a>
							</dd>
							<dd>
								<a href="article.php?id=17" title="支付方式说明">支付方式说明</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="article_cat.php?id=10">会员中心</a>
							</dt>
							<dd>
								<a href="article.php?id=18" title="资金管理">资金管理</a>
							</dd>
							<dd>
								<a href="article.php?id=19" title="我的收藏">我的收藏</a>
							</dd>
							<dd>
								<a href="article.php?id=20" title="我的订单">我的订单</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="article_cat.php?id=8">服务保证 </a>
							</dt>
							<dd>
								<a href="article.php?id=21" title="退换货原则">退换货原则</a>
							</dd>
							<dd>
								<a href="article.php?id=22" title="售后服务保证 ">售后服务保证</a>
							</dd>
							<dd>
								<a href="article.php?id=23" title="产品质量保证 ">产品质量保证</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="article_cat.php?id=9">联系我们 </a>
							</dt>
							<dd>
								<a href="article.php?id=24" title="网站故障报告">网站故障报告</a>
							</dd>
							<dd>
								<a href="article.php?id=25" title="选机咨询 ">选机咨询</a>
							</dd>
							<dd>
								<a href="article.php?id=26" title="投诉与建议 ">投诉与建议</a>
							</dd>
						</dl>

						<div class="b_tel_bg">
							<a href="#" class="b_sh1">新浪微博</a> <a href="#" class="b_sh2">腾讯微博</a>
							<p>
								服务热线：<br /> <span></span>
							</p>
						</div>
						<div class="b_er">
							<div class="b_er_c">
								<img src="images/er.gif" width="118" height="118" />
							</div>
							<img src="images/ss.png" />
						</div>
					</div>
					<div class="btmbg">
						<div class="btm">
							备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright ©
							2015-2018 朵购网 All Rights Reserved. 复制必究 , Technical Support: Dgg
							Group <br /> <a href="http://cn.unionpay.com"><img
								src="images/b_1.gif" width="98" height="33" /></a> <a
								href="http://alipay.com"><img src="images/b_2.gif"
								width="98" height="33" /></a> <a href="http://net.china.com.cn"><img
								src="images/b_3.gif" width="98" height="33" /></a> <a
								href="http://www.cyberpolice.cn"><img src="images/b_4.gif"
								width="98" height="33" /></a> <a href="http://t.knet.cn"><img
								src="images/b_5.gif" width="98" height="33" /></a> <a
								href="http://www.hd315.gov.cn"><img src="images/b_6.gif"
								width="98" height="33" /></a>
						</div>
					</div>
					<div class="blank"></div>
				</div>
</body>
<script type="text/javascript">
	document.getElementById('cur_url').value = window.location.href;
</script>
</html>
