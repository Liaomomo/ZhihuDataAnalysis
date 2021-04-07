<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" type="text/css" href="../static/css/index.css"/>
    <script src="../static/js/jquery.min.js"></script>
    <script src="../static/js/echarts.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=sSFPImjk2jCz5Ctf84s3BdTUdi6NCIwq"></script>
    <script type="text/javascript" src="//api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <!-- <style type="text/css">
            <style type="text/css">
		ul,li{list-style: none;margin:0;padding:0;float:left;}
		html{height:80%}
		body{height:80%;margin:10px;padding:0px;font-family:"微软雅黑";}
		#container{height:520px;width:90%; margin-left:80px;margin-top:20px;margin-bottom:20px;}
		/* #r-result{width:100%;} */
    </style> -->
  </head>
  <body>
          <header class="header">
    	<span class="head_word"></span>
    </header>
    
    
    <div class="d-flex align-items-stretch" style="border:1px solid gray;">
<!-- 侧边栏导航-->
      <nav id="sidebar" style="border-right:1px solid white; width:20%; background:url('../static/img/Left.png') no-repeat;height:610px">
		<span class="heading" style="margin-left:10px;margin-top:10px;font-size:1.3em; float:left;">数据分析</span>
		
        <ul class="list-unstyled">
          <li><a href="../page/index_1.do">首页 </a></li>
          <li><a href="../page/chart_0.do" >粉丝大V </a></li>
          <li><a href="../page/chart_1.do">最佳活跃人 </a></li>
          <li><a href="../page/chart_2.do">知乎职业分布</a></li>
          <li><a href="../page/chart_3.do">最热话题 </a></li>
          <li  class="active"><a href="../page/chart_5.do">高校用户分布 </a></li>
          <li><a href="../page/chart_6.do">知乎兴趣分析 </a></li>
          <li><a href="../page/chart_7.do">PageRank用户排行 </a></li>
          <li> <a href="../page/yonghu.do">用户分析</a></li>
         </ul>

      </nav>
<!-- Sidebar Navigation end-侧边栏导航结束-->
        <div class="page-contents">
        <div class="page-header">
          <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">知乎数据分析</h2>
            <div>
              <!--    <li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" ></i>柱状图 </a></li>
            -->
            <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_5.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>大学人数柱状图</a></li>
          		<li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_5_1.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" ></i>大学男女比例柱状图 </a></li>
                <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_5_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>热力图</a></li>
            
            </div>
          </div>
          <div class="container-charts"  id="echarts" style="background: white;">
              
           </div>

        </div>
        
      </div>
       </div>
    
   <script type="text/javascript">
  var map = new BMap.Map("echarts",{minZoom:5,maxZoom:8}); // 创建Map实例,设置地图允许的最小/大级别
	map.centerAndZoom(new BMap.Point(116.30,34.10000),5); // 初始化地图，设置中心点坐标和地图级别
	map.enableScrollWheelZoom(true);// 允许滚轮缩放
	
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
	
	var convertDate = convertData(data);
	List = [];
	for(var i = 0;i<convertDate.length;i++){
		Dist = {}
		Dist['lng'] = (convertDate[i].value)[0];
		Dist['lat'] = (convertDate[i].value)[1];
		Dist['count'] = (convertDate[i].value)[2];
		List.push(Dist);
	};

   
    if(!isSupportCanvas()){
    	alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
	//详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
	//参数说明如下:
	/* visible 热力图是否显示,默认为true
     * opacity 热力的透明度,1-100
     * radius 势力图的每个点的半径大小   
     * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
     *	{
			.2:'rgb(0, 255, 255)',
			.5:'rgb(0, 110, 255)',
			.8:'rgb(100, 0, 255)'
		}
		其中 key 表示插值的位置, 0~1. 
		    value 为颜色值. 
     */
	heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
	map.addOverlay(heatmapOverlay);
	heatmapOverlay.setDataSet({
				data: List,
				max:100
				});
	//是否显示热力图
   /*  function openHeatmap(){ */
        heatmapOverlay.show();
 /*    }
	function closeHeatmap(){
        heatmapOverlay.hide();
    } */
	//closeHeatmap();
    function setGradient(){
     	/*格式如下所示:
		{
	  		0:'rgb(102, 255, 0)',
	 	 	.5:'rgb(255, 170, 0)',
		  	1:'rgb(255, 0, 0)'
		}*/
     	var gradient = {};
     	var colors = document.querySelectorAll("input[type='color']");
     	colors = [].slice.call(colors,0);
     	colors.forEach(function(ele){
			gradient[ele.getAttribute("data-key")] = ele.value; 
     	});
        heatmapOverlay.setOptions({"gradient":gradient});
    }
	//判断浏览区是否支持canvas
    function isSupportCanvas(){
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
	
    function convertData(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    value: geoCoord.concat(data[i].value)
                });
            }
        }
        return res;
    }
	 });
   
</script>
  </body>
  
</html>
