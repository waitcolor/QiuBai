//
//  TCShitFrame.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitFrame.h"
#import "TCShit.h"
#import "TCShitDetailFrame.h"
@implementation TCShitFrame

- (void)setShit:(TCShit *)shit
{
    _shit = shit;
    
    //计算糗事整体Frame
    [self setUpShitDetailFrame];
    
    //计算TooBarFrame
    [self setUpShitToolBarFrame];
    
    //糗事cell高度
    self.cellHeight = CGRectGetMaxY(self.toolBarFrame);
}
/**
 *  计算糗事详情Frame
 */
- (void)setUpShitDetailFrame
{
    TCShitDetailFrame *detailFrame = [[TCShitDetailFrame alloc] init];
    detailFrame.shit = self.shit;
    self.detailFrame = detailFrame;
}

/**
 *  计算TooBarFrame
 */
- (void)setUpShitToolBarFrame
{
    CGFloat toolBarX = 0;
    CGFloat toolBarY = CGRectGetMaxY(self.detailFrame.frame);
    CGFloat toolBarW = TCScreenWidth;
    CGFloat toolBarH = 40;//工具条高度暂定40
    
    self.toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
}
@end
