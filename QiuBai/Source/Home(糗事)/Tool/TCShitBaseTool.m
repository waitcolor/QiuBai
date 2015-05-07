//
//  TCShitBaseTool.m
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitBaseTool.h"
#import "TCHttpTool.h"
#import "MJExtension.h"


@implementation TCShitBaseTool
+ (void)getWithURL:(NSString *)url withParam:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    [TCHttpTool get:url parameters:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

+ (void)postWithURL:(NSString *)url withParam:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    [TCHttpTool get:url parameters:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}
@end
