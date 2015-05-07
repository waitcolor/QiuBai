//
//  TCUserTool.m
//  QiuBai
//
//  Created by Mac OS on 15-4-30.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCUserTool.h"

@implementation TCUserTool
+ (void)loadUserInfoWithParam:(TCUserDetailParams *)param success:(void (^)(TCUserDetailResponseResult *))success failure:(void (^)(NSError *))failure
{//    //http://nearby.qiushibaike.com/user/用户ID/detail
    NSString *urlString = [NSString stringWithFormat:@"http://nearby.qiushibaike.com/user/%@/detail", param.userID];
    [self getWithURL:urlString withParam:nil resultClass:[TCUserDetailResponseResult class] success:success failure:failure];
}
@end
