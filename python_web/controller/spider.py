import tornado.web
from server import sp

class zhihu_data(tornado.web.RequestHandler):
    def get(self):
        
        ip = self.request.remote_ip
        print(ip)
        self.set_header("Access-Control-Allow-Origin", "http://172.19.136.174:8080")
        print(self.get_argument('token'))
        token=self.get_argument('token')
        result=sp.start_run(token)
        lists = []
        dir = {}
        for i in result:
            dir["name"] = i[0]
            dir["value"] = i[1]
            lists.append(dir.copy())

            dir.clear()
        #print( lists) 
        print("Access-Control-Allow-Origin", "http://{}:8080".format(ip))
        self.finish(dict(data= lists))
