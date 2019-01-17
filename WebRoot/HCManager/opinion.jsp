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
<title>展示建议</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;意见管理
			</div>
		</div>
		<div class="page">
			<!-- opinion 页面样式 -->
			<div class="opinion">
				<!-- opinion 表格 显示 -->
				<div class="opShow">
					<c:set var="totalSuggests" value="${requestScope.totalSuggests}" />
					<c:set var="suggestsPerPage"
						value="${requestScope.suggestsPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageSuggests"
						value="${requestScope.suggests.subList(beginIndex,endIndex)}" />
					<table border="1" cellspacing="0" cellpadding="0">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="66px" class="tdColor tdC">序号</td>
								<td width="440px" class="tdColor">反馈时间</td>
								<td width="396px" class="tdColor">用户名</td>
								<td width="760px" class="tdColor">内容</td>
							</tr>
							<c:forEach var="suggest" items="${currentPageSuggests}">
								<tr height="40px">
									<td>序号</td>
									<td>${suggest.getTime() }</td>
									<td>${suggest.getAccount() }</td>
									<td>${suggest.getSuggest() }</td>
								</tr>
							</c:forEach>
						</table>
						<div class="paging">
						<nav>
						<ul class="pagination">
							<a href="<c:url value="/suggestShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/suggestShowServlet?page=${page-1>1?page-1:1}"/>">上一页</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/suggestShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/suggestShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页s</a>

							<a href="<c:url value="/suggestShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
						</nav>
					</div>
				</div>
				<!-- opinion 表格 显示 end-->
			</div>
			<!-- 页面样式end -->
		</div>
	</div>
</body>
</html>