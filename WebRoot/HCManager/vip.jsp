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
<title>会员管理-有点</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<script type="text/javascript">
	$(function() {
		$("input.mh_date").manhuaDate({
			Event : "click",//可选               
			Left : 0,//弹出时间停靠的左边位置
			Top : -16,//弹出时间停靠的顶部边位置
			fuhao : "-",//日期连接符默认为-
			isTime : false,//是否开启时间值默认为false
			beginY : 1949,//年份的开始默认为1949
			endY : 2100
		//年份的结束默认为2049
		});
	});
</script>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="main.jsp">首页</a>&nbsp;-&nbsp;<a
					href="#">会员管理</a>&nbsp;-</span>&nbsp;会员管理
			</div>
		</div>

		<div class="page">
			<!-- vip页面样式 -->
			<div class="vip">
				<div class="conform">
					<form>
						<div class="cfD">
							<a class="addA addA1" href="vipadd.jsp">新增会员+</a> 
						</div>
					</form>
				</div>
				<!-- vip 表格 显示 -->
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
							<td width="250px" class="tdColor">头像</td>
							<td width="188px" class="tdColor">姓名</td>
							<td width="235px" class="tdColor">手机号码</td>
							<td width="220px" class="tdColor">所在城市</td>
							<td width="282px" class="tdColor">注册时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach var="user" items="${currentPageUsers}">
							<tr height="40px">
								<td>${user.getNo() }</td>
								<td><img src="../${user.getPhotourl() }" style="height: 110px; width: 110px; "></td>
								<td>${user.getName() }</td>
								<td>${user.getPhone() }</td>
								<td>${user.getAddress() }</td>
								<td>${user.getSignData() }</td>
								<td><a href="userupdate.jsp?no=${user.getNo() }&&url=${user.getPhotourl() }"><img class="operation"
									src="img/update.png"></a> <img class="operation delban"
								src="img/delete.png"></td>
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

							<a href=" <c:url value="/userShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页</a>

							<a href="<c:url value="/userShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
						</nav>
					</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>

	</div>


	<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="img/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="#" class="ok yes">确定</a><a class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
</body>

<script type="text/javascript">
	// 广告弹出框
	$(".delban").click(function() {
		$(".banDel").show();
	});
	$(".close").click(function() {
		$(".banDel").hide();
	});
	$(".no").click(function() {
		$(".banDel").hide();
	});
	// 广告弹出框 end
</script>
</html>