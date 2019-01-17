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
<base href="<%=basePath%>/HCManager/">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改管理员信息</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
	String acc = request.getParameter("account");
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
					href="#">管理管理员</a>&nbsp;-</span>&nbsp;修改管理员信息
			</div>
		</div>
		<form action="<%=basePath%>updateAdminServlet?acc=<%=acc %>" method="post" enctype="multipart/form-data">
			<div class="page ">
				<!-- 上传广告页面样式 -->
				<div class="banneradd bor">
					<div class="baTopNo">
						<span>修改管理员(<%=acc %>)信息</span><%=url %>
					</div>
					<div class="baBody">
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;头像：
							<div class="vipHead vipHead1">
								<img src="../<%=url %>" />
								<p class="vipP">更换头像</p>
								<input class="file1" type="file" name="photo"/>
							</div>
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：<input type="text"
								class="input3" name="password" />
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<input type="text"
								class="input3" name="name" />
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号：<input type="text"
								class="input3" name="phone" />
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;余额：<input class="input3"
								type="text" name="money" />
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员简介：
							<div class="btext2">
								<textarea class="text2"></textarea>
							</div>
						</div>
						<div class="bbD">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前管理权限：<label><input
								type="radio" checked="checked" name="styleshoice2" value="1" />&nbsp;正常</label><label><input
								type="radio" name="styleshoice2" value="2" />&nbsp;禁止</label>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<button class="btn_ok btn_yes" type="submit">提交</button>
								<a class="btn_ok btn_no" href="<%=basePath%>userShowServlet?account=${account }">取消</a>
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