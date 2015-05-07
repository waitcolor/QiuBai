//
//  TCShitUserFrame.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCUser;
@interface TCShitUserFrame : NSObject
/**
 *  糗事数据
 */
@property(nonatomic, strong) TCUser *user;
/**
 *  自身frame
 */
@property (nonatomic, assign) CGRect frame;
/**
 *  头像frame
 */
@property (nonatomic, assign) CGRect iconFrame;
/**
 *  昵称Frame
 */
@property (nonatomic, assign) CGRect loginFrame;
/**
 *  类型frame(type:/hot/refresh)
 */
@property (nonatomic, assign) CGRect typeFrame;
/**
 *  糗事类型标示
 */
@property (nonatomic, copy) NSString *type;
@end
