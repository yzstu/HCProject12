<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <base href="<%=basePath%>HC/">
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
        <td width="30%" align="right"> <a href="../regist.jsp">注册</a> |
       	<c:choose>
       		<c:when test="${empty account}">
       			<a href="../login.jsp">登录</a>
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
        <td width="130" align="center"><a href="about.jsp" class="dao">关于华成</a></td>
        <td width="2" align="center"><img src="images/top_22.png" width="2" height="40" /></td>
        <td width="130" align="center"  bgcolor="#076f9b"><a href="<%=basePath%>newsShowServlet?type=2" class="dao">农业资讯</a></td>
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
    <!-- <td width="1000" height="190" valign="middle"><img src="images/new_03.jpg" width="1000" height="150" /></td> -->
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212" valign="top"><table border="0" cellpadding="0" cellspacing="10" bgcolor="#FFFFFF" class="bk_e4e4e4">
      <tr>
        <td width="190"><table border="0" cellspacing="10" cellpadding="0">
          <tr>
            <td align="right"><span  class="font_18 fotn_999">新闻资讯</span><br />
                <span class="font_0A8BC4  font_24">News</span></td>
          </tr>
          <tr>
            <td height="27" align="left" background="images/left_07.jpg" class="font_fff" style=" padding-left:10px;">新闻资讯</td>
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
            <td height="30" align="left" class="font_14"><strong class="font_16">农业资讯</strong></td>
          </tr>
          <tr>
            <td height="3" background="images/about_49.jpg"></td>
          </tr>
          <tr>
            <td valign="top">
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0">
            <c:set var="totalNews" value="${requestScope.totalNews}" />
					<c:set var="newssPerPage" value="${requestScope.newssPerPage}" />
					<c:set var="totalPages" value="${requestScope.totalPages}" />
					<c:set var="beginIndex" value="${requestScope.beginIndex}" />
					<c:set var="endIndex" value="${requestScope.endIndex}" />
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="currentPageNewss"
						value="${requestScope.newss.subList(beginIndex,endIndex)}" />
            			<c:forEach var="news" items="${currentPageNewss}">
							<tr height="40px">
								<td width="3%" align="center" class="dhx font_st font_14">·</td>
								<td width="86%" align="left" class="dhx"><a href="<%=basePath%>newsSiteShowServlet?no=${news.getNo() }" target="_blank">${news.getTitle() }</a></td>
								<td align="left" class="dhx fotn_999">${news.getTime() }</td>
							</tr>
						</c:forEach>
            </table>
            <div class="paging">
						<ul class="pagination">
							<a href="<c:url value="/newsShowServlet?page=1"/>">首页</a>
							<a href="<c:url value="/newsShowServlet?page=${page-1>1?page-1:1}"/>">上一页</a>

							<c:forEach begin="1" end="${totalPages}" varStatus="loop">
								<c:set var="active" value="${loop.index==page?'active':''}" />
								<a href="<c:url value="/newsShowServlet?page=${loop.index}"/>">${loop.index}</a>

							</c:forEach>

							<a href=" <c:url value="/newsShowServlet?page=${page+1<totalPages?page+1:totalPages }"/> ">下一页</a>

							<a href="<c:url value="/newsShowServlet?page=${totalPages }"/>">尾页</a>
						</ul>
					</div></td>
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
