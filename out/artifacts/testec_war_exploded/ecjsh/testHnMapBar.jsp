<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
    <script type="text/javascript" src="${ctx}/ui/echarts-s/echarts-3.2.3/options/cofopts.js"></script>
</head>

<body>
<div id="nrgk_rylbt"
     style="height: 500px;width:900px;background-color: #404a59">
    <div id="rylbMap" style="height: 500px;width:60%;float: left;"></div>
    <div id="rylbBar" style="height: 500px;width:40%;float: left;"></div>
</div>
<script type="text/javascript">
    var hnMapChart, hnBarChart;
    $(function () {

        var hnMapJsonURL = "${ctx}/ui/echarts-s/echarts-3.2.3/map/json/province/hunan.json";
        //贵阳地图
        hnMapChart = initMapGeoJson(hnMapJsonURL, 'hunan', 'rylbMap');
        hnBarChart = echarts.init(document.getElementById('rylbBar'));

        showHnMap();
        showHnBar();

    });

    function showHnBar() {
        var hnBarOpt = getHnBarOpt2();
        var data = [{
            name: "张家界",
            value: 190
        }, {
            name: "岳阳",
            value: 102
        }, {
            name: "常德",
            value: 120
        }, {
            name: "长沙",
            value: 12
        }, {
            name: "湘潭",
            value: 74
        }, {
            name: "株洲",
            value: 18
        }];

        var sorData = data.sort(function (a, b) {
            return a.value - b.value;
        });
        var fmtData = formatBarData(sorData);

        hnBarOpt.yAxis.data = fmtData.ctAData;
        hnBarOpt.series[0].data = fmtData.serData;
        hnBarChart.setOption(hnBarOpt);
    }
    function showHnMap() {
        var geoCoordMap = {
            '张家界': [110.479191, 29.117096],
            '岳阳': [113.09, 29.37],
            '常德': [111.69, 29.05],
            '长沙': [113, 28.21],
            '湘潭': [112.91, 27.87],
            '株洲': [113.16, 27.83]
        };

        var data = [{
            name: "张家界",
            value: 190
        }, {
            name: "岳阳",
            value: 102
        }, {
            name: "常德",
            value: 120
        }, {
            name: "长沙",
            value: 12
        }, {
            name: "湘潭",
            value: 74
        }, {
            name: "株洲",
            value: 18
        }];

        var hnMapOpt = getHnMapOpt2(geoCoordMap, data);

        hnMapChart.setOption(hnMapOpt);
    }
    /////////////////////////
    function getHnMapOpt2(geoCoordMap, data) {
        var convertData = function (data) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var geoCoord = geoCoordMap[data[i].name];
                if (geoCoord) {
                    res.push({
                        name: data[i].name,
                        value: geoCoord.concat(data[i].value)
                    });
                }
            }
            return res;
        };

        var convertedData = [convertData(data),
            convertData(data.sort(function (a, b) {
                return b.value - a.value;
            }).slice(0, 6))];

        var hnMapOpt = {
            backgroundColor: 'agba(255,255,255,0)',
            animation: true,
            animationDuration: 1000,
            animationEasing: 'cubicInOut',
            animationDurationUpdate: 1000,
            animationEasingUpdate: 'cubicInOut',
            title: {
                show: false,
                text: '全国主要城市 PM 2.5',
                subtext: 'data from PM25.in',
                sublink: 'http://www.pm25.in',
                left: 'center',
                textStyle: {
                    color: '#fff'
                }
            },
            toolbox: {
                iconStyle: {
                    normal: {
                        borderColor: '#fff'
                    },
                    emphasis: {
                        borderColor: '#b1e4ff'
                    }
                }
            },
            tooltip: {
                trigger: 'item'
            },
            geo: {
                map: 'hunan',
                top: '2%',
                right: '2%',
                layoutCenter: ['50%', '50%'],
                layoutSize: '98%',
                //center: [117.98561551896913, 31.205000490896193],
                //zoom: 2.5,
                label: {
                    emphasis: {
                        show: false
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        areaColor: '#323c48',
                        borderColor: '#111'
                    },
                    emphasis: {
                        areaColor: '#2a333d'
                    }
                }
            },
            series: [{
                name: 'pm2.5',
                type: 'scatter',
                coordinateSystem: 'geo',
                data: convertedData[0],
                symbolSize: function (val) {
                    return Math.max(val[2] / 10, 8);
                },
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#ddb926'
                    }
                }
            }, {
                name: 'Top 5',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                data: convertedData[1],
                symbolSize: function (val) {
                    return Math.max(val[2] / 10, 8);
                },
                showEffectOn: 'emphasis',
                rippleEffect: {
                    brushType: 'stroke'
                },
                hoverAnimation: true,
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#f4e925',
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                },
                zlevel: 1
            }]
        };
        return hnMapOpt;
    }

    //////////////////////////
    function getHnBarOpt2() {
        var hnBarOpt = {
            backgroundColor: 'rgba(255,255,255,0)',
            color: ['#3398DB'],
            tooltip: {
                trigger: 'item',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '6%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                scale: true,
                minInterval: 1,
                position: 'top',
                boundaryGap: false,
                splitLine: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    margin: 2,
                    textStyle: {
                        color: '#aaa'
                    }
                }
            },
            yAxis: {
                type: 'category',
                nameGap: 16,
                axisLine: {
                    show: false,
                    lineStyle: {
                        color: '#ddd'
                    }
                },
                axisTick: {
                    show: false,
                    lineStyle: {
                        color: '#ddd'
                    }
                },
                axisLabel: {
                    interval: 0,
                    textStyle: {
                        color: '#ddd'
                    }
                },
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            },
            series: [{
                name: '人员类别',
                type: 'bar',
                barWidth: '60%',
                id: 'bar',
                zlevel: 2,
                symbol: 'none',
                itemStyle: {
                    normal: {
                        color: '#ddb926'
                    }
                },
                data: [10, 52, 200, 334, 390, 330, 220]
            }]
        };
        return hnBarOpt;
    }
</script>


</body>
</html>
