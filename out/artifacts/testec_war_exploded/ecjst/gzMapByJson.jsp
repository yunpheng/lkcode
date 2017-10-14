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
    <script type="text/javascript" src="${ctx}/ui/echarts-s/echarts-3.2.3/options/cofopts.js"></script>
</head>

<body>
<div style="height: 600px;width: 800px; background-color: green;">
    <div id="gzMap" style="height: 600px;width: 800px;"></div>
</div>
<script type="text/javascript">
    var gzMapChart;
    $(function () {

        //贵州地图
        gzMapChart = initMapGeoJson(
                '${ctx}/ui/echarts-s/echarts-3.2.3/map/json/province/guizhou.json',
                'guizhou', 'gzMap');

        showGzMap();

    });

    function showGzMap() {
        var gzMapOpt = getGzMapOptByJson({});
        gzMapOpt.title.text = '贵州地图';
        gzMapOpt.series[0].name = '贵州地图';
        gzMapChart.setOption(gzMapOpt);
    }
</script>

</body>
</html>
