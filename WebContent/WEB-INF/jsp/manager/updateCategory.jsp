<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=path%>">
<title>updateCategory</title>
</head>
<body>
<script>
$(function(){
	$("form").off("submit");
	$("form").on("submit",function(){
		//异步提交
		$("form").ajaxSubmit(function(){
			$("form input").val("");//清空表单内容
			alert("修改成功");
			//模拟点击"栏目管理"
			$("span:contains('栏目管理')").trigger("click");
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
		<form action="updateCategory.action" method="post">
			<input type="hidden" name="id" value="${category.id }">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改栏目</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">栏目名称：</td>
								<td class="pl5"><input type="text" value="${category.name}" name="name"></td>
							</tr>
							<tr>
								<td class="tr" width="80">栏目编号：</td>
								<td class="pl5"><input type="text" value="${category.code}" name="code"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">修改</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>