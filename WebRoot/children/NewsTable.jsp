<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
td{
	border: 1px solid #C9C9C9 ;
	height: 30px;
	text-align: center;
	width:500px;
	overflow:hidden; 
	white-space:nowrap; 
}
a:hover{
	color: red;
}
</style>
 	<table id="mytable" style="border-collapse: collapse;"  >
 		<c:forEach var="item" items="${page.pageList }">
 		<tr><td><a href="NewsServlet?id=${item.id }&type=top5news">${item.title }</a></td><td>${item.createTime }</td></tr>
 		</c:forEach>
 	</table>
