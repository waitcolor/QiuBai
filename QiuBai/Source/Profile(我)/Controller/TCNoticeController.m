//
//  TCNoticeController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-23.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCNoticeController.h"
#import "TCCommonGroup.h"
#import "TCCommonItemSwitch.h"
@interface TCNoticeController ()

@end

@implementation TCNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

- (void)setupGroup1
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    group.header = @"消息类型";
    // 3.设置组的所有行数据
    TCCommonItemSwitch *suggest = [TCCommonItemSwitch itemWithTitle:@"糗事精选"];
    
    TCCommonItemSwitch *newMessage = [TCCommonItemSwitch itemWithTitle:@"新纸条"];

    TCCommonItemSwitch *newFan = [TCCommonItemSwitch itemWithTitle:@"新粉丝"];

    group.items = @[suggest, newMessage, newFan];
    [self.groups addObject:group];
}
- (void)setupGroup2
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    group.header = @"提醒设置";
    // 3.设置组的所有行数据
    TCCommonItemSwitch *sound = [TCCommonItemSwitch itemWithTitle:@"声音"];
    
    TCCommonItemSwitch *vibrate = [TCCommonItemSwitch itemWithTitle:@"震动"];
    
    group.items = @[sound, vibrate];
    [self.groups addObject:group];
}
- (void)setupGroup3
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    group.header = @"勿扰模式";
    group.footer = @"开启时间:23:00-8:00";
    // 3.设置组的所有行数据
    TCCommonItemSwitch *silent = [TCCommonItemSwitch itemWithTitle:@"夜间防打扰模式"];
    group.items = @[silent];
    [self.groups addObject:group];
}
@end
