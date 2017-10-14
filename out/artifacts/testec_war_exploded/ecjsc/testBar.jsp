<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'map.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${ctx }/ui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts-s/echarts-3.2.3/dist/echarts.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts-s/echarts-3.2.3/options/cofopts.js"></script>
</head>

<body>
<div style="width: 600px;height: 400px;">
    <div id="bar" style="width: 600px;height: 400px;"></div>
</div>
<script type="text/javascript">
    var barChart;
    $(function () {
        barChart = echarts.init(document.getElementById("bar"));

        showBar();
    });

    function showBar() {
        var barOpt = getSmtBarOpt();
        barChart.setOption(barOpt);
    }

    /////////////////////////////
    //柱状图
    function getSmtBarOpt() {
        var barOpt = {
            color: ['#04A3AA'],
            backgroundColor:new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0, color: 'red' // 0% 处的颜色
            }, {
                offset: 1, color: 'blue' // 100% 处的颜色
            }], false),
            tooltip: {
                trigger: 'item',
                formatter: "{b} : {c}",
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '5%',
                top: '5%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: [],
                    nameTextStyle: {
                        color: "#fff", // 刻度颜色
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: "#fff",
                            // 刻度颜色

                        },
                        formatter: function (val) {
                            var reval = '';
                            for (var i = 0, len = val.length; i < len; i++) {
                                reval += val.charAt(i) + '\n';
                            }
                            return reval.substring(0, reval.length - 1);
                        }
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    nameTextStyle: {
                        color: "#fff", // 刻度颜色
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: '#082335'
                        }
                    },
                    minInterval: 1,
                    axisLabel: {
                        textStyle: {
                            color: "#083D4D", // 刻度颜色
                        }
                    }
                }
            ],
            series: [
                {
                    name: '数量',
                    type: 'bar',
                    barWidth: '60%',
                    data: []
                }
            ]
        };
        //数据处理
        var tData = [{name: 'Mon', value: 30}, {name: 'Tue', value: 52}, {name: 'Wed', value: 60}, {name: 'Thu', value: 78},
            {name: 'Fri', value: 96}, {name: 'Sat', value: 246}, {name: 'Sun', value: 98}
        ];
        var sData = tData.sort(function (a, b) {
            return b.value - a.value;
        });
        var fData = formatBarData(sData);
        barOpt.xAxis[0].data = fData.ctAData;
        barOpt.series[0].data = fData.serData;
        return barOpt;
    }
</script>
</body>
</html>
