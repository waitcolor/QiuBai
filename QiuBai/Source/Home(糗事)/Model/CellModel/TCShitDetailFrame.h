//
//  TCShitDetailFrame.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCShit,TCShitContentFrame,TCShitUserFrame;
@interface TCShitDetailFrame : NSObject
/**
 *  糗事数据
 */
@property(nonatomic, strong) TCShit *shit;
/**
 *  自身frame
 */
@property (nonatomic, assign) CGRect frame;
/**
 *  糗事具体内容Frame
 */
@property (nonatomic, strong) TCShitContentFrame *contentFrame;
/**
 *  userFrame
 */
@property (nonatomic, strong) TCShitUserFrame *userFrame;
@end
