//
//  TCShitContentView.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  正文视图(包括文字+图片/视频)

#import "TCShitContentView.h"
#import "TCShit.h"
#import "TCShitContentFrame.h"
#import "UIImageView+WebCache.h"
@interface TCShitContentView ()
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *contentLabel;
/**
 *  图片
 */
@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation TCShitContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //添加正文

        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = TCShitContentFontSize;
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        //添加图片
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        imageView.backgroundColor = [UIColor yellowColor];
        self.imageView = imageView;
    }
    
    return self;
}

-(void)setContentFrame:(TCShitContentFrame *)contentFrame
{
    _contentFrame = contentFrame;
    self.frame = contentFrame.frame;
    TCShit *shit = contentFrame.shit;
    
    self.contentLabel.text = shit.content;
    self.contentLabel.frame = contentFrame.textFrame;
    BOOL hasImage =  CGRectGetHeight(contentFrame.imageFrame);
    if (hasImage) {
        self.imageView.hidden = NO;
        self.imageView.frame = contentFrame.imageFrame;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        NSString *imageURLString = nil;
        if (shit.image) {
            //拼接图片地址
            //http://pic.qiushibaike.com/system/pictures/段子id去掉后4位/段子id/medium/image对应的内容（app+段子ID）
            NSInteger integer = shit.shitID.length - 4;
            NSString *uidSubString = [shit.shitID substringToIndex:integer];
            imageURLString = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/pictures/%@/%@/medium/app%@.jpg", uidSubString, shit.shitID, shit.shitID];
        } else {
            imageURLString = shit.pic_url;
        }
        NSURL *imageURL = [NSURL URLWithString:imageURLString];
        [self.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"im_img_placeholder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                self.imageView.image = [UIImage imageNamed:@"im_img_download_failed"];
            }
        }];
//        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageURLString]placeholderImage:[UIImage imageNamed:@"im_img_placeholder"]];
        TCLog(@"%@", imageURLString);
    }
    else self.imageView.hidden = YES;
}

@end
