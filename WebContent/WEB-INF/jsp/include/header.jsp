<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=path%>">
<title>header</title>
<c:if test="${msg != null}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>
</head>
<body>
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
                  
                    <!-- <span class="sp_signout">退出</span> -->
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
</body>
</html>