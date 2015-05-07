//
//  TCCommonItem.h
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCCommonItem : NSObject
/*
 * 图标 
 */
@property (nonatomic, copy) NSString *icon;
/*
 * 标题
 */
@property (nonatomic, copy) NSString *title;
/*
 * 子标题
 */
@property (nonatomic, copy) NSString *subtitle;
/*
 * 右边显示的数字标记 
 */
@property (nonatomic, copy) NSString *badgeValue;
/*
 * 点击这行cell跳转到得目标控制器
 */
@property (nonatomic, assign) Class destVcClass;
@property (nonatomic, copy) void (^operation)();

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;
@end
