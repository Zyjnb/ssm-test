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
		<div  class="easyui-linkbutton" onclick="addStaff()" data-options="iconCls:'icon-add',plain:true">新增</div>
		<div  class="easyui-linkbutton" onclick="deleteStaff()" data-options="iconCls:'icon-remove',plain:true">删除</div>
		<div  class="easyui-linkbutton" onclick="updateStaff()"data-options="iconCls:'icon-edit',plain:true">修改</div>
	</div> 
</table>  
<div id="dialog_add"></div>
<div id="dialog_role"></div>
<div id="dialog_update"></div>
	<script type="text/javascript">
	$('#dg').datagrid({    
	    url:'<%=request.getContextPath()%>/StaffAction!selStaff.action', 
	    fitColumns:true,
	    checkOnSelect:false,
	    ctrlSelect:true,
	    striped:true,
	    selectOnCheck:false,
	    striped:true,
	    columns:[[  
	              {field:'id',title:'编号',align:'center',width:200},    
		          {field:'name',title:'姓名',align:'center',width:200},    
		          {field:'sex',title:'性别',align:'center',width:200,
		        	  formatter: function(value,row,index){
		        		  var tol ="男";
						  if(row.sex==0){
							  tol=="女"
						  }
						  return tol;
					 }
		          },    
		          {field:'creatDate',title:'生日',align:'center',width:200,
		        	  formatter: function(value,row,index){
		        		  var date =new Date(value);
						  var tol=date.toLocaleDateString(date);
						  return tol;
					 }
		          },    
		          {field:'phone',title:'电话',align:'center',width:200},    
		          {field:'email',title:'邮箱',align:'center',width:200},    
	    ]]    
	})
	function addStaff() {
		 $("#dialog_add").dialog({
			    title: '新增用户',    
			    width: 400,    
			    height: 200,    
			    closed: false,    
			    cache: false,
			    href:"<%=request.getContextPath()%>/addStaff.jsp",
			    modal: true ,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/StaffAction!addStaff.action",
							data:$("#addstaff").serialize(),
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
	function updateStaff() {
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
			      href:"<%=request.getContextPath()%>/updateStaff.jsp?id="+ids[0].id,
			    toolbar:[{
					text:'保存',
					iconCls:'icon-edit',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/StaffAction!updateStaff.action",
							data:$("#updatestaff").serialize(),
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
	function deleteStaff() {
		var ids=$("#dg").datagrid("getSelections");
		console.log(ids[0].id)
		if(ids.length!=1){
			  alert('请选择要删除的那一项'); 
		  }else{
			
						$.ajax({
							url:"<%=request.getContextPath()%>/StaffAction!deleteStaff.action",
							data:{"id":ids[0].id},
							//dataType:"json",
							type:"post",
							success:function(){
								$("#dialog_update").dialog("close");
								$("#dg").datagrid("reload");
								
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
						$.ajax({
							url:"<%=request.getContextPath()%>/RoleAction!addTree.action",
							data:$("#role").serialize(),
							type:"post",
							success:function(){
								$("#dialog_role").dialog("close");
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
						$("#dialog_role").dialog("close");
					}
				}]
		 })
	}
	</script>
</body>
</html>