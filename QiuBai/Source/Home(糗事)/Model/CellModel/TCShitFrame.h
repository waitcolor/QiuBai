//
//  TCShitFrame.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCShitDetailFrame, TCShit;
@interface TCShitFrame : NSObject
/**
 *  工具条Frame
 */
@property (nonatomic, assign) CGRect toolBarFrame;
/**
 *  糗事详情Frame
 */
@property (nonatomic, strong) TCShitDetailFrame *detailFrame;
/**
 *  cell高度
 */
@property (nonatomic, assign) CGFloat cellHeight;
/**
 *  糗事数据
 */
@property (nonatomic, strong) TCShit *shit;
@end
