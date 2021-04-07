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
   
  </head>
  <body style="word-spacing:-4px;">
      <header class="header">
    	<span class="head_word"></span>
    </header>
    
    
    <div class="d-flex align-items-stretch" style="border:1px solid gray;">
<!-- 侧边栏导航-->
      <nav id="sidebar" style="border-right:1px solid white; width:20%; background:url('../static/img/Left.png') no-repeat; height:610px">
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
                
                <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_5.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>大学人数柱状图</a></li>
          		<li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_5_1.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" ></i>大学男女比例柱状图 </a></li>
                <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_5_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>热力图</a></li>
            
            </div>
          </div >
           <div class="container-charts"  id="echarts" style="background: white;display: inline-block;white;width: 66%;height:500px;"></div>
           <div class="container-charts"  id="echarts2" style="background: white;display: inline-block;white;width: 33%;height:500px;"></div>
        </div>
        
      </div>
    </div>
    
    <script type="text/javascript">
   $(function(){
	   
	   initEcharts();
	   
   })
    
   function initEcharts()
   {
	  
	   var myChart1 = echarts.init(document.getElementById('echarts'));
	   myChart1.showLoading();
	     // 显示标题，图例和空的坐标轴
			 myChart1.setOption({
				 title : {
				        text: '高校分布',
				        x:'center'
				    },
				 tooltip:{
					 show:true
					 },
					 legend:{
					 
					 },
					 xAxis:[{
					 type:'category',
					 data:[]//名称
					 }],
					 yAxis:[{
					 type:'value'

					 }],
					 series:[{
					 
					 'type':'bar',
					 'data':[],//数量
					 itemStyle: {
				    	 normal:{
				    		 color: function (params) { 
				                 

				                 //随机显示
				                 return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);
				             },
			 
				    	 }
				     },
					 }]
					 
			 });
			 var myChart2 = echarts.init(document.getElementById('echarts2'));
			 myChart2.setOption({
				 title : {
				        
				    },
				    tooltip : {
				    	trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				    	
				        left: 'left',
				        data: []
				    },
				    series : [
				        {
				            
				            type: 'pie',
				            radius : '45%',
				            center: ['53%', '50%'],
				            data:[
				                
				            ],
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				                
				       
				            }
				         
				        }
				    ]
					 
			 });


			
			 // 异步加载数据
			 $.get('../student/getCollegeUserNum.do').done(function (data) {
				 var name=[];
				 var keys=[]
				 
				 
				for(var k in data){
					let d  = data[k]
					name.push(d['name'])
					keys.push(d['value'])
				}
				
			     // 填入数据
			     myChart1.setOption({
			         xAxis: {
			             data: name,
			             axisLabel:{  
	                         interval:0,//横轴信息全部显示  
	                         rotate:-20,//-30度角倾斜显示  
				        }
			             
			         },
			         grid:{
					    	y2:140
					    },
			         series: [{
			             // 根据名字对应到相应的系列
			             
			             data: keys
			         }]
			     });
			 
             // 填入数据
		     myChart2.setOption({
		    	 legend: {
				        
				        //data: name
				    },
		         
		         series: [{
		             // 根据名字对应到相应的系列
		             name: '',
		             data: data
		         }]
		     });
             
		});
		echarts.connect([myChart1,myChart2]);
		 myChart1.hideLoading();

   }
    

 </script>
  
  </body>
  
</html>
