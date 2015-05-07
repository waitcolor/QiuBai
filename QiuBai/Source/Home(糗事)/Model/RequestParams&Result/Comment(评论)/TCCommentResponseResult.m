//
//  TCCommentResponseResult.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommentResponseResult.h"
#import "MJExtension.h"
#import "TCComment.h"
@implementation TCCommentResponseResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"items" : [TCComment class]};
}
@end
