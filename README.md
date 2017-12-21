# testch

百度ECharts使用总结

1. 百度ECharts介绍，ECharts，一个纯 Javascript 的图表库，可以流畅的运行在PC 和移动设备上，兼容当前绝大部分浏览器（IE8/9/10/11，Chrome，Firefox，Safari等），
底层依赖轻量级的 Canvas 类库 ZRender，提供直观，生动，可交互，可高度个性化定制的数据可视化图表。

2. 单文件方式使用，需要一个echarts.js文件，在echarts官网下载使用echarts需要的文件，引入该文件即可使用。

3. 完整功能方式使用，由于有的图表需要依赖底层Canvas类库ZRender，并且要使用更丰富的功能或更多图表交互组件也需要依赖底层Canvas类库ZRender，
这时需要下载echarts完整文件，可以在github上下载echarts-master，还需要下载ZRender完整文件，也可在github上下载zrender-master，
然后将zrender-master改名为zrender，echarts-master名字任意，并把他们放到相同目录下，修改配置文件，引入配置文件和esl.js文件，根据需要引入依赖的文件即可使用。

4. 该项目总结了ECharts主要图表的用法，数据接口option的提起与格式化
主要图表有：折线图，柱状图，散点图，饼图，K线图，用于统计的盒形图，用于地理数据可视化的地图，热力图，线图，用于关系数据可视化的关系图，
treemap，多维数据可视化的平行坐标，还有用于 BI 的漏斗图，仪表盘等