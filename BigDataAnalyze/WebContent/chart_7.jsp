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
          <li><a href="../page/chart_5.do">高校用户分布 </a></li>
          <li><a href="../page/chart_6.do">知乎兴趣分析 </a></li>
          <li   class="active"><a href="../page/chart_7.do">PageRank用户排行 </a></li>
          <li> <a href="../page/yonghu.do">用户分析</a></li>
         </ul>

      </nav>
<!-- Sidebar Navigation end-侧边栏导航结束-->
      <div class="page-contents" >
        <div class="page-header">
          <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">知乎数据分析</h2>
          </div>
            <div>
            
            <li   style="list-style: none; display: inline-block;margin-right: 60px;"><a href="../page/relation.do" style="text-decoration: none;"></a></li>
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
