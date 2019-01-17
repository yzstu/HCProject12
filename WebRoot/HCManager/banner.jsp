<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>HCManager/">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>广告</title>
	<link rel="stylesheet" type="text/css" href="css/css.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>

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
			<!-- banner页面样式 -->
			<div class="banner">
				<div class="add">
					<a class="addA" href="banneradd.jsp">上传广告&nbsp;&nbsp;+</a>
				</div>
				<!-- banner 表格 显示 -->
				<div class="banShow">
					<c:set var="totalAdvs" value="${requestScope.totalAdvs}" />
					<c:set var="advsPerPage" value="${requestScope.advsPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageAdvs"
						value="${requestScope.advs.subList(beginIndex,endIndex)}" />
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="315px" class="tdColor">图片</td>
							<td width="308px" class="tdColor">名称</td>
							<td width="450px" class="tdColor">链接</td>
							<td width="215px" class="tdColor">是否显示</td>
							<td width="180px" class="tdColor">排序</td>
							<td width="125px" class="tdColor">操作</td>
						</tr>
						<c:forEach var="adv" items="${currentPageAdvs}">
							<tr height="40px">
								<td>${adv.getNo() }</td>
								<td><img class="operation delban" src="../${adv.getImgurl() }"  style="width: 130px; height: 110px"></td>
								<td>${adv.getName() }</td>
								<td>${adv.getUrl() }</td>
								<td>${adv.getIsshow() }</td>
								<td>${adv.getPriority() }</td>
								<td><a href="advchange.jsp?no=${adv.getNo() }&&imgurl=${adv.getImgurl() }"><img class="operation"
									src="img/update.png"></a> 
									<a href="<%=basePath%>advDeleteServlet?no=${adv.getNo() }"><img class="operation delban"
									src="img/delete.png"></a> 
									</td>
							</tr>
						</c:forEach>
						
							
						
					</table>
					<div class="paging">>
						<ul class="pagination">
							<a href="<c:url value="/advShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/advShowServlet?page=${page-1>1?page-1:1}"/>">&laquo;</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/advShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/advShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">&raquo;</a>

							<a href="<c:url value="/advShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
					</div>
				</div>
				<!-- banner 表格 显示 end-->
			</div>
			<!-- banner页面样式end -->
		</div>

	</div>


	
</body>
</html>