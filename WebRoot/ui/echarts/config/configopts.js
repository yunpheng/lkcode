///////////////////////////////
/////////////////////////
function getRadarOpt() {
    var radarOpt = {
        title: {
            text: '多雷达图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            x: 'center',
            data: ['某软件']
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: true,
                    optionToContent: function (opt) {
                        var serData = opt.series[0].data[0].value;
                        var serName = opt.series[0].name;
                        var ind = opt.radar[0].indicator;
                        var table = '<table><tbody>';
                        for (var i = 0, l = ind.length; i < l; i++) {
                            table += '<tr>' + '<td>' + ind[i].name + '</td>'
                                + '<td>' + serData[i] + '</td>' + '</tr>';
                        }
                        table += '</tbody></table>';
                        return serName + table;
                    }
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: 'blue',
                }
            },
            right: '1%',
            top: '5%'
        },
        radar: [{
            indicator: [{
                name: '品牌',
                max: 100
            }, {
                name: '内容',
                max: 100
            }, {
                name: '可用性',
                max: 100
            }, {
                name: '功能',
                max: 100
            }],
            center: ['25%', '40%'],
            radius: 80
        }],
        series: [{
            type: 'radar',
            tooltip: {
                trigger: 'item'
            },
            itemStyle: {
                normal: {
                    areaStyle: {
                        type: 'default'
                    }
                }
            },
            data: [{
                value: [60, 73, 85, 40],
                name: '某软件'
            }]
        }]
    };
    return radarOpt;
}
///////////////////////////////
/////////////////////////
function getGzMapOptByJs() {
    var gzMapOpt = {
        title: {
            show: true,
            text: 'bbb',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 20,
                color: 'red',
                shadowColor: 'blue', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        tooltip: {
            trigger: 'item',
            textStyle: {
                fontSize: 18
            }
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: true
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: 'green',
                }
            },
            right: '1%',
            top: '5%'
        },

        dataRange: {
            min: 0,
            max: 1000,
            color: ['red', 'yellow'],
            text: ['高', '低'], // 文本，默认为数值文本
            calculable: true,
            right: 2,
            top: '42%',
            textStyle: {
                color: '#ffffff',
                fontSize: 15
            }
        },
        series: [{
            name: 'xxx',
            type: 'map',
            mapType: '贵州',
            selectedMode: 'single',
            layoutCenter: ['45%', '50%'],
            layoutSize: '90%',
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            fontSize: 15
                        },
                        formatter: function (v) {
                            var vn = v.name;
                            if (vn.match(/黔南/)) {
                                return '黔南';
                            } else if (vn.match(/黔东南/)) {
                                return '黔东南';
                            } else if (vn.match(/黔西南/)) {
                                return '黔西南';
                            }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true
                    }
                }
            },
            markPoint: {
                symbol: 'emptyCircle',
                symbolSize: 8,

                itemStyle: {
                    normal: {
                        label: {
                            show: false
                        }
                    }
                },
                data: [{
                    symbol: 'Star',
                    coord: [106.71, 26.50]
                },//贵阳
                    {
                        coord: [109.21, 27.63]
                    },//铜仁
                    {
                        coord: [106.90, 27.63]
                    },//遵义
                    {
                        coord: [105.29, 27.22]
                    },//毕节
                    {
                        coord: [104.82, 26.50]
                    },//六盘水
                    {
                        coord: [105.92, 26.17]
                    },//安顺
                    {
                        coord: [104.90, 25.01]
                    },//黔西南
                    {
                        coord: [107.52, 26.18]
                    },//黔南
                    {
                        coord: [107.97, 26.50]
                    },//黔东南
                ]
            },
            data: [{
                name: '遵义市',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '黔东南苗族侗族自治州',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '毕节市',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '黔南布依族苗族自治州',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '铜仁市',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '黔西南布依族苗族自治州',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '六盘水市',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '安顺市',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '贵阳市',
                value: Math.round(Math.random() * 1000)
            }]
        }]
    };
    return gzMapOpt;
}
///////////////////////////////
/////////���ص�ͼ��GeoJson���///////////
//////////��ʼ����ͼmapchart/////
function initMapGeoJson(jsonUrl, mType, mId) {
    var mapChart;
    $.ajax({
        type: "GET",
        url: jsonUrl,
        dataType: 'json',
        async: false,
        success: function (mJson) {
            echarts.registerMap(mType, mJson);
            mapChart = echarts.init(document.getElementById(mId));
        }
    });
    return mapChart;
}
/////////////////////////////
//////////////////////////////
function formatGeoData(tData) {
    var geoDats = {};
    var dats = [];
    for (var i = 0, len = tData.length; i < len; i++) {
        geoDats[tData[i].kkjc] = [tData[i].kkjd, tData[i].kkwd];
        dats.push({
            name: tData[i].kkjc,
            value: 10
        });
    }

    return {
        geoData: geoDats,
        data: dats
    };
}

function formatBarData(data) {
    var ctAData = [];
    var serData = [];

    for (var i = 0; i < data.length; i++) {
        ctAData.push(data[i].name || "");
        serData.push({
            name: data[i].name,
            value: data[i].value || 0
        });
    }

    return {
        ctAData: ctAData,
        serData: serData
    };
}

function formatPieData(data) {
    var legData = [];
    var serData = [];

    for (var i = 0; i < data.length; i++) {
        legData.push(data[i].name || "");
        serData.push({
            name: data[i].name,
            value: data[i].value || 0
        });
    }

    return {
        legData: legData,
        serData: serData
    };
}

function getMaxVal(data) {
    var mVal = 0;
    for (var i = 0, len = data.length; i < len; i++) {
        if (mVal < data[i].value) {
            mVal = data[i].value;
        }
    }
    return mVal;
}