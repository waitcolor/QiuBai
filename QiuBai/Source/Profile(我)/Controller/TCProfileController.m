//
//  TCProfileController.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCProfileController.h"
#import "TCCommonGroup.h"
#import "TCCommonItem.h"
#import "TCCommonCell.h"
#import "TCCommonItemArrow.h"
#import "TCCommonItemSwitch.h"
#import "TCNearbyViewController.h"
#import "TCShitShopViewController.h"
#import "TCSettingController.h"
#import "TCUserInfoViewController.h"
@interface TCProfileController ()

@end

@implementation TCProfileController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 初始化模型数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

/**
 *  初始化模型数据
 */
- (void)setupGroup0
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemArrow *user = [TCCommonItemArrow itemWithTitle:@"测试" icon:@"default_avatar"];
    user.destVcClass = [TCNearbyViewController class];

    group.items = @[user];
    [self.groups addObject:group];
}
- (void)setupGroup1
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemArrow *myFriends = [TCCommonItemArrow itemWithTitle:@"我的糗友" icon:@"icon_myfriends"];
    myFriends.destVcClass = [TCUserInfoViewController class];
    
    TCCommonItemArrow *searchFriends = [TCCommonItemArrow itemWithTitle:@"搜索糗友" icon:@"icon_for_search_myfriends"];
    searchFriends.destVcClass = [TCShitShopViewController class];

    group.items = @[myFriends, searchFriends];
    [self.groups addObject:group];
}

- (void)setupGroup2
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemArrow *post = [TCCommonItemArrow itemWithTitle:@"我发表的" icon:@"icon_posted"];
    post.destVcClass = [TCNearbyViewController class];
    
    TCCommonItemArrow *comment = [TCCommonItemArrow itemWithTitle:@"我参与的" icon:@"icon_icommentd"];
    comment.destVcClass = [TCShitShopViewController class];
    
    TCCommonItemArrow *favorite = [TCCommonItemArrow itemWithTitle:@"我收藏的" icon:@"icon_myfavorite"];
    favorite.destVcClass = [TCShitShopViewController class];
    group.items = @[post, comment, favorite];
    [self.groups addObject:group];
}
- (void)setupGroup3
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemSwitch *nightmode = [TCCommonItemSwitch itemWithTitle:@"夜间模式" icon:@"icon_nightmode"];
    nightmode.destVcClass = [TCNearbyViewController class];
    
    TCCommonItemArrow *setting = [TCCommonItemArrow itemWithTitle:@"设置" icon:@"icon_setting"];
    setting.destVcClass = [TCSettingController class];

    group.items = @[nightmode, setting];
    [self.groups addObject:group];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    } else return 50;
}


@end
