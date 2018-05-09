<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form id="updatestaff">
	<input name="id" type="hidden"  id="id"/>
	姓名：<input name="name"  id="name"/><br>
	性别：<select name="sex"  id="sex" >
			<option value="0">男</option>
			<option value="1">女</option>
		</select><br>
	生日：<input type="text" class="Wdate" name="creatDate"   id="creatDate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br>
	电话：<input name="phone"  id="phone"/><br>
	邮箱：<input name="email"  id="email"/><br>
</form>
<script type="text/javascript">
$(function () {
	var ids = <%=request.getParameter("id")%>
	alert(ids);
	$.ajax({
		url:"<%=request.getContextPath()%>/StaffAction!queryStaff.action",
		data:{"id":ids},
		dataType:"JSON",
		type:"POST",
		success:function(res){
			/* var obj=eval('('+res+')'); */
			console.log(res)
			$("#name").val(res.name);
			$("#id").val(res.id);
			$("#sex").val(res.sex);
			$("#creatDate").val(res.creatDate);
			$("#phone").val(res.phone);
			$("#email").val(res.email);
		},
		error:function(){
			alert("出错了")
		}
	})
})
</script>
</body>
</html>