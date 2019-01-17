<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
	<link href="css/normalize.css" rel="stylesheet"/>
	<link href="css/jquery-ui.css" rel="stylesheet"/>
	<link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>
	<style type="text/css">
	body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
	#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
	#comments{width:350px;height:100px;}
	</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>

<div class="row">

  <div class="eightcol last">

    <!-- Begin Form -->

    <form id="my-form" action="registServlet?type=0" method="post" enctype="multipart/form-data">

        <section name="第一步">

          <div><label>用户名:</label><input id="account" name="account" type="text"/></div>
          <div><label>密码:</label><input id="password" name="password" type="password"/></div>
          <div><label>真实姓名:</label><input id="name" name="name" /></div>
          <div><label>上传头像:</label><input type="file" name="photo"/></div>
          
        </section>

        <section name="第二步">
          <div>
            <label>着重关注:</label>
            <label><input type="checkbox" name="point[]" value="fruit"/>水果</label>
            <label><input type="checkbox" name="point[]" value="vegetable"/>蔬菜</label>
            <label><input type="checkbox" name="point[]" value="cereal"/>谷物</label>
            <label><input type="checkbox" name="point[]" value="fowl"/>家禽</label>
            <label><input type="checkbox" name="point[]" value="other"/>其他</label>
          </div>
        </section>

        <section name="第三步">
          <div><label>手机号:</label><input name="phone" /></div>
          <div><label>地区:</label>
          <select id="address" name="address">
            <option value="default">&ndash; 选择地区 &ndash;</option>
            <option value="汉寿">汉寿</option>
            <option value="襄阳">襄阳</option>
            <option value="公安">公安</option>
            <option value="宛城">宛城</option>
            <option value="新野">新野</option>
            <option value="荆州">荆州</option>
            <option value="沙市">沙市</option>
          </select>
        </div>
        <div><label>邮编:</label><input type="text" name="zip" data-ideal="zip"/></div>
        <div><label>备注:</label><textarea id="comments" name="comments"></textarea></div>
      </section>

      <div><hr/></div>

      <div>
        <button type="submit">提交</button>
        <button id="reset" type="button">重置</button>
        ${empty msg?"":msg}
        <%request.setAttribute("msg", null); %>
      </div>

    </form>

    <!-- End Form -->

  </div>

</div>


<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idealforms.js"></script>
<script type="text/javascript">
var options = {

	onFail: function(){
		alert( $myform.getInvalid().length +' 处仍需要填写！' )
	},

	inputs: {
		'password': {
			filters: 'required pass',
		},
		'account': {
			filters: 'required account',
			data: {
			//ajax: { url:'validate.php' }
			}
		},
		'file': {
			filters: 'extension',
			data: { extension: ['jpg'] }
		},
		'comments': {
			filters: 'min max',
			data: { min: 50, max: 200 }
		},
		'states': {
			filters: 'exclude',
			data: { exclude: ['default'] },
			errors : {
				exclude: '选择地区.'
			}
		},
		'langs[]': {
			filters: 'min max',
			data: { min: 2, max: 3 },
			errors: {
				min: 'Check at least <strong>2</strong> options.',
				max: 'No more than <strong>3</strong> options allowed.'
			}
		}
	}
	
};

var $myform = $('#my-form').idealforms(options).data('idealforms');

$('#reset').click(function(){
	$myform.reset().fresh().focusFirst()
});

$myform.focusFirst();
</script>
<div style="text-align:center;">
</div>
  </body>
</html>
