//
//  TCShitUserView.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  User视图:头像+昵称

#import <UIKit/UIKit.h>
@class TCShitUserFrame, TCCommentFrame,TCShitUserView;

@protocol TCShitUserViewDelegate <NSObject>
@optional
/**
 *  处理点击userView事件,根据userID跳到user详情
 *
 */
- (void)userView:(TCShitUserView *)userView withUserID:(NSString *)userID;
@end

@interface TCShitUserView : UIView

@property(nonatomic, strong) TCShitUserFrame *shitUserFrame;
@property(nonatomic, strong) TCCommentFrame *commentFrame;
@property(nonatomic, weak) id<TCShitUserViewDelegate> delegate;

@end
