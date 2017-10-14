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
    <script type="text/javascript" src="${ctx }/ui/echarts/echarts-3.2.3/dist/echarts.js"></script>
    <script type="text/javascript" src="${ctx }/ui/echarts/config/cfgopts.js"></script>
</head>

<body>
<div style="width: 600px;height: 400px;background-color: #00CC33;">
    <div id="candlestick" style="width: 600px;height: 400px;"></div>
</div>
<script type="text/javascript">
    var candlestickChart;
    $(function () {
        candlestickChart = echarts.init(document.getElementById("candlestick"));

        showCandlestick();
    });

    function showCandlestick() {
        var candlestickOpt = getCandlestickOpt();
        candlestickOpt.title.text = 'K线图';
        candlestickChart.setOption(candlestickOpt);
    }
</script>
</body>
</html>
