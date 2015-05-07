//
//  TCImageRankResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCImageRankResponseResult.h"
#import "TCShit.h"
#import "MJExtension.h"

@implementation TCImageRankResponseResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCShit class]};
}
@end
