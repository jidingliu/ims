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
<title>articleList</title>
<style type="text/css">
.btn_left {
	position: absolute;
	bottom: 30px;
	margin-left: 10px
}
</style>
<script>
$(function(){
	//alert("测试");
	
	//为删除图标绑定事件
	$(".divtable").off("click");
	$(".divtable").on("click",".pl5 .ico_del",function(){
		alert("删除");
		//获取点击元素的id
		var id = $(this).attr("val");
		//通过ajax删除id为id的栏目
		$.post("deleteArticle.action",{
			"article.id":id	//参数
		},function(){			//回调函数
			alert("删除成功");
			//模拟点击"栏目管理"
			$("span:contains('信息管理')").trigger("click");
		});
	});

	//为修改图标绑定事件
	//$(".divtable").off("click");
	$(".divtable").on("click",".pl5 .ico_edit",function(){
		alert("修改");
		//获取要修改元素的id
		var id = $(this).attr("val");
		//将class为"rightContent"的元素替换为action返回页面
		$(".rightContent").load("updateArticleInfo",{
			"article.id":id
		});
	});
	//为查询绑定事件
	$("form").off("submit");
	$("form").on("submit",function(){
		$(".divtable").load($(this).attr("action"),{
			key:$(this).find("select[name='key']").val(),
			value:$(this).find("input[name='value']").val()
		});
		//阻止表单的默认提交行为
		return false;
	});
	$("form").submit();
});


</script>
</head>
<body>


<div class="c_condition">
<form action="articleListContent.action" method="post">
	<span>
		<select name="key">
			<option value="">-请选择-</option>
			<option value="title">标题</option>
			<option value="author">作者</option>
			<option value="category">栏目</option>
		</select>
	</span>
	<span>关键字：<input type="text" name="value"></span> 
	<button class="btn_gray">搜索</button>
</form>	
</div>
<!-- 内容 -->
<div class="divtable">
</div>
<div class="btn_left">
	<!-- <span class="btnL"><em class="btnR">添加</em></span> -->
	<!-- <span class="btnL"><em class="btnR">推荐</em></span>  -->
</div>
</body>
</html>