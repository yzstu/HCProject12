<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页左侧导航</title>
		<link rel="stylesheet" type="text/css" href="HCManager/css/public.css" />
		<script type="text/javascript" src="HCManager/js/jquery.min.js"></script>
		<script type="text/javascript" src="HCManager/js/public.js"></script>
		<%
		String account = request.getParameter("account");
		 %>
	</head>
  
   <body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="HCManager/main.jsp" target="main"><div class="line">
					<img src="HCManager/img/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<!-- <dl class="system_log">
			<dt><img class="icon1" src="../img/coin01.png" /><img class="icon2"src="../img/coin02.png" />
				首页<img class="icon3" src="../img/coin19.png" /><img class="icon4" src="../img/coin20.png" /></dt>
		</dl> -->
		<c:choose>
       		<c:when test="${type}">
       			<a href="<%=basePath%>regist.jsp">注册</a> | <a href="<%=basePath%>login.jsp">登录</a>
       		</c:when>
       		<c:otherwise>
       			<span style="color: red;"><c:out value="欢迎您,${account }"></c:out></span>
       		</c:otherwise>
       	</c:choose>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coin03.png" /><img class="icon2"
						src="HCManager/img/coin04.png" /> 网站管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a class="cks" href="userShowServlet?type=1"
						target="main">管理员管理</a><img class="icon5" src="HCManager/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coin05.png" /><img class="icon2"
						src="HCManager/img/coin06.png" /> 公共管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a class="cks" href="advShowServlet"
						target="main">广告管理</a><img class="icon5" src="HCManager/img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a class="cks" href="suggestShowServlet"
						target="main">意见管理</a><img class="icon5" src="HCManager/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coin07.png" /><img class="icon2"
						src="HCManager/img/coin08.png" /> 会员管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a href="userShowServlet?type=2" target="main"
						class="cks">会员管理</a><img class="icon5" src="HCManager/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coin11.png" /><img class="icon2"
						src="HCManager/img/coin12.png" />资讯管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a href="newsShowServlet?type=1&&account=<%=account %>" target="main"
						class="cks">农业资讯</a><img class="icon5" src="HCManager/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coin15.png" /><img class="icon2"
						src="HCManager/img/coin16.png" /> 产品管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a href="prductShowServlet?type=1"
						target="main" class="cks">产品管理</a><img class="icon5"
						src="HCManager/img/coin21.png" />
				</dd>
			</dl>
			
			<dl class="system_log">
				<dt>
					<img class="icon1" src="HCManager/img/coinL1.png" /><img class="icon2"
						src="HCManager/img/coinL2.png" /> 系统管理<img class="icon3"
						src="HCManager/img/coin19.png" /><img class="icon4"
						src="HCManager/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><a href="HCManager/changepwd.jsp?account=<%=account %>"
						target="main" class="cks">修改密码</a><img class="icon5"
						src="HCManager/img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="HCManager/img/coin111.png" /><img class="coin22"
						src="HCManager/img/coin222.png" /><img
						class="icon5" src="HCManager/img/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
</body>
</html>