<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="update_user_form">
		<input name="id" id="id"><br>
		姓名：<input name="name" id="name"><br>
		年龄：<input name="age" id="age"><br>
		账号：<input name="loginname" id="loginname"><br>
		密码：<input name="pwd" id="pwd"><br>
</form>
<script type="text/javascript">

$(function () {
	var ids = <%=request.getParameter("id")%>

	$.ajax({
		url:"<%=request.getContextPath()%>/userController/queryUser.do",
		data:{"id":ids},
		dataType:"JSON",
		type:"POST",
		success:function(res){
			/* var obj=eval('('+res+')'); */
			console.log(res)
			$("#name").val(res.name);
			$("#id").val(res.id);
			$("#age").val(res.age);
			$("#loginname").val(res.loginname);
			$("#pwd").val(res.pwd);
		},
		error:function(){
			alert("出错了")
		}
	})
})
</script>
</body>
</html>