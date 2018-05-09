<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/EasyUI/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/EasyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/EasyUI/themes/default/easyui.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/EasyUI/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/EasyUI/util-js.js"></script>
    <script src="<%=request.getContextPath() %>/js/highcharts.js"></script>
    <script src="<%=request.getContextPath() %>/js/exporting.js"></script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north',title:'North Title',split:true" style="height:150px;">

    </div>   
    <div data-options="region:'west',title:'West',split:true" style="width:210px;">
    <ul id="tt" class="easyui-tree">  
    	
    </ul>  
    	
    </div>   
    <div data-options="region:'center',title:'center title'" style="padding:5px">
    	
		<div id="tabs" class="easyui-tabs" data-options="fit:true">   
		    <div title="首页" style="padding:20px">   
		        	作业
		    </div>   
		</div>  
    	
    	
    </div>   
</body>  
<script type="text/javascript">


$("#tt").tree({

	  url:"<%=request.getContextPath()%>/treeController/QuertTreeList.do",
	  method:"post",
	  checkbox:true,
	  parentField:'pid',//实体类定义的pid一致
	  onSelect:function(node){

		 if(node.url!=""&&node.url!=null){
			 var flag=$("#tabs").tabs('exists',node.text);
		 if(flag){
			 $("#tabs").tabs('select',node.text);
		 }else{
			 $("#tabs").tabs('add',{
				  title:node.text,
				  href:"<%=request.getContextPath()%>/"+node.url,
				  closable:true,
				  
			  })
		 }
		 }
	  }
})

</script>
</html>