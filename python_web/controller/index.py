
import tornado.web
class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")

class hello(tornado.web.RequestHandler):
    def get(self):
        self.render("hello.html")

class stop(tornado.web.RequestHandler):
    def get(self):
        tornado.ioloop.IOLoop.current().stop()