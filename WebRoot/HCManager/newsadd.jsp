<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>HCManager/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻添加</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
	String account = request.getParameter("account");
	request.setAttribute("account", account);
 %>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;资讯添加<%=account %>
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>资讯添加</span>
				</div>
				
				<div class="baBody">
				<form method="post" action="<%=basePath%>newsAddServlet?account=${account }">
					<div class="bbD">
						资讯标题：<input type="text" class="input3" name="title" />
					</div>
					<div class="bbD">
						内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：<textarea name="content" cols="30" rows="4" style="width: 754px; "></textarea>
					</div>
						<p class="bbDP">
							<button class="btn_ok btn_yes" type="submit">提交</button>
							<a class="btn_ok btn_no" href="<%=basePath%>newsShowServlet">取消</a>
						</p>
						</form>
					</div>
				</div>
			</div>

			<!-- 上传广告页面样式end -->
		</div>
	</div>
</body>
</html>