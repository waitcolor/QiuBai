//
//  TCShitDetailFrame.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitDetailFrame.h"
#import "TCShit.h"
#import "TCShitUserFrame.h"
#import "TCShitContentFrame.h"
@implementation TCShitDetailFrame
- (void)setShit:(TCShit *)shit
{
    _shit = shit;
    //UserFrame
    TCShitUserFrame *userFrame = [[TCShitUserFrame alloc] init];
    userFrame.user = self.shit.user;
    userFrame.type = self.shit.type;
    self.userFrame = userFrame;
    
    //糗事内容Frame
    TCShitContentFrame *contentFrame = [[TCShitContentFrame alloc] init];
    contentFrame.shit = self.shit;
    CGRect tempF = contentFrame.frame;
    tempF.origin.y = CGRectGetMaxY(userFrame.frame) + TCShitCellMargin;
    contentFrame.frame = tempF;
    self.contentFrame = contentFrame;
    
    //自身Frame
    CGFloat x = 0;
    CGFloat y = TCShitCellMargin;
    CGFloat w = TCScreenWidth;
    CGFloat h = CGRectGetMaxY(contentFrame.frame);
    self.frame = CGRectMake(x, y, w, h);
}
@end
