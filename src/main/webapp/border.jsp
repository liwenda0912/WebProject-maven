<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2023/11/7
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.3.2/echarts.min.js"></script>

<%--<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.js" type="text/javascript" charset="utf-8"></script>--%>
<style>
    #container{
        width: 608px;
        height: 180px;
        padding-bottom:40px;
    }
</style>
<body>
<div id="container"></div>
<script>
    const PieEChart = echarts.init(document.getElementById("container"),'pie');
    const PieOption = {
        title: {
            text: '各商品销量占比',
            subtext: 'A商场情况分析',
            // left: 'left'
        },
        tooltip: {
            trigger: 'item',
            // formatter: '{a} <br/>{b} : {c} ({d}%)'
            // formatter: '{b}: {c} ({d}%)'
            formatter: '{b}: ({d}%)'
        },
        label: {
            show: true,
            formatter: '{b}: {d}%'
        },
        toolbox: {
            right:15,
            feature: {
                saveAsImage: {}
            }
        },
        legend: {
            // type: 'scroll',
            // orient: 'horizontal', // 水平布局
            // align: 'left', // 图例组件在容器中水平对齐方式
            // left: 10, // 图例组件离容器左侧的距离
            // top: 10, // 图例组件离容器顶部的距离
            // itemWidth: 14,
            // itemHeight: 5,
            // formatter: function (name) {
            //     // 如果需要，这里可以自定义图例文本的格式
            //     return name;
            // },
            type: 'scroll',
            align: 'left', // 图例组件在容器中水平对齐方式
            // left: 130, // 图例组件离容器左侧的距离
            top: 160,
            bottom: 0, // 图例组件离容器顶部的距离
            // left: 'center',
            // bottom: 'center',
            // selectedMode: false,
            // bottom: -30,
            orient: 'horizontal',
            data: []
                // ["处方点评",
                // "抗生素使用情况",
                // "医用耗材、试剂",
                // "大型医疗设备检查",
                // "医疗收费",
                // "廉洁行医",
                // "统方管理"]
        },
        series: [
            {
                // name: '所售商品',
                type: 'pie',
                radius: ['50%', '70%'],
                data:[]
                //     [
                //     {
                //         "value": 10,
                //         "name": "处方点评"
                //     },
                //     {
                //         "value": 20,
                //         "name": "抗生素使用情况"
                //     },
                //     {
                //         "value": 30,
                //         "name": "医用耗材、试剂"
                //     },
                //     {
                //         "value": 40,
                //         "name": "大型医疗设备检查"
                //     },
                //     {
                //         "value": 50,
                //         "name": "医疗收费"
                //     },
                //     {
                //         "value": 70,
                //         "name": "廉洁行医"
                //     },
                //     {
                //         "value": 80,
                //         "name": "统方管理"
                //     }
                // ],
            }
        ]
    };
    PieEChart.setOption(PieOption);
    const PieOption_data ={
        legend:{
            type: 'scroll',
            align: 'left', // 图例组件在容器中水平对齐方式
            // left: 130, // 图例组件离容器左侧的距离
            top: 160,
            bottom: 0, // 图例组件离容器顶部的距离
            // left: 'center',
            // bottom: 'center',
            // selectedMode: false,
            // bottom: -30,
            orient: 'horizontal',
            data:
            ["处方点评",
            "抗生素使用情况",
            "医用耗材、试剂",
            "大型医疗设备检查",
            "医疗收费",
            "廉洁行医",
            "统方管理"]
        },
        series: [{
            type: 'pie',
            radius: ['50%', '70%'],
            data: [
                {
                    "value": 10,
                    "name": "处方点评"
                },
                {
                    "value": 20,
                    "name": "抗生素使用情况"
                },
                {
                    "value": 30,
                    "name": "医用耗材、试剂"
                },
                {
                    "value": 40,
                    "name": "大型医疗设备检查"
                },
                {
                    "value": 50,
                    "name": "医疗收费"
                },
                {
                    "value": 70,
                    "name": "廉洁行医"
                },
                {
                    "value": 80,
                    "name": "统方管理"
                }
            ],
        }

        ]
    }
    setTimeout(()=>{
        console.log(4444)
        PieEChart.setOption(PieOption_data)
    },5000)

    // var  pie_=new Vue({
    //     el:"#container",
    //     methods:{
    //         onshow(){
    //             console.log(888555)
    //
    //         }
    //     }    })
</script>
</body>
</html>
