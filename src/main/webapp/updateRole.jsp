<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="updrole">
		角色名称：<input name="name" id="name"/><br>
		角色描述：<input name="desciption" id="desciption"/><br>
		<input name="id" id="id">
	</form>
	<script type="text/javascript">
	$(function () {
		var ids = <%=request.getParameter("id")%>
		alert(ids);
		$.ajax({
			url:"<%=request.getContextPath()%>/ShowRoleAction!queryRole.action",
			data:{"id":ids},
			dataType:"JSON",
			type:"POST",
			success:function(res){
				/* var obj=eval('('+res+')'); */
				console.log(res)
				$("#name").val(res.name);
				$("#id").val(res.id);
				$("#desciption").val(res.desciption);
			},
			error:function(){
				alert("出错了")
			}
		})
	})
	</script>
</body>
</html>