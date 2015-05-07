//
//  TCShitDetailView.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitDetailView.h"
#import "TCShitUserView.h"
#import "TCShitContentView.h"
#import "TCShitUserFrame.h"
#import "TCShitContentFrame.h"
#import "TCShitDetailFrame.h"
@interface TCShitDetailView ()
@property (nonatomic, weak) TCShitUserView *userView;
@property (nonatomic, weak) TCShitContentView *contentView;
@end

@implementation TCShitDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.image = [UIImage resizedImage:@"timeline_card_top_background"];
        //用户
        TCShitUserView *userView = [[TCShitUserView alloc] init];
        userView.userInteractionEnabled = YES;
        [self addSubview:userView];
        self.userView = userView;
    
        //正文
        TCShitContentView *contentView = [[TCShitContentView alloc] init];
        [self addSubview:contentView];
        self.contentView = contentView;
    }
    
    return self;
}
- (void)setDetailFrame:(TCShitDetailFrame *)detailFrame
{
    _detailFrame = detailFrame;
    self.frame = detailFrame.frame;
    //用户
    self.userView.shitUserFrame = detailFrame.userFrame;
    //正文
    self.contentView.contentFrame = detailFrame.contentFrame;
    
}

@end
