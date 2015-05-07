//
//  TCUserDetailResponseResult.h
//  QiuBai
//
//  Created by Mac OS on 15-4-29.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCUserData.h"
@interface TCUserDetailResponseResult : NSObject
/**
 *  返回的用户数据
 */
@property (nonatomic, strong) TCUserData *userdata;

/**
 *  错误信息
 */
@property (nonatomic, copy) NSString *err;
@end
