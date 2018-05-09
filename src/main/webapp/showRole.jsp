<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="showRole">   
   	<div id="tb">
		<div  class="easyui-linkbutton" onclick="addRole()" data-options="iconCls:'icon-add',plain:true">新增</div>
		<div  class="easyui-linkbutton" onclick="deleteRole()" data-options="iconCls:'icon-remove',plain:true">删除</div>
		<div  class="easyui-linkbutton" onclick="updateRole()"data-options="iconCls:'icon-edit',plain:true">修改</div>
	</div> 
</table>  
<div id="dialog_add"></div>
<div id="dialog_role"></div>
<div id="dialog_update"></div>
	<script type="text/javascript">
	$('#showRole').datagrid({    
	    url:'<%=request.getContextPath()%>/RoleController/selectRoleAll.do',
	    fitColumns:true,
	    checkOnSelect:false,
	    ctrlSelect:true,
	    striped:true,
	    selectOnCheck:false,
	    striped:true,
	    columns:[[  
	              {field:'id',title:'编号',align:'center',width:200},    
		          {field:'name',title:'姓名',align:'center',width:200},    
		          {field:'desciption',title:'描述',align:'center',width:200},    
		          {field:'createtime',title:'创建时间',align:'center',width:200,
		        	  formatter: function(value,row,index){
		        		  var date =new Date(value);
						  var tol=date.toLocaleDateString(date);
						  return tol;
					 },      
		          },    
		          {field:'updatetime',title:'修改时间',align:'center',width:200,
		        	  formatter: function(value,row,index){
		        		  var date =new Date(value);
						  var tol=date.toLocaleDateString(date);
						  return tol;
					 },  
		          }, 
				  {field:'            ',title:'分配权限',align:'center',width:200,
			          formatter: function(value,row,index){
						return "<input type='button' onclick='fpqx("+row.id+")' value='分配权限'>"; 
					 },  
		          }
	    ]]    
	})
	function addRole() {
		 $("#dialog_add").dialog({
			    title: '新增角色',    
			    width: 400,    
			    height: 200,    
			    closed: false,    
			    cache: false,
			    href:"<%=request.getContextPath()%>/addRole.jsp",
			    modal: true ,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/RoleController/addRoles.do",
							data:$("#addrole").serialize(),
							type:"post",
							success:function(){
								$("#dialog_add").dialog("close");
								$("#showRole").datagrid("reload");
								
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
	function updateRole() {
		var ids=$("#showRole").datagrid("getSelections");
		console.log(ids[0].id)
		if(ids.length!=1){
			  $.messager.alert('请选择要修改的那一项'); 
		  }else{
			  $("#dialog_update").dialog({
				  title:"修改角色",
				  width: 400,    
			      height: 200,    
			      closed: false,    
			      cache: false,
			      href:"<%=request.getContextPath()%>/updateRole.jsp?id="+ids[0].id,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/ShowRoleAction!updateRole.action",
							data:$("#updrole").serialize(),
							dataType:"json",
							type:"post",
							success:function(){
								$("#dialog_update").dialog("close");
								$("#showRole").datagrid("reload");
								
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
	function deleteRole() {
		var ids=$("#showRole").datagrid("getSelections");
		console.log(ids[0].id)
		if(ids.length!=1){
			  alert('请选择要删除的那一项'); 
		  }else{
			
						$.ajax({
							url:"<%=request.getContextPath()%>/ShowRoleAction!deleteRole.action",
							data:{"id":ids[0].id},
							//dataType:"json",
							type:"post",
							success:function(){
								alert('删除成功'); 
								$("#showRole").datagrid("reload");
							},error:function(){
								alert('修改出错'); 
							}
						})
		  }		
	}
	function fpqx(ids){
		 $("#dialog_role").dialog({
			    title: '分配权限',    
			    width: 400,    
			    height: 500,    
			    closed: false,    
			    cache: false,
			    href:"<%=request.getContextPath()%>/treeList.jsp?id="+ids,
			    modal: true ,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						var node=$("#tree_list").tree("getChecked");
      					var ids ="";
      					 for (var i = 0; i < node.length; i++) {
							ids+=","+node[i].id;
						}
      					 ids=ids.substring(1);
      					 $("#treeId").val(ids);
						$.ajax({
							url:"<%=request.getContextPath()%>/treeController/addTree.do",
							data:$("#treeList").serialize(),
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