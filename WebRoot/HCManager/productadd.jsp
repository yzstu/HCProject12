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
<title>上传广告</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<title></title>
<script>
	//实现预览功能
	function preview() {
		//获取文件框的第一个文件,因为文件有可能上传多个文件,咱这里是一个文件
		var file = document.getElementById("fileload").files[0];
		//可以进行一下文件类型的判断
		var fileType = file.type.split("/")[0];
		if (fileType != "image") {
			alert("请上传图片")
			return;
		}
		//图片大小的限制
		var fileSize = Math.round(file.size / 1024 / 1024);
		if (fileSize >= 3) {
			alert("请上传小于少于3M的图片");
			return;
		}
		//获取img对象
		var img = document.getElementById("image");
		//建一条文件流来读取图片
		var reader = new FileReader();
		//根据url将文件添加的流中
		reader.readAsDataURL(file);
		//实现onload接口
		reader.onload = function(e) {
			//获取文件在流中url
			url = reader.result;
			//将url赋值给img的src属性
			img.src = url;
		};

	}
	//实现取消上传功能
	function call() {
		//将img的src属性赋值为空串
		document.getElementById("image").src = "";
		//选择文件框的value属性赋值为空串
		document.getElementById("fileload").value = "";
	}
</script>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">产品管理</a>&nbsp;-</span>&nbsp;上传产品
			</div>
		</div>
		<div class="page ">
			<form action="<%=basePath%>addProductServlet" method="post"
				enctype="multipart/form-data">
				<!-- 上传广告页面样式 -->
				<div class="banneradd bor">
					<div class="baTop">
						<span>上传产品</span>
					</div>
					<div class="baBody">
						<div class="bbD">
							标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" class="input1" name="title" />
						</div>
						<div class="bbD">
							单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：<input type="text" class="input1" name="price" />
						</div>
						<div class="bbD">
							剩余数量：<input type="text" class="input1" name="quantity" />
						</div>
						<div class="bbD">
							联系电话：<input type="text" class="input1" name="phone" />
						</div>
						<div class="bbD">
							上传图片：
							<div class="bbDd">
		 						<div  class="bbDImg">
									<!--设置一个框放图片-->
									<img id="image" width="100%" height="100%" src="img/upload.jpg" />
									<!--放图片的标签-->
									<input id="fileload" type="file" name="file" value="点击此处上传图片" onchange="preview();" />
								</div>
								
								<!--建一个文件选择框-->
								<a class="bbDDel" onclick="call()">删除</a>
							</div>
						</div>
						<div class="bbD">
							是否显示：<label><input type="radio" checked="checked" value="1"
								name="isshow" />是</label> <label><input value="0" type="radio" />否</label>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<button class="btn_ok btn_yes" type="submit">提交</button>
								<a class="btn_ok btn_no" href="HCManager/productShowServlet">取消</a>
							</p>
						</div>
					</div>
				</div>
			</form>

			<!-- 上传广告页面样式end -->
		</div>
	</div>
</body>
</html>