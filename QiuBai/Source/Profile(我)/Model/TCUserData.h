//
//  TCUserData.h
//  QiuBai
//
//  Created by Mac OS on 15-4-29.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCUserData : NSObject
/**
 *  糗百ID:uid
 */
@property (nonatomic, copy) NSString *userID;
/**
 *  头像
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  用户名
 */
@property (nonatomic, copy) NSString *login;

/**
 * 好友头像/个人秀,具体未知
 */
@property (nonatomic, copy) NSString *avatar;
/**
 *  账号创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  家乡
 */
@property (nonatomic, copy) NSString *hometown;
/**
 *  现居地
 */
@property (nonatomic, copy) NSString *haunt;
/**
 *  糗百年龄
 */
@property (nonatomic, copy) NSString *qb_age;
/**
 *  icon_eday
 */
@property (nonatomic, copy) NSString *icon_eday;
/**
 *  星座
 */
@property (nonatomic, copy) NSString *astrology;
/**
 *  手机型号
 */
@property (nonatomic, copy) NSString *mobile_brand;
/**
 *  好笑数量
 */
@property (nonatomic, copy) NSString *smile_cnt;
/**
 *  大罩(个人信息背景图片)完整地址
 */
@property (nonatomic, copy) NSString *big_cover;
/**
 *  big_cover_eday
 */
@property (nonatomic, copy) NSString *big_cover_eday;
/**
 *  发表糗事数
 */
@property (nonatomic, copy) NSString *qs_cnt;
/*
 * location
 */
@property (nonatomic, copy) NSString *location;
/**
 *  兴趣爱好
 */
@property (nonatomic, copy) NSString *hobby;
/**
 *  login_eday
 */
@property (nonatomic, copy) NSString *login_eday;
/**
 *  与自己关系
 */
@property (nonatomic, copy) NSString *relationship;
/**
 *  introduce
 */
@property (nonatomic, copy) NSString *introduce;
/**
 *  工作
 */
@property (nonatomic, copy) NSString *job;
/**
 *  性别:M,F
 */
@property (nonatomic, copy) NSString *gender;
/**
 *  个性签名
 */
@property (nonatomic, copy) NSString *signature;
/**
 *  年龄
 */
@property (nonatomic, copy) NSString *age;
@end
