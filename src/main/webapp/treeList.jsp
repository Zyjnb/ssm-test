<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="treeList">
<input type="hidden" id="roleId" name="roleid">
<input type="hidden" id="treeId" name="treeidlist">
<div id="tree_list"></div>
</form>
<script type="text/javascript">
	var ids=<%=request.getParameter("id")%>;
	
	$(function () {
		$("#roleId").val(ids);
		   $.ajax({
    		   url:"<%=request.getContextPath()%>/treeController/queryTree.do",
    		   data:{"roleid":ids},
    		   type:"post",
    		   dataType:"json",
    		   success:function(data){
    			   $("#tree_list").tree({
    				   method:"post",
    			      checkbox:true,
    			      parentField:'pid',//实体类定义的pid一致
    			      data:data
    			   })
    		   },error:function(){
    			   alert("");
    		   }
    		   
    	   })
	})
</script>
</body>
</html>