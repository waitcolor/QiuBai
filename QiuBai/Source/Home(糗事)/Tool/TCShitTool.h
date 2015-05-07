//
//  TCShitTool.h
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  糗事业务处理类

#import <Foundation/Foundation.h>
#import "TCShitBaseTool.h"
#import "TCListParams.h"
#import "TCListResponseResult.h"
#import "TCSuggestParams.h"
#import "TCSuggestResponseResult.h"
#import "TCVideoParams.h"
#import "TCVideoResponseResult.h"
#import "TCTextParams.h"
#import "TCTextResponseResult.h"
#import "TCImageRankParams.h"
#import "TCImageRankResponseResult.h"
#import "TCLatestParams.h"
#import "TCLatestResponseResult.h"
#import "TCCommentParams.h"
#import "TCCommentResponseResult.h"
#import "TCDayParams.h"
#import "TCDayResponseResult.h"
@interface TCShitTool : TCShitBaseTool
/**
 *  加载专享页面数据(未登录)
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadSuggestShitsWithParam:(TCSuggestParams *)param success:(void(^)(TCSuggestResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载专享页面数据(已登录)
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadListShitsWithParam:(TCListParams *)param success:(void(^)(TCListResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载视频页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadVideoShitsWithParam:(TCVideoParams *)param success:(void(^)(TCVideoResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载纯文页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadTextShitsWithParam:(TCTextParams *)param success:(void(^)(TCTextResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载纯图页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadImageRankShitsWithParam:(TCImageRankParams *)param success:(void(^)(TCImageRankResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载精华页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadDayShitsWithParam:(TCDayParams *)param success:(void(^)(TCDayResponseResult *result))success failure:(void(^)(NSError *error))failure;
/**
 *  加载最新页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadLatestShitsWithParam:(TCLatestParams *)param success:(void(^)(TCLatestResponseResult *result))success failure:(void(^)(NSError *error))failure;

/**
 *  加载评论
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadCommentWithParam:(TCCommentParams *)param success:(void(^)(TCCommentResponseResult *result))success failure:(void(^)(NSError *error))failure;
@end
