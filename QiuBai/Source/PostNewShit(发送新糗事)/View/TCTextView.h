//
//  TCTextView.h
//  QiuBai
//
//  Created by Mac OS on 15-4-8.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCTextView : UITextView
/**
 *  占位文字
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
