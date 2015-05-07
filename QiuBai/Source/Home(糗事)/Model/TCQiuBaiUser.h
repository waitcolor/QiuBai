//
//  TCQiuBaiUser.h
//  QiuBai
//
//  Created by Mac OS on 15-4-2.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
// 用户模型

#import <Foundation/Foundation.h>

@interface TCQiuBaiUser : NSObject

/**
*  糗百ID
*/
@property (nonatomic, copy) NSString *ID;
/**
 *  头像
 */
@property (nonatomic, copy) NSString *icon;
/**
 * 作用未知,一般为n
 */
@property (nonatomic, copy) NSString *role;
/**
 *  用户名
 */
@property (nonatomic, copy) NSString *login;
/**
 *  状态:active/bonded
 */
@property (nonatomic, copy) NSString *state;
/**
 *  邮箱
 */
@property (nonatomic, copy) NSString *email;
/**
 * 好友头像/个人秀,具体未知
 */
@property (nonatomic, copy) NSString *avatar;
/**
 *  账号创建时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  最后登录设备
 */
@property (nonatomic, copy) NSString *last_device;
/**
 *  最后访问时间
 */
@property (nonatomic, copy) NSString *last_visited_at;

 

@end
