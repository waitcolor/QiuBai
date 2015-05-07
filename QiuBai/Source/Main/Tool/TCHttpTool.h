//
//  TCHttpTool.h
//  QiuBai
//
//  Created by Mac OS on 15-4-1.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCHttpTool : NSObject
/**
 *  发送get请求
 *
 *  @param url        请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功后回调
 *  @param failure    请求失败后回调
 */
+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  发送post请求
 *
 *  @param url        请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功后回调
 *  @param failure    请求失败后回调
 */
+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

//+(void)post:(NSString *)url parameters:(NSMutableDictionary *)parameters constructingBodyWithBlock:(NSMutableArray *(^)())block success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
