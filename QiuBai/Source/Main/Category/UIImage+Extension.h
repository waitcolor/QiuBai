//
//  UIImage+Extension.h
//  QiuBai
//
//  Created by Mac OS on 15-4-14.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/*
 *  返回一张拉伸过的图片(默认拉伸最中间一个像素点)
 */
+ (UIImage *)resizedImage:(NSString *)image;
@end
