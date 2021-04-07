<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>社交数据综合分析大数据平台</title>
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script>
	 $(window).load(function(){  
             $(".loading").fadeOut()
            })  
	</script>
	
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/map.css">
</head>
<body>
	<div class="loading">
      <div class="loadbox"> <img src="../picture/loading.gif"> 页面加载中... </div>
    </div>
<div class="data">
    <div class="data-title">
        <div class="title-center ">社交数据综合分析大数据平台</div>
    </div>
    <div class="data-content">
        <div class="con-left fl">
            <div class="left-top">
            
            
                 <!--  -->
                    <div class="info boxstyle">
                    <a href="../page/yonghu.do"><div class="title">用户信息</div></a>
                    
                    <div class="info-main">
						<ul >
							<li><img src="../picture/info-img-1.png" alt=""><span>用户人数(人)</span><p style="font-size:16px;">3249268</p></li>
						    <li><img src="../picture/info-img-2.png" alt=""><span>在线人数(人)</span><p style="font-size:16px;">3249268</p></li>
							<li><img src="../picture/info-img-3.png" alt=""><span>当日活跃数(人)</span><p style="font-size:16px;">3249268</p></li>
							<li><img src="../picture/info-img-4.png" alt=""><span>当日活跃率(%)</span><p style="font-size:16px;">100%</p ></li>
						</ul>
                     </div>
                   </div>
                 
                
                
               <!--   -->
                  <div class="top-bottom boxstyle">
                  <a href="../page/chart_2.do">   <div class="title">行业分类</div> </a>
                    
                    <div id="echarts_1" class="charts"></div>
                  </div>
              
                
            </div>
            
            <!--  -->
               <div class="left-bottom boxstyle">
               <a href="../page/chart_5.do"><div class="title">高校男女性别比</div> </a>
                
                <div id="echarts_2" class="charts"></div>
            </div>
           
            
        </div>
        <div class="con-center fl">
            <div class="map-num">
                <p>用户人数总计(人)</p>
                <div class="num">
                    <span>3</span>
                    <span>2</span>
                    <span>4</span>
                    <span>9</span>
                    <span>2</span>
                    <span>6</span>
                    <span>8</span>
                </div>
            </div>
            
            <!-- <a href="./page/chart_2.do"></a> -->
               <div class="cen-top map" id="map"></div>
            
            
            
            
            <div class="cen-bottom boxstyle">
                <div class="title">每周用户活跃度</div>
                <div id="echarts_3" class="charts"></div>
            </div>
            
        </div>
        <div class="con-right fr">
        
          <!--   -->
             <div class="right-top boxstyle">
             <a  href="../page/chart_1.do"><div class="title">最佳活跃人TOP5</div></a>
                
                <div id="echarts_4" class="charts"></div>
            </div>          
           

            
           <!--   -->
            <div class="right-center boxstyle">
            <a href="../page/chart_0.do"><div class="title">粉丝拥有量TOP10</div></a>
                
                <div id="echarts_5" class="charts"></div>
            </div>           
            

            
           <!--   -->
             <div class="right-bottom boxstyle">
                <a href="../page/chart_5.do"><div class="title">高校人数TOP榜</div> </a>
                
                <div id="echarts_6" class="charts"></div>
            </div>           
           

            
            
        </div>
    </div>
</div>
</body> 
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/echarts.min.js"></script>
<script src="../js/china.js"></script>
<script src="../js/echarts_1.js"></script>
</html>
