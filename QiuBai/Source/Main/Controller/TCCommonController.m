//
//  TCCommonController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommonController.h"
#import "TCCommonGroup.h"
#import "TCCommonItem.h"
#import "TCCommonCell.h"
#import "TCCommonItemArrow.h"
#import "TCCommonItemSwitch.h"
#import "TCCommonItemLabel.h"
#import "TCCommonItemButton.h"

@interface TCCommonController ()
@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation TCCommonController

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

/*
 *屏蔽tableView的样式
 */
- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置tableView默认属性
    self.tableView.backgroundColor = TCGlobalBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = TCShitCellMargin;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(TCShitCellMargin - 35, 0, 0, 0);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TCCommonGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCCommonCell *cell = [TCCommonCell cellWithTableView:tableView];
    TCCommonGroup *group = self.groups[indexPath.section];
    cell.item = group.items[indexPath.row];
    //设置cell所处的行号 和 所处组的总行数
    [cell setIndexPath:indexPath rowsInSection:group.items.count];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    TCCommonGroup *group = self.groups[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TCCommonGroup *group = self.groups[section];
    return group.header;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出这行对应的item模型
    TCCommonGroup *group = self.groups[indexPath.section];
    TCCommonItem *item = group.items[indexPath.row];
    
    // 判断有无需要跳转的控制器
    if (item.destVcClass) {
        UIViewController *destViewController = [[item.destVcClass alloc] init];
        destViewController.title = item.title;
        [self.navigationController pushViewController:destViewController animated:YES];
    }
    
    //判断有无想执行的操作
    if (item.operation) {
        item.operation();
    }
}


@end
