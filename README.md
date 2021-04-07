# ZhihuDataAnalysis
通过分析知乎用户数据，把握当前热点话题，推送相关行业信息。构建用户画像，给用 户打上标签，有利于对用户信息进行整体把握，挖掘其中有价值的信息。通过pageRank算法构建 用户社交关系网，挖掘大V用户，控制社交舆论的发展趋势

文件说明：
    1、原始数据：为知乎的原始数据，未经过清洗；2、数据库文件：已经清洗过后并进行数据分析得到的结构化数据；3、BigDataAnalyze 文件 ：java web 项目，主要用来对数据进行可视化（ssm框架实现）；4、python_web文件： 进行用户的特殊数据爬取，如 关注的问题和回答的问题，之后进行jieba分词统计，为java 端提供服务。
   
运行环境：
   java 端：   java 1.8 + tomcat 8.0 + mysql 5.7.21 +springboot + springmvc + mybatis  + Echart  ; 开发工具：pycharm
        
   python 端 ： python 3.7 + tornado 6.0.2 + requests 2.25.1 +jieba 0.42.1  ; 开发工具:eclipse

运行流程：
   python服务   启动python_web app.py 文件的main 方法
        
   java服务     启动tomcat 浏览器输入 ip:端口/项目名/page/chart_0.do
  
    
