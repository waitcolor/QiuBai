//
//  TCShitUserFrame.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitUserFrame.h"
#import "TCShit.h"
@implementation TCShitUserFrame
-(void)setUser:(TCUser *)user
{
    _user = user;
    //头像
    CGFloat iconX = TCShitCellInset;
    CGFloat iconY = TCShitCellInset;
    CGFloat iconW = TCShitUserIconWidth;
    CGFloat iconH = TCShitUserIconWidth;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //昵称
    NSString *userLogin = self.user?self.user.login :@"匿名用户";
    CGSize loginSize = [userLogin sizeWithFont:TCShitLoginFontSize];
    
    CGFloat loginX = CGRectGetMaxX(self.iconFrame) + TCShitCellMargin;
    CGFloat loginY =  iconY;
    if ([self.type isEqualToString:@"hot"]) {
        loginY = CGRectGetMidY(self.iconFrame) - loginSize.height * 0.5;;
    }
    self.loginFrame = (CGRect){{loginX, loginY}, loginSize};

    //类型(热门等等)
    CGFloat typeY = loginY;
    CGFloat typeW = 50;
    CGFloat typeH = 15;
    CGFloat typeX = TCScreenWidth- TCShitCellMargin - typeW;
    self.typeFrame = CGRectMake(typeX, typeY, typeW, typeH);

    //自身Frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = TCScreenWidth;
    CGFloat h = iconH;//头像H大于昵称
    
    self.frame = CGRectMake(x, y, w, h);
}
@end
