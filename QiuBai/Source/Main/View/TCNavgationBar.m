//
//  TCNavgationBar.m
//  QiuBai
//
//  Created by Mac OS on 15-4-1.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCNavgationBar.h"

@implementation TCNavgationBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置左右按钮位置
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) continue;
        
        if (button.centerX < self.width * 0.5) {//左边按钮
            button.x = 0;
        }
        else if (button.centerX > self.width * 0.5 ){//右边按钮
            button.x = self.width - button.width;
        }
    }
}
@end
