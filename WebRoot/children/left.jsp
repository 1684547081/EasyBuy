<%@page import="cn.zll.entity.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
	    		$("#acookies").click(function(){
    			$.ajax({
        			url:"/EasyBuy/ProductServlet?type=acookies",
        			type:"get",
        			success:function(){
        				$("#cookiesul").html("");
        			}
        				
        		});
        	});
	});
</script>
    	<div class="l_history">
        	<div class="his_t">
            	<span class="fl">浏览历史</span>
                <span class="fr"><a href="#" id="acookies">清空</a></span>
            </div>
        	<ul id="cookiesul">
            	<c:forEach var="item" items="${clist}">
            	<li>
                    <div class="img"><a href="ProductServlet?id=${item.id }&type=xq"><img src="images/${item.fileName }" width="185" height="162" /></a></div>
                	<div class="name"><a href="ProductServlet?id=${item.id }&type=xq">${item.name }</a></div>
                    <div class="price">
                    	<font>￥<span>${item.price }</span></font> &nbsp; 18R
                    </div>
                </li>
            	</c:forEach>
        	</ul>
        </div>