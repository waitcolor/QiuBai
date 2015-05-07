//
//  TCBaseResult.h
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCBaseResult : NSObject
/**
 *  单页返回的糗事数
 */
@property (nonatomic, copy) NSString *count;
/**
 *  返回的糗事数组
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  最近的糗事总数
 */
@property (nonatomic, copy) NSString *total;
/**
 *  当前返回的页数
 */
@property (nonatomic, copy) NSString *page;
/**
 *  错误:0->无错误/107->未登录
 */
@property (nonatomic, copy) NSString *err;
/**
 *  错误信息
 */
@property (nonatomic, copy) NSString *err_msg;

@end
