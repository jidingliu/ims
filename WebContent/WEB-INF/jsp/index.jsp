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
</head>
<body>
<div id="main">
	<!-- 导入共用header.jsp -->
    <jsp:include page="include/header.jsp"></jsp:include>
    <div class="content">
    	<div class="congw">
             <div class="clear"></div>
            <div class="box">
            <c:forEach items="${categorys}" var="c" varStatus="state">
            	<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">${c.name }</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="toList.action?id=${c.id }"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
					<c:forEach items="${c.articles }" var="a" >                    	
                        	<li>
                            	<a href="content.action?id=${a.id }" class="txt_title">
                            		${a.title }
                            	</a>
                            	<span class="txt_discipline">${a.author }</span>
                            	<span class="txt_time">
                            	<fmt:formatDate value="${a.publisurDate }" pattern="yy/MM/dd" />
                            	</span>
                            </li>
                    </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- 每当输入三个box_b在其后输入一个clear(空开与上面的距离)-->
                <c:if test="${state.index==2 ||state.index==5 }">
                	<div class="clear"></div>
                </c:if>
                </c:forEach>
            </div>
            
            <div class="link">
            	<div class="linelink">
            		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海杰普软件科技有限公司</a><a href="javascript:void(0)">郑州轻工学院</a><a href="javascript:void(0)">郑州大学</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 导入底部文件 -->
    <jsp:include page="include/footer.jsp"></jsp:include>
</div>
</body>
</html>
