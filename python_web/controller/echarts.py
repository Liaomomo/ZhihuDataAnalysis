
import tornado.web
class echarts(tornado.web.RequestHandler):
    def get(self):
        self.render("echarts.html")

class echart_data(tornado.web.RequestHandler):
    def get(self):
        result=dict()

        result['title']=dict(text="ECharts 入门示例")
        result['legend']=dict(data='销量')
        result['xAxis']=dict(data=["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"])
        result['series']=[{
                'name': '销量',
                'type': 'bar',
                'data': [5, 20, 36, 10, 10, 20]
            }]

        self.finish(result)

class echarts2(tornado.web.RequestHandler):
    def get(self):
        self.render("echarts_2.html")