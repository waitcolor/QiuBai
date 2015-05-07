//
//  UIBarButtonItem+Extension.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    
    if (highlightedImageName) {
        [button setBackgroundImage:[[UIImage imageNamed:highlightedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]forState:UIControlStateHighlighted];
    }
    
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
   return [self itemWithImageName:imageName highlightedImageName:nil target:target action:action];
}
@end
