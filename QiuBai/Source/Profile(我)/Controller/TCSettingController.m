//
//  TCSettingController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCSettingController.h"
#import "TCCommonGroup.h"
#import "TCCommonItem.h"
#import "TCCommonCell.h"
#import "TCCommonItemArrow.h"
#import "TCCommonItemSwitch.h"
#import "TCCommonItemLabel.h"
#import "TCCommonItemButton.h"
#import "TCNearbyViewController.h"
#import "TCShitShopViewController.h"
#import "TCBindController.h"
#import "TCNoticeController.h"
#import "SDImageCache.h"
#import "NSString+FileSize.h"
@interface TCSettingController ()

@end

@implementation TCSettingController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 初始化模型数据
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupFooter];
}

- (void)setupFooter
{
    UIButton *logout = [[UIButton alloc] init];
    
    logout.titleLabel.font = [UIFont systemFontOfSize:14];
    [logout setTitle:@"退出登录" forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [logout setBackgroundColor:[UIColor whiteColor]]; 
    logout.height = 35;
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = logout;
}

- (void)setupGroup1
{
    //创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    //设置组的所有行数据
    TCCommonItemButton *bind = [TCCommonItemButton itemWithTitle:@"密保绑定" ];
    bind.image = @"icon_bind_active";
    bind.text = @"已绑定";
    bind.destVcClass = [TCBindController class];
    group.items = @[bind];
    [self.groups addObject:group];
}

- (void)setupGroup2
{
    //创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    //设置组的所有行数据
    TCCommonItemArrow *videoList = [TCCommonItemArrow itemWithTitle:@"视频列表"];
    videoList.destVcClass = [TCNearbyViewController class];
    
    TCCommonItemArrow *notice = [TCCommonItemArrow itemWithTitle:@"提醒和通知"];
    notice.destVcClass = [TCNoticeController class];
    
    TCCommonItemArrow *blackList = [TCCommonItemArrow itemWithTitle:@"黑名单"];
    blackList.destVcClass = [TCShitShopViewController class];
                                    
    TCCommonItemLabel *clearCache = [TCCommonItemLabel itemWithTitle:@"清除缓存"];
    //SDWebImage框架中SDImage.h并未将diskCachePath(缓存图片文件夹路径)暴露,可在头文件中暴露其get方法
    NSString *imageCachePath = [SDImageCache sharedImageCache].diskCachePath;
    long long filezSize = [imageCachePath fileSize];
    
    clearCache.text = [NSString stringWithFormat:@"(%.1fM)", filezSize / (1000.0 * 1000.0)];
    __weak typeof(clearCache) weakClearCache = clearCache;
    __weak typeof(self) weakSelf = self;
    clearCache.operation = ^{
        //清除缓存
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:imageCachePath error:nil];
        weakClearCache.text = nil;
        [weakSelf.tableView reloadData];
    };
    
    TCCommonItemArrow *officialID = [TCCommonItemArrow itemWithTitle:@"官方号"];
    officialID.destVcClass = [TCShitShopViewController class];
    group.items = @[videoList, notice, blackList, clearCache, officialID];
    [self.groups addObject:group];
}

- (void)setupGroup3
{
    //创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    //设置组的所有行数据
    TCCommonItemArrow *advice = [TCCommonItemArrow itemWithTitle:@"意见反馈"];
    advice.destVcClass = [TCShitShopViewController class];
    
    TCCommonItemArrow *support = [TCCommonItemArrow itemWithTitle:@"打分支持糗百"];
    support.destVcClass = [TCShitShopViewController class];
    
    TCCommonItemArrow *noAD = [TCCommonItemArrow itemWithTitle:@"无广告版本说明"];
    noAD.destVcClass = [TCShitShopViewController class];
    
    TCCommonItemArrow *about = [TCCommonItemArrow itemWithTitle:@"关于糗百"];
    about.destVcClass = [TCShitShopViewController class];
    
    group.items = @[advice, support, noAD, about];
    [self.groups addObject:group];
}
/**
 *  退出登录按钮点击
 */
- (void)logout
{
    TCLog(@"--点击退出登录按钮-");
}

@end
