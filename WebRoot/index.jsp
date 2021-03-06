<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ECharts | Study</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- jQuery 2.0.2 -->
    <script src="${ctx}/ui/js/jquery.min.js"></script>
    <!-- bootstrap 3.0.2 -->
    <link href="${ctx}/ui/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap -->
    <script src="${ctx}/ui/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="${ctx}/ui/css/normalize.css">
    <link rel="stylesheet" href="${ctx}/ui/css/custom.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-blue">
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header navbar-left">
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" role="navigation" id="navbar-collapse">
            <ul class="nav navbar-nav" id="nav">
                <li><a href="http://localhost:8088/testech/ecjsp/test_pie.jsp" target="mainChartFrame">饼形图</a></li>
                <li><a href="http://localhost:8088/testech/ecjsp/test_bar.jsp" target="mainChartFrame">柱状图</a></li>
                <li><a href="http://localhost:8088/testech/ecjsp/test_line.jsp" target="mainChartFrame">折线图</a></li>
                <li><a href="http://localhost:8088/testech/ecjsp/test_radar.jsp" target="mainChartFrame">雷达图</a></li>
                <li><a href="http://localhost:8088/testech/ecjsp/test_gzmap.jsp" target="mainChartFrame">地图</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-haspopup="true" aria-expanded="false">其它图表 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="http://localhost:8088/testech/ecjsp/test_candlestick.jsp" target="mainChartFrame">K线图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_heatmap.jsp" target="mainChartFrame">热力图</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_boxplot.jsp" target="mainChartFrame">箱线图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_scatter.jsp" target="mainChartFrame">散点图</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_graph.jsp" target="mainChartFrame">关系图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_treemap.jsp" target="mainChartFrame">矩形树图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_sankey.jsp" target="mainChartFrame">桑基图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_parallel.jsp" target="mainChartFrame">平行坐标</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_funnel.jsp" target="mainChartFrame">漏斗图</a></li>
                        <li><a href="http://localhost:8088/testech/ecjsp/test_gauge.jsp" target="mainChartFrame">仪表盘</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                ECharts
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <!-- AREA CHART -->
                    <div class="box box-primary" id="box">
                        <div class="box-header">
                            <h3 class="box-title"></h3>
                        </div>
                        <div class="box-body chart-responsive">
                            <div class="chart" id="revenue-chart" style="height: 500px;text-align: center">
                                <iframe id="mainChartFrame" name="mainChartFrame" scrolling="no" frameborder="0"
                                      src="http://localhost:8088/testech/ecjsp/test_pie.jsp"  style="height: 100%;width: 100%;background-color: #5bc0de">

                                </iframe>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->

                </div><!-- /.col (LEFT) -->
            </div><!-- /.row -->

        </section><!-- /.content -->
    </div><!-- ./wrapper -->
</div><!-- ./container -->

<script>
    $(function () {
        $("#box .box-title").text($("#nav").find("a[href!='#']").first().text());
       $("#nav").find("a[href!='#']").each(function () {
           $(this).click(function () {
               $("#box .box-title").text($(this).text());
           });
       });
    });
</script>
</body>
</html>
