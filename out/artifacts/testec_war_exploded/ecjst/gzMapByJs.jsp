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
    <script type="text/javascript" src="${ctx }/ui/echarts-a/echarts-3.2.3/config/config.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts-a/echarts-3.2.3/config/esl.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts-a/echarts-3.2.3/options/cofopts.js"></script>
</head>

<body>

<div style="width: 800px;height: 600px;background-color: green;">
    <div id="gzMap" style="width: 800px;height: 600px;"></div>
</div>
<script type="text/javascript">
    $(function () {
        requireEcPath('${ctx}/ui/echarts-a/echarts-3.2.3', '${ctx}/ui/echarts-a/zrender');
        showGzMap();
    });

    function showGzMap() {
        require(['echarts', 'echarts/chart/map',
            'echarts/component/title', 'echarts/component/tooltip',
            'echarts/component/toolbox', 'echarts/component/legend',
            'echarts/component/visualMap',
            'echarts/component/markPoint'], function (echarts) {

            require(['map/js/province/guizhou'], function () {
                var gzMapChart = echarts.init(document.getElementById('gzMap'));
                var gzMapOpt = getGzMapOptByJs();
                gzMapOpt.title.text = '贵州地图';
                gzMapOpt.series[0].name = '贵州地图';
                gzMapChart.setOption(gzMapOpt);
            });
        });
    }
</script>
</body>
</html>
