//
//  TCTextResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCTextResponseResult.h"
#import "TCShit.h"
#import "MJExtension.h"
@implementation TCTextResponseResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCShit class]};
}
@end
