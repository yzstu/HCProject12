<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>HCManager/">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>

<%
String account = request.getParameter("account");
String msg = request.getParameter("msg");
 %>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="main.jsp">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;修改密码
			</div>
		</div>
		<div class="page ">
			<!-- 修改密码页面样式 -->
			<div class="bacen">
				
				<div class="bbD">管理员用户名：&nbsp;&nbsp;&nbsp;&nbsp;${account }</div>
				<form action="<%=basePath%>changPswServlet?account=${account }" method="post" >
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3" id="pwd2" name="newpsw" /> 
					<br>${empty msg?"":msg }
				</div>
				<div class="bbD">
					<p class="bbDP">
						<button class="btn_ok btn_yes" type="submit">提交</button>
						<a class="btn_ok btn_no" type=>取消</a>
					</p>
				</div>
				</form>
			</div>

			<!-- 修改密码页面样式end -->
		</div>
	</div>
</body>
</html>