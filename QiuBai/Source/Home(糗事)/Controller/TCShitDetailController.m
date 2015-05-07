//
//  TCShitDetailController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-23.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitDetailController.h"
#import "TCShitFrame.h"
#import "TCShitCell.h"
#import "TCShit.h"
#import "TCCommentController.h"
#import "TCCommentCell.h"
#import "TCComment.h"
#import "TCCommentFrame.h"
#import "TCShitTool.h"
#import "TCCommentParams.h"
#import "TCCommentResponseResult.h"
#import "TCShitUserView.h"
#import "TCUserInfoViewController.h"
@interface TCShitDetailController ()<UITableViewDataSource, UITableViewDelegate, TCShitUserViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *commentFrameArray;
@end

@implementation TCShitDetailController

-(NSMutableArray *)commentFrameArray
{
    if (!_commentFrameArray) {
        _commentFrameArray = [NSMutableArray array];
    }
    return _commentFrameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    [self setUpTableView];
    [self setupDetailView];
    [self setUpBottomToolbar];
    if (self.shitFrame.shit.comments_count.intValue != 0) {
        [self loadComment];
    }

}
- (void)setUpNavigationBar
{
    self.title = [NSString stringWithFormat:@"糗事%@", self.shitFrame.shit.shitID];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_back" target:self action:@selector(back)];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadComment
{
    TCCommentParams *param = [[TCCommentParams alloc] init];
    param.shitID = self.shitFrame.shit.shitID;
    param.count = @50;
    param.page = @1;
    [TCShitTool loadCommentWithParam:param success:^(TCCommentResponseResult *result) {
        NSArray *receiveCommentArray = result.items;
        //将收到的Comment数组转为CommentFrame数组
        for (TCComment *comment in receiveCommentArray) {
            TCCommentFrame *commentFrame = [[TCCommentFrame alloc] init];
            commentFrame.comment = comment;
            [self.commentFrameArray addObject:commentFrame];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        if (error) {
            TCLog(@"%@", error);
        }
    }];
}

- (void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.width = self.view.width;
    tableView.height = self.view.height - 35;
    tableView.backgroundColor = TCGlobalBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (void)setupDetailView
{

    TCShitCell *cell = [[TCShitCell alloc] init];
    cell.shitFrame = self.shitFrame;
    cell.height = self.shitFrame.cellHeight;
    self.tableView.tableHeaderView = cell;
}
- (void)setUpBottomToolbar
{
    UIButton *bottomToolbar = [[UIButton alloc] init];
    [bottomToolbar setTitle:@"评论" forState:UIControlStateNormal];
    [bottomToolbar setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    bottomToolbar.y = CGRectGetMaxY(self.tableView.frame);
    bottomToolbar.width = self.view.width;
    bottomToolbar.height = self.view.height - self.tableView.height;
    
    [bottomToolbar addTarget:self action:@selector(clickCommentButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomToolbar];
}

- (void)clickCommentButton
{
    TCCommentController *comment = [[TCCommentController alloc] init];
    comment.shitID = self.shitFrame.shit.shitID;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:comment];
    [self presentViewController:nav animated:YES completion:nil ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCCommentCell *cell = [TCCommentCell cellWithTableView:tableView];
    cell.commentFrame = self.commentFrameArray[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentFrameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCCommentFrame *commentFrame = self.commentFrameArray[indexPath.row];
    return commentFrame.cellHeight;
}

/*
 * TCShitUSerViewDelegate
 */
- (void)userView:(TCShitUserView *)userView withUserID:(NSString *)userID
{
    TCUserInfoViewController *userVC = [[TCUserInfoViewController alloc] init];
    userVC.userID = userID;
    [self.navigationController pushViewController:userVC animated:YES];
}
@end
