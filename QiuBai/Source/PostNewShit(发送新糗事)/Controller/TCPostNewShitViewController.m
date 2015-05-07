//
//  TCPostNewShitViewController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-8.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
// 

#import "TCPostNewShitViewController.h"
#import "TCTextView.h"
#import "TCPostToolBar.h"
#import "TCHttpTool.h"
#import "AFNetworking.h"
#import "TCPostNewShitParams.h"
#import "TCPostNewShitTool.h"
@interface TCPostNewShitViewController () <TCPostToolBarDelegate,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) TCTextView *textView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) TCPostToolBar *toolBar;
@end

@implementation TCPostNewShitViewController

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
    [self setUpToolBar];
    [self setUpPhotosView];

}
/**
 *  设置导航栏
 */
- (void)setUpNavigation
{
    self.title = @"新糗事";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"投稿" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}
/**
 *  设置TextView
 */
- (void)setUpTextView
{
    TCTextView *textView = [[TCTextView alloc] init];
    textView.frame = self.view.bounds;
    textView.placeholder = @"分享我的真实糗事~";
    textView.font = [UIFont systemFontOfSize:15];
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    textView.backgroundColor = TCRGBColor(236, 236, 236);
    [self.view addSubview:textView];
    self.textView = textView;

    //监听是否输入文字
    [TCNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
    //监听键盘
    [TCNotificationCenter addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

/**
 *  设置toolBar
 */
- (void)setUpToolBar
{
    //添加工具条
    TCPostToolBar *toolBar = [[TCPostToolBar alloc]init];
    toolBar.height = 44;
    toolBar.width = self.view.width;
    toolBar.y = self.view.height - toolBar.height;
    toolBar.delegate = self;
    self.toolBar = toolBar;
    [self.view addSubview:toolBar];
}
/**
 *  设置PhotosView
 */
- (void)setUpPhotosView
{
    //如果需要发送多张,可自定义photoview,糗百最多发一张
    
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.width = self.textView.width;
    photoView.height = self.textView.height;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    photoView.x = 0;
    photoView.y = 100;
    photoView.contentMode = UIViewContentModeScaleAspectFill;
    [self.textView addSubview:photoView];
    self.imageView = photoView;
}
/**
 *  发送含图片的糗事
 */
- (void)sendShitWithImage
{

}
/**
 *  发送只有文字的糗事
 */
- (void)sendShitWithoutImage
{
    //    json	{"screen_width":640,"
    //          content":"问：刚在同学那听了一首歌，叫《耶稣他爹玩什么》，真是太好听了！百度里搜不到，求资源！ \n回复：搜索Yesterday Once More试试","
    //            allow_comment":true,"
    //              anonymous":true,"
    //             screen_height":1136}
    TCPostNewShitParams *param = [[TCPostNewShitParams alloc] init];
    param.screen_hetight = @(TCScreenHeight);
    param.screnn_width = @(TCScreenWidth);
    param.content = self.textView.text;
    param.allow_comment = @"true";
    param.anonymous = @"false";
    [TCPostNewShitTool sendNewShitWithParam:param success:^(TCPostNewShitResponseResult *result) {
        TCLog(@"发送成功");
    } failure:^(NSError *error) {
        TCLog(@"发送失败--%@", error);
    }];
                                  
}
-(void)dealloc
{
    //移除通知
    [TCNotificationCenter removeObserver:self];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *  发送糗事
 */
- (void)send
{
    if (self.imageView.image) {
        [self sendShitWithImage];
    } else {
        [self sendShitWithoutImage];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
//    // URL: http://m2.qiushibaike.com/article/create
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 监听文字改变
 */
- (void)textDidChange
{
    //有输入文字投稿按钮才可点击
    self.navigationItem.rightBarButtonItem.enabled = self.textView.hasText;
}

#pragma mark - 键盘处理
/**
 * 键盘的frame发生改变时调用（显示、隐藏等）
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    
    NSDictionary *userInfo = notification.userInfo;
    //动画的持续时间
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //键盘的frame
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //执行动画
    [UIView animateWithDuration:duration animations:^{
        if (keyboardF.origin.y > self.view.height) { // 键盘的Y值已经远远超过了控制器view的高度
            self.toolBar.y = self.view.height - self.toolBar.height;
        } else {
            self.toolBar.y = keyboardF.origin.y - self.toolBar.height;
        }
    }];
}


#pragma mark - TCPostToolBarDelegate
//监听键盘工具条按钮点击
- (void)postToolBar:(TCPostToolBar *)tooBar didClickButtonType:(TCPostToolBarButtonType)buttonType
{
    switch (buttonType) {
        case TCPostToolBarButtonTypeAlbum://相册
            [self openAlbum];
            break;
        case TCPostToolBarButtonTypeCamera://相机
            [self openCamera];
            break;
        case TCPostToolBarButtonTypeVideo://摄像头
            [self openVideoCamera];
            break;
        default:
            break;
    }
}

/**
 *  打开相册
 */
- (void)openAlbum
{
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

/**
 *  打开相机
 */
- (void)openCamera
{
    //检测是否有摄像头
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

/**
 *  打开摄像头
 */
- (void)openVideoCamera
{
    //检测是否有摄像头
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
}

#pragma mark - UITextViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

/**
 *  当textView的文字改变就会调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //取出图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
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
