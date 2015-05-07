//
//  TCCommentController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-23.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommentController.h"
#import "TCTextView.h"
#import "TCPostToolBar.h"
#import "TCHttpTool.h"
#import "TCUserInfoViewController.h"
#import "TCShitUserView.h"
@interface TCCommentController ()<UITextViewDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) TCTextView *textView;
@end

@implementation TCCommentController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigation];
    [self setUpTextView];
    
}
/**
 *  设置导航栏
 */
- (void)setUpNavigation
{
    self.title = @"评论";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}
/**
 *  设置TextView
 */
- (void)setUpTextView
{
    TCTextView *textView = [[TCTextView alloc] init];
    textView.frame = self.view.bounds;
    textView.placeholder = @"发表你的看法";
    textView.font = [UIFont systemFontOfSize:15];
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    self.textView = textView;
    
    // 监听是否输入文字
    [TCNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
}


- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *  发送评论
 */
- (void)send
{
    //关闭控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    // URL:http://m2.qiushibaike.com/article/105123720/comment/create
    NSString *urlString = [NSString stringWithFormat:@"http://m2.qiushibaike.com/article/%@/comment/create", self.shitID];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"content"] = self.textView.text;
    dict[@"anonymous"] = @"true";
    [TCHttpTool post:urlString parameters:dict success:^(id responseObj) {
        TCLog(@"发表成功");
    } failure:^(NSError *error) {
        TCLog(@"%@", error);
    }];
}

/**
 * 监听文字改变,有输入文字投稿按钮才可点击
 */
- (void)textDidChange
{
    self.navigationItem.rightBarButtonItem.enabled = self.textView.hasText;
}

/**
 *  当textView的文字改变就会调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}

@end
