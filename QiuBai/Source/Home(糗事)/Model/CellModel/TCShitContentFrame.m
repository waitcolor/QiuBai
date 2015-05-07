//
//  TCShitContentFrame.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitContentFrame.h"
#import "TCShit.h"

@implementation TCShitContentFrame

-(void)setShit:(TCShit *)shit
{
    _shit = shit;
    //文字
    CGFloat textX = TCShitCellMargin;
    CGFloat textY = TCShitCellMargin;
    CGFloat maxWidth = TCScreenWidth - textX * 2;
    CGSize textSize = [shit.content sizeWithFont:TCShitContentFontSize maxWidth:maxWidth];
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    //配图
    CGFloat imageX = textX;
    CGFloat imageY = CGRectGetMaxY(self.textFrame) + TCShitCellMargin;
    CGFloat imageW = TCScreenWidth - 2 * TCShitCellMargin;
    CGFloat imageH = 0;

    if (_shit.image) {//1,正文图片
        
//        imageW = ((NSString *)shit.image_size.small[0]).floatValue;
        CGFloat tempW = ((NSString *)shit.image_size.big[0]).floatValue;
        CGFloat tempH = ((NSString *)shit.image_size.big[1]).floatValue;
        CGFloat scale = imageW / tempW ;
        imageH = tempH * scale;
    }
    else if (_shit.pic_url){//2,视频预览图480*480
//        imageW = ((NSString *)shit.pic_size[0]).floatValue;
//        imageH = ((NSString *)shit.pic_size[1]).floatValue;
        imageH = imageW;
    }
    self.imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //自己Frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = TCScreenWidth;
    CGFloat imageMaxY = CGRectGetMaxY(self.imageFrame);//获取imageFrame的高度,如果为0,说明不存在image
    CGFloat h = imageMaxY ? imageMaxY : CGRectGetMaxY(self.textFrame);
    
    self.frame = CGRectMake(x, y, w, h);
}

@end