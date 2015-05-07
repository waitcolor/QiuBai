//
//  TCPostNewShitParams.h
//  QiuBai
//
//  Created by Mac OS on 15-5-4.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//
//  json{"screen_width":640,"
//        content":"问：刚在同学那听了一首歌，叫《耶稣他爹玩什么》，真是太好听了！百度里搜不到，求资源！ \n回复：搜索Yesterday Once More试试","
//        allow_comment":true,"
//        anonymous":true,"
//        screen_height":1136}

#import <Foundation/Foundation.h>

@interface TCPostNewShitParams : NSObject
/**
 *  屏幕宽度
 */
@property (nonatomic, strong) NSNumber *screnn_width;
/**
 *  屏幕高度
 */
@property (nonatomic, strong) NSNumber *screen_hetight;
/**
 *  糗事内容
 */
@property (nonatomic, copy) NSString *content;
/**
 *  是否允许评论
 */
@property (nonatomic, copy) NSString *allow_comment;
/**
 *  是否匿名
 */
@property (nonatomic, copy) NSString *anonymous;

@end
