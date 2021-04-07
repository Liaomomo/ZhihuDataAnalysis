
$(function () {

    echarts_1();
    echarts_2();
    map();
    echarts_3();
    echarts_4();
    echarts_5();
    echarts_6();
    

    
    
    //职业分布
    function echarts_1() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts_1'));
        // 异步加载数据
		 $.get('../user/getUserJobLocation_1.do').done(function (data) {
			 console.log(data[0]['name'])
			 var name=[];
			 var value=[];
			 
			 
			for(var k in data){
				let d  = data[k]
				name.push(d['name'])
				value.push(d['value'])
			}
			
			List = [];
			for(var i = 0;i<data.length;i++){
				Dist = {}
				Dist['value'] = data[i]['value'];
				Dist['name'] = data[i]['name'];
				List.push(Dist);
			};
			
			
	        console.log(List)
		     
	        

		    /*    var data = [
		            {value: 42,name: '行业一'},
		            {value: 23,name: '行业二'},
		            {value: 70,name: '行业三'},

		        ];*/
			
//			***************************
			

			
	        option = {
	                backgroundColor: 'rgba(0,0,0,0)',
	                tooltip: {
	                    trigger: 'item',
	                    formatter: "{b}: <br/>{c} ({d}%)"
	                },
	                color: [ '#20b9cf', '#2089cf', '#205bcf'],
	                legend: { //图例组件，颜色和名字
	                    x: '70%',
	                    y: 'center',
	                    orient: 'vertical',
	                    itemGap: 12, //图例每项之间的间隔
	                    itemWidth: 10,
	                    itemHeight: 10,
	                    icon: 'rect',
	                    data: name,
	                    textStyle: {
	                        color: [],
	                        fontStyle: 'normal',
	                        fontFamily: '微软雅黑',
	                        fontSize: 12,
	                    }
	                },
	                series: [{
	                    name: '行业占比',
	                    type: 'pie',
	                    clockwise: false, //饼图的扇区是否是顺时针排布
	                    minAngle: 20, //最小的扇区角度（0 ~ 360）
	                    center: ['35%', '50%'], //饼图的中心（圆心）坐标
	                    radius: [40, 60], //饼图的半径
	                  //  avoidLabelOverlap: true, ////是否启用防止标签重叠
	                    itemStyle: { //图形样式
	                        normal: {
	                            borderColor: 'transparent',
	                            borderWidth: 2,
	                        },
	                    },
	                    label: { //标签的位置
	                        normal: {
	                            show: true,
	                            position: 'inside', //标签的位置
	                            formatter: "{d}%",
	                            textStyle: {
	                                color: '#fff',
	                            }
	                        },
	                        emphasis: {
	                            show: true,
	                            textStyle: {
	                                fontWeight: 'bold'
	                            }
	                        }
	                    },
	                    data: data
	                }, {
	                    name: '',
	                    type: 'pie',
	                    clockwise: false,
	                    silent: true,
	                    minAngle: 20, //最小的扇区角度（0 ~ 360）
	                    center: ['35%', '50%'], //饼图的中心（圆心）坐标
	                    radius: [0, 40], //饼图的半径
	                    itemStyle: { //图形样式
	                        normal: {
	                            borderColor: '#1e2239',
	                            borderWidth: 1.5,
	                            opacity: 0.21,
	                        }
	                    },
	                    label: { //标签的位置
	                        normal: {
	                            show: false,
	                        }
	                    },
	                    data: List
	                }]
	            };

	            // 使用刚指定的配置项和数据显示图表。
	            myChart.setOption(option);
	            window.addEventListener("resize",function(){
	                myChart.resize();
	            });
			
			
//			***************************			
		 })


    }
    
    
    
    //最热话题
    function echarts_2() {
    			  
    		   var myChart = echarts.init(document.getElementById('echarts_2'));
    		   myChart.showLoading();
    		   var colors = ['#5793f3', '#EE82EE', '#FF0000'];
    		     // 显示标题，图例和空的坐标轴
    				 myChart.setOption({
    					 backgroundColor: 'rgba(0,0,0,0)',
    					 color: [ '#20b9cf', '#2089cf', '#205bcf'],
    					 color: colors,

    					    tooltip: {
    					        
    					        axisPointer: {
    					            type: 'cross'
    					        }
    					    },
    					    grid: {
    					      
    					    },
    					    toolbox: {
    					        feature: {
    					            dataView: {show: true, readOnly: false},
    					            restore: {show: true},
    					            saveAsImage: {show: true}
    					        }
    					    },
    					    legend: {
    					    	textStyle: {
    		                        color: [],
    		                        fontStyle: 'normal',
    		                        fontFamily: '微软雅黑',
    		                        fontSize: 12,
    		                    }
    					    },
    					    xAxis: [
    					        {
    					            type: 'category',
    					            axisTick: {
    					                alignWithLabel: true
    					            },
    					            data: []
    					        }
    					    ],
    					    yAxis: [
    					        {
    					        	lineStyle: {
    				                    color: colors[0]
    				                }
    					           
    					        },
    					        {
    					        	lineStyle: {
    				                    color: colors[2]
    				                }
    					            
    					            
    					        },
    					        {
    					        	 lineStyle: {
    					                    color: colors[2]
    					                }
    					        }
    					    ],
    					    series: [
    					        {
    					            name:'男',
    					            type:'bar',
    					            data:[]
    					        },
    					        {
    					            name:'女',
    					            type:'bar',
    					            
    					            data:[]
    					        },
    					        {
    					            name:'总数',
    					            type:'line',
    					            yAxisIndex: 2,
    					            data:[]
    					        }
    					    ]
    					

    						 
    				 });
    				
    				 // 异步加载数据
    				 $.get('../student/getCollegeUserSexRatio.do').done(function (data) {
    					 var education=[];
    					 var male=[]
    					 var female=[]
    					 var total=[]
    					 
    					 
    					for(var k in data){
    						let d  = data[k]
    						education.push(d['education'])
    						male.push(d['male'])
    						female.push(d['female'])
    						total.push(d['total'])
    					}
    					
    				     // 填入数据
    				     myChart.setOption({
    				    	 
    				         xAxis: {
    				             data: education,
    				             
    				             axisLabel:{  
    		                         //interval:0,  横轴信息全部显示  
    		                         rotate:-20,//-30度角倾斜显示  
    		                         color: '#fff',
    					        }
    				             
    				         },
    				         yAxis: {
    				             
    				             
    				             axisLabel:{  
    		                         
    		                         color: '#fff',
    					        }
    				             
    				         },
    				         grid:{
    						    	y2:140
    						    },
    				         series: [{
    				             
    				             name: '男',
    				             data: male
    				         },
    				         {
    				        	 name: '女',
    				             data: female
    				         },
    				         {
    				        	 name: '总数',
    				             data: total
    				         }
    				      ]
    				     });
    				 
    	            
    			});
    				 
    		    myChart.hideLoading();
			 
 }
    	   
    	   
    	   
    	   
    	   
    	   
    
    //热力图
    
    function map() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('map'));
        
        $.get('../user/getUserlocationMap.do').done(function (data) {
        	
        	
        	var geoCoordMap = {
        		    '海门':[121.15,31.89],
        		    '鄂尔多斯':[109.781327,39.608266],
        		    '招远':[120.38,37.35],
        		    '舟山':[122.207216,29.985295],
        		    '齐齐哈尔':[123.97,47.33],
        		    '盐城':[120.13,33.38],
        		    '赤峰':[118.87,42.28],
        		    '青岛':[120.33,36.07],
        		    '乳山':[121.52,36.89],
        		    '金昌':[102.188043,38.520089],
        		    '泉州':[118.58,24.93],
        		    '莱西':[120.53,36.86],
        		    '日照':[119.46,35.42],
        		    '胶南':[119.97,35.88],
        		    '南通':[121.05,32.08],
        		    '拉萨':[91.11,29.97],
        		    '云浮':[112.02,22.93],
        		    '梅州':[116.1,24.55],
        		    '文登':[122.05,37.2],
        		    '上海':[121.48,31.22],
        		    '攀枝花':[101.718637,26.582347],
        		    '威海':[122.1,37.5],
        		    '承德':[117.93,40.97],
        		    '厦门':[118.1,24.46],
        		    '汕尾':[115.375279,22.786211],
        		    '潮州':[116.63,23.68],
        		    '丹东':[124.37,40.13],
        		    '太仓':[121.1,31.45],
        		    '曲靖':[103.79,25.51],
        		    '烟台':[121.39,37.52],
        		    '福州':[119.3,26.08],
        		    '瓦房店':[121.979603,39.627114],
        		    '即墨':[120.45,36.38],
        		    '抚顺':[123.97,41.97],
        		    '玉溪':[102.52,24.35],
        		    '张家口':[114.87,40.82],
        		    '阳泉':[113.57,37.85],
        		    '莱州':[119.942327,37.177017],
        		    '湖州':[120.1,30.86],
        		    '汕头':[116.69,23.39],
        		    '昆山':[120.95,31.39],
        		    '宁波':[121.56,29.86],
        		    '湛江':[110.359377,21.270708],
        		    '揭阳':[116.35,23.55],
        		    '荣成':[122.41,37.16],
        		    '连云港':[119.16,34.59],
        		    '葫芦岛':[120.836932,40.711052],
        		    '常熟':[120.74,31.64],
        		    '东莞':[113.75,23.04],
        		    '河源':[114.68,23.73],
        		    '淮安':[119.15,33.5],
        		    '泰州':[119.9,32.49],
        		    '南宁':[108.33,22.84],
        		    '营口':[122.18,40.65],
        		    '惠州':[114.4,23.09],
        		    '江阴':[120.26,31.91],
        		    '蓬莱':[120.75,37.8],
        		    '韶关':[113.62,24.84],
        		    '嘉峪关':[98.289152,39.77313],
        		    '广州':[113.23,23.16],
        		    '延安':[109.47,36.6],
        		    '太原':[112.53,37.87],
        		    '清远':[113.01,23.7],
        		    '中山':[113.38,22.52],
        		    '昆明':[102.73,25.04],
        		    '寿光':[118.73,36.86],
        		    '盘锦':[122.070714,41.119997],
        		    '长治':[113.08,36.18],
        		    '深圳':[114.07,22.62],
        		    '珠海':[113.52,22.3],
        		    '宿迁':[118.3,33.96],
        		    '咸阳':[108.72,34.36],
        		    '铜川':[109.11,35.09],
        		    '平度':[119.97,36.77],
        		    '佛山':[113.11,23.05],
        		    '海口':[110.35,20.02],
        		    '江门':[113.06,22.61],
        		    '章丘':[117.53,36.72],
        		    '肇庆':[112.44,23.05],
        		    '大连':[121.62,38.92],
        		    '临汾':[111.5,36.08],
        		    '吴江':[120.63,31.16],
        		    '石嘴山':[106.39,39.04],
        		    '沈阳':[123.38,41.8],
        		    '苏州':[120.62,31.32],
        		    '茂名':[110.88,21.68],
        		    '嘉兴':[120.76,30.77],
        		    '长春':[125.35,43.88],
        		    '胶州':[120.03336,36.264622],
        		    '银川':[106.27,38.47],
        		    '张家港':[120.555821,31.875428],
        		    '三门峡':[111.19,34.76],
        		    '锦州':[121.15,41.13],
        		    '南昌':[115.89,28.68],
        		    '柳州':[109.4,24.33],
        		    '三亚':[109.511909,18.252847],
        		    '自贡':[104.778442,29.33903],
        		    '吉林':[126.57,43.87],
        		    '阳江':[111.95,21.85],
        		    '泸州':[105.39,28.91],
        		    '西宁':[101.74,36.56],
        		    '宜宾':[104.56,29.77],
        		    '呼和浩特':[111.65,40.82],
        		    '成都':[104.06,30.67],
        		    '大同':[113.3,40.12],
        		    '镇江':[119.44,32.2],
        		    '桂林':[110.28,25.29],
        		    '张家界':[110.479191,29.117096],
        		    '宜兴':[119.82,31.36],
        		    '北海':[109.12,21.49],
        		    '西安':[108.95,34.27],
        		    '金坛':[119.56,31.74],
        		    '东营':[118.49,37.46],
        		    '牡丹江':[129.58,44.6],
        		    '遵义':[106.9,27.7],
        		    '绍兴':[120.58,30.01],
        		    '扬州':[119.42,32.39],
        		    '常州':[119.95,31.79],
        		    '潍坊':[119.1,36.62],
        		    '重庆':[106.54,29.59],
        		    '台州':[121.420757,28.656386],
        		    '南京':[118.78,32.04],
        		    '滨州':[118.03,37.36],
        		    '贵阳':[106.71,26.57],
        		    '无锡':[120.29,31.59],
        		    '本溪':[123.73,41.3],
        		    '克拉玛依':[84.77,45.59],
        		    '渭南':[109.5,34.52],
        		    '马鞍山':[118.48,31.56],
        		    '宝鸡':[107.15,34.38],
        		    '焦作':[113.21,35.24],
        		    '句容':[119.16,31.95],
        		    '北京':[116.46,39.92],
        		    '徐州':[117.2,34.26],
        		    '衡水':[115.72,37.72],
        		    '包头':[110,40.58],
        		    '绵阳':[104.73,31.48],
        		    '乌鲁木齐':[87.68,43.77],
        		    '枣庄':[117.57,34.86],
        		    '杭州':[120.19,30.26],
        		    '淄博':[118.05,36.78],
        		    '鞍山':[122.85,41.12],
        		    '溧阳':[119.48,31.43],
        		    '库尔勒':[86.06,41.68],
        		    '安阳':[114.35,36.1],
        		    '开封':[114.35,34.79],
        		    '济南':[117,36.65],
        		    '德阳':[104.37,31.13],
        		    '温州':[120.65,28.01],
        		    '九江':[115.97,29.71],
        		    '邯郸':[114.47,36.6],
        		    '临安':[119.72,30.23],
        		    '兰州':[103.73,36.03],
        		    '沧州':[116.83,38.33],
        		    '临沂':[118.35,35.05],
        		    '南充':[106.110698,30.837793],
        		    '天津':[117.2,39.13],
        		    '富阳':[119.95,30.07],
        		    '泰安':[117.13,36.18],
        		    '诸暨':[120.23,29.71],
        		    '郑州':[113.65,34.76],
        		    '哈尔滨':[126.63,45.75],
        		    '聊城':[115.97,36.45],
        		    '芜湖':[118.38,31.33],
        		    '唐山':[118.02,39.63],
        		    '平顶山':[113.29,33.75],
        		    '邢台':[114.48,37.05],
        		    '德州':[116.29,37.45],
        		    '济宁':[116.59,35.38],
        		    '荆州':[112.239741,30.335165],
        		    '宜昌':[111.3,30.7],
        		    '义乌':[120.06,29.32],
        		    '丽水':[119.92,28.45],
        		    '洛阳':[112.44,34.7],
        		    '秦皇岛':[119.57,39.95],
        		    '株洲':[113.16,27.83],
        		    '石家庄':[114.48,38.03],
        		    '莱芜':[117.67,36.19],
        		    '常德':[111.69,29.05],
        		    '保定':[115.48,38.85],
        		    '湘潭':[112.91,27.87],
        		    '金华':[119.64,29.12],
        		    '岳阳':[113.09,29.37],
        		    '长沙':[113,28.21],
        		    '衢州':[118.88,28.97],
        		    '廊坊':[116.7,39.53],
        		    '菏泽':[115.480656,35.23375],
        		    '合肥':[117.27,31.86],
        		    '武汉':[114.31,30.52],
        		    '大庆':[125.03,46.58]
        		};
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

        		option = {
        				title: {
        			        //text: '知乎高校用户分布',
        			        textVerticalAlign:'center'
        			    },	
        		    tooltip : {
        		        trigger: 'item'
        		    },
        		  
        		    geo: {
        		        map: 'china',
        		        label: {
        		            emphasis: {
        		                show: false
        		            }
        		        },
        		        roam: true,
        		        itemStyle: {
        		            normal: {
        		                areaColor: '#3eabff',
        		                borderColor: '#fff'
        		            },
        		            emphasis: {
        		                areaColor: '#006be4'
        		            }
        		        }
        		    },
        		    series : [
        		        {
        		            name: '知乎高校用户分布',
        		            type: 'scatter',
        		            coordinateSystem: 'geo',
        		            data: convertData(data),
        		            symbolSize: function (val) {
        		                return val[2] / 80;
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
        		                    color: '#fff'
        		                }
        		            }
        		        },
        		        {
        		            name: 'Top 20',
        		            type: 'effectScatter',
        		            coordinateSystem: 'geo',
        		            data: convertData(data.sort(function (a, b) {
        		                return b.value - a.value;
        		            }).slice(0, 1000)),
        		            symbolSize: function (val) {
        		                return val[2] / 80;
        		            },
        		            showEffectOn: 'render',
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
        		                    color: '#0041d2',
        		                    shadowBlur: 10,
        		                    shadowColor: 'rgba(0,0,0,.1)'
        		                }
        		            },
        		            zlevel: 1
        		        }
        		    ]
        		};
        				
        		        myChart.setOption(option);
        		        window.addEventListener("resize",function(){
        		            myChart.resize();
        		        });
       	
        	
        });

    }
    
    
    
    
	//
    
    function echarts_3() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts_3'));

        option = {

            tooltip : {
                trigger: 'axis'
            },
          
            grid: {
                left: '3%',
                right: '5%',
                top:'8%',
                bottom: '5%',
                containLabel: true
            },
            color:['#a4d8cc','#25f3e6'],
            toolbox: {
                show : false,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },

            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    axisTick:{show:false},
                    boundaryGap : false,
                    axisLabel: {
                        textStyle:{
                            color: 'rgba(255,255,255,.6)',
                            fontSize:'12'
                        },
                        lineStyle:{
                            color:'rgba(255,255,255,.1)',
                        },
                        interval: {default: 0},
                     //   rotate:50,
                        formatter : function(params){
                            var newParamsName = "";// 最终拼接成的字符串
                            var paramsNameNumber = params.length;// 实际标签的个数
                            var provideNumber = 4;// 每行能显示的字的个数
                            var rowNumber = Math.ceil(paramsNameNumber / provideNumber);// 换行的话，需要显示几行，向上取整
                            /**
                             * 判断标签的个数是否大于规定的个数， 如果大于，则进行换行处理 如果不大于，即等于或小于，就返回原标签
                             */
                            // 条件等同于rowNumber>1
                            if (paramsNameNumber > provideNumber) {
                                /** 循环每一行,p表示行 */
                                var tempStr = "";
                                tempStr=params.substring(0,4);
                                newParamsName = tempStr+"...";// 最终拼成的字符串
                            } else {
                                // 将旧标签的值赋给新标签
                                newParamsName = params;
                            }
                            //将最终的字符串返回
                            return newParamsName
                        }

                    },
                    data: ['星期一','星期二 ','星期三 ','星期四','星期五','星期六','星期天']
                }
            ],
            yAxis : {
				min:300,
                type : 'value',
                axisLabel: {
                    textStyle: {
                        color: '#ccc',
                        fontSize:'12',
                    }
                },
                axisLine: {
                    lineStyle:{
                        color:'rgba(160,160,160,0.2)',
                    }
                },
                splitLine: {
                    lineStyle:{
                        color:'rgba(160,160,160,0.2)',
                    }
                },

            },
			
            series : [
                {
                    // name:'简易程序案件数',
					 lineStyle:{
                        color:'#72b0f9',
                    },
					
                    type:'line',
                    areaStyle: {

                        normal: {type: 'default',
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 0.8, [{
                                offset: 0,
                                color: 'rgba(129,197,255,.6)'
                            }, {
                                offset: 1,
                                color: 'rgba(129,197,255,.0)'
                            }], false)
                        }
                    },
                    smooth:true,
                    itemStyle: {
                        normal: {areaStyle: {type: 'default'}}
                    },
                    data:[580, 490, 700,450, 550, 660, 540]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
    
    
    
    
    //pangrank  排行前五
    function echarts_4() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts_4'));

        option = {

            tooltip : {
                trigger: 'item',
                formatter: "{b}: <br/>  {c} ({d}%)"
            },

            toolbox: {
                show : false,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [

                {
                    name:'排名',
                    type:'pie',
                    color: ['#33b565', '#20cc98', '#20b9cf', '#2089cf', '#205bcf'],
                    radius : [20, 70],
                    center : ['50%', '50%'],
                    roseType : 'area',
                    data:[
                  /*  	chenran,陈然,49814,1100.206122651716
                    	anderson-76,Maker毕,1582,423.929399316305
                    	zerojz,zero,29475,412.09666593062707
                    	wwwwodddd,wwwwodddd,3155,406.5036564239385
                    	xia-bingying,夏冰莹,8482,174.19876403576976*/
                    	
                    	
                        {value:1100.206122651716, name:'陈然'},
                        {value:423.929399316305, name:'Maker毕'},
                        {value:412.09666593062707, name:'zero'},
                        {value:406.5036564239385, name:'wwwwodddd'},
                        {value:174.19876403576976, name:'夏冰莹'}

                    ]
                }
            ]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
    
    
    
    //高校用户信息
    function echarts_5() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts_5'));

        $.get('../fans/getMostFansNumUser_1.do').done(function (data) {
			 var name=[];
			 var value=[]
			 
			 
			for(var k in data){
				let d  = data[k]
				name.push(d['name'])
				value.push(d['value'])
			}
			 
			 
			// 显示标题，图例和空的坐标轴
		 	   myChart.setOption({
		 		 
		 			     tooltip: {},
		 			     legend: {
		 			         data:[]
		 			     }, 
		 			    grid: {
		 			    	top:'5%',
		 			        left: '3%',
		 			        right: '4%',
		 			        bottom: '1%',
		 			        containLabel: true
		 			    },
		 			     xAxis: {
		 			         data: name,
		 			         color:'#fff',
		 			     },
		 			     yAxis: {
		 			    	 
		 			         color:'#fff',
		 			    	 },
		 			     series: [{
		 			         name: '',
		 			         type: 'bar',
		 			         barWidth: '30%',
		 			         data:data
		 			     }]
		 			    	
		 			 });
		 			
			 
			 
			 
        });	

    }
    
    
    
    
    
    
    
    //粉丝大V
    function echarts_6() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts_6'));

			// 异步加载数据
			
			  // $.get('./fans/getMostFansNumUser.do').done(function (data) 
			   $.get('../student/getCollegeUserNum.do').done(function (data){
				   
				     var name=[];
					 var value=[];
					 
					 
					for(var k in data){
						let d  = data[k]
						name.push(d['name'])
						value.push(d['value'])
					}
					
					List = [];
					for(var i = 0;i<data.length;i++){
						Dist = {}
						Dist['value'] = data[i]['value'];
						Dist['name'] = data[i]['name'];
						List.push(Dist);
					};
				   
					console.log("----------------6")
				   console.log(List)
				    console.log(name)
			        // 填入数据  
				    option = {
		                backgroundColor: 'rgba(0,0,0,0)',
		                tooltip: {
		                    trigger: 'item',
		                    formatter: "{b}: <br/>{c} ({d}%)"
		                },
		                color: [ '#20b9cf', '#2089cf', '#205bcf'],
		                legend: { //图例组件，颜色和名字
		                    x: '50%',
		                    y: 'center',
		                    orient: 'vertical',
		                    itemGap: 12, //图例每项之间的间隔
		                    itemWidth: 10,
		                    itemHeight: 10,
		                    icon: 'rect',
		                    data: name,
		                    textStyle: {
		                        color: [],
		                        fontStyle: 'normal',
		                        fontFamily: '微软雅黑',
		                        fontSize: 12,
		                    }
		                },
		                series: [{
		                    name: '行业占比',
		                    type: 'pie',
		                    clockwise: false, //饼图的扇区是否是顺时针排布
		                    minAngle: 20, //最小的扇区角度（0 ~ 360）
		                    center: ['35%', '50%'], //饼图的中心（圆心）坐标
		                    radius: [40, 60], //饼图的半径
		                  //  avoidLabelOverlap: true, ////是否启用防止标签重叠
		                    itemStyle: { //图形样式
		                        normal: {
		                            borderColor: 'transparent',
		                            borderWidth: 2,
		                        },
		                    },
		                    label: { //标签的位置
		                        normal: {
		                            show: true,
		                            position: 'inside', //标签的位置
		                            formatter: "{d}%",
		                            textStyle: {
		                                color: '#fff',
		                            }
		                        },
		                        emphasis: {
		                            show: true,
		                            textStyle: {
		                                fontWeight: 'bold'
		                            }
		                        }
		                    },
		                    data: data
		                }, {
		                    name: '',
		                    type: 'pie',
		                    clockwise: false,
		                    silent: true,
		                    minAngle: 20, //最小的扇区角度（0 ~ 360）
		                    center: ['35%', '50%'], //饼图的中心（圆心）坐标
		                    radius: [0, 40], //饼图的半径
		                    itemStyle: { //图形样式
		                        normal: {
		                            borderColor: '#1e2239',
		                            borderWidth: 1.5,
		                            opacity: 0.21,
		                        }
		                    },
		                    label: { //标签的位置
		                        normal: {
		                            show: false,
		                        }
		                    },
		                    data: List
		                }]
		            };

		            // 使用刚指定的配置项和数据显示图表。
		            myChart.setOption(option);
		            window.addEventListener("resize",function(){
		                myChart.resize();
		            });
		            
			   })
			  
         }
    

})  