//
//  TCDayResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCDayResponseResult.h"
#import "TCShit.h"
#import "MJExtension.h"
@implementation TCDayResponseResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCShit class]};
}
@end
