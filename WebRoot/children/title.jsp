
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${map==null }">
<jsp:forward page="Product_categoryServlet"></jsp:forward>
</c:if>			
<div class="soubg">
	<div class="sou">
    	
    	<span class="s_city_b">
        	<span class="fl" onclick="AddFavorite('朵购网-全民消费利润共享平台', window.location.href);" style="cursor:pointer;">加入收藏</span>
        </span>
    	<span class="s_city_b" style="display:none;">
        	<span class="fl">送货至：</span>
            <span class="s_city">
            	<span>四川</span>
                <div class="s_city_bg">
                	<div class="s_city_t"></div>
                    <div class="s_city_c">
                    	<h2>请选择所在的收货地区</h2>
                        <table border="0" class="c_tab" style=" margin-top: 10px;width: 252px;padding: 0 10px;" cellspacing="0" cellpadding="0">
                          <tr>
                            <th>A</th>
                            <td class="c_h"><span>安徽</span><span>澳门</span></td>
                          </tr>
                          <tr>
                            <th>B</th>
                            <td class="c_h"><span>北京</span></td>
                          </tr>
                          <tr>
                            <th>C</th>
                            <td class="c_h"><span>重庆</span></td>
                          </tr>
                          <tr>
                            <th>F</th>
                            <td class="c_h"><span>福建</span></td>
                          </tr>
                          <tr>
                            <th>G</th>
                            <td class="c_h"><span>广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
                          </tr>
                          <tr>
                            <th>H</th>
                            <td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
                          </tr>
                          <tr>
                            <th>J</th>
                            <td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
                          </tr>
                          <tr>
                            <th>L</th>
                            <td class="c_h"><span>辽宁</span></td>
                          </tr>
                          <tr>
                            <th>N</th>
                            <td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
                          </tr>
                          <tr>
                            <th>Q</th>
                            <td class="c_h"><span>青海</span></td>
                          </tr>
                          <tr>
                            <th>S</th>
                            <td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span class="c_check">四川</span><span>陕西</span></td>
                          </tr>
                          <tr>
                            <th>T</th>
                            <td class="c_h"><span>台湾</span><span>天津</span></td>
                          </tr>
                          <tr>
                            <th>X</th>
                            <td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
                          </tr>
                          <tr>
                            <th>Y</th>
                            <td class="c_h"><span>云南</span></td>
                          </tr>
                          <tr>
                            <th>Z</th>
                            <td class="c_h"><span>浙江</span></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </span>
        </span>
        
        <span class="fr">
        	<span class="fl" id="ECS_MEMBERZONE">
        		<div id="append_parent"></div>
        		<c:if test="${user!=null }">
        			你好，欢迎您:<a href="user?title=user">${user.userName }</a>&nbsp; 
&nbsp;|&nbsp;<a href="OrderServlet?type=cx">我的订单</a>&nbsp;|<a href="user?title=zx">注销</a>      			
        		</c:if>
        		<c:if test="${user==null }">
 你好，请<a href="Login.jsp">登录</a>&nbsp; 
<a href="Regist.jsp" style="color:#ff4e00;display: inline-block;">免费注册</a>
				</c:if>
        		        	</span>
        	<span class="ss">
            	<div class="ss_list">
                	<a >收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<div class='no_text'>暂无收藏商品！</div>                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a >客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a title="售后流程" href="article.php?id=9">售后流程</a></li>
                                <li><a title="订购方式" href="article.php?id=11">订购方式</a></li>
                                <li><a title="隐私声明" href="article.php?id=36">隐私声明</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
                <div class="ss_list">
                	<a >网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a target="_blank" href="category.php?id=434">精品女装</a></li>
                                <li><a href="category.php?id=602">生活电器</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a class="sh1">新浪</a><a class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a >手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="Index.jsp"><img src="images/logo.png" /></a></div>
    <div class="search">
    	<form id="searchForm" name="searchForm" method="post" action="ProductServlet?type=fl" onSubmit="return checkSearchForm()"  >
        	<input type="text" value="" class="s_ipt" name="keywords" id="keyword" />
            <input type="submit" value="搜索" class="s_btn" />
        </form>                      
        <span class="fl">
        	 
									<a href="search.php?keywords=%E5%92%96%E5%95%A1">咖啡</a>
														<a href="search.php?keywords=iphone+6S">iphone 6S</a>
														<a href="search.php?keywords=%E6%96%B0%E9%B2%9C%E7%BE%8E%E9%A3%9F">新鲜美食</a>
														<a href="search.php?keywords=%E8%9B%8B%E7%B3%95">蛋糕</a>
														<a href="search.php?keywords=%E6%97%A5%E7%94%A8%E5%93%81">日用品</a>
														<a href="search.php?keywords=%E8%BF%9E%E8%A1%A3%E8%A3%99">连衣裙</a>
														</span>
    </div>
<div class="i_car" >



<c:if test="${plist!=null }">

    	<div class="car_t">购物车 [ <span id="gw">${pcount}</span> ]</div>
     </c:if>
     <c:if test="${plist==null }">
    	<div class="car_t">购物车 [ <span id="gw">0</span> ]</div>
     </c:if>
        <div class="car_bg">
        <c:if test="${user==null }">
       		<!--Begin 购物车未登录 Begin-->

        	<div class="un_login">还未登录！<a href="Login.jsp" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
            <!--End 购物车未登录 End-->
            </c:if>
            <!--Begin 购物车已登录 Begin-->
            <c:if test="${user!=null }">
            <ul class="cars" id="ul">
            <c:if test="${plist!=null }">
            <c:forEach var="item" items="${plist }">
            
            	<li>
                	<div class="img"><a href="ProductServlet?id=${item.id }&type=xq"><img src="images/${item.fileName }" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">${item.name }</a></div>
                    <div class="price"><font color="#ff4e00">${item.price }</font> X${item.count }</div>
                </li>
            </c:forEach>
         
             </c:if>
            </ul>
            <c:if test="${fn:length(plist)>0}">
            <div id="div">
            <div class="price_sum">共计&nbsp; <font color="#ff4e00">￥</font><span id="zj">${pprice }</span></div>
            <div class="price_a"><a href="BuyCar.jsp">去购物车结算</a></div>
             </div>
             </c:if>
              <c:if test="${fn:length(plist)==0||plist==null}">
              <div id="div">
               <div class="un_login">购物车内还没有商品，赶快选购吧！</div>
              </div>       
              </c:if>
            </c:if>
        <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
<!--End Header End--> 
<!--Begin Menu Begin-->


<script type="text/javascript">
function deleteCartGoods(rec_id)
{
Ajax.call('delete_cart_goods.php', 'id='+rec_id, deleteCartGoodsResponse, 'POST', 'JSON');
}

/**
 * 接收返回的信息
 */
function deleteCartGoodsResponse(res)
{
  if (res.error)
  {
    alert(res.err_msg);
  }
  else
  {
      document.getElementById('ECS_CARTINFO').innerHTML = res.content;
  }
}
</script>

    </div>
</div>
<div class="menu_bg">
	<div class="menu">
    	    
    	<div class="nav nav_none" >
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav">
        		<ul>
					<c:set var="i" value="0"></c:set>
					<c:forEach var="item1" items="${map}">
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav1.png" /></span> <span class="fl"><a href="ProductServlet?oneid=${item1.key.id }&type=fl">${item1.key.name }</a></span>
							</div>
							<div class="zj" style="top:${i}px ">
								<div class="zj_l">

									<c:forEach var="item2" items="${item1.value }">
										<dl class="zj_l_c">
											<dt><a href="ProductServlet?twoid=${item2.key.id }&type=fl">${item2.key.name }</a></dt>
											<dd><c:forEach var="item3" items="${item2.value }">
												<a href="ProductServlet?threeid=${item3.id }&type=fl">${item3.name }</a>
                    							</c:forEach>|</dd>
										</dl>
									</c:forEach>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<c:set var="i" value="${i-40 }"></c:set>
					</c:forEach>

				</ul>
            </div>
        </div>  
                                                             
    	<ul class="menu_r">                                                                                                                                               
			          		<li >
          			<a href="Index.jsp" target="_blank">首页</a>
			</li>
			          		<li >
          			<a href="ProductServlet?oneid=681&type=fl" target="_blank" >箱包</a>
			    </li>
			          		<li >
          			<a href="ProductServlet?oneid=660&type=fl" target="_blank" >手机数码</a>
			    </li>
			          		<li >
          			<a href="ProductServlet?oneid=670&type=fl" target="_blank" >进口食品</a>
			    </li>
			          		<li >
          			<a href="ProductServlet?oneid=548&type=fl" target="_blank" >化妆品</a>
			    </li>
			          		<li >
          			<a href="ProductServlet?oneid=628&type=fl" >生活电器</a>
			    </li>
			        </ul>
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>