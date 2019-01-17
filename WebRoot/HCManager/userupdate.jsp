<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>修改管理员信息</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
	String no = request.getParameter("no");
	String url = request.getParameter("url");
%>
</head>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">会员管理</a>&nbsp;-</span>&nbsp;修改会员信息
			</div>
		</div>
		<form action="<%=basePath%>updateVipServlet?no=<%=no%>" method="post">
			<div class="page ">
				
				<div class="banneradd bor">
					<div class="baTopNo">
						<span>修改会员(ID=<%=no %>)信息
						</span>
					</div>
					<div class="baBody">
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：<input type="text"
								class="input3" name="password" />
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否拥有管理权限：<label><input
								type="radio"  name="styleshoice2" value=1 />&nbsp;是</label><label><input
								type="radio" checked="checked" name="styleshoice2" value="2"/>&nbsp;否</label>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<button class="btn_ok btn_yes" type="submit">提交</button>
								<a class="btn_ok btn_no"
									href="vip.jsp">取消</a>
							</p>
						</div>
					</div>
				</div>

				<!-- 改变管理员信息页面样式end -->
			</div>
		</form>
	</div>
</body>
</html>