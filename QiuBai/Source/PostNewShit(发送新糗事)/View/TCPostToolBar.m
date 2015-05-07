//
//  TCPostToolBar.m
//  QiuBai
//
//  Created by Mac OS on 15-4-8.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCPostToolBar.h"

@implementation TCPostToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = TCRGBColor(240, 240, 240);
        [self addButtonWithImageName:@"post_image_from_photo" buttonType:TCPostToolBarButtonTypeAlbum];
        [self addButtonWithImageName:@"post_image_from_camera" buttonType:TCPostToolBarButtonTypeCamera];
        [self addButtonWithImageName:@"post_video_from_camera" buttonType:TCPostToolBarButtonTypeVideo];
    }
    
    return self;
}


/**
 *  添加一个tag设定为buttonType的按钮
 *
 *  @param imageName  按钮图片
 *  @param buttonType 按钮类型
 */
- (void)addButtonWithImageName:(NSString *)imageName buttonType:(TCPostToolBarButtonType)buttonType
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = buttonType;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}
/**
 *  点击按钮
 */
- (void)buttonClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(postToolBar:didClickButtonType:)]) {
        [self.delegate postToolBar:self didClickButtonType:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    CGFloat buttonW = self.width / count;
    CGFloat buttonH = self.height;
    for (int i = 0; i < count; i++) {
        UIButton *button = self.subviews[i];
        button.y = 0;
        button.width = buttonW;
        button.height = buttonH;
        button.x = buttonW * i;
    }
}

@end
