<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="help_right_out">
    <div class="help_right">
     
<div class="help_right_title " >
         <p>[特惠]${News[0].title }<p><b>${News[0].brief }/${News[0].createTime }</b>
         </div>
         <div class="blank"></div>
         ${News[0].content}
         <div class="content_right">
         
                   <object>
<param value="always" name="allowScriptAccess" />
<param value="transparent" name="wmode" />
<param value="http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ" name="movie" /><embed width="480" height="385" src="http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ" allowscriptaccess="always" wmode="transparent" type="application/x-shockwave-flash"></embed></object>                            </div>
           <div class="blank"></div>
         <div style="padding:8px; margin-top:15px; text-align:left; border-top:1px solid #e6e6e6 ;">
         <c:if test="${News[1]!=null }">
           	 下一篇:<a href="NewsServlet?id=${News[1].id }&type=top5news" class="f6">${News[1].title }</a><br />
         </c:if>
         <c:if test="${News[2]!=null }">          
                      上一篇:<a href="NewsServlet?id=${News[2].id }&type=top5news" class="f6">${News[2].title }</a><br />  
         </c:if>    
                   </div>
     
   
  
  <div class="blank"></div>
  
</div>
  </div>
  

<div class="blank30"></div>