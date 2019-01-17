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
<title>产品管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
		<div class="add">
					<a class="addA" href="productadd.jsp">上传产品&nbsp;&nbsp;+</a>
				</div>
			<div class="page">
				<img src="img/coin02.png" /><span><a href="">首页</a>&nbsp;-&nbsp;<a
					href="#">产品管理</a>&nbsp;-</span>&nbsp;产品管理
			</div>
		</div>
<br><br>
		<div class="page">
			<!-- topic页面样式 -->
			<div class="topic">
				<!-- topic表格 显示 -->
				<div class="conShow">
				<c:set var="totalProducts" value="${requestScope.totalProducts}" />
					<c:set var="productsPerPage" value="${requestScope.productsPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageProducts"
						value="${requestScope.products.subList(beginIndex,endIndex)}" />
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="200px" class="tdColor">图片</td>
							<td width="125px" class="tdColor">标题</td>
							<td width="155px" class="tdColor">联系电话</td>
							<td width="175px" class="tdColor">单价</td>
							<td width="175px" class="tdColor">余量</td>
							<td width="175px" class="tdColor">是否显示</td>
						</tr>
						<c:forEach var="product" items="${currentPageProducts}">
							<tr height="40px">
								<td>${product.getNo() }</td>
								<td><img src="../${product.getImgurl() }"  style="width: 130px; height: 110px"></td>
								<td>${product.getTitle() }</td>
								<td>${product.getPhone() }</td>
								<td>${product.getPrice() }</td>
								<td>${product.getQuantity() }</td>
								<td>${product.getIsshow() }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<ul class="pagination">
							<a href="<c:url value="/productShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/productShowServlet?page=${page-1>1?page-1:1}"/>">上一页</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/productShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/productShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页</a>

							<a href="<c:url value="/productShowServlet?page=${totalPages }"/>">尾页</a>
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