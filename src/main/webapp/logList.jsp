<%--
  Created by IntelliJ IDEA.
  User: ZYJ
  Date: 2018/5/1
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table id="log_list"></table>
<script>
    $('#log_list').datagrid({
        url:'<%=request.getContextPath()%>/mongoController/loglist.do',
        fitColumns:true,
        checkOnSelect:false,
        ctrlSelect:true,
        striped:true,
        selectOnCheck:false,
        striped:true,
        columns:[[
            {
                field: 'clazzName',
                title: '类名称'
            }, {
                field: 'methodName',
                title: '方法名称'
            }, {
                field: 'params',
                title: '内容'
            },{
                field: 'time',
                title: '操作时间'
            }
        ]]
    })
</script>
</body>
</html>
