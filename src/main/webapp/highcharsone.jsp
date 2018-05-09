<%--
  Created by IntelliJ IDEA.
  User: ZYJ
  Date: 2018/5/1
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"<%=request.getContextPath()%>/RoleController/queryChars.do",
            dataType:"JSON",
            type:"POST",
            success:function(res){
                console.log(res)
                name(res);
            }
        })
    })
    function name(res){
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '各个角色所占比'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    },

                }

            },

            series: [{
                name: '占比',
                colorByPoint: true,
                data: res
            }]
        });
    }
</script>
</body>
</html>
