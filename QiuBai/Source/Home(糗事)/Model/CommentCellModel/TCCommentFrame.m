//
//  TCCommentFrame.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommentFrame.h"
#import "TCComment.h"
#import "TCShitUserFrame.h"
@implementation TCCommentFrame
 -(void)setComment:(TCComment *)comment
{
    _comment = comment;
    [self setUpUserFrame];
    [self setUpContentFrame];
}

- (void)setUpUserFrame
{
    TCShitUserFrame *commentUserFrame = [[TCShitUserFrame alloc] init];
    commentUserFrame.user = self.comment.user;
    commentUserFrame.type = @"floor";
    self.commentUserFrame = commentUserFrame;
}

- (void)setUpContentFrame
{
    //文字
    CGFloat textX = self.commentUserFrame.loginFrame.origin.x;
    CGFloat textY = CGRectGetMaxY (self.commentUserFrame.loginFrame) + TCShitCellMargin;
    CGFloat maxWidth = TCScreenWidth - TCShitCellMargin * 4 - TCShitUserIconWidth;
    CGSize textSize = [self.comment.content sizeWithFont:TCShitContentFontSize maxWidth:maxWidth];
    self.commentContentFrame = (CGRect){{textX, textY}, textSize};
    self.cellHeight = CGRectGetMaxY(self.commentContentFrame) + TCShitCellMargin;
}
@end
