import tornado.ioloop
import tornado.web
import sys, asyncio
import os
from controller  import  index,echarts,spider
if sys.platform == 'win32':
	asyncio.set_event_loop_policy(\
	asyncio.WindowsSelectorEventLoopPolicy())


def make_app():

    # 获取当前路径
    _dir_ = os.getcwd()
    #配置静态资源访问路径
    setting={

        "template_path":_dir_ + "/template",
        "static_path":_dir_ + "/static"
    }
   #
    return tornado.web.Application([
        (r"/", index.MainHandler),
        (r"/stop", index.stop),
        (r"/hello", index.hello),
        (r"/echarts", echarts.echarts),
        (r"/api/data", echarts.echart_data),
        (r"/echarts2", echarts.echarts2),
        (r"/api/zhihu/data", spider.zhihu_data)



    # **setting文件加入
    ],**setting)

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()