//
//  TCCommonItemButton.h
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommonItem.h"

@interface TCCommonItemButton : TCCommonItem
/**
 *  右边按钮显示文字内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  右边按钮图片
 */
@property (nonatomic, copy) NSString *image;
/**
 *  右边按钮背景图片
 */
@property (nonatomic, copy) NSString *backgroundImage;
@end
