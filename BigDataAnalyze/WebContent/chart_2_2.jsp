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
  <body>
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
          <li class="active"><a href="../page/chart_2.do">知乎职业分布</a></li>
          <li><a href="../page/chart_3.do">最热话题 </a></li>
          <li><a href="../page/chart_5.do">高校用户分布 </a></li>
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
                <!-- <li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" ></i>柱状图 </a></li>  -->
                <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>柱状图</a></li>
              <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_2_2.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i>饼图</a></li>
              
            </div>
          </div>
           <div class="container-charts"  id="echarts" style="background: white;">
              
           </div>
        </div>
        
      </div>
    </div>
    
    <script type="text/javascript">
   $(function(){
	   
	   initEcharts();
	   
   })
    
   function initEcharts()
   {
	  
	   var myChart = echarts.init(document.getElementById('echarts'));
	     // 显示标题，图例和空的坐标轴
	    
			 myChart.setOption({
				 title : {
				        text: '职业分布',
				        x:'center'
				    },
				    tooltip : {
				    	trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				    	orient: 'vertical',
				        left: 'left',
				        data: []
				    },
				    series : [
				        {
				            
				            type: 'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
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
			 $.get('../user/getUserJobLocation2_2.do').done(function (data) {
				 var name=[];
				 var keys=[];
				 datas={};
				 console.log(data)
				
				 
				 
				for(var k in data){
					let d  = data[k]
					name.push(d['name'])
					keys.push(d['value'])
					
					
				}
				
				 
				
			     // 填入数据
			     myChart.setOption({
			    	 legend: {
					        
					        data: name
					    },
			         
			         series: [{
			             // 根据名字对应到相应的系列
			             name: '',
			             data: data
			         }]
			     });
			 });
			 

   }
    

 </script>
  
  </body>
  
</html>