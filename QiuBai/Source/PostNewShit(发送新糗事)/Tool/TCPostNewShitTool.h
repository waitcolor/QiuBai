//
//  TCPostNewShitTool.h
//  QiuBai
//
//  Created by Mac OS on 15-5-4.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitBaseTool.h"
#import "TCPostNewShitParams.h"
#import "TCPostNewShitResponseResult.h"
@interface TCPostNewShitTool : TCShitBaseTool
/**
 *  发送新糗事
 *
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+ (void)sendNewShitWithParam:(TCPostNewShitParams *)param success:(void(^)(TCPostNewShitResponseResult *result))success failure:(void(^)(NSError *error))failure;
@end
