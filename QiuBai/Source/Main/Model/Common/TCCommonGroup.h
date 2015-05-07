//
//  TCCommonGroup.h
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  描述改组的所有数据(组头,组尾,行)

#import <Foundation/Foundation.h>

@interface TCCommonGroup : NSObject
/*
 * 组头
 */
@property (nonatomic, copy) NSString *header;
/*
 * 组尾
 */
@property (nonatomic, copy) NSString *footer;
/*
 * 用于存放行模型
 */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)group;
@end
