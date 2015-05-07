//
//  TCComment.h
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCUser;
@interface TCComment : NSObject
/**
 *  评论ID
 */
@property (nonatomic, copy) NSString *commentID;
/**
 *  所在层数
 */
@property (nonatomic, copy) NSString *commentFloor;
/**
 *  评论内容
 */
@property (nonatomic, copy) NSString *content;
/**
 *  评论者信息
 */
@property (nonatomic, strong) TCUser *user;

@end
