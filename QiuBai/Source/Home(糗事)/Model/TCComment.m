//
//  TCComment.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCComment.h"
#import "MJExtension.h"
@implementation TCComment

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"commentID" : @"id", @"commentFloor":@"floor"};
}
@end
