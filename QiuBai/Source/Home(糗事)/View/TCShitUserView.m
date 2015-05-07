//
//  TCShitUserView.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitUserView.h"
#import "TCShitUserFrame.h"
#import "TCShit.h"
#import "UIImageView+WebCache.h"
#import "TCCommentFrame.h"
@interface TCShitUserView () <UIGestureRecognizerDelegate>
/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;
/**
 *  昵称
 */
@property (nonatomic, weak) UILabel *loginLabel;
/**
 *  热门图标
 */
@property (nonatomic, weak) UIButton *typeButton;

@property (nonatomic, strong) TCUser *user;

@end

@implementation TCShitUserView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        //昵称
        UILabel *loginLabel = [[UILabel alloc] init];
        loginLabel.textColor = [UIColor orangeColor];
        [self addSubview:loginLabel];
        self.loginLabel = loginLabel;
        
        //类型
        UIButton *typeButton = [[UIButton alloc] init];
        typeButton.userInteractionEnabled = NO;
        [typeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        typeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        typeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self addSubview:typeButton];
        self.typeButton = typeButton;
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        recognizer.numberOfTapsRequired = 1;
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
    }
    
    return self;
}

- (void)click:(UIGestureRecognizer *)rec
{
    TCLog(@"---click--");
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    TCLog(@"-2--touchesBegan----");
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (void)setShitUserFrame:(TCShitUserFrame *)shitUserFrame
{
    _shitUserFrame = shitUserFrame;

    [self setUpUserViewWithUser:shitUserFrame.user iconFrame:shitUserFrame.iconFrame loginFrame:shitUserFrame.loginFrame];
    
    self.typeButton.hidden = YES;
    if ([shitUserFrame.type isEqualToString:@"hot"]) {
        self.typeButton.hidden = NO;
        self.typeButton.frame = shitUserFrame.typeFrame;
        [self.typeButton setTitle:@"热门" forState:UIControlStateNormal];
        [self.typeButton setImage:[UIImage imageNamed:@"subscribe_hot"] forState:UIControlStateNormal];
    }
}

- (void)setCommentFrame:(TCCommentFrame *)commentFrame
{
    _commentFrame = commentFrame;
    
    [self setUpUserViewWithUser:commentFrame.comment.user iconFrame:commentFrame.commentUserFrame.iconFrame loginFrame:commentFrame.commentUserFrame.loginFrame];

    self.typeButton.hidden = YES;
    if (commentFrame.commentUserFrame.type) {
        self.typeButton.hidden = NO;
        self.typeButton.frame = commentFrame.commentUserFrame.typeFrame;
        
        self.typeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [self.typeButton setTitle:commentFrame.comment.commentFloor forState:UIControlStateNormal];;
    }
}

- (void)setUpUserViewWithUser:(TCUser *)user iconFrame:(CGRect )iconFrame loginFrame:(CGRect)loginFrame
{
    //头像
    self.iconView.frame = iconFrame;
    //将头像裁剪为圆形
    self.iconView.layer.cornerRadius = self.iconView.frame.size.height / 2;
    //强制内部子层均实现圆形效果防止子层溢出圆形范围,开启时阴影效果消失
    self.iconView.layer.masksToBounds = YES;
    if (user) {
        self.user = user;
        //http://pic.qiushibaike.com/system/avtnew/（用户UID前去掉后4位）/用户ID/medium/头像序号（icon）.jpg
        //拼接头像地址
        NSInteger integer = user.userID.length -4;
        NSString *uidSubString = [user.userID substringToIndex:integer];
        NSString *iconURLString = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@", uidSubString,user.userID, user.icon];
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:iconURLString]placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    } else {
        self.iconView.image = [UIImage imageNamed:@"user_icon_anonymous"];
    }
    //昵称
    self.loginLabel.frame = loginFrame;
    if (user) {
        self.loginLabel.text = user.login;
        self.loginLabel.textColor = [UIColor orangeColor];
    } else {
        self.loginLabel.text = @"匿名用户";
        self.loginLabel.textColor = [UIColor grayColor];
    }
}
@end
