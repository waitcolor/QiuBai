//
//  TCSuggestController.m
//  QiuBai
//
//  Created by Mac OS on 15-4-3.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCSuggestController.h"
#import "TCShit.h"
#import "TCShitTool.h"
#import "TCListParams.h"
#import "TCListResponseResult.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "TCShitCell.h"
#import "TCShitFrame.h"
#import "TCShitDetailController.h"
#import "TCShitUserView.h"
#import "TCUserInfoViewController.h"
#define TCMargin 100
@interface TCSuggestController ()<TCShitUserViewDelegate>
@property(strong, nonatomic) NSMutableArray *shitFramesArray;
@property(assign, nonatomic) NSUInteger count;
@end

@implementation TCSuggestController

-(NSMutableArray *)shitFramesArray
{
    if (!_shitFramesArray) {
        _shitFramesArray = [NSMutableArray array];
    }
    return _shitFramesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewShits)];
    self.tableView.header.updatedTimeHidden = YES;
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreShits)];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, TCMargin, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (!self.shitFramesArray) {
        self.tableView.footer.hidden = YES;
    }
    [self.tableView.header beginRefreshing];
//    [self setUpDownRefresh];
//    [self loadNewShit];

}
//- (void)setUpDownRefresh
//{
//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//    [self.tableView addSubview:refreshControl];
//    
//    [refreshControl addTarget:self action:@selector(refreshControlStateChanged:) forControlEvents:UIControlEventValueChanged];
//}

/**
 *  下拉刷新加载新的糗事
 */
- (void)loadNewShits
{
    //将count数重设为1;
    self.count = 1;
    //封装请求参数
    TCListParams *param = [[TCListParams alloc]init];
    param.count = @30;
    param.page = @1;
    param.type = @"refresh";
    
    [TCShitTool loadListShitsWithParam:param success:^(TCListResponseResult *result) {
        [self.tableView.header endRefreshing];
        if (result.err_msg) {
            TCLog(@"%@", result.err_msg);
        } else {
            NSArray *newShitArray = result.items;
            NSMutableArray *newShitFrameArray = [NSMutableArray array];
            //将shit数组转为shitFrame数组
            for (TCShit *shit in newShitArray) {
                TCShitFrame *shitFrame = [[TCShitFrame alloc] init];
                shitFrame.shit = shit;
                [newShitFrameArray addObject:shitFrame];
            }
            
            //刷新条数
            NSString *newNumber = result.refresh;
            //提示刷新了多少条糗事
            [self showNewShitCount:newNumber];
            if (newNumber.intValue <= 0 && newNumber.intValue!= TCCacheTag.intValue) return ;//无新糗事
            
            else if (newNumber.intValue > 30 ||newNumber.intValue == TCCacheTag.intValue || self.shitFramesArray.count == 0 ) {//当新糗事数量>30或者当前糗事总数为0时(加载离线缓存),将显示返回的前30结果;
                self.shitFramesArray = newShitFrameArray;
            }else{
                
                //设定插入范围
//                NSRange newShitRange = NSMakeRange(0, newNumber.integerValue);
                NSRange newShitRange = NSMakeRange(0, newShitFrameArray.count);
                NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:newShitRange];
                NSMutableArray *subNewShitFrame = (NSMutableArray *)[newShitFrameArray subarrayWithRange:newShitRange];
                //将新糗事插入数组
                [self.shitFramesArray insertObjects:subNewShitFrame atIndexes:indexSet];
            }
            [self.tableView reloadData];
        }
//        [self.tableView.header endRefreshing];
    } failure:^(NSError *error) {
        TCLog(@"--请求失败---%@", error);
        [self.tableView.header endRefreshing];
    }];
}
/**
 *  上拉加载更多糗事
 */
- (void)loadMoreShits
{
    //每次上拉加载发送的请求page数递增1;下拉加载时恢复为1;
    self.count++;
    //封装请求参数
    TCListParams *params = [[TCListParams alloc] init];
    params.count = @30;
    params.page = [NSNumber numberWithInteger:self.count];
    params.type = @"list";
    [TCShitTool loadListShitsWithParam:params success:^(TCListResponseResult *result) {
        if (result.err_msg) {
            TCLog(@"%@", result.err_msg);
        } else {
            //将返回的糗事模型数组添加到后面
            NSArray *moreShitArray = result.items;
            NSMutableArray *moreShitFrameArray = [NSMutableArray array];
            //将shit数组转为shitFrame数
            for (TCShit *shit in moreShitArray) {
                TCShitFrame *shitFrame = [[TCShitFrame alloc] init];
                shitFrame.shit = shit;
                [moreShitFrameArray addObject:shitFrame];
            }
            
            [self.shitFramesArray addObjectsFromArray:moreShitFrameArray];
            [self.tableView reloadData];
        }
        [self.tableView.footer endRefreshing];
    } failure:^(NSError *error) {
        TCLog(@"--请求失败---%@", error);
        [self.tableView.header endRefreshing];
    }];
}

/**
 *  提示刷新的糗事个数
 */
- (void)showNewShitCount:(NSString *)newNumber
{
    //添加一个label到导航控制器的view中
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = TCRandomColor;
    
    //添加label到navigationBar的下面
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    // 设置文字
    if (newNumber.intValue <= 0 && newNumber.intValue != TCCacheTag.intValue) {
        label.text = @"没有新的糗事";
    } else if (newNumber.intValue > 0 ){
        label.text = [NSString stringWithFormat:@"共为您刷新%@条糗事", newNumber];
    } else {//刚开始进入加载离线数据时,直接返回,不提示
        return;
    }
    
    //计算位置
    label.width = self.navigationController.view.width;
    label.height = 35;
    label.x = 0;
    label.y = 64 - label.height;
    label.alpha = 0.0;
    
    [UIView animateWithDuration:0.5 animations:^{
        //往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
        label.alpha = 1.0;
    } completion:^(BOOL finished) {

        [UIView animateWithDuration:0.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            //label回到原来的位置
            label.transform = CGAffineTransformIdentity;
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            //从内存中移除
            [label removeFromSuperview];
        }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.shitFramesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TCShitCell *cell = [TCShitCell cellWithTableView:tableView];
    cell.shitFrame = self.shitFramesArray[indexPath.row];
    return cell;
}

//- (void)dealloc
//{
//    TCLog(@"----SuggestControllerDealloc-----");
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCShitFrame *shitFrame = self.shitFramesArray[indexPath.row];
    return shitFrame.cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCShitDetailController *detailViewController = [[TCShitDetailController alloc] init];
    detailViewController.shitFrame = self.shitFramesArray[indexPath.row];

    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)userView:(TCShitUserView *)userView withUserID:(NSString *)userID
{
    TCUserInfoViewController *userVC = [[TCUserInfoViewController alloc] init];
    userVC.userID = userID;
    [self.navigationController pushViewController:userVC animated:YES];
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
