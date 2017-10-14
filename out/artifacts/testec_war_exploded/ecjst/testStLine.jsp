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
<div style="height: 600px;width:900px;">
    <div id="stLine" style="height: 600px;width:900px;"></div>
</div>
<script type="text/javascript">
    var stLineChart;
    $(function () {
        stLineChart = echarts.init(document.getElementById("stLine"));
        showStLine();
    });

    function showStLine() {
        var stLineOpt = getStLineOpt();
        stLineChart.setOption(stLineOpt);
    }

    function getStLineOpt() {
        var stLineOpt = {
            backgroundColor: '#040C18',
            title: {
                show: false,
                text: '折线图堆叠'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                show: false,
                data: []
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                axisLabel: {
                    interval: 0,
                    textStyle: {
                        color: "#fff", // 刻度颜色
                        fontSize: 15
                        // 刻度大小
                    }/* ,
                     formatter : function(val) {
                     var reval = '';
                     for (i = 0, len = val.length; i < len; i++) {
                     reval += val.charAt(i) + '\n';
                     }
                     return reval.substring(0, reval.length - 1);
                     } */
                },
                axisTick: {
                    alignWithLabel: true
                }
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    textStyle: {
                        color: "#045156", // 刻度颜色
                        fontSize: 15
                        // 刻度大小
                    }
                },
                axisTick: {
                    alignWithLabel: true
                },
                splitLine: {
                    lineStyle: {
                        color: '#041B23'
                    }
                },
                axisLine: {
                    show: false
                }
            },
            series: [
                {
                    name: '红色预警',
                    type: 'line',
                    color: 'red',
                    data: [0, 31, 35, 20, 25, 20, 45, 30, 35, 40, 45, 50],
                    itemStyle: {
                        normal: {
                            color: 'red'
                        }
                    },
                    markPoint: {
                        data: []
                    },
                    markLine: {
                        data: []
                    }
                },
                {
                    name: '橙色预警',
                    type: 'line',
                    data: [0, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65],
                    itemStyle: {
                        normal: {
                            color: 'orange'
                        }
                    },
                    markPoint: {
                        data: []
                    },
                    markLine: {
                        data: []
                    }
                },
                {
                    name: '黄色预警',
                    type: 'line',
                    data: [0, 31, 30, 39, 38, 37, 36, 35, 34, 43, 22, 41],
                    itemStyle: {
                        normal: {
                            color: 'yellow'
                        }
                    },
                    markPoint: {
                        data: []
                    },
                    markLine: {
                        data: []
                    }
                },
                {
                    name: '蓝色预警',
                    type: 'line',
                    data: [0, 44, 53, 54, 55, 66, 77, 68, 69, 49, 71, 42],
                    itemStyle: {
                        normal: {
                            color: 'blue'
                        }
                    },
                    markPoint: {
                        data: []
                    },
                    markLine: {
                        data: []
                    }
                }
            ]
        };
        return stLineOpt;
    }
</script>


</body>
</html>