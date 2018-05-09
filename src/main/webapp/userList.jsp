<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="dg">   
   	<div id="tbb">
		<div  class="easyui-linkbutton" onclick="addUser()" data-options="iconCls:'icon-add',plain:true">新增</div>
		<div  class="easyui-linkbutton" onclick="deleteUsers()" data-options="iconCls:'icon-remove',plain:true">删除</div>
		<div  class="easyui-linkbutton" onclick="updateUser()"data-options="iconCls:'icon-edit',plain:true">修改</div>
	</div> 
</table>  
<div id="dialog_add"></div>
<div id="dialog_role"></div>
<div id="dialog_update"></div>
	<script type="text/javascript">
	$('#dg').datagrid({    
	    url:'<%=request.getContextPath()%>/userController/queryUserList.do',
	    fitColumns:true,
	    checkOnSelect:false,
	    ctrlSelect:true,
	    striped:true,
	    selectOnCheck:false,
	    striped:true,
	    columns:[[  
	              {field:'id',title:'编号',align:'center',width:200},    
		          {field:'name',title:'姓名',align:'center',width:200},    
		          {field:'age',title:'年龄',align:'center',width:200},    
		          {field:'            ',title:'角色管理',align:'center',width:200,
		        	  formatter: function(value,row,index){
						return "<input type='button' onclick='jsgl("+row.id+")' value='角色管理'>"; 
					 },      
		          }    
	    ]]    
	})
	function addUser() {
		 $("#dialog_add").dialog({
			    title: '新增用户',    
			    width: 400,    
			    height: 200,    
			    closed: false,    
			    cache: false,
			    href:"<%=request.getContextPath()%>/add.jsp",
			    modal: true ,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/userController/addUser.do",
							data:$("#addUser").serialize(),
							type:"post",
							success:function(){
								$("#dialog_add").dialog("close");
								$("#dg").datagrid("reload");
								
							},error:function(){
								 $.messager.alert('提示','代码报错'); 
							}
						})
						
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$("#dialog_add").dialog("close");
					}
				}]
		 })
	}
	function updateUser() {
		var ids=$("#dg").datagrid("getSelections");
		console.log(ids[0].id)
		if(ids.length!=1){
			  $.messager.alert('请选择要修改的那一项'); 
		  }else{
			  $("#dialog_update").dialog({
				  title:"修改用户",
				  width: 400,    
			      height: 200,    
			      closed: false,    
			      cache: false,
			      href:"<%=request.getContextPath()%>/updateUser.jsp?id="+ids[0].id,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/userController/updateUser.do",
							data:$("#update_user_form").serialize(),
							dataType:"json",
							type:"post",
							success:function(){
								$("#dialog_update").dialog("close");
								$("#dg").datagrid("reload");
								
							},error:function(){
								 $.messager.alert('修改出错'); 
							}
						})
						
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$("#dialog_update").dialog("close");
					}
				}]
			  })
		  }		
	}
	function jsgl(ids){
		 $("#dialog_role").dialog({
			    title: '角色管理',    
			    width: 400,    
			    height: 200,    
			    closed: false,    
			    cache: false,
			    href:"<%=request.getContextPath()%>/roleList.jsp?id="+ids,
			    modal: true ,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/RoleController/addRole.do",
							data:$("#role").serialize(),
							type:"post",
							success:function(){
								$("#dialog_role").dialog("close");
								$("#dg").datagrid("reload");
								
							},error:function(){
								 $.messager.alert('提示','代码报错'); 
							}
						})
						
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$("#dialog_role").dialog("close");
					}
				}]
		 })
	}
	</script>
</body>
</html>