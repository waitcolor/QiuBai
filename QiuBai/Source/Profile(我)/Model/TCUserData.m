//
//  TCUserData.m
//  QiuBai
//
//  Created by Mac OS on 15-4-29.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCUserData.h"
#import "MJExtension.h"
@implementation TCUserData
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"userID": @"id"};
}
@end
