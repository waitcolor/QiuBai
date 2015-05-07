//
//  TCPostToolBar.h
//  QiuBai
//
//  Created by Mac OS on 15-4-8.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//  投递新糗事键盘上工具条:包括相机,相册,视频,表情

#import <UIKit/UIKit.h>
typedef enum : NSInteger{
    TCPostToolBarButtonTypeCamera, //相机
    TCPostToolBarButtonTypeAlbum,//相册
    TCPostToolBarButtonTypeVideo,//视频
    TCPostToolBarButtonTypeEmotion//表情,暂未支持
}TCPostToolBarButtonType;

@class TCPostToolBar;
@protocol TCPostToolBarDelegate <NSObject>
@optional
- (void)postToolBar:(TCPostToolBar *)tooBar didClickButtonType:(TCPostToolBarButtonType)buttonType;
@end

@interface TCPostToolBar : UIView
@property(nonatomic, weak) id<TCPostToolBarDelegate> delegate;

@end
