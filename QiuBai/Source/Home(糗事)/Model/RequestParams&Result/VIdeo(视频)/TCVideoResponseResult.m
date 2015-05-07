//
//  TCVideoResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCVideoResponseResult.h"
#import "TCShit.h"
#import "MJExtension.h"
@implementation TCVideoResponseResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCShit class]};
}
@end
