<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>
    #chartdiv {
      width: 100%;
      height: 500px;
    }
</style>

    <link rel="stylesheet" type="text/css" href="../static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" type="text/css" href="../static/css/index.css"/>
    
    <!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/plugins/forceDirected.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script src="../static/js/relation_graphy.js"></script>
</head>
<body>
<header class="header">   
      <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex align-items-center justify-content-between">
          <div class="navbar-header">
               <a href="index.html" class="navbar-brand">
              <div class="brand-text brand-big visible text-uppercase"><strong class="text-primary">大数据</strong><strong>分析平台</strong></div>
              </a>

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

        
        <span class="heading">数据分析</span>
        <ul class="list-unstyled">
        <li><a href="../page/index_1.do"> <i class="fa fa-bar-chart"></i>首页 </a></li>
          <li ><a href="../page/chart_0.do" > <i class="icon-home"></i >粉丝大V </a></li>
          <!-- <li ><a href="../page/relation.do"> <i class="fa fa-bar-chart"></i>知乎大V交际圈 </a></li> -->
          <li  ><a href="../page/chart_1.do"> <i class="fa fa-bar-chart"></i>最佳活跃人 </a></li>
          <li><a href="../page/chart_2.do"> <i class="fa fa-bar-chart"></i>知乎职业分布</a></li>
         <!--  <li  class="active"><a href="../page/relation_graphy.do"> <i class="fa fa-bar-chart"></i>关系网</a></li> -->
          <li><a href="../page/chart_3.do"> <i class="fa fa-bar-chart"></i>最热话题 </a></li>
         <!--  <li><a href="../page/chart_4.do"> <i class="fa fa-bar-chart"></i>知乎僵尸粉 </a></li> -->
          <li><a href="../page/chart_5.do"> <i class="fa fa-bar-chart"></i>高校用户分布 </a></li>
          <li><a href="../page/chart_6.do"> <i class="fa fa-bar-chart"></i>知乎兴趣分析 </a></li>
          <li><a href="../page/chart_7.do"> <i class="fa fa-bar-chart"></i>PageRank用户排行 </a></li>
          <li> <a href="../page/yonghu.do"> <i class="icon-settings"></i>用户分析</a></li>
          </ul>

          

      </nav>
<!-- Sidebar Navigation end-侧边栏导航结束-->
      <div class="page-contents" >
        <div class="page-header">
          <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">知乎数据分析</h2>
          </div>
            <div>
            
            <li   style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/relation.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" style="padding-left: 15px;"></i>关系图 </a></li>
<!--             <li  class="active" style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/chart_0_1.do" style="text-decoration: none;"> <i class="fa fa-bar-chart" style="padding-left: 15px;"></i>柱状图 </a></li>
 -->           </div>
           <div class="container-charts"  id="echarts" style="background: rgb(255,255,255);">
                    <div id="chartdiv"></div>
           </div>
        </div>
        
      </div>
    </div>

</body>
</html>