//
//  TCHomeController.m
//  QiuBai
//
//  Created by Mac OS on 15-3-31.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCHomeController.h"
#import "HMSegmentedControl.h"
#import "TCSuggestController.h"
#import "TCPostNewShitViewController.h"
@interface TCHomeController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentControl;

@end

@implementation TCHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化NavgationBar
    [self setUpNavgationBar];
    
    // 初始化SegmentControl
    [self setUpSegmentControl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView
{
    CGFloat scrollY = CGRectGetMaxY(self.segmentControl.frame);
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scrollY, self.view.width, self.view.height)];
        _scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.view.width * self.segmentControl.sectionTitles.count, self.view.height);
        _scrollView.delegate = self;
        [_scrollView scrollRectToVisible:CGRectMake(self.view.width, 0, self.view.width, 200) animated:NO];
        [self.view addSubview:self.scrollView];
    }
    return _scrollView;
}

/*
 * 初始化NavgationBar
 */
- (void)setUpNavgationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_review" target:self action:@selector(reviewNewShit)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_post_new" target:self action:@selector(postNewShit)];
}
/*
 * 初始化SegmentControl
 */
- (void)setUpSegmentControl
{
    CGFloat segmentControlX = 0;
    CGFloat segmentControlY = 64;
    CGFloat segmentControlW = self.view.width;
    CGFloat segmentControlH = 30;
    
    HMSegmentedControl *segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(segmentControlX, segmentControlY, segmentControlW, segmentControlH)];
    //设置segmentControl各部分标题
//    segmentControl.sectionTitles = @[@"专享", @"视频", @"图文", @"纯图", @"精华", @"最新"];
    segmentControl.sectionTitles = @[@"专享",@"视频"];

    //设置默认选中
    segmentControl.selectedSegmentIndex = 0;
    //设置背景色
    segmentControl.backgroundColor = TCRGBColor(239, 239, 239);
    
    //设置字体属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //字体颜色
    attrs[NSForegroundColorAttributeName] = TCRGBColor(160, 160, 160);
    //字体大小
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    segmentControl.titleTextAttributes = attrs;
    
    
    //设置选中时对应segementControl的按钮属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = TCRGBColor(85, 85, 105);
    selectedAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:13];
    segmentControl.selectedTitleTextAttributes = selectedAttrs;
    
    //设置segmentControl选中标题文字下指示条颜色
    segmentControl.selectionIndicatorColor = [UIColor orangeColor];
    //设置选中指示条样式:HMSegmentedControlSegmentWidthStyleFixed 与title文字长度一样
    segmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    //设置选中时指示条位置:HMSegmentedControlSelectionIndicatorLocationDown 位于title下方
    segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    self.segmentControl = segmentControl;
    

    //点击选中segmenControl的第index个按钮,跳转到对应视图
    __weak typeof(self) weakSelf = self;
    [self.segmentControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(segmentControlW * index, 0, segmentControlW, weakSelf.scrollView.height) animated:NO];

    }];
    
    [self.view addSubview:self.segmentControl];
//暂时未考虑优化等
    for (int i = 0; i < self.segmentControl.sectionTitles.count; i++) {
       TCSuggestController *homeController = [[TCSuggestController alloc] init];
        homeController.tableView.backgroundColor = TCGlobalBackgroundColor;
        homeController.tableView.frame = CGRectMake(segmentControlW * i, 0, segmentControlW, self.scrollView.height);
        [self addChildViewController:homeController];
        [self.scrollView addSubview:homeController.tableView];
    }
    
}

/*
 * 发送新糗事
 */
- (void)postNewShit
{
    TCPostNewShitViewController *postShitVC = [[TCPostNewShitViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:postShitVC];
    [self presentViewController:nav animated:YES completion:nil ];
    
}
/*
 * 审核新糗事
 */
- (void)reviewNewShit
{
    TCLog(@"--ReviewNewShit--");
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = lroundf(scrollView.contentOffset.x / pageWidth);
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
}
@end
