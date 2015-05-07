//
//  TCBindController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-23.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCBindController.h"
#import "TCCommonGroup.h"
#import "TCCommonItemArrow.h"
@interface TCBindController ()

@end

@implementation TCBindController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 初始化模型数据
    [self setupGroup];
    [self setupFooter];
}

- (void)setupFooter
{
    UILabel *label = [[UILabel alloc]init];

    label.font = [UIFont systemFontOfSize:13];
    label.numberOfLines = 0;
    label.text = @"绑定账号可以帮助您找回密码或登录糗百";
    label.textColor = [UIColor grayColor];
    label.height = 35;
    self.tableView.tableFooterView = label;
}

- (void)setupGroup
{
    // 1.创建组
    TCCommonGroup *group = [TCCommonGroup group];
    
    // 3.设置组的所有行数据
    TCCommonItemArrow *qq = [TCCommonItemArrow itemWithTitle:@"QQ" icon:@"icon_bind_qq"];
    qq.operation = ^{
        TCLog(@"绑定QQ");
    };
    TCCommonItemArrow *wechat = [TCCommonItemArrow itemWithTitle:@"微信" icon:@"more_weixin"];
    wechat.operation = ^{
        TCLog(@"绑定微信");
    };
    TCCommonItemArrow *sinaWeibo = [TCCommonItemArrow itemWithTitle:@"新浪微博" icon:@"icon_bind_sina"];
    sinaWeibo.operation = ^{
        TCLog(@"绑定新浪微博");
    };
    TCCommonItemArrow *email = [TCCommonItemArrow itemWithTitle:@"邮箱" icon:@"icon_bind_mail"];
    email.operation = ^{
        TCLog(@"绑定邮箱");
    };

    group.items = @[qq, wechat, sinaWeibo, email];
    [self.groups addObject:group];
}

@end
