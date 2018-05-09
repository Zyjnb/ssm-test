<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="addstaff">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
	姓名：<input name="name"  /><br>
	性别：<input name="sex"   type="radio" value="0"/>女<input name="sex"  id="sex" type="radio" value="1"/>男<br>
	生日：<input type="text" class="Wdate" name="creatDate" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br>
	电话：<input name="phone"  /><br>
	邮箱：<input name="email"  /><br>
</form>
</body>
</html>