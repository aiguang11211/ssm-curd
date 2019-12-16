<%--
  Created by IntelliJ IDEA.
  User: 拉布拉多搭
  Date: 2019/8/21
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <meta charset="utf-8">
    <title>污水信息查询系统</title>
    <script src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH }/static/js/echarts.min.js" ></script>
    <link href="${APP_PATH }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/list.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>


<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand" id="head"></h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li ><a href="${APP_PATH}/layout">退出</a></li>
                        </ul>

                    </nav>

                </div>
            </div>
            <br/><br/>

            <div >
                开始时间：<input type="datetime-local" id="startTime" value="2019-08-20T00:00:00" style="color:black;">
                &nbsp;

                结束时间：<input type="datetime-local" id="endTime" value="2019-08-22T00:00:00" style="color:black;">
                &nbsp;
                <button type="button" class="btn btn-default" onclick="select()">查询</button>
            </div>
            <br/>

            <div class="inner cover ">
                <div id="main" style="width: 800px;height:600px;"></div>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>污水信息查询系统</p>

                </div>

            </div>

        </div>

    </div>

</div>

    <script type="text/javascript">
        var flag=-1;
        // 基于准备好的dom，初始化echarts实例
        $(function () {
            flag=${user};
            if(flag==1){
                $("#head").text("鼎湖山");
                getDate_0();
            }else{
                $("#head").text("七星岩");
                getDate_1();
            }

        })

        function select(){

            $.ajax({
                url:"${APP_PATH }/selectInfosWithTime",
                type:"GET",
                data:{flag:flag,startTime:$("#startTime").val(),endTime:$("#endTime").val()},
                dataType: "json",
                success: function (data) {   //回调函数
                    to_page_0(JSON.parse(data.extend.infos));
                }
            })
        }




        function getDate_0() {
            $.ajax({
                url:"${APP_PATH }/selectInfos_0",
                type:"GET",
                dataType: "json",
                success: function (data) {   //回调函数
                    to_page_0(JSON.parse(data.extend.infos));
                }
            })
        }

        function getDate_1() {

            $.ajax({
                url:"${APP_PATH }/selectInfos_1",
                type:"GET",
                dataType: "json",
                success: function (data) {   //回调函数
                    to_page_0(JSON.parse(data.extend.infos));
                }
            })
        }

        function to_page_0(data){

            var myChart = echarts.init(document.getElementById('main'));
            myChart.clear();
            var dateList = data.map(function (item) {
                return item[0];
            });
            var valueList = data.map(function (item) {
                return item[1];
            });

            option = {

                // Make gradient line here
                visualMap: [{
                    show: false,
                    type: 'continuous',
                    seriesIndex: 0,
                    min: 0,
                    max: 3000
                }],


                title: [{

                    left: 'center',
                    text: 'Gradient along the y axis'
                }],
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: [{
                    data: dateList,
                    name:'日期',

                    axisLine: {
                        lineStyle: {
                            type: 'solid',
                            color: '#fff',//左边线的颜色
                            width:'2'//坐标线的宽度
                        }
                    },
                    axisLabel: {

                        rotate: 20, // 20度角倾斜显示(***这里是关键)
                        textStyle: {
                            color: '#00c5d7'
                        }
                    }
                }],
                yAxis: [{
                    splitLine: {show: false},
                    name:'NTU(100以上为高污染)',
                    axisLine: {
                        lineStyle: {
                            type: 'solid',
                            color: '#fff',//左边线的颜色
                            width:'2'//坐标线的宽度
                        }
                    }
                }],
                grid: [{
                    bottom: '60%'
                }],
                series: [{
                    type: 'line',
                    showSymbol: false,
                    data: valueList
                }]
            };
            myChart.setOption(option);
        }

    </script>
    </body>
</html>
