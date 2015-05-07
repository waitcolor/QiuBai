//
//  
//  QiuBai
//
//  Created by Mac OS on 15-4-6.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  糗百API
//头像
http://pic.qiushibaike.com/system/avtnew/1237/12376620/medium/20150221080703.jpg
http://pic.qiushibaike.com/system/avtnew/900/9003121/medium/20150316145210.jpg

http://pic.qiushibaike.com/system/avtnew/（用户UID前去掉后4位）/用户ID/medium/头像序号（icon）.jpg

//段子图片
http://pic.qiushibaike.com/system/pictures/10305/103052428/medium/app103052428.jpg
http://pic.qiushibaike.com/system/pictures/10306/103062850/medium/app103062850.jpg

http://pic.qiushibaike.com/system/pictures/段子id去掉后4位/段子id/medium/image对应的内容（app+段子ID）
#import<Foundation/Foundation.h>
投稿文字 + 图片
http://m2.qiushibaike.com/article/create
参数
json:json	{"image_height":723,"image_width":600,"screen_width":640,"content":"唐僧及其小分队~","anonymous":true,"image_type":"JPG","screen_height":1136,"allow_comment":true}
image :image.jpg
{
    Size	55.51 KB (56841 bytes)
    Content-Type	image/jpg
}

/*
 *--ixhan-dot-com
 Content-Disposition: form-data; name="json"
 
 {"image_height":723,"image_width":600,"screen_width":640,"content":"唐僧及其小分队~","anonymous":true,"image_type":"JPG","screen_height":1136,"allow_comment":true}
 --ixhan-dot-com
 Content-Disposition: form-data; name="image"; filename="image.jpg"
 Content-Type: image/jpg
 图片内容
 --ixhan-dot-com--
 */

response :
{
    "article": {
        "votes": {
            "down": 0,
            "up": 0
        },
        "created_at": 1428494519,
        "content": "唐僧及其小分队~",
        "published_at": 1428494519,
        "comments_count": 0,
        "user": {
            "last_visited_at": 1428494310,
            "created_at": 1425779211,
            "state": "bonded",
            "email": "lokavid@126.com",
            "last_device": "ios_6.3.1",
            "role": "n",
            "login": "Lokavid",
            "id": "26370868",
            "icon": "20150308094651.jpg"
        },
        "anonymous": 1,
        "allow_comment": true,
        "image": null,
        "id": 104185338
    },
    "err": 0
}
投稿文字
http://m2.qiushibaike.com/article/create
//匿名
json	{"screen_width":640,"content":"问：刚在同学那听了一首歌，叫《耶稣他爹玩什么》，真是太好听了！百度里搜不到，求资源！ \n回复：搜索Yesterday Once More试试","allow_comment":true,"anonymous":true,"screen_height":1136}
null	--ixhan-dot-com--
//不匿名
json	{"screen_width":640,"content":"问：耶稣和释迦牟尼的最大区别是什么？\n答：他俩头发一个大卷一个小卷。","allow_comment":true,"anonymous":false,"screen_height":1136}
null	--ixhan-dot-com--

response
{
    "article": {
        "votes": {
            "down": 0,
            "up": 0
        },
        "created_at": 1428495537,
        "content": "问：耶稣和释迦牟尼的最大区别是什么？\n答：他俩头发一个大卷一个小卷",
        "published_at": 1428495537,
        "comments_count": 0,
        "user": {
            "last_visited_at": 1428494310,
            "created_at": 1425779211,
            "state": "bonded",
            "email": "lokavid@126.com",
            "last_device": "ios_6.3.1",
            "role": "n",
            "login": "Lokavid",
            "id": "26370868",
            "icon": "20150308094651.jpg"
        },
        "anonymous": 0,
        "allow_comment": true,
        "image": null,
        "id": 104186370
    },
    "err": 0
}
//删除
方法:Delete
http://m2.qiushibaike.com/user/my/articles/104187076
----------------------------------------------------------------
专享刷新
请求:curl http://m2.qiushibaike.com/mainpage/list?count=30&page=1&type=refresh

["count": 30,
"err": 0,
items:[20]
"refresh": 214,
"total": 800,
"page": 1

"count": 30,
"err": 0,
items:20:15+上面5
"refresh": 15,
"total": 800,
"page": 1


拼接加载数组前面 每组30]
不在本地拼接
直接数组清零:重新发送请求加载1页
后面上拉加载直接发送page2:拼接数组后面
http://m2.qiushibaike.com/mainpage/list?count=30&page=2&type=list
http://m2.qiushibaike.com/mainpage/list?count=30&page=4&type=list

--------------------------------------------------------------------
视频
刷新:
curl http://m2.qiushibaike.com/article/list/video?count=30&page=2&AdID=14282969871637C83D4E9C
curl http://m2.qiushibaike.com/article/list/video?count=30&page=1&AdID=14282969864281C83D4E9C


纯文
刷新
curl http://m2.qiushibaike.com/article/list/text?count=30&page=1&AdID=14282972050065C83D4E9C
curl http://m2.qiushibaike.com/article/list/text?count=30&page=2&AdID=14282972055381C83D4E9C

纯图
刷新
curl http://m2.qiushibaike.com/article/list/imgrank?count=30&page=1&AdID=14282975564175C83D4E9C


精华
curl http://m2.qiushibaike.com/article/list/day?count=30&page=1&AdID=14282976505800C83D4E9C
curl http://m2.qiushibaike.com/article/list/day?count=30&page=2&AdID=14282976508726C83D4E9C


最新
curl http://m2.qiushibaike.com/article/list/latest?count=30&page=2&AdID=14282977634059C83D4E9C


刷新??2分钟一次
curl http://m2.qiushibaike.com/mainpage/check?
response
{
    "num": 0,
    "err": 0
}



登陆账号
http://m2.qiushibaike.com/user/my/info?AdID=14283910718302C83D4E9C


{"userdata":
    {"articles":
        {"a": 0,
        "t_all": 0,
         "t": 0},
    "wb": "皇甫若云"},
    "user":
        {"last_visited_at": 1425779211,
        "created_at": 1425779211,
        "state": "bonded",
        "email": "767765740@qq.com",
        "last_device": "ios_6.3.1",
        "role": "n",
        "login": "皇甫若云",
        "id": "26370868",
        "icon": "20150308094651.jpg"},
    "err": 0,
    "_logs":
        {"002": "mb_c",
        "001": "test_i_app"}
}


***1.发送账号信息
post:http://m2.qiushibaike.com/user/signin
params:{"login":"","pass":"qiushibaike.71"}
返回userdata,token,im,user,err信息:token用于请求头

//2.curl http://m2.qiushibaike.com/config
//3.发送设备信息http://nearby.qiushibaike.com/user/26370868/detail
//{"device_info":"iPhone5,2|Apple|iPhone 5 (GSM+CDMA)|IOS 8.2","mobile_brand":"iPhone5,2"}

//4.http://m2.qiushibaike.com/mainpage/check?AdID=14283909877878C83D4E9C
***5.http://bitmap.qiushibaike.com/bitmap/26370868/get?AdID=14283909878223C83D4E9C

{"bitInit": 1, "pushNewFan": 1, "pushImSound": 1, "err": 0, "pushArticle": 1, "pushImDetail": 1, "pushImTotal": 1, "pushPublic": 1, "pushImVibrate": 1, "pushTribe": 1, "pushTribeTmp": 1, "pushAntiDisturb": 0}

curl http://nearby.qiushibaike.com/user/26370868/detail?AdID=14283910659617C83D4E9C
{
    "userdata": {
        "uid": 26370868,
        "hometown": "",
        "haunt": "",
        "qb_age": 31,
        "icon_eday": 0,
        "astrology": "",
        "mobile_brand": "Fight Club",
        "smile_cnt": 0,
        "big_cover": "",
        "big_cover_eday": 0,
        "qs_cnt": 0,
        "location": "",
        "hobby": "",
        "email": "767765740@qq.com",
        "login_eday": 0,
        "wb": "皇甫若云",
        "relationship": "no_rel",
        "introduce": "",
        "job": "",
        "birthday": "",
        "icon": "20150308094651.jpg",
        "qq": "",
        "gender": "U",
        "created_at": 1425750411,
        "signature": "",
        "login": "皇甫若云",
        "age": 0
    },
    "err": 0
}




//Qbtoken:83bfdc85cb871509887f50b8c022fafc2d6cc519
If-None-Match:"81668a02af67944c5e0adabfb9e97a1f5b8afbc0"
Uuid:ios_7C4E0215DACF07D22FD2CC6610B3809F
cookie:__utma=210674965.1625135894.1420450501.1420450501.1425716323.2; __utmz=210674965.1420450501.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)

{"userdata":
    {"articles": {"a": 0, "t_all": 0, "t": 0}},
"token": "83bfdc85cb871509887f50b8c022fafc2d6cc519",
"im": 1,
"user": {"last_visited_at": 1425779211, "created_at": 1425779211, "state": "bonded", "email": "767765740@qq.com", "last_device": "ios_6.3.1", "role": "n", "login": "\u7687\u752b\u82e5\u4e91", "id": "26370868", "icon": "20150308094651.jpg"},
"err": 0}



http://m2.qiushibaike.com/config



GET /config HTTP/1.1
Host	m2.qiushibaike.com
User-Agent	QiuBai/6.4.2 (iPhone; iPhone OS 8.2; zh_CN) PLHttpClient/1
If-None-Match	"81668a02af67944c5e0adabfb9e97a1f5b8afbc0"
Accept	* / *
Accept-Encoding	gzip, deflate
Accept-Language	zh-cn
Connection	keep-alive
Uuid	ios_7C4E0215DACF07D22FD2CC6610B3809F
Source	ios_6.4.2
Qbtoken	83bfdc85cb871509887f50b8c022fafc2d6cc519




crl http://m2.qiushibaike.com/mainpage/list?count=30&page=1&type=refresh&AdID=14283882680437C83D4E9C
//专享刷新NSNumber:refresh:有多少条新糗事:
count/items/total/page/refresh/error
//纯文//纯图
count/items/total/page/err

糗百API
{
    "index": [{
        "url": "http://m2.qiushibaike.com/article/list/suggest",
        "shuffle": false,
        "badge": 0,
        "title": "\u5e72\u8d27"
    }, {
        "url": "http://m2.qiushibaike.com/article/list/latest",
        "shuffle": false,
        "badge": 0,
        "title": "\u5ae9\u8349"
    }, {
        "url": "http://m2.qiushibaike.com/article/list/text",
        "shuffle": false,
        "badge": 0,
        "title": "\u6587\u5b57"
    }],
    "ol": {
        "duration": 86400,
        "version": 1
    },
    "FeedAdConfig": {
        "adPosition": [7, 15],
        "isShowAd": true,
        "adLoaderKeys": []
    },
    "image-domain": "http://pic.moumentei.com",
    "articleCofig": [{
        "extra": {
            "log": "subcribe",
            "name": "cache_article_sub"
        },
        "shuffle": false,
        "log": "suggest",
        "title": "\u4e13\u4eab",
        "url": "http://m2.qiushibaike.com/article/list/suggest",
        "cache": "cache_article_sug"
    }, {
        "shuffle": false,
        "log": "fulltext",
        "title": "\u7eaf\u6587",
        "url": "http://m2.qiushibaike.com/article/list/text",
        "cache": "cache_article_fulltext",
        "badge": 0
    }, {
        "url": "http://m2.qiushibaike.com/article/list/imgrank",
        "cache": "cache_article_pic_top",
        "shuffle": false,
        "log": "imageshot",
        "title": "\u7eaf\u56fe"
    }, {
        "url": "http://m2.qiushibaike.com/article/list/latest",
        "shuffle": true,
        "badge": 0,
        "title": "\u6700\u65b0"
    }, {
        "url": "http://m2.qiushibaike.com/article/list/video",
        "cache": "cache_article_video",
        "log": "video",
        "title": "\u89c6\u9891"
    }],
    "adbanner-close": 1,
    "video_loop_upload_interval": 180,
    "report-article": [
                       ["\u5e7f\u544a\u6b3a\u8bc8", 1],
                       ["\u6deb\u79fd\u8272\u60c5", 2],
                       ["\u9a9a\u6270\u8c29\u9a82", 3],
                       ["\u53cd\u52a8\u653f\u6cbb", 4],
                       ["\u5176\u5b83", 5]
                       ],
    "wx-share": {
        "text": "\uff08\u7cd7\u767e\uff09",
        "head": true
    }
}

