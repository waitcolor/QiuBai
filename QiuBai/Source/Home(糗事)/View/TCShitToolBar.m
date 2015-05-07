//
//  TCShitToolBar.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitToolBar.h"
#import "TCShit.h"

@interface TCShitToolBar ()
//按钮数组
@property (nonatomic, strong) NSMutableArray *buttons;
//分割线数组
@property (nonatomic, strong) NSMutableArray *dividers;
//好笑
@property (nonatomic, weak) UIButton *voteUpButton;
//不好笑
@property (nonatomic, weak) UIButton *voteDownButton;
//评论数
@property (nonatomic, weak) UIButton *comentsButton;
@end

@implementation TCShitToolBar

-(NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

-(NSMutableArray *)dividers
{
    if (!_dividers) {
        _dividers = [NSMutableArray array];
    }
    
    return _dividers;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //设置背景图片
        UIImage *backGroundImage = [UIImage imageNamed:@"timeline_card_bottom_background"];
        self.image = [backGroundImage stretchableImageWithLeftCapWidth:backGroundImage.size.width * 0.5 topCapHeight:backGroundImage.size.height * 0.5];
//        self.backgroundColor = [UIColor yellowColor];
        //添加好笑按钮
        self.voteUpButton = [self buttonWithImageName:@"icon_for" selectedImageName:@"icon_for_active" defaultTitle:@"好笑"];

        //添加不好笑按钮
        self.voteDownButton = [self buttonWithImageName:@"icon_against" selectedImageName:@"icon_against_active" defaultTitle:@"不好笑"];

        //添加评论按钮
        self.comentsButton = [self buttonWithImageName:@"button_comment" selectedImageName:@"button_comment" defaultTitle:@"评论"];
        
        //添加分割线(2条)
        [self setupDivider];
        [self setupDivider];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置所有按钮frame
    CGFloat buttonsCount = self.buttons.count;
    CGFloat buttonW = self.width / buttonsCount;
    CGFloat buttonH = self.height;
    for (int i = 0; i < buttonsCount; i++) {
        UIButton *button = self.buttons[i];
        button.x = buttonW * i;
        button.y = 0;
        button.width =buttonW;
        button.height = buttonH;
    }
    
    //设置分割线frame
    CGFloat dividerCount = self.dividers.count;
    CGFloat dividerW = 5;
    CGFloat dividerH = buttonH;
    for (int i = 0; i < dividerCount; i++) {
        UIImageView *divider = self.dividers[i];
        divider.width = dividerW;
        divider.height = dividerH;
        divider.centerX = buttonW * (i + 1);
        divider.centerY = buttonH * 0.5;
    }
}

- (void)setShit:(TCShit *)shit
{
    _shit = shit;
    
    [self setUpButton:self.voteUpButton withCount:shit.votes.up defaultTitle:@"好笑"];
    [self setUpButton:self.voteDownButton withCount:shit.votes.down defaultTitle:@"不好笑"];
    [self setUpButton:self.comentsButton withCount:shit.comments_count defaultTitle:@"评论"];
}

- (void)setUpButton:(UIButton *)button withCount:(NSString *)count defaultTitle:(NSString *)defaultTitle
{
    if (count.intValue != 0) {
        defaultTitle = [NSString stringWithFormat:@"%d", abs(count.intValue)];
    }
    [button setTitle:defaultTitle forState:UIControlStateNormal];
}

/**
 *  返回一个toolBar按钮
 *  @param imageName         普通状态按钮图片名
 *  @param selectedImageName 选中状态按钮图片名
 *  @param title             默认按钮文字
 */
- (UIButton *)buttonWithImageName:(NSString *)imageName  selectedImageName:(NSString *)selectedImageName defaultTitle:(NSString *)title
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    UIImage *highlightedImage = [UIImage imageNamed:@"timeline_card_bottom_background_highlighted"];
    [button setBackgroundImage:[highlightedImage stretchableImageWithLeftCapWidth:highlightedImage.size.width * 0.5 topCapHeight:highlightedImage.size.height * 0.5]forState:UIControlStateHighlighted];
    
    [self addSubview:button];
    [self.buttons addObject:button];
    
    return button;
}

/**
 *  分割线
 */
- (void)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@"timeline_card_bottom_line"];
    divider.contentMode = UIViewContentModeCenter;
    [self addSubview:divider];
    [self.dividers addObject:divider];
}
@end
