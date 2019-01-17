<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <base href="<%=basePath%>/HC/">
    <title>华成农贸资讯有限公司</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="2%" align="left"><img src="images/top_03.png" width="13" height="13" /></td>
        <td width="68%" align="left"><span class="fotn_999">您好！欢迎来到</span><span class="font_0A8BC4">华成农贸资讯有限公司</span><span class="fotn_999">！</span></td>
        <td width="30%" align="right"> 
       	<c:choose>
       		<c:when test="${empty account}">
       			<a href="<%=basePath%>/regist.jsp">注册</a> | <a href="<%=basePath%>/login.jsp">登录</a>
       		</c:when>
       		<c:otherwise>
       			<span style="color: red;"><c:out value="欢迎您,${account }"></c:out></span>
       		</c:otherwise>
       	</c:choose>
       	</td> 
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="110" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
     	 <td>
		<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=5" width="650" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> 
		</td>
        <!-- <td width="21%"><img src="images/top_09.png" width="210" height="76" /></td>
        <td width="5%" align="center"><img src="images/top_07.png" width="1" height="85" /></td>
        <td width="46%" align="left"><img src="images/top_15.png" width="216" height="27" /></td>-->
        <td width="28%"> 
        <table border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="53" rowspan="3" align="center"><img src="images/top_12.png" width="41" height="54" /></td>
            <td align="left" class="fotn_999">客服热线：</td>
          </tr>
          <tr>
            <td align="left" class="font_0A8BC4  font_24">400-027-3552</td>
          </tr>
          <tr>
            <td align="left" class="fotn_999">客服工作时间：9：00-18：00</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td width="130" align="center"><a href="index.jsp" class="dao">网站首页</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center" bgcolor="#076f9b"><a href="about.jsp" class="dao">关于华成</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center"><a href="<%=basePath%>newsShowServlet?type=2" class="dao">农业资讯</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center"><a href="products.jsp" class="dao">产品中心</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center"><a href="service.jsp" class="dao">我的农资</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center"><a href="contact.jsp" class="dao">反馈中心</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="190" valign="middle"><img src="images/abanner.jpg" width="1000" height="150" /></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212" valign="top"><table border="0" cellpadding="0" cellspacing="10" bgcolor="#FFFFFF" class="bk_e4e4e4">
      <tr>
        <td width="190"><table border="0" cellspacing="10" cellpadding="0">
          <tr>
            <td align="right"><span  class="font_18 fotn_999">关于华成</span><br />
                <span class="font_0A8BC4  font_24">About us</span></td>
          </tr>
          <tr>
            <td height="27" align="left" background="images/left_07.jpg" class="font_fff" style=" padding-left:10px;">公司简介</td>
          </tr>
          <tr>
            <td><a href="products.jsp"><img src="images/left_10.jpg" width="170" height="62" border="0" /></a></td>
          </tr>
          <tr>
            <td><a href="contact.jsp"><img src="images/left_12.jpg" width="170" height="62" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="20" valign="top">&nbsp;</td>
    <td width="768" valign="top" bgcolor="#FFFFFF" class="bk_e4e4e4"><table width="100%" border="0" cellspacing="10" cellpadding="0">
      <tr>
        <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" align="left" class="font_14"><strong class="font_16">公司简介</strong></td>
          </tr>
          <tr>
            <td height="3" background="images/about_49.jpg"></td>
          </tr>
          <tr>
            <td valign="top"> “华成农贸资讯有限公司”（www.farmer.com.cn）是经国务院新闻办公室批准刊载新闻的综合性网站，是中央级综合性大报——农民日报建设的大型网上信息发布平台，是农业部权威涉农信息发布的重要窗口，是国家权威“三农”主流网络媒体。
        “华成农贸资讯有限公司”创建于2017年，是农民日报社建设的“三农”网络服务平台。“中国农业新闻网”网站在保持农民日报“三农”报道权威性的同时，充分发挥互联网特性，采用文字、图片、动漫、短信等方式，依托农民日报、中国农村信用合作报、中国畜牧报、中国渔业报等报纸和中华全国农民报协会各省市会员单位的采编力量，向全世界发布信息。“中国农业新闻网”网站现有采编人员三百多名，全国各省市区30多个记者站，合作媒体百余家，是国际互联网上海内外读者了解中国农业、农村和农民的重要窗口。是“三农”新闻资讯服务平台、农业数据应用服务平台、农产品电子交易服务平台。国务院有关领导来网站视察，对中国农业新闻的工作给予了充分肯定。
        “华成农贸资讯有限公司”网站每天定时发布新闻，日更新量近千条，设有100多个栏目。在开辟“大地社区”加强网友互动的基础上，网站力求增强吸引力、可读性、亲和力。</td>
          </tr>
          <tr>
            <td valign="top"><img src="images/about_15.jpg" width="729" height="166" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font_fff">
  <tr>
    <td height="20" align="center"></td>
  </tr>
  <tr>
    <td height="93" align="center" background="images/endbj.jpg">Copyright @ 2017-2023  All Rights Reserved  版权所有<br />
    地址：长江大学东校区小西门斜对面汉科十巷9号1楼&nbsp;&nbsp;电话：400-027-3552&nbsp;&nbsp;QQ：800101800</td>
  </tr>
</table>

</body>
</html>
