//
//  TCUserInfoViewController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCUserInfoViewController.h"
#import "UIImageView+WebCache.h"
#import "TCUserDetailParams.h"
#import "TCUserTool.h"
#import "TCUserDetailResponseResult.h"
@interface TCUserInfoViewController ()
@property (nonatomic, strong) TCUserData *userData;
@end

@implementation TCUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化界面
    [self setUpView];
    
    //发送请求加载用户数据
    [self loadData];
    
//根据用户userID发送请求获取UserData,根据userData设置View
    //http://nearby.qiushibaike.com/user/用户ID/detail

}

- (void)setUpView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:imageView];

}

- (void)loadData
{
    TCUserDetailParams *detailParam = [[TCUserDetailParams alloc] init];
    detailParam.userID = self.userID;
    [TCUserTool loadUserInfoWithParam:detailParam success:^(TCUserDetailResponseResult *result) {
        if (result.err) {
            TCLog(@"%@", result.err);
        } else {
            self.userData = result.userdata;
            TCLog(@"%@", result.userdata);
        }
    } failure:^(NSError *error) {
        if (error) {
            TCLog(@"%@", error);
        }
    }];
}

@end
