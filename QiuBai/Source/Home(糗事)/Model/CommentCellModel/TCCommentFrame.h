//
//  TCCommentFrame.h
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCComment.h"
#import "TCShitUserFrame.h"
@interface TCCommentFrame : NSObject
/**
 *  评论
 */
@property (nonatomic, strong) TCComment *comment;
/**
 *  评论的具体内容的frame
 */
@property (nonatomic, assign) CGRect commentContentFrame;
/**
 *  评论者视图的frame
 */
@property (nonatomic, strong) TCShitUserFrame *commentUserFrame;
/**
 *  cell高度
 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
