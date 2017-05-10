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
<title>updateArticleInfo</title>
</head>
<body>
<script>
$(function(){
	$("form").off("submit");
	$("form").on("submit",function(){
		//异步提交
		$("form").ajaxSubmit(function(){
			$("form input").val("");//清空表单内容
			$("form textarea").val("");//清空表单内容
			$("form select").val("");//清空表单内容
			alert("修改成功");
			$("span:contains('信息管理')").trigger("click");
		});
		//阻止表单的默认提交行为
		return false;
	});
	
});
</script>	
<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<form action="updateArticle.action" method="post">
					<input type="hidden" name="id" value="${article1.id }">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改信息</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">标题：</td>
								<td class="pl5"><input type="text" value="${article1.title}" name="title"></td>
							</tr>
							<tr>
								<td class="tr" width="80">作者：</td>
								<td class="pl5"><input type="text" value="${article1.author}" name="author"></td>
							</tr>
							<tr>
								<td class="tr" width="80">所属栏目：</td>
								<td class="pl5">
									<select name="cid">
										<option value="${article1.category.id}">--${article1.category.name}--</option>
										<c:forEach items="${list3}" var="ca">
										<option value="${ca.id}">--${ca.name}--</option>
									</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="content" class="website_edit" cols="100">
										${article1.content}
									</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">修改</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>