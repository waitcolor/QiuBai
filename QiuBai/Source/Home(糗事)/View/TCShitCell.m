//
//  TCShitCell.m
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitCell.h"
#import "TCShitDetailView.h"
#import "TCShitToolBar.h"
#import "TCShitFrame.h"
#import "TCShitDetailFrame.h"
@interface TCShitCell ()
@property (nonatomic, weak) TCShitDetailView *detailView;
@property (nonatomic, weak) TCShitToolBar *toolBar;
@end

@implementation TCShitCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *reuseIdentifier = @"ShitIdentifier";
    TCShitCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[TCShitCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //添加糗事View
        TCShitDetailView *detailView = [[TCShitDetailView alloc] init];
        detailView.userInteractionEnabled = YES;
        [self.contentView addSubview: detailView];
        self.detailView = detailView;
        //添加工具条
        TCShitToolBar *toolBar = [[TCShitToolBar alloc] init];
        [self.contentView addSubview: toolBar];
        self.toolBar = toolBar;
        
        // 3.cell的设置
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setShitFrame:(TCShitFrame *)shitFrame
{
    _shitFrame = shitFrame;
    //糗事正文
    self.detailView.detailFrame = shitFrame.detailFrame;
    //糗事工具条
    self.toolBar.frame = shitFrame.toolBarFrame;
    self.toolBar.shit = shitFrame.shit;
}
@end
