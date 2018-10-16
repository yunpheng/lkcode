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
    <script type="text/javascript" src="${ctx }/ui/echarts/config/configpath.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/esl.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/configopts.js"></script>
</head>

<body>
<div style="width: 800px;height: 600px;background-color: green;">
    <div id="main" style="width: 800px;height: 600px;"></div>
</div>
<script type="text/javascript">
    $(function () {
        requireEcPath('${ctx}/ui/echarts/echarts-3.2.3', '${ctx}/ui/echarts/zrender');
        showRadar();
    });

    function showRadar() {
        require(['echarts', 'echarts/chart/radar',
            'echarts/component/title', 'echarts/component/toolbox',
            'echarts/component/legend', 'echarts/component/markPoint',
            'echarts/component/tooltip'], function (echarts) {
            var radarChart = echarts.init(document.getElementById('main'));
            var radarOpt = getRadarOpt();
            radarOpt.title.text = '雷达图测试';
            radarOpt.series[0].name = '雷达图测试';
            radarChart.setOption(radarOpt);
        });
    }
</script>
</body>
</html>
