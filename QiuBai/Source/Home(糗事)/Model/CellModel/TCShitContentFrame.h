//
//  TCShitContentFrame.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCShit;
@interface TCShitContentFrame : NSObject
/**
 *  糗事数据
 */
@property(nonatomic, strong) TCShit *shit;
/**
 *  自身frame
 */
@property (nonatomic, assign) CGRect frame;
/**
 *  正文frame
 */
@property (nonatomic, assign) CGRect textFrame;
/**
 *  配图(包括Video预览图)frame
 */
@property (nonatomic, assign) CGRect imageFrame;

@end
