<%@page import="com.xtkj.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>/HCManager/">
<title>管理员管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;-</span>&nbsp;管理员管理
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur" >
				<div class="conform">
					<form action="<%=basePath%>addAdminServlet" method="post">
						<div class="cfD">
							<input class="userinput" type="text" name="account" placeholder="输入用户名" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="userbtn">添加</button>
						</div>
					</form>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow">
					<c:set var="totalUsers" value="${requestScope.totalUsers}" />
					<c:set var="usersPerPage" value="${requestScope.usersPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageUsers"
						value="${requestScope.users.subList(beginIndex,endIndex)}" />
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">ID</td>
							<td width="435px" class="tdColor">会员等级</td>
							<td width="400px" class="tdColor">用户名</td>
							<td width="630px" class="tdColor">添加时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach var="user" items="${currentPageUsers}">
							<tr height="40px">
								<td>${user.getNo() }</td>
								<td>管理员</td>
								<td>${user.getAccount() }</td>
								<td>${user.getSignData() }</td>
								<td><a href="updateadmin.jsp?account=${user.getAccount() }&&url=${user.getPhotourl() } "><img class="operation" src="img/update.png"></a>
									<a href="<%=basePath%>deleteAdminServlet?account=${user.getAccount() }"><img class="operation delban" src="img/delete.png"></a></td>
							</tr>
						</c:forEach>

					</table>
					<div class="paging">
						<nav>
						<ul class="pagination">
							<a href="<c:url value="/userShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/userShowServlet?page=${page-1>1?page-1:1}"/>">上一页</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/userShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/userShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页s</a>

							<a href="<c:url value="/userShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
						</nav>
					</div>
				</div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>

	</div>
</body>
</html>
