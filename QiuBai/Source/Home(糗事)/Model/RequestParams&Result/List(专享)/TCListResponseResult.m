//
//  TCListResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCListResponseResult.h"
#import "TCShit.h"
#import "MJExtension.h"
@implementation TCListResponseResult
+(NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCShit class]};
}
@end
