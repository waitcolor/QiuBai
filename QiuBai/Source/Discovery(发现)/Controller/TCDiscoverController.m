//
//  TCDiscoverController.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCDiscoverController.h"
#import "TCCommonGroup.h"
#import "TCCommonItem.h"
#import "TCCommonCell.h"
#import "TCCommonItemArrow.h"
#import "TCNearbyViewController.h"
#import "TCShitShopViewController.h"

@interface TCDiscoverController ()

@end

@implementation TCDiscoverController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    // 初始化模型数据
    [self setupGroups];
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemArrow *nearby = [TCCommonItemArrow itemWithTitle:@"附近" icon:@"discovery_nearby"];
    nearby.subtitle = @"查看附近糗友";
    nearby.destVcClass = [TCNearbyViewController class];
    
    TCCommonItemArrow *shitShop = [TCCommonItemArrow itemWithTitle:@"糗百货" icon:@"discovery_qiubaihuo"];
    shitShop.destVcClass = [TCShitShopViewController class];
    shitShop.subtitle = @"萌萌的糗事百科周边,买买买";
    
    TCCommonItem *shitHouse = [TCCommonItem itemWithTitle:@"里屋" icon:@"discovery_cafe"];
    shitHouse.subtitle = @"施工中, 敬请期待";
    
    TCCommonItem *shitGame = [TCCommonItem itemWithTitle:@"游戏" icon:@"discovery_game"];
    shitGame.subtitle = @"施工中,敬请期待";
    
    group.items = @[nearby, shitShop, shitHouse, shitGame];
    [self.groups addObject:group];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


@end
