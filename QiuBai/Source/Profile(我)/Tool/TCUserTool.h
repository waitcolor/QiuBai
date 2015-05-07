//
//  TCUserTool.h
//  QiuBai
//
//  Created by Mac OS on 15-4-30.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitBaseTool.h"
#import "TCUserDetailParams.h"
#import "TCUserDetailResponseResult.h"
@interface TCUserTool : TCShitBaseTool
/**
 *  加载用户页面数据(
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)loadUserInfoWithParam:(TCUserDetailParams *)param success:(void(^)(TCUserDetailResponseResult *result))success failure:(void(^)(NSError *error))failure;
@end
