<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>/HCManager/">
    
	<title>头部</title>
	<link rel="stylesheet" type="text/css" href="css/public.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/public.js"></script>
	<%
	String account = request.getParameter("account");
	 %>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 头部 -->
	<div class="head">
		<div class="headL">
			<img class="headLogo" src="img/headLogo.png" />
		</div>
		<div class="headR">
			<p class="p1">
				欢迎你，<%=account %>
			</p>
			<p class="p2">
				<a href="#" class="resetPWD">重置密码</a>&nbsp;&nbsp;<a
					href="{:U('Admin/Index/exit')}" class="goOut">退出</a>
			</p>
		</div>
		<!-- onclick="{if(confirm(&quot;确定退出吗&quot;)){return true;}return false;}" -->
	</div>

	<div class="closeOut">
		<div class="coDiv">
			<p class="p1">
				<span>X</span>
			</p>
			<p class="p2">确定退出当前用户？</p>
			<P class="p3">
			<a class="ok yes" href="#">确定</a><a class="ok no" href="#">取消</a>
			</p>
		</div>
	</div>
  </body>
</html>
