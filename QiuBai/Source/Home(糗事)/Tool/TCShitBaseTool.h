//
//  TCShitBaseTool.h
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCShitBaseTool : NSObject
/**
 *  发送get请求
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param resultClass 返回结果类
 *  @param success     成功后回调
 *  @param failure     失败后回调
 */
+ (void)getWithURL:(NSString *)url withParam:(id)param resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *))failure;
/**
 *  发送post请求
 *
 *  @param url         请求路径
 *  @param param       请求参数
 *  @param resultClass 返回结果类
 *  @param success     成功后回调
 *  @param failure     失败后回调
 */
+ (void)postWithURL:(NSString *)url withParam:(id)param resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *))failure;
@end
