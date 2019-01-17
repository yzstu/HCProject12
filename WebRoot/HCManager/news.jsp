<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>HCManager/">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资讯管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
	String account = request.getParameter("account");
 %>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
		<div class="add">
					<a class="addA" href="newsadd.jsp?account=<%=account %>">添加资讯&nbsp;&nbsp;+</a>
				</div>
			<div class="page">
				<img src="img/coin02.png" /><span><a href="">首页</a>&nbsp;-&nbsp;<a
					href="#">资讯管理<%=account %></a>&nbsp;-</span>&nbsp;农业资讯
			</div>
		</div>
<br><br>
		<div class="page">
			<!-- topic页面样式 -->
			<div class="topic">
				<!-- topic表格 显示 -->
				<div class="conShow">
				<c:set var="totalNews" value="${requestScope.totalNews}" />
					<c:set var="newssPerPage" value="${requestScope.newssPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageNewss"
						value="${requestScope.newss.subList(beginIndex,endIndex)}" />
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="200px" class="tdColor">标题</td>
							<td width="125px" class="tdColor">作者</td>
							<td width="155px" class="tdColor">发表时间</td>
							<td width="175px" class="tdColor">内容</td>
						</tr>
						<c:forEach var="news" items="${currentPageNewss}">
							<tr height="40px">
								<td>${news.getNo() }</td>
								<td>${news.getTitle() }</td>
								<td>${news.getAuthor() }</td>
								<td>${news.getTime() }</td>
								<td>${news.getContent() }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<ul class="pagination">
							<a href="<c:url value="/newsShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/newsShowServlet?page=${page-1>1?page-1:1}"/>">上一页</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/newsShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/newsShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页</a>

							<a href="<c:url value="/newsShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
					</div>
				</div>
				<!-- topic 表格 显示 end-->
			</div>
			<!-- topic页面样式end -->
		</div>

	</div>


	
</body>
</html>