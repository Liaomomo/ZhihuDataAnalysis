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
      <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex align-items-center justify-content-between">
          <div class="navbar-header">
               <a href="index.html" class="navbar-brand">
              <div class="brand-text brand-big visible text-uppercase"><strong class="text-primary">大数据</strong><strong>分析平台</strong></div>
              </a>
<!-- Sidebar Toggle Btn-->
          </div>
          <div class="right-menu list-inline no-margin-bottom">    
           
            <div ><a><img src="../static/img/flags/16/CN.png" alt="English"><span class="d-none d-sm-inline-block">中文</span></a>
            </div>

           
          </div>
        </div>
      </nav>
    </header>
    <div class="d-flex align-items-stretch">
<!-- 侧边栏导航-->
      <nav id="sidebar" style="height:610px">
<!-- 侧边栏标题-->
      
        <!-- 左边菜单栏--><span class="heading">数据分析</span>
        <ul class="list-unstyled">
        <li><a href="../page/index_1.do"> <i class="fa fa-bar-chart"></i>首页 </a></li>
          <li ><a href="../page/chart_0.do" > <i class="icon-home"></i >粉丝大V </a></li>
          <!-- <li  ><a href="../page/relation.do"> <i class="fa fa-bar-chart"></i>知乎大V交际圈 </a></li> -->
          <li><a href="../page/chart_1.do"> <i class="fa fa-bar-chart"></i>最佳活跃人 </a></li>
          <li><a href="../page/chart_2.do"> <i class="fa fa-bar-chart"></i>知乎职业分布</a></li>
         <!--  <li ><a href="../page/relation_graphy.do"> <i class="fa fa-bar-chart"></i>关系网</a></li> -->
          <li><a href="../page/chart_3.do"> <i class="fa fa-bar-chart"></i>最热话题 </a></li>
          <!-- <li class="active"><a href="../page/chart_4.do"> <i class="fa fa-bar-chart"></i>知乎僵尸粉 </a></li> -->
          <li><a href="../page/chart_5.do"> <i class="fa fa-bar-chart"></i>高校用户分布 </a></li>
          <li><a href="../page/chart_6.do"> <i class="fa fa-bar-chart"></i>知乎兴趣分析 </a></li>
          <li><a href="../page/chart_7.do"> <i class="fa fa-bar-chart"></i>PageRank用户排行 </a></li>
          <li> <a href="../page/yonghu.do"> <i class="icon-settings"></i>用户分析</a></li>
           </ul>
          


      </nav>
<!-- Sidebar Navigation end-侧边栏导航结束-->
      <div class="page-contents">
        <div class="page-header">
          <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">知乎数据分析</h2>
            <div>
                <li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_4.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" ></i>饼图 </a></li>
                <li style="list-style: none;display: inline-block;margin-right: 60px;"><a href="./chart_4.do" style="text-decoration: none;"> <i class="fa fa-bar-chart"></i></a></li>
          		
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
	   myChart.showLoading();
	     // 显示标题，图例和空的坐标轴
			 myChart.setOption({
			     title: {
			         text: '粉丝人数排名'
			     },
			     tooltip: {},
			     legend: {
			         data:['人数']
			     },
			     xAxis: {
			         data: []
			     },
			     yAxis: {},
			     series: [{
			         name: '人数',
			         type: 'bar',
			         data: []
			     }]
			 });
			
			 // 异步加载数据
			 $.get('../student/getCollegeUserNum.do').done(function (data) {
				 var name=[];
				 var keys=[]
				 
				 
				for(var k in data){
					let d  = data[k]
					name.push(d['user'])
					keys.push(d['times'])
				}
				
			     // 填入数据
			     myChart.setOption({
			         xAxis: {
			             data: name
			         },
			         series: [{
			             // 根据名字对应到相应的系列
			             name: '人数',
			             data: keys
			         }]
			     });
			 });
			 myChart.hideLoading();

   }
    

 </script>
  
  </body>
  
</html>
