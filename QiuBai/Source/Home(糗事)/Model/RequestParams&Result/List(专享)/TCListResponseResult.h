//
//  TCListResponseResult.h
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  封装加载专享糗事的返回结果模型

#import "TCBaseResult.h"

@interface TCListResponseResult : TCBaseResult
/*
 * 刷新条数
 */
@property (nonatomic, copy) NSString *refresh;

@end
