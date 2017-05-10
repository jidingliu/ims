<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=path%>">
<title>addCategory</title>
<script>
$(function(){
	$("form").off("submit");
	$("form").on("submit",function(){
		
		//异步提交
		$("form").ajaxSubmit(function(){
			//alert(1);
			$.get('checkcatall', {
				name:$("input[name='name']").val(),
				code:$("input[name='code']").val()
			}, function(data) {
				alert(data.ms);
				$("form input").val("");//清空表单内容
			}, 'json');
		});
		//阻止表单的默认提交行为
		return false;
	});
	
	$("input[name='name']").blur(function(){
		$.get('checkcat', {
			name:$("input[name='name']").val()
		}, function(data) {
			$("#sp").html('<FONT  color=#ff0000>'+data.msg+'</FONT>')
			//alert(data.msg);
		}, 'json');
   });

});
</script>	

</head>
<body>

<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
		<form  method="post">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">添加栏目</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">栏目名称：</td>
								<td class="pl5"><input type="text" name="name"><span id="sp"></span></td>
							</tr>
							<tr>
								<td class="tr" width="80">栏目编号：</td>
								<td class="pl5"><input  onkeyup="if(!/^\d+$/.test(this.value)) {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}" type="text" name="code"><FONT  color=#ff0000>*编号必须为数字</FONT></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">发布</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>