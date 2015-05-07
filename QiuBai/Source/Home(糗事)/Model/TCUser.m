//
//  TCUser.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCUser.h"
#import "MJExtension.h"
@implementation TCUser
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"userID": @"id"};
}
@end
