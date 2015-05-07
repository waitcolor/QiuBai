//
//  NSString+Extension.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  根据所给字体以及最大宽度计算出对应字符串尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
@end
