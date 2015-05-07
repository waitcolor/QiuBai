//
//  TCPostNewShitTool.m
//  QiuBai
//
//  Created by Mac OS on 15-5-4.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCPostNewShitTool.h"

@implementation TCPostNewShitTool
+ (void)sendNewShitWithParam:(TCPostNewShitParams *)param success:(void (^)(TCPostNewShitResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self postWithURL:@"http://m2.qiushibaike.com/article/create" withParam:param resultClass:[TCPostNewShitResponseResult class] success:success failure:failure];
}
@end
