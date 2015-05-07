//
//  TCTabBarController.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCTabBarController.h"
#import "TCNavgationController.h"
#import "TCHomeController.h"
#import "TCDiscoverController.h"
#import "TCChatController.h"
#import "TCProfileController.h"

@interface TCTabBarController ()

@end

@implementation TCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addAllChildControllers];
}

- (void)addAllChildControllers
{
    TCHomeController *homeVC = [[TCHomeController alloc] init];
    [self addOneChildVC:homeVC title:@"糗事" imageName:@"icon_main" selectedImageName:@"icon_main_active"];
    
    TCDiscoverController *discoverVC = [[TCDiscoverController alloc] init];
    [self addOneChildVC:discoverVC title:@"发现" imageName:@"main_tab_discovery" selectedImageName:@"main_tab_discovery_active"];
    
    TCChatController *chatVC = [[TCChatController alloc] init];
    [self addOneChildVC:chatVC title:@"小纸条" imageName:@"icon_chat" selectedImageName:@"icon_chat_active"];
    
    TCProfileController *profileVC = [[TCProfileController alloc] init];
    [self addOneChildVC:profileVC title:@"我" imageName:@"icon_me" selectedImageName:@"icon_me_active"];
}

- (void)addOneChildVC:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childViewController.title = title;
    
    childViewController.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //默认状态下字体属性
    NSMutableDictionary *textAttrsNormal = [NSMutableDictionary dictionary];
    textAttrsNormal[NSForegroundColorAttributeName] = TCRGBColor(124, 124, 124);
    textAttrsNormal[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childViewController.tabBarItem setTitleTextAttributes:textAttrsNormal forState:UIControlStateNormal];
    
    //选中时字体属性
    NSMutableDictionary *textAttrsSelected = [NSMutableDictionary dictionary];
    textAttrsSelected[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childViewController.tabBarItem setTitleTextAttributes:textAttrsSelected forState:UIControlStateSelected];
                                        
    TCNavgationController *nav = [[TCNavgationController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
