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
<title>articleListContent</title>
</head>
<body>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="tab1">
		<tbody>
			<tr>
				<th class="tl pl5">标题</th>
				<th class="tl pl5">所属栏目</th>
				<th class="tl pl5">作者</th>
				<th class="tl pl5">发布日期</th>
				<th class="tl pl5">点击次数</th>
				<th class="tl pl5">操作</th>
			</tr>
			<c:forEach items="${list2}" var="a">
				<tr>
				<td class="pl5">${a.title}</td>
				<td class="pl5">${a.category.name}</td>
				<td class="pl5">${a.author}</td>
				<td class="pl5"><fmt:formatDate value="${a.publisurDate}" pattern="yy/MM/dd" />
				</td>
				<td class="pl5">${a.clickTimes}</td>
				<!-- 拓展 js -->
				<td class="pl5">
					<span class="ico_edit" val="${a.id}"></span>
					<span class="ico_del ml5" val="${a.id }"></span>
				</td>
			</tr>
			</c:forEach>
			
			
		</tbody>
	</table>
</body>
</html>