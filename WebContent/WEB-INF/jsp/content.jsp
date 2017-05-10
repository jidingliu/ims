<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=path%>">
<title>杰普信息管理系统</title>
<link rel="stylesheet" type="text/css" href="theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/front/style.css">

<c:if test="${msg != null}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>

</head>

<body>
<div id="main">
   
	<div class="top">
    	<div class="topbg">
            <div class="logo_sign">
            	<div class="logo"></div>
                <div class="sign">
                	<form action="manager/toHome.action" name="form" method="post" id="login" onsubmit="return checkLoginForm();">
                    <!-- <span class="sp_backstage">
                    		<a href="manager/toHome.action">后台管理</a>
                    </span> -->
                    <table >
									<tr>
									<td>
									<span class="sp_home"><a href="index">首页</a>  </span>
									</td>
									<td>
										管理账号：
										<input type="text" name="nickname" style="width: 80px" />
									</td>
									<td>
										密码：
										<input type="password" name="password"
											style="width: 80px; height: 15px" />
									</td>
									<td>
									<input type="submit" style="background-color:skyblue" value="进入后台" height="15px" />
									</td>
									</tr>
								</table>
                    </form>
                </div>
            </div> 
            <div class="nav">
            	<ul class="navUI">
                	<li><a href="index">首页</a></li>
                    <c:forEach items="${categorys}" var="category">
                    <li><a href="toList.action?id=${category.id}">${category.name}</a></li>
                	</c:forEach>
               
                </ul>
            </div>
            <div class="banner">
            	<div class="banimg"><img width="1072" height="241" src="theme/1/images/front/banner.png"></div>
            </div>
        </div>
    </div>


    <div class="content">
    	<div class="congw">
           <div class="conarticle">
                    <div class="position">
                    	<span class="poshome">您现在的位置：</span>
                        <a href="index">首页</a> >> 
                        <a href="toList.action?id=${c.id}">
                        	${c.name }
                        </a>
                    </div>
                    <div class="title">${article.title}</div>
                    <div class="abstract">
                    	<span>更新时间：<fmt:formatDate value="${article.publisurDate }" pattern="yy/MM/dd" /></span>
                        <span>发布人：${article.author}</span>
                        <span>点击${article.clickTimes}次</span>
                    </div>
                    <div class="details">
						<center>
                    		<p>${article.content}</p>
						</center>
                    </div>
           </div>
            <div class="link">
            	<div class="linelink">
            		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a>
                </div>
            </div>
        </div>
    </div>
  
  <div class="footer">
    	<div class="foot">
        	<p>杰普信息发布系统 技术支持：<a href="javascript:void(0)">上海杰普软件科技有限公司</a>      电话：021-xxxxxxx</p>
        </div>
    </div>


</div>
</body>
</html>