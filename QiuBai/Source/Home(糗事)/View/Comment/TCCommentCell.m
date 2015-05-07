//
//  TCCommentCell.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommentCell.h"
#import "TCComment.h"
#import "TCShitUserView.h"
#import "TCCommentFrame.h"
#import "TCUser.h"
@interface TCCommentCell ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, weak) TCShitUserView *userView;
@end
@implementation TCCommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *resuseCommentID = @"commentID";
    TCCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseCommentID];
    if (!cell) {
        cell = [[TCCommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:resuseCommentID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        TCShitUserView *userView = [[TCShitUserView alloc] init];
        [self.contentView addSubview:userView];
        userView.userInteractionEnabled =  YES;
        self.userView = userView;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.font = TCShitContentFontSize;
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
    }
    return self;
}
- (void)setCommentFrame:(TCCommentFrame *)commentFrame
{
    _commentFrame = commentFrame;
    self.userView.commentFrame = commentFrame;

    self.contentLabel.text = commentFrame.comment.content;
    self.contentLabel.frame = commentFrame.commentContentFrame;
    
}

@end
