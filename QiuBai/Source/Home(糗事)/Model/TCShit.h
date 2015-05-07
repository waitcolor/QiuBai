//
//  TCShit.h
//  QiuBai
//
//  Created by Mac OS on 15-4-3.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCUser.h"
#import "TCImageSize.h"
#import "TCVotes.h"
@interface TCShit : NSObject
/**
 *  发表日期
 */
@property (nonatomic, copy) NSString *published_at;

/**
 * 糗事ID
 */
@property (nonatomic, copy) NSString *shitID;
/**
 *  糗事内容类型:word->纯文/picture->纯图/video->视频
 */
@property (nonatomic, copy) NSString *articletype;
/**
 * 内容
 */
@property (nonatomic, copy) NSString *content;
/**
 * 状态权限
 */
@property (nonatomic, copy) NSString *state;
/**
 * 创建时间,默认与published_at相同
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  type:hot/fresh
 */
@property (nonatomic, copy) NSString *type;

/**
 * 标示
 */
@property (nonatomic, copy) NSString *tag;

/**
 * 是否允许评论,默认为1
 */
@property (nonatomic, assign) NSString *allow_comment;
/**
 * 评论数
 */
@property (nonatomic, copy) NSString *comments_count;

/**
 * 糗事配图名
 */
@property (nonatomic, copy) NSString *image;
/**
 * 糗事配图尺寸width/height/size(数据大小)
 */
@property (nonatomic, strong) TCImageSize *image_size;
/**
 * 投票
 */
@property (nonatomic, strong) TCVotes *votes;
/**
 * 作者
 */
@property (nonatomic, strong) TCUser *user;

//Video类型额外属性
/**
 * 低分辨率视频完整地址
 */
@property (nonatomic, copy) NSString *low_url;
/**
 * 高分辨率视频完整地址
 */
@property (nonatomic, copy) NSString *high_url;
/**
 * 图片完整地址
 */
@property (nonatomic, copy) NSString *pic_url;
/**
 * 图片尺寸:width/height
 */
@property (nonatomic, strong) NSArray *pic_size;

@property (nonatomic, copy) NSString *loop;
@end
