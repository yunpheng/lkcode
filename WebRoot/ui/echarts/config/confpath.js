/**
 * 初始化echarts path及及依赖zrender path配置
 * @param ecPath
 * @param zrPath
 */
function requireEcPath(ecPath, zrPath) {
    require.config({
        paths: {
            'geoJson': ecPath + '/geoData/geoJson',
            'theme': ecPath + '/theme',
            'data': ecPath + '/data',
            'map': ecPath + '/map',
            'extension': ecPath + '/extension'
        },
        packages: [
            {
                main: 'echarts',
                location: ecPath + '/src',
                name: 'echarts'
            },
            {
                main: 'zrender',
                location: zrPath + '/src',
                name: 'zrender'
            }
        ]
        // urlArgs: '_v_=' + +new Date()
    });
}
