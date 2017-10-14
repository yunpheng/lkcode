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
<div style="height: 500px;width:800px;background-color: #404a59">
    <div id="yyQxMap" style="height: 400px;width:800px;"></div>
</div>
<script type="text/javascript">
    $(function () {
        showYyQxMap();
    });

    function showYyQxMap() {

        var mapJsonURL = "${ctx}/ui/echarts-s/echarts-3.2.3/map/json/province/city/yunyan.json";

        $.get(mapJsonURL,
                function (tdata) {
                    echarts.registerMap('yunyan', tdata);
                    var geoCoordMap = {
                        'A': [106.675271, 26.589342],
                        'B': [106.702804, 26.589809],
                        'C': [106.721692, 26.585195],
                        'D': [106.710528, 26.59057],
                        'E': [106.702093, 26.596069],
                        'F': [106.73127, 26.594357],
                        'G': [106.723446, 26.583439],
                        'H': [106.732248, 26.608721],
                        'I': [106.709172, 26.58454],
                        'J': [106.768677, 26.599027],
                        'KT': [106.727083, 26.621278]
                    };

                    var data = {
                        'A': 50,
                        'B': 30,
                        'C': 64,
                        'D': 40,
                        'E': 50,
                        'F': 30,
                        'G': 64,
                        'H': 30,
                        'I': 64,
                        'J': 40
                    };

                    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

                    var yyQxMapOpt = {
                        backgroundColor: 'rgba(255,255,255,0)',
                        title: {
                            text: '',
                            left: '-5',
                            top: '10px',
                            itemStyle: {
                                normal: {
                                    borderColor: 'rgba(100,149,237,1)',
                                    borderWidth: 0.5,
                                    areaStyle: {
                                        color: '#1b1b1b'
                                    }
                                }
                            }
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: function (o) {
                                return o.name + "：" + o.value[2] + "起";
                            }
                        },
                        geo: {
                            map: 'yunyan',
                            label: {
                                emphasis: {
                                    show: false
                                }
                            },
                            silent: true,
                            /*layoutSize:900,
                             layoutCenter:[700,140],*/
                            roam: true,
                            itemStyle: {
                                normal: {
                                    borderColor: 'rgba(100,149,237,1)',
                                    color: '#1b1b1b',
                                    borderWidth: 0.5,
                                    areaStyle: {
                                        color: '#1b1b1b'
                                    }
                                }
                            }
                        },
                        series: [
                            {
                                type: 'lines',
                                zlevel: 1,
                                effect: {
                                    show: true,
                                    period: 3,
                                    trailLength: 0.1,
                                    color: '#A6C84C',
                                    symbolSize: 8
                                },
                                lineStyle: {
                                    normal: {
                                        color: '#a6c84c',
                                        width: 0,
                                        curveness: 0.2
                                    }
                                },
                                data: [
                                    {
                                        coords: [
                                            geoCoordMap['A'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['B'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['C'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['D'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['E'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['F'],
                                            geoCoordMap['KT']]
                                    },
                                    {

                                        coords: [
                                            geoCoordMap['G'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['H'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['I'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['J'],
                                            geoCoordMap['KT']]
                                    }]
                            },
                            {
                                type: 'lines',
                                zlevel: 1,
                                effect: {
                                    show: true,
                                    period: 3,
                                    trailLength: 0.1,
                                    color: '#A6C84C',
                                    symbolSize: 8
                                },
                                lineStyle: {
                                    normal: {
                                        color: '#a6c84c',
                                        width: 0,
                                        curveness: 0.2
                                    }
                                },
                                data: [
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['A']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['B']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['C']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['D']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['E']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['F']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['G']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['H']]
                                    },
                                    {

                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['I']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['J']]
                                    }]
                            },
                            {
                                type: 'lines',
                                zlevel: 2,
                                effect: {
                                    show: true,
                                    period: 3,
                                    trailLength: 0,
                                    //symbol: 'image://',
                                    symbol: planePath,
                                    symbolSize: 15
                                },
                                lineStyle: {
                                    normal: {
                                        color: '#a6c84c',
                                        width: 1,
                                        opacity: 0.4,
                                        curveness: 0.2
                                    }
                                },
                                data: [
                                    {
                                        coords: [
                                            geoCoordMap['A'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['B'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['C'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['D'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['E'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['F'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['G'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['H'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['I'],
                                            geoCoordMap['KT']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['J'],
                                            geoCoordMap['KT']]
                                    }]
                            },
                            {
                                type: 'lines',
                                zlevel: 2,
                                effect: {
                                    show: true,
                                    period: 3,
                                    trailLength: 0,
                                    //symbol: 'image://',
                                    symbol: planePath,
                                    symbolSize: 15
                                },
                                lineStyle: {
                                    normal: {
                                        color: '#a6c84c',
                                        width: 1,
                                        opacity: 0.4,
                                        curveness: 0.2
                                    }
                                },
                                data: [
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['A']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['B']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['C']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['D']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['E']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['F']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['G']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['H']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['I']]
                                    },
                                    {
                                        coords: [
                                            geoCoordMap['KT'],
                                            geoCoordMap['J']]
                                    }]
                            },
                            {
                                type: 'effectScatter',
                                coordinateSystem: 'geo',
                                zlevel: 2,
                                rippleEffect: {
                                    period: 4,
                                    scale: 2.5,
                                    brushType: 'stroke'
                                },
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'right',
                                        formatter: '{b}'
                                    }
                                },
                                symbolSize: '8',
                                itemStyle: {
                                    normal: {
                                        color: '#0D6695',
                                    }
                                },

                                data: [
                                    {
                                        name: 'A',
                                        value: geoCoordMap['A']
                                                .concat(data.A),
                                        //symbol: 'path://M266.048,191.088c50.663,0,92.957,30.761,102.883,71.688c-1.659-0.072-3.339-0.104-5.021-0.104c-55.207,0-99.959,38.572-99.959,86.153c0,7.81,1.204,15.359,3.465,22.554c-0.456,0-0.922,0.011-1.369,0.011c-13.611,0-26.619-2.21-38.559-6.256l-37.043,18.925l10.373-32.126c-24.295-16.517-39.875-42.044-39.875-70.698C160.943,231.442,207.999,191.088,266.048,191.088L266.048,191.088z M360.747,271.463c48.777,0,88.31,33.899,88.31,75.746c0,24.128-13.153,45.62-33.65,59.509l8.132,26.194L393.735,417.5l0.031-0.021c-10.208,3.535-21.349,5.475-33.02,5.475c-48.775,0-88.319-33.909-88.319-75.744C272.428,305.362,311.972,271.463,360.747,271.463L360.747,271.463z M392.864,310.91c6.494,0,11.773,5.287,11.773,11.813c0,6.549-5.279,11.847-11.773,11.847s-11.774-5.298-11.774-11.847C381.09,316.197,386.37,310.91,392.864,310.91L392.864,310.91z M334.513,310.91c6.493,0,11.774,5.287,11.774,11.813c0,6.549-5.281,11.847-11.774,11.847c-6.504,0-11.763-5.298-11.763-11.847C322.75,316.197,328.009,310.91,334.513,310.91L334.513,310.91z M229.523,234.299c8.081,0,14.637,6.58,14.637,14.704c0,8.112-6.556,14.702-14.637,14.702c-8.081,0-14.627-6.59-14.627-14.702C214.896,240.879,221.442,234.299,229.523,234.299L229.523,234.299z M302.055,234.299c8.08,0,14.626,6.58,14.626,14.704c0,8.112-6.546,14.702-14.626,14.702c-8.082,0-14.637-6.59-14.637-14.702C287.418,240.879,293.973,234.299,302.055,234.299L302.055,234.299z'
                                        // symbol: 'image:'+weixin
                                    },
                                    {
                                        name: 'B',
                                        value: geoCoordMap['B']
                                                .concat(data.B),
                                        //symbol: 'path://M124.302,345.927c0.08,59.373,76.261,95.476,150.779,95.476c97.736,0,162.761-56.793,162.761-101.885 c0-27.233-22.951-42.698-43.563-49.094c-5.053-1.503-8.537-2.54-5.877-9.188c5.73-14.441,6.329-26.901,0.106-35.783 c-11.676-16.662-43.589-15.771-80.184-0.452c0-0.014-11.489,5.026-8.551-4.083c5.625-18.098,4.774-33.243-3.976-42.006 c-19.854-19.854-72.644,0.758-117.922,46.009c-33.815,33.828-53.482,69.679-53.575,100.701V345.927L124.302,345.927z M275.268,420.101c-59.493,5.864-110.848-21.023-114.717-60.092c-3.856-39.055,41.262-75.476,100.754-81.354 c59.493-5.891,110.848,20.997,114.704,60.052C379.865,377.788,334.773,414.209,275.268,420.101L275.268,420.101z M459.185,181.664 c-23.604-26.17-58.416-36.143-90.569-29.308l0,0c-7.433,1.582-12.181,8.909-10.585,16.329c1.583,7.42,8.896,12.181,16.33,10.585 c22.871-4.854,47.604,2.247,64.386,20.837c16.768,18.59,21.329,43.948,14.135,66.168l0.014,0.014 c-2.34,7.233,1.609,14.986,8.856,17.326c7.233,2.327,14.999-1.622,17.34-8.843c0-0.014,0-0.04,0-0.053 C489.17,243.443,482.787,207.807,459.185,181.664L459.185,181.664z M422.936,214.376c-11.489-12.739-28.443-17.579-44.107-14.255 c-6.409,1.356-10.479,7.659-9.109,14.068c1.37,6.383,7.673,10.479,14.056,9.096v0.013c7.646-1.622,15.943,0.731,21.568,6.955 c5.611,6.236,7.128,14.72,4.708,22.18h0.026c-2.021,6.21,1.383,12.898,7.605,14.906c6.237,1.995,12.912-1.396,14.92-7.632 C437.522,244.481,434.451,227.114,422.936,214.376L422.936,214.376z M278.565,349.345c-2.088,3.563-6.688,5.279-10.292,3.79 c-3.537-1.463-4.654-5.439-2.633-8.937c2.074-3.471,6.488-5.173,10.025-3.763C279.257,341.738,280.547,345.768,278.565,349.345 L278.565,349.345z M259.604,373.679c-5.758,9.188-18.085,13.204-27.366,8.976c-9.149-4.175-11.835-14.84-6.091-23.789 c5.691-8.909,17.606-12.885,26.808-9.016C262.289,353.813,265.255,364.41,259.604,373.679L259.604,373.679z M281.225,308.708c-28.311-7.367-60.317,6.741-72.617,31.688c-12.513,25.438-0.412,53.682,28.19,62.923c29.64,9.548,64.56-5.093,76.7-32.552C325.479,343.919,310.519,316.273,281.225,308.708L281.225,308.708z'
                                        // symbol: 'image://'+weibo
                                    },
                                    {
                                        name: 'C',
                                        value: geoCoordMap['C']
                                                .concat(data.C),
                                        //symbol: 'path://M404.32,355.807c-8.773,2.607-17.837,8.488-24.154,15.163 c-12.469,13.167-19.628,38.858-39.74,43.198c-16.484,3.591-34.486-12.308-40.914-25.328c25.837-27.934,48.791-65.215,65.577-98.464 c9.657-19.173,19.864-41.305,21.948-63.506c2.179-23.071-3.919-40.964-19.534-51.492c-13.284-8.94-30.747-14.788-43.934-19.378 c-16.181,25.498-31.906,51.323-47.189,77.557c6.331,2.583,12.027,4.962,17.905,7.355c8.179,3.32,16.634,5.722,17.905,16.034 c1.131,9.52-3.215,20.5-7.339,30.098c-7.421,17.236-17.173,32.897-30.914,46.11c-6.827,6.561-16.138,14.335-25.229,14.709 c-14.388,0.612-25.34-6.618-34.996-12.035c-15.782,25.611-32.044,51.845-47.205,76.878c15.547,4.85,26.9,13.541,43.949,17.371 c6.566,1.496,17.739,2.278,26.029,0.681c17.547-3.377,33.19-13.938,45.935-25.09c19.836,26.992,60.57,40.933,88.903,15.967 c17.243-15.23,25.243-48.365,48.225-48.002c15.808,0.238,26.347,14.765,30.802,24.147c7.119-1.846,16.319-4.521,23.299-6.481 C466.104,367.456,431.522,347.728,404.32,355.807L404.32,355.807z'
                                        // symbol: 'image://'+phone
                                    },
                                    {
                                        name: 'D',
                                        value: geoCoordMap['D']
                                                .concat(data.D),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'E',
                                        value: geoCoordMap['E']
                                                .concat(data.E),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'F',
                                        value: geoCoordMap['F']
                                                .concat(data.F),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'G',
                                        value: geoCoordMap['G']
                                                .concat(data.G),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'H',
                                        value: geoCoordMap['H']
                                                .concat(data.H),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'I',
                                        value: geoCoordMap['I']
                                                .concat(data.I),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'J',
                                        value: geoCoordMap['J']
                                                .concat(data.J),
                                        //symbol: 'path://M164,210.677v33.47l154.656,66.356L468,243.681v-33.004H164L164,210.677z M164,282.255L164,282.255v134.76h304V282.061l-149.012,66.615L164,282.255L164,282.255z'
                                        // symbol: 'image://'+sms
                                    },
                                    {
                                        name: 'KT',
                                        value: geoCoordMap['KT']
                                                .concat(parseInt(data.A)
                                                        + parseInt(data.B)
                                                        + parseInt(data.C)
                                                        + parseInt(data.D)
                                                        + parseInt(data.E)
                                                        + parseInt(data.F)
                                                        + parseInt(data.G)
                                                        + parseInt(data.H)
                                                        + parseInt(data.I)
                                                        + parseInt(data.J)),
                                        itemStyle: {
                                            normal: {
                                                color: 'red',
                                                borderColor: '#000'
                                            }
                                        },
                                        symbol: 'image://${ctx}/ui/echarts-s/echarts-3.2.3/map/icon/wjxico.png'
                                        // symbol: 'path://M42.677,26.583l15.466-0.022l-2.798,4.447l-9.855-0.027 L42.677,26.583L42.677,26.583z M45.562,31.912h9.769c-0.023,2.716,0.075,5.745-3.027,7.152c-1.931,0.875-3.87,0.294-4.639-0.339 C45.447,36.907,45.579,34.432,45.562,31.912L45.562,31.912z M35.709,46.547l0.152,26.248c0,0-0.305,2.039,1.091-0.605l4.001-7.576 c0.297-0.561-0.01-10.404,0.137-9.811c0.229,0.949,0.881,6.957,1.055,6.957l1.744,0.002L57.34,41.876L39.852,41.92 C36.746,41.928,35.543,44.057,35.709,46.547L35.709,46.547z M59.908,41.899c0.068-0.102,5.194-0.532,5.137,3.662 C65.01,48.129,65.29,73.16,65.29,73.16s0.033,0.725-0.579-0.25c-0.61-0.979-4.638-8.297-4.638-8.297l-0.138-9.928 c0,0-0.264,0.959-0.684,3.332c-0.418,2.373-0.688,3.744-0.688,3.744l-12.322-0.014L59.908,41.899L59.908,41.899z M42.545,64.125 h15.896l5.54,9.967l-26.003,0.004c-0.279,0-0.333-0.486,0.008-1.145L42.545,64.125z'
                                    }]
                            }]
                    };

                    yyQxMapChart = echarts.init(document
                            .getElementById('yyQxMap'));

                    yyQxMapChart.setOption(yyQxMapOpt);

                    var currentIndex = -1;
                    var timeTicket = setInterval(function () {
                        var dataLen = yyQxMapOpt.series[2].data.length;

                        currentIndex = (currentIndex + 1) % dataLen;

                        // 显示 tooltip
                        yyQxMapChart.dispatchAction({
                            type: 'showTip',
                            seriesIndex: 2,
                            dataIndex: currentIndex
                        });
                    }, 1000);

                });
    }
</script>

</body>
</html>
