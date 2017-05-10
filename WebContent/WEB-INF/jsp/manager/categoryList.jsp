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
<title>categoryList</title>
<style type="text/css">
.btn_left {
	position: absolute;
	bottom: 30px;
	margin-left: 10px
}
</style>
<script>
$(function(){
	//为删除图标绑定事件
	$(".pl5 .ico_del").off("click");
	$(".pl5 .ico_del").on("click",function(){
		//获取点击元素的id
		var id = $(this).attr("val");
		//通过ajax删除id为id的栏目
		$.post("deleteCategory.action",{
			"category.id":id	//参数
		},function(){			//回调函数
			alert("删除成功");
			//模拟点击"栏目管理"
			$("span:contains('栏目管理')").trigger("click");
		});
	});
	//为修改图标绑定事件
	$(".pl5 .ico_edit").off("click");
	$(".pl5 .ico_edit").on("click",function(){
		//获取要修改元素的id
		var id = $(this).attr("val");
		//将class为"rightContent"的元素替换为action返回页面
		$(".rightContent").load("updateCategory",{
			"category.id":id
		});
	});
	
	
});
</script>
</head>
<body>




<div class="divtable">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="tab1">
		<tbody>
			<tr>
				<th class="tl pl5">栏目名称</th>
				<th class="tl pl5">栏目编号</th>
				<th class="tl pl5">操作</th>
			</tr>
			<c:forEach items="${list}" var="category">
			<tr>
				<td class="pl5">${category.name}</td>
				<td class="pl5"><span class="fontLv">
					${category.code}</span>
				</td>
				<td class="pl5">
					<span class="ico_edit" val="${category.id }"></span>
					<span class="ico_del ml5" val="${category.id }"></span>
				</td>
			</tr>
			</c:forEach>
			
			
			
		</tbody>
	</table>
</div>
<div class="btn_left">
	<!-- <span class="btnL"><em class="btnR">添加</em></span> -->
	<!-- <span class="btnL"><em class="btnR">推荐</em></span>  -->
</div>
</body>
</html>