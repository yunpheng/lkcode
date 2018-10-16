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
    <script type="text/javascript" src="${ctx }/ui/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/esl.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/configpath.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/cfgopts.js"></script>
</head>

<body>
<%--<div style="width: 800px;height: 600px;background-color: #00CC33;">
    <div id="heatmap" style="width: 800px;height: 600px;"></div>
</div>--%>
<div id="heatmap" style="height: 100%;"></div>
<script type="text/javascript">
    var heatmapChart;
    $(function () {
        requireEcPath('${ctx}/ui/echarts/echarts-3.2.3', '${ctx}/ui/echarts/zrender');

        showHeatmap();
    });

    function showHeatmap() {
        require([
            'echarts',
            'echarts/chart/heatmap',
            'echarts/component/geo',
            'echarts/component/legend',
            'echarts/component/visualMap',
            'echarts/component/grid',
            'echarts/component/polar',
            'echarts/component/tooltip'
        ], function (echarts) {
            require(['map/js/china'], function () {
                var heatmapChart = echarts.init(document.getElementById('heatmap'));
                var heatmapOpt = getHeatmapOpt();
                heatmapOpt.title.text = '热力图';
                heatmapChart.setOption(heatmapOpt);
            });
        });
    }
</script>
</body>
</html>
