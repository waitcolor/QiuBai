
//
//  TCHttpTool.m
//  QiuBai
//
//  Created by Mac OS on 15-4-1.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCHttpTool.h"
#import "AFNetworking.h"
@implementation TCHttpTool
//get请求
+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //获取请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
#warning 设置请求头:Qbtoken:通过登录请求获取:
//post:http://m2.qiushibaike.com/user/signin
//params:{"login":"邮箱地址","pass":"密码"}
//  返回userdata,token,im,user,err信息:token用于请求头
    [manager.requestSerializer setValue:@"83bfdc85cb871509887f50b8c022fafc2d6cc519" forHTTPHeaderField:@"Qbtoken"];
    //发送请求
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(responseDict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
//post请求
+ (void)post:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(responseDict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
/**
 * 上传文件
 *
 */
//+(void)post:(NSString *)url parameters:(NSMutableDictionary *)parameters constructingBodyWithBlock:(NSMutableArray *(^)())block success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager POST:url
//       parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//           NSMutableArray *array = block;
//           [formData appendPartWithFileData:array[0] name:array[1] fileName:array[2] mimeType:array[3]];
//#warning 未实现
//       } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//           if (success) {
//               NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//               success(responseDict);
//           }
//       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           if (failure) {
//               failure (error);
//           }
//       }];
//}
@end
