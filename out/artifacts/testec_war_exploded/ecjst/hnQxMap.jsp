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
<div style="height: 600px;width: 900px;background-color: #00CC33">
    <div id="qxMap" style="height: 600px;width: 900px;"></div>
</div>
<script type="text/javascript">
    $(function () {
        showQxMap();
    });

    function showQxMap() {

        var uploadedDataURL = "${ctx}/ui/echarts-s/echarts-3.2.3/map/json/china.json";

        $.get(
                uploadedDataURL,
                function (data) {
                    echarts.registerMap('chn', data);

                    var qxMapOpt = getQxMapOpt();

                    qxMapChart = echarts.init(document
                            .getElementById('qxMap'));

                    qxMapChart.setOption(qxMapOpt);

                    /* var currentIndex = -1;
                     var timeTicket = setInterval(function() {
                     var dataLen = option.series[2].data.length;

                     currentIndex = (currentIndex + 1) % dataLen;

                     // 显示 tooltip
                     myChart.dispatchAction({
                     type : 'showTip',
                     seriesIndex : 2,
                     dataIndex : currentIndex
                     });
                     }, 1000); */

                });
    }
</script>

</body>
</html>
