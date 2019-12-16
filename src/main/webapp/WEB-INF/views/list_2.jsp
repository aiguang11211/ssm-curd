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


<%--    ${infos }--%>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="color: black;">联系方式</h4>
            </div>
            <div class="modal-body" style="color: black;">
                地点：鼎湖山<br/>
                名字：张三<br/>
                电话:13035846068<br/>
                <br/>
                <br/>
                地点：七星岩<br/>
                名字：李四<br/>
                电话：13035844088<br/>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div>
    </div>
</div>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">管理员</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li id="li_1" class="active"><a onclick="getDate_all()">整体数据</a></li>
                            <li id="li_2"><a onclick="getDate_0()">鼎湖山数据</a></li>
                            <li id="li_3"><a onclick="getDate_1()">七星岩数据</a></li>
                            <li ><a href="${APP_PATH}/layout">退出</a></li>

                        </ul>
                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                            联系检测员
                        </button>
                    </nav>

                </div>
            </div>
            <br/><br/>
            <br/><br/>
            <div hidden id="time">
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
            getDate_all();
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

        function removeAction() {
            $("li").removeClass("active");
        }
        function getDate_all() {
            flag=-1;
            removeAction();
            $("#li_1").addClass("" +
                "active");
            $("#time").attr("hidden","hidden");
            $.ajax({
                url:"${APP_PATH }/selectInfos_all",
                type:"GET",
                dataType: "json",
                success: function (data) {   //回调函数
                    to_page_all(JSON.parse(data.extend.infos_0),JSON.parse(data.extend.infos_1));
                }
                })
        }

        function getDate_0() {
            flag=0;
            removeAction();
            $("#li_2").addClass("" +
                "active");
            $("#time").removeAttr("hidden");
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
            flag=1;
            removeAction();
            $("#li_3").addClass("" +
                "active");
            $("#time").removeAttr("hidden");
            $.ajax({
                url:"${APP_PATH }/selectInfos_1",
                type:"GET",
                dataType: "json",
                success: function (data) {   //回调函数
                    to_page_0(JSON.parse(data.extend.infos));
                }
            })
        }
        function to_page_all(data,data2){
            var myChart = echarts.init(document.getElementById('main'));
            myChart.clear();
            var dateList = data.map(function (item) {
                return item[0];
            });
            var valueList = data.map(function (item) {
                return item[1];
            });
            var dateList_2 = data2.map(function (item) {
                return item[0];
            });
            var valueList_2 = data2.map(function (item) {
                return item[1];
            });

            // 指定图表的配置项和数据
            option = {

                // Make gradient line here
                visualMap: [{
                    show: false,
                    type: 'continuous',
                    seriesIndex: 0,
                    min: 0,
                    max: 3000
                }, {
                    show: false,
                    type: 'continuous',
                    seriesIndex: 1,
                    min: 0,
                    max: 3000
            }],


                title: [{
                    left: 'center',
                    text: '鼎湖山',
                    textStyle:{
                        color: '#fff',//左边线的颜色
                    }
                }, {
                    top: '50%',
                    left: 'center',
                    text: '七星岩',
                    textStyle:{
                        color: '#fff',//左边线的颜色
                    }
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
                }, {
                    data: dateList_2,
                    name:'日期',
                    gridIndex: 1,
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
                }, {
                    splitLine: {show: false},
                    name:'NTU(100以上为高污染)',
                    gridIndex: 1,
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
                }, {
                    top: '60%'
                }],
                series: [{
                    type: 'line',
                    showSymbol: false,
                    data: valueList
                }, {
                    type: 'line',
                    showSymbol: false,
                    data: valueList_2,
                    xAxisIndex: 1,
                    yAxisIndex: 1
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
        function to_page_0(data){

            var myChart = echarts.init(document.getElementById('main'));
            myChart.clear();
            var dateList = data.map(function (item) {
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
