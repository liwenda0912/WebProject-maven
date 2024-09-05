<%--
  Created by IntelliJ IDEA.
  User: lwd
  Date: 2023/10/31
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script src="https://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.3.2/echarts.min.js"></script>

<%--<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.js" type="text/javascript" charset="utf-8"></script>--%>
<style>
    #container-bar{
        width: 400px;
        height: 200px;
        background-color: azure;

        /*box-shadow: 0 0 10px blanchedalmond;*/
    }
</style>
<head>
    <title>www.webapp.Controller.pop.com</title>
</head>
<body>
<div id="container-bar"></div>
</body>
<script>
    var d=["data","test","ll","msg",'lls','555'];
    var BarEChart = echarts.init(document.getElementById("container-bar"),'bar');
    var BarOption = {
        title:{
            text:"柱形图"
        },
        tooltip:{},
        xAxis:{
            data: []
            // ["data","test","ll","msg",'lls','555']
        },
        yAxis:{
            // data:[1,5,10,15,20]
        },
        toolbox: {
            right:15,
            feature: {
                saveAsImage: {}
            }
        },
        series:[
            {
                name:"柱形图",
                type:"bar",
                color:['rgb(58 160 255 / 91%)'],
                data:[]
                    // [1,8,3,4,30,50],
            }
        ]
    };
    BarEChart.setOption(BarOption);

    var BarOption_data={
        xAxis: {
            data: d
        },
        series: [{
            // 注意：！！！根据名字对应到相应的系列
            data:[1,8,3,4,30,50],

        }]
    };
    setTimeout(()=>{
        BarEChart.setOption(BarOption_data)
    },5000)
</script>
</html>
