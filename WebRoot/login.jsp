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
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>登陆登陆长江大学实验室签到管理系统</title>
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	
	
	<script type="text/javascript">
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c){
			$('.message').fadeOut('slow', function(c){
		  		$('.message').remove();
			});
		});	
	});
	
	</script>
	
  </head>
  
  <body>
   <div class="message warning">
	<div class="inset">
		<div class="login-head">
			<h1>欢迎登陆登陆长江大学实验室签到管理系统</h1>
			<div class="alert-close"></div> 			
		</div>
		<form action="verificationServle" method="post"> 
			<ul>
				<li><input type="text" name="account"  class="text" value="请输入账号" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '请输入账号';}"><a href="#" class=" icon user"></a></li>
				<li><input type="password" name="password" value="" /> <a href="#" class="icon lock"></a></li>
           		<li><input type="text" name="validateCode" value="请在此输入验证码" onFocus="this.value =  '';" onBlur=" if (this.value == '') {this.value = '请输入验证码';}">
           		<img alt="点击更换验证码" src="imageMaskServlet" id="imageMask" onclick="reloadImg()"></li>
            </ul>
            ${empty msg?"":msg}
            <%request.setAttribute("msg", null); %>
			<script type="text/javascript"> 
		    	function reloadImg(){
		        document.getElementById("imageMask").src="imageMaskServlet?date="+new Date().getTime();  
		    }  
		 	</script> 
			<div class="submit">
				<input type="submit" value="登陆" >
				<h4><a href="regist.jsp">注册新账号</a></h4>
				<div class="clear">  </div>	
			</div>
		</form>
	</div>					
</div>
<br><br><br>
<!--- footer --->
<!-- <div class="footer" >
	<p>华成农贸&nbsp;版权所有&nbsp;Copyright &copy; 2014.</p>
</div> -->

<div style="text-align:center;">
<p><br><a href="http://www.baidu.com/" target="_blank">联系我们</a></p>
</div>
  </body>
</html>
