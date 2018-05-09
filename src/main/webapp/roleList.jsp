<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="role">
		
	</form>
	<script type="text/javascript">
		$(function(){
			var ids= <%=request.getParameter("id")%>;
		//	$("#userId").val(ids);
			$.ajax({
				url:"<%=request.getContextPath()%>/RoleController/selectRoleAll.do",
				type:"POST",
				dataType:"JSON",
				success:function(res){
					//console.log(res.length)
					var htl="<input type='hidden' id='userId' name='userid' value='"+ids+"'/>";
					$.each(res,function(){
						htl+="<input name='roleid' type='checkbox' value='"+this.id+"'>"+this.name+""
					})
					$("#role").html(htl);
					$.ajax({
						url:"<%=request.getContextPath()%>/RoleController/selectRole.do",
						type:"POST",
						dataType:"JSON",
						data:{"id":ids},
						success:function(res){
							console.log(res)
							var aa= $("[name='roleid']");
							console.log(aa)
							for(var i=0;i<res.length;i++){
								console.log(res[i].id)
								for(var j=0;j<aa.length;j++){
									if(aa[j].value == res[i].id){
										aa[j].checked = true;
									}
								}
							}
						},
						error:function(){
							alert("查询角色失败")
						}
					})
				},
				error:function(){
					alert("查询角色失败")
				}
			})
			})
			
	</script>
</body>
</html>