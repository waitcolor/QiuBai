//
//  TCNavgationController.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCNavgationController.h"
#import "TCNavgationBar.h"
@interface TCNavgationController ()

@end

@implementation TCNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setValue:[[TCNavgationBar alloc] init] forKeyPath:@"navigationBar"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.view.backgroundColor = TCGlobalBackgroundColor;
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
