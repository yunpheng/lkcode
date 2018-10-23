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
    <script type="text/javascript" src="${ctx }/ui/echarts/config/confpath.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/cfgopts.js"></script>
</head>
<body>
<%--<div style="width: 600px;height: 400px;background-color: #00CC33;">
    <div id="boxplot" style="width: 600px;height: 400px;"></div>
</div>--%>
<div id="boxplot" style="height: 100%;"></div>
<script type="text/javascript">
    var boxplotChart;
    $(function () {
        requireEcPath('${ctx}/ui/echarts/echarts-3.2.3', '${ctx}/ui/echarts/zrender');

        showBoxplot();
    });

    function showBoxplot() {
        require([
            'echarts',
            'extension/dataTool/prepareBoxplotData',
            'echarts/chart/boxplot',
            'echarts/chart/scatter',
            'echarts/component/title',
            'echarts/component/legend',
            'echarts/component/grid',
            'echarts/component/tooltip',
            'echarts/component/dataZoom'
        ], function (echarts, prepareBoxplotData) {

            var boxplotChart = echarts.init(document.getElementById('boxplot'), null, {
                renderer: 'canvas'
            });
            var boxplotOpt = getBoxplotOpt(prepareBoxplotData);
            boxplotOpt.title.text = '箱线图';
            boxplotChart.setOption(boxplotOpt);
        });
    }
</script>
</body>
</html>
