//
//  TCCommonItem.m
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommonItem.h"

@implementation TCCommonItem
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    TCCommonItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}
@end
