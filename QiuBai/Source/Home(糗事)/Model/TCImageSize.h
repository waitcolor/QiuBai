//
//  TCImageSize.h
//  QiuBai
//
//  Created by Mac OS on 15-4-6.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  图片尺寸模型:数组中存放宽度,高度,大小
//

#import <Foundation/Foundation.h>

@interface TCImageSize : NSObject
/**
 * 大图片尺寸
 */
@property (nonatomic, strong) NSArray *big;
/**
 * 小图片尺寸
 */
@property (nonatomic, strong) NSArray *small;
@end
