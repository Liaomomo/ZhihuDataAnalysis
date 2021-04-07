from urllib.request import urlopen,Request
from bs4 import  BeautifulSoup
from urllib import parse
import lxml
from urllib.parse import urlencode
import pymysql
import re
import collections # 词频统计库
import jieba #
import tornado
import jieba.analyse

class zhihu_spider(object):


        #获取网页内容
        def get_htmls(self,url):
            headers = {

                "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Mobile Safari/537.36"
                , "Referer": "https://www.zhihu.com/"
            }
            #伪装请求
            request=Request(url,headers=headers)
            #访问网页
            response=urlopen(request)
            #获取网页数据
            info=response.read().decode()
            infos=info.encode('utf-8').decode('unicode_escape')
            soup = BeautifulSoup(infos, "lxml")
            infomation=soup.get_text()
            reg=r'"title": "(.*?)"'
            list_tip= re.findall(reg, infomation)
            #ss=parse.unquote("https://www.zhihu.com/api/v4/members/miaomiao-cat/following-questions?include=data%5B*%5D.created%2Canswer_count%2Cfollower_count%2Cauthor&offset=80&limit=20")
            return  ''.join(list_tip)

        # 进行结巴分词
        def jiebas(self,info):

            seg_list_exact = jieba.cut(info,cut_all = False)
            seg=[]
            for word in seg_list_exact:  # 循环读出每个分词
                if  len(word)==1 or word in ['怎么','',' ',"的","?","，","了","是",'年','很',"好",'？','如何',':','怎样','有','什么','哪些']:
                    continue
                else:
                    seg.append(word)
            word_counts = collections.Counter(seg)  # 对分词做词频统计
            word_counts_top10 = word_counts.most_common(10)# 获取前10最高频的词
            return word_counts_top10

        def jiebas_analyze(self,info):
            keywords = jieba.analyse.extract_tags(info, topK=40, withWeight=True, allowPOS=('n', 'nr', 'ns'))

            # print(type(keywords))
            # <class 'list'>
            return keywords
            # for item in keywords:
            #     print(item[0], item[1])

        #开始爬取
        def start_run(self,user_toker):
            print("enter spider")
            # 回答
            url1 = 'https://www.zhihu.com/api/v4/members/{}/answers?include=data%5B*%5D.is_normal%2Cadmin_closed_comment%2Creward_info%2Cis_collapsed%2Cannotation_action%2Cannotation_detail%2Ccollapse_reason%2Ccollapsed_by%2Csuggest_edit%2Ccomment_count%2Ccan_comment%2Ccontent%2Ceditable_content%2Cvoteup_count%2Creshipment_settings%2Ccomment_permission%2Cmark_infos%2Ccreated_time%2Cupdated_time%2Creview_info%2Cexcerpt%2Cis_labeled%2Clabel_info%2Crelationship.is_authorized%2Cvoting%2Cis_author%2Cis_thanked%2Cis_nothelp%2Cis_recognized%3Bdata%5B*%5D.author.badge%5B%3F(type%3Dbest_answerer)%5D.topics%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20data%5B*%5D.question.has_publishing_draft%2Crelationship&offset={}&limit=20&sort_by=created'
            # 关注
            url2 = "https://www.zhihu.com/api/v4/members/{}/following-questions?include=data%5B*%5D.created%2Canswer_count%2Cfollower_count%2Cauthor&offset={}&limit=20"

            str = ''
            for i in range(20, 40, 10):
                str = str + self.get_htmls(url2.format(user_toker,i))
                str = str + self.get_htmls(url1.format(user_toker,i))

            return self.jiebas_analyze(str)

