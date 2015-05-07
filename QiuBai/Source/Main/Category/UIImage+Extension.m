//
//  UIImage+Extension.m
//  QiuBai
//
//  Created by Mac OS on 15-4-14.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)resizedImage:(NSString *)image
{
    UIImage *originalImage = [UIImage imageNamed:image];
    return [originalImage stretchableImageWithLeftCapWidth:originalImage.size.width * 0.5 topCapHeight:originalImage.size.height * 0.5];
}
@end
