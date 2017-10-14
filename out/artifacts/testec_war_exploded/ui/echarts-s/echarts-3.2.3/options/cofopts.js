/////////////////////
//////////////////////////
function getQxMapOpt() {
    var geoCoordMap = {
        '长春': [125.8154, 44.2584],
        '长沙': [113.0823, 28.2568],
        '贵阳': [106.6992, 26.7682],
        '西安': [109.1162, 34.2004],
        '深圳': [114.5435, 22.5439],
        '济南': [117.1582, 36.8701],
        '海口': [110.3893, 19.8516],
        '沈阳': [123.1238, 42.1216],
        '武汉': [114.3896, 30.6628],
        '昆明': [102.9199, 25.4663],
        '杭州': [119.5313, 29.8773],
        '成都': [103.9526, 30.7617],
        '拉萨': [91.1865, 30.1465],
        '天津': [117.4219, 39.4189],
        '合肥': [117.29, 32.0581],
        '呼和浩特': [111.4124, 40.4901],
        '哈尔滨': [127.9688, 45.368],
        '北京': [116.4551, 40.2539],
        '南京': [118.8062, 31.9208],
        '南宁': [108.479, 23.1152],
        '南昌': [116.0046, 28.6633],
        '乌鲁木齐': [87.9236, 43.5883],
        '上海': [121.4648, 31.2891]
    };

    var data = [{
        name: '长春',
        value: 90
    }, {
        name: '长沙',
        value: 10
    }, {
        name: '贵阳',
        value: 20
    }, {
        name: '西安',
        value: 20
    }, {
        name: '深圳',
        value: 20
    }, {
        name: '济南',
        value: 50
    }, {
        name: '海口',
        value: 58
    }, {
        name: '沈阳',
        value: 64
    }, {
        name: '武汉',
        value: 68
    }, {
        name: '昆明',
        value: 45
    }, {
        name: '杭州',
        value: 68
    }, {
        name: '成都',
        value: 49
    }, {
        name: '拉萨',
        value: 66
    }, {
        name: '天津',
        value: 86
    }, {
        name: '合肥',
        value: 58
    }, {
        name: '呼和浩特',
        value: 59
    }, {
        name: '哈尔滨',
        value: 95
    }, {
        name: '北京',
        value: 68
    }, {
        name: '南京',
        value: 56
    }, {
        name: '南宁',
        value: 89
    }, {
        name: '南昌',
        value: 48
    }, {
        name: '乌鲁木齐',
        value: 49
    }, {
        name: '上海',
        value: 78
    }];

    function formtGCData(geoData, data, srcNam, dest) {
        var tGeoDt = [];
        if (dest) {
            for (var i = 0, len = data.length; i < len; i++) {
                if (srcNam != data[i].name) {
                    tGeoDt.push({
                        coords: [geoData[srcNam],
                            geoData[data[i].name]]
                    });
                }
            }
        } else {
            for (var i = 0, len = data.length; i < len; i++) {
                if (srcNam != data[i].name) {
                    tGeoDt.push({
                        coords: [
                            geoData[data[i].name],
                            geoData[srcNam]]
                    });
                }
            }
        }
        return tGeoDt;
    }

    function formtVData(geoData, data, srcNam) {
        var tGeoDt = [];
        for (var i = 0, len = data.length; i < len; i++) {
            var tNam = data[i].name
            if (srcNam != tNam) {
                var gdt = [];
                gdt.push(geoData[tNam]);
                gdt.concat(data[i].value);
                tGeoDt.push({
                    name: tNam,
                    value: gdt
                });
            }

        }
        tGeoDt.push({
            name: srcNam,
            value: geoData[srcNam],
            itemStyle: {
                normal: {
                    color: 'red',
                    borderColor: '#000'
                }
            }
        });
        return tGeoDt;
    }

    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

    var qxMapOpt = {
        backgroundColor: 'rgba(255,255,255,0)',
        title: {
            text: '',
            left: '-5',
            top: '10px',
            itemStyle: {
                normal: {
                    borderColor: 'rgba(100,149,237,1)',
                    borderWidth: 0.5,
                    areaStyle: {
                        color: '#1b1b1b'
                    }
                }
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: function (o) {

                return o.name + "：";
            }

        },

        geo: {
            map: 'chn',
            label: {
                emphasis: {
                    show: false
                }
            },
            silent: true,
            /* layoutSize:900,
             layoutCenter:[700,140], */
            roam: true,
            itemStyle: {
                normal: {
                    borderColor: 'rgba(100,149,237,1)',
                    color: '#1b1b1b',
                    borderWidth: 0.5,
                    areaStyle: {
                        color: '#1b1b1b'
                    }
                }
            }
        },
        series: [
            {

                type: 'lines',
                zlevel: 2,
                effect: {
                    show: true,
                    period: 3,
                    trailLength: 0,
                    //symbol: 'image://',
                    symbol: planePath,
                    symbolSize: 15
                },
                lineStyle: {
                    normal: {
                        color: '#a6c84c',
                        width: 1,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                data: formtGCData(geoCoordMap,
                    data, '长沙', true)
            },
            /* {

             type : 'lines',
             zlevel : 2,
             effect : {
             show : true,
             period : 3,
             trailLength : 0,
             //symbol: 'image://',
             symbol : planePath,
             symbolSize : 15
             },
             lineStyle : {
             normal : {
             color : '#a6c84c',
             width : 1,
             opacity : 0.4,
             curveness : 0.2
             }
             },
             data : formtGCData(geoCoordMap, data, '长沙', false)
             }, */
            {

                type: 'effectScatter',
                coordinateSystem: 'geo',
                zlevel: 2,
                rippleEffect: {
                    period: 4,
                    scale: 2.5,
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                symbolSize: '8',
                itemStyle: {
                    normal: {
                        color: '#0D6695',
                    }
                },

                data: formtVData(geoCoordMap,
                    data, '长沙')
            }]
    };
    return qxMapOpt;
}
/////////////////////
//////////////////////////
function getHnMapOpt() {
    var geoCoordMap = {
        '长沙市': [113, 28.21],
        '株洲市': [113.16, 27.83],
        '湘潭市': [112.91, 27.87],
        '衡阳市': [112.61, 26.89],
        '邵阳市': [111.5, 27.22],
        '常德市': [111.69, 29.05],
        '益阳市': [111.63, 26.22],
        '娄底市': [111.96, 27.71],
        '郴州市': [113, 25.79],
        '永州市': [111.63, 26.22],
        '怀化市': [109.47, 27.52],
        '吉首市': [109.71, 28.3],
        '张家界': [110.27, 29.20],
        '岳阳市': [113.09, 29.37]
    };

    var data = [{
        name: '长沙市',
        value: 43359
    }, {
        name: '岳阳市',
        value: 44372
    }, {
        name: '怀化市',
        value: 47597
    }, {
        name: '湘潭市',
        value: 24022
    }, {
        name: '娄底市',
        value: 50636
    }, {
        name: '常德市',
        value: 40463
    }, {
        name: '永州市',
        value: 58002
    }, {
        name: '湘西',
        value: 35480
    }, {
        name: '邵阳市',
        value: 70948
    }, {
        name: '益阳市',
        value: 44878
    }, {
        name: '衡阳市',
        value: 75530
    }, {
        name: '张家界市',
        value: 15944
    }, {
        name: '株洲市',
        value: 31524
    }, {
        name: '郴州市',
        value: 50863
    }];

    var convertData = function (data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value)
                });
            }
        }
        return res;
    };

    var convertedData = [convertData(data),
        convertData(data.sort(function (a, b) {
            return b.value - a.value;
        }).slice(0, 6))];

    var hnMapOpt = {
        backgroundColor: 'rgba(255,255,255,0)',
        animation: true,
        animationDuration: 1000,
        animationEasing: 'cubicInOut',
        animationDurationUpdate: 1000,
        animationEasingUpdate: 'cubicInOut',
        title: {
            show: false,
            text: '',
            left: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        toolbox: {
            feature: {
                dataView: {
                    show: true,
                    readOnly: false
                },
                restore: {
                    show: true
                },
                saveAsImage: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                    color: "blue"
                },
                emphasis: {
                    borderColor: '#b1e4ff'
                }
            }
        },
        tooltip: {
            trigger: 'item',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontSize: 16
            }
        },
        brush: {
            outOfBrush: {
                color: '#abc'
            },
            brushStyle: {
                borderWidth: 2,
                color: 'rgba(0,0,0,0.2)',
                borderColor: 'rgba(0,0,0,0.5)'
            },
            seriesIndex: [0, 1],
            throttleType: 'debounce',
            throttleDelay: 300,
            geoIndex: 0
        },
        geo: {
            map: 'hunan',
            /* left : '10',
             right : '35%', */
            //center: [117.98561551896913, 31.205000490896193],
            //zoom: 2.5,
            label: {
                emphasis: {
                    show: false
                }
            },
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#37376e',
                    borderColor: '#000'
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        series: [{
            name: '各地区重点人员数',
            type: 'scatter',
            coordinateSystem: 'geo',
            data: convertedData[0],
            symbolSize: function (val) {
                return 8;
            },
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: false
                },
                emphasis: {
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#ddb926'
                }
            }
        }, {
            name: '各地区重点人员数',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            data: convertedData[1],
            symbolSize: function (val) {
                return 10;
            },
            showEffectOn: 'emphasis',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#f4e925',//#f4e925
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            zlevel: 1
        }]
    };
    return hnMapOpt;
}
/////////////////////
//////////////////////////
function getRosePieOpt() {
    var rosePieOpt = {
        title: {
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b} : {c} ({d}%)"
        },
        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        series: [
            {
                name: '',
                type: 'pie',
                radius: '78%',
                center: ['50%', '50%'],
                data: [],
                roseType: 'angle',
                label: {
                    normal: {
                        formatter: "{b} \n {c} ",
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 8,
                        length2: 4
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#07182C',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    //数据处理
    var tData = [{name: 'A', value: 335}, {name: 'B', value: 235}, {name: 'C', value: 310}, {name: 'D', value: 274},
        {name: 'E', value: 253}, {name: 'F', value: 420}
    ];
    var sData = tData.sort(function (a, b) {
        return a.value - b.value;
    });
    var fData = formatPieData(sData);
    rosePieOpt.series[0].data = fData.serData;
    return rosePieOpt;
}
/////////////////////
//////贵州地图
function getGzMapOptByJson() {
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
            mapType: 'guizhou',
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
/////////////////////
// ////////贵阳地图/////////////////
function getGyMapOptByJson(datas) {
    var gyMapOpt = {
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 20,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
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
                    readOnly: true,
                    backgroundColor: 'rgba(0,0,0,0.8)',
                    // textareaColor : 'rgba(0,0,0,0.4)',
                    textColor: '#fff',
                    optionToContent: function (opt) {
                        var serData = opt.series[0].data;
                        var serName = opt.series[0].name;
                        var tot = 0;
                        var txt = '<textarea readonly="" style="width: 100%; height: 100%;'
                            + 'font-family: monospace; font-size: 14px; line-height: 1.6rem;'
                            + 'color: rgb(255, 255, 255); border-color: rgb(51, 51, 51);'
                            + 'background-color: rgba(0, 0, 0, 0);">';
                        txt += '  ' + serName + '\r\n';
                        txt += '  -----------------------\r\n';
                        for (var i = 0, l = serData.length; i < l; i++) {
                            txt += '  ' + serData[i].name + '  '
                                + serData[i].value + '\r\n';
                            tot += Number(serData[i].value);
                        }
                        txt += '  -----------------------\r\n';
                        txt += '  合计' + '  ' + tot + '\r\n';
                        txt += '</textarea>';
                        return txt;
                    }
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            right: '5%',
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
            name: '',
            type: 'map',
            mapType: 'guiyang',
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
                        /*formatter : function(v) {
                         var vn = v.name;
                         if (vn.match(/关岭/)) {
                         return '关岭县';
                         } else if (vn.match(/镇宁/)) {
                         return '镇宁县';
                         } else if (vn.match(/紫云/)) {
                         return '紫云县';
                         }
                         }*/
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
                silent: true,
                itemStyle: {
                    normal: {
                        label: {
                            show: false
                        }
                    }
                },
                /*data : [ {
                 symbol : 'emptyCircle',
                 coord : [ 105.945, 26.221 ]
                 },// 西秀
                 {
                 coord : [ 106.258, 26.381 ]
                 },// 平坝
                 {
                 coord : [ 105.743, 26.276 ]
                 },// 普定
                 {
                 coord : [ 105.765, 26.028 ]
                 },// 镇宁
                 {
                 coord : [ 105.616, 25.920 ]
                 },// 关岭
                 {
                 coord : [ 106.085, 25.726 ]
                 } // 紫云
                 ]*/
            },
            data: [{
                name: '南明区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '云岩区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '花溪区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '乌当区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '白云区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '观山湖区',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '开阳县',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '息烽县',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '修文县',
                value: Math.round(Math.random() * 1000)
            }, {
                name: '清镇市',
                value: Math.round(Math.random() * 1000)
            }]
        }]
    };
    // 处理数据
    var dats = gyMapOpt.series[0].data;

    /*var qxData = {}, qtData = {};
     for ( var i = 0, len = datas.length; i < len; i++) {
     var qxName = datas[i].name;
     if (qxName.match(/西秀/)) {
     qxData.xx = datas[i].value;
     } else if (qxName.match(/镇宁/)) {
     qxData.zn = datas[i].value;
     } else if (qxName.match(/平坝/)) {
     qxData.pb = datas[i].value;
     } else if (qxName.match(/普定/)) {
     qxData.pd = datas[i].value;
     } else if (qxName.match(/关岭/)) {
     qxData.gl = datas[i].value;
     } else if (qxName.match(/紫云/)) {
     qxData.zy = datas[i].value;
     } else if (qxName.match(/经开区/)) {
     qtData.jkq = datas[i].value;
     } else if (qxName.match(/^黄果树$/)) {
     qtData.hgs = datas[i].value;
     } else if (qxName.match(/黄果树机场/)) {
     qtData.hgsjc = datas[i].value;
     }
     }

     for ( var i = 0, len = dats.length; i < len; i++) {
     var qxName = dats[i].name;
     if (qxName.match(/西秀/)) {
     dats[i].value = qxData.xx + qtData.jkq + qtData.hgsjc;
     } else if (qxName.match(/镇宁/)) {
     dats[i].value = qxData.zn + qtData.hgs;
     } else if (qxName.match(/平坝/)) {
     dats[i].value = qxData.pb;
     } else if (qxName.match(/普定/)) {
     dats[i].value = qxData.pd;
     } else if (qxName.match(/关岭/)) {
     dats[i].value = qxData.gl;
     } else if (qxName.match(/紫云/)) {
     dats[i].value = qxData.zy;
     }
     }

     gydtOpt.tooltip.formatter = function(params) {
     // var serName = params.seriesName;
     var name = params.name;
     var value = params.value;
     if (name.match(/西秀/)) {
     return "&nbsp;" + name + " : " + value + "<br/>----------------<br/>" + "&nbsp;西秀 : "
     + qxData.xx + "<br/>" + "&nbsp;经开区 : " + qtData.jkq + "<br/>"
     + "&nbsp;黄果树机场 : " + qtData.hgsjc;
     } else if (name.match(/镇宁/)) {
     return "&nbsp;" + name + " : " + value + "<br/>----------------<br/>" + "&nbsp;镇宁 : "
     + qxData.zn + "<br/>" + "&nbsp;黄果树 : " + qtData.hgs;
     } else {
     return name + " : " + value;
     }
     };*/

    var mdat = 100;
    for (var i = 0, len = dats.length; i < len; i++) {
        if (mdat < dats[i].value) {
            mdat = dats[i].value;
        }
    }
    gyMapOpt.dataRange.max = mdat;
    return gyMapOpt;
}
/////////////////////
///////4小环图////////
function get4SmlPieOpt() {
    function getBgSer(cent) {
        return {
            type: 'pie',
            radius: ['45%', '55%'],
            center: cent,
            silent: true,
            label: {
                normal: {
                    show: false,
                }
            },
            data: [{
                itemStyle: {
                    normal: {
                        //color: 'rgba(200,200,200,1)',
                        color: '#4C5364',
                        shadowBlur: 10,
                        shadowColor: 'rgba(0,0,0,0.8)'
                    }
                }
            }],
            animation: false
        };
    }

    function getFgSer(cent, perc, colr) {
        return {
            name: '',
            type: 'pie',
            radius: ['46%', '54%'],
            center: cent,
            silent: true,
            data: [{
                value: perc,
                itemStyle: {
                    normal: {
                        color: colr,
                        //color: '#fb358a',
                        //shadowBlur: 20,
                        //shadowColor: '#fb358a',
                        //shadowColor: mainColor,
                        borderWidth: 1.5,
                        //borderColor: borderColor,
                        label: {
                            show: true,
                            position: 'center',
                            formatter: '{d}%',
                            textStyle: {
                                color: colr,
                                fontSize: 5
                            }
                        },
                        labelLine: {
                            show: false,
                            length: 2
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }, {
                value: 1 - perc,
                itemStyle: {
                    normal: {
                        color: 'transparent'
                    }
                }
            }],
            animationEasingUpdate: 'bounceOut',
            animationDurationUpdate: 2000
        };
    }

    function getTit(lpos, tit, colr) {
        return {
            show: true,
            text: tit,
            textAlign: 'center',
            bottom: 0,
            left: lpos,
            textStyle: {
                color: colr,
                fontSize: 10,
            }
        };
    }

    var smlOpt = {
        backgroundColor: 'rgba(255,255,255,0)',
        tooltip: {
            trigger: 'item',
            textStyle: {
                fontSize: 16
            },
            formatter: "{d}%"
        },
        grid: {
            top: 5,
            bottom: 5
        },
        title: [],
        series: []
    };
    //数据处理

    smlOpt.title = [
        getTit('50%', '环状图', 'blue')
    ];
    smlOpt.series = [
        getBgSer(['20%', '50%']), getFgSer(['20%', '50%'], 0.2, 'white'),
        getBgSer(['40%', '50%']), getFgSer(['40%', '50%'], 0.8, 'red'),
        getBgSer(['60%', '50%']), getFgSer(['60%', '50%'], 0.7, 'orange'),
        getBgSer(['80%', '50%']), getFgSer(['80%', '50%'], 0.6, 'yellow')
    ];
    return smlOpt;
}
/////////////////////
///////小环图////////
function getSmlPieOpt() {
    function getBgSer(cent) {
        return {
            type: 'pie',
            radius: ['45%', '55%'],
            center: cent,
            silent: true,
            label: {
                normal: {
                    show: false,
                }
            },
            data: [{
                itemStyle: {
                    normal: {
                        //color: 'rgba(200,200,200,1)',
                        color: '#4C5364',
                        shadowBlur: 10,
                        shadowColor: 'rgba(0,0,0,0.8)'
                    }
                }
            }],
            animation: false
        };
    }

    function getFgSer(cent, perc, colr) {
        return {
            name: '',
            type: 'pie',
            radius: ['46%', '54%'],
            center: cent,
            silent: true,
            data: [{
                value: perc,
                itemStyle: {
                    normal: {
                        color: colr,
                        //color: '#fb358a',
                        //shadowBlur: 20,
                        //shadowColor: '#fb358a',
                        //shadowColor: mainColor,
                        borderWidth: 1.5,
                        //borderColor: borderColor,
                        label: {
                            show: true,
                            position: 'center',
                            formatter: '{d}%',
                            textStyle: {
                                color: colr,
                                fontSize: 5
                            }
                        },
                        labelLine: {
                            show: false,
                            length: 2
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }, {
                value: 1 - perc,
                itemStyle: {
                    normal: {
                        color: 'transparent'
                    }
                }
            }],
            animationEasingUpdate: 'bounceOut',
            animationDurationUpdate: 2000
        };
    }

    function getTit(lpos, tit, colr) {
        return {
            show: true,
            text: tit,
            textAlign: 'center',
            bottom: 0,
            left: lpos,
            textStyle: {
                color: colr,
                fontSize: 10,
            }
        };
    }

    var smlOpt = {
        backgroundColor: 'rgba(255,255,255,0)',
        tooltip: {
            trigger: 'item',
            textStyle: {
                fontSize: 16
            },
            formatter: "{d}%"
        },
        grid: {
            top: 5,
            bottom: 5
        },
        title: [],
        series: []
    };
    //数据处理
    smlOpt.title = [
        getTit('50%', '环状图', 'blue')
    ];
    smlOpt.series = [
        getBgSer(['50%', '50%']), getFgSer(['50%', '50%'], 0.8, 'red')
    ];

    return smlOpt;
}
//////////////////////////
//////饼图
function getPieOpt() {
    var pieOpt = {
        tooltip: {
            trigger: 'item',
            formatter: "{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'right',
            bottom: 10,
            data: [],
            //itemWidth: 10,
            //itemHeight: 7,
            inactiveColor: '#787878',
            textStyle: {
                color: '#fff',
                //fontSize: 10
            }
        },
        series: [
            {
                name: '',
                type: 'pie',
                radius: ['39%', '75%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: []
            }
        ]
    };
    //数据处理
    var tData = [{name: 'A', value: 335}, {name: 'B', value: 235}, {name: 'C', value: 310}, {name: 'D', value: 274},
        {name: 'E', value: 253}, {name: 'F', value: 420}
    ];
    var fData = formatPieData(tData);
    pieOpt.legend.data = fData.legData;
    pieOpt.series[0].data = fData.serData;

    return pieOpt;
}
//////////////////////////
//水平方向Bar
function getHorBarOpt() {
    var vecBarOpt = {
        backgroundColor: 'rgba(255,255,255,0)',
        color: ['#3398DB'],
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '6%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            scale: true,
            minInterval: 1,
            position: 'top',
            boundaryGap: false,
            splitLine: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 2,
                textStyle: {
                    color: '#aaa'
                }
            },
        },
        yAxis: {
            type: 'category',
            nameGap: 16,
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#ddd'
                }
            },
            axisTick: {
                show: false,
                lineStyle: {
                    color: '#ddd'
                }
            },
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: '#ddd'
                }
            },
            data: []
        },
        series: [{
            name: '',
            type: 'bar',
            barWidth: '60%',
            id: 'bar',
            zlevel: 2,
            symbol: 'none',
            itemStyle: {
                normal: {
                    color: '#ddb926'
                }
            },
            data: []
        }]
    };

    //数据处理
    var tData = [{name: 'Mon', value: 60}, {name: 'Tue', value: 72}, {name: 'Wed', value: 90}, {name: 'Thu', value: 88},
        {name: 'Fri', value: 96}, {name: 'Sat', value: 256}, {name: 'Sun', value: 98}
    ];
    var sData = tData.sort(function (a, b) {
        return a.value - b.value;
    });
    var fData = formatBarData(sData);
    vecBarOpt.yAxis.data = fData.ctAData;
    vecBarOpt.series[0].data = fData.serData;

    return vecBarOpt;
}
/////////////////////////////
//垂直方向Bar
function getVecBarOpt() {
    var barOpt = {
        color: ['#04A3AA'],
        backgroundColor: '#0E1522',
        tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}",
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '5%',
            right: '5%',
            bottom: '5%',
            top: '5%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: [],
                nameTextStyle: {
                    color: "#fff", // 刻度颜色
                },
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    interval: 0,
                    textStyle: {
                        color: "#fff",
                        // 刻度颜色

                    },
                    formatter: function (val) {
                        var reval = '';
                        for (var i = 0, len = val.length; i < len; i++) {
                            reval += val.charAt(i) + '\n';
                        }
                        return reval.substring(0, reval.length - 1);
                    }
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                nameTextStyle: {
                    color: "#fff", // 刻度颜色
                },
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#082335'
                    }
                },
                minInterval: 1,
                axisLabel: {
                    textStyle: {
                        color: "#083D4D", // 刻度颜色
                    }
                }
            }
        ],
        series: [
            {
                name: '数量',
                type: 'bar',
                barWidth: '60%',
                data: []
            }
        ]
    };
    //数据处理
    var tData = [{name: 'Mon', value: 30}, {name: 'Tue', value: 52}, {name: 'Wed', value: 60}, {name: 'Thu', value: 78},
        {name: 'Fri', value: 96}, {name: 'Sat', value: 246}, {name: 'Sun', value: 98}
    ];
    var sData = tData.sort(function (a, b) {
        return b.value - a.value;
    });
    var fData = formatBarData(sData);
    barOpt.xAxis[0].data = fData.ctAData;
    barOpt.series[0].data = fData.serData;
    return barOpt;
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