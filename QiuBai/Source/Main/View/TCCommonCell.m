//
//  TCCommonCell.m
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCCommonCell.h"
#import "TCCommonItem.h"
#import "TCCommonItemArrow.h"
#import "TCCommonItemButton.h"
#import "TCCommonItemSwitch.h"
#import "TCCommonItemCenter.h"
#import "TCCommonItemLabel.h"
#import "TCBadgeView.h"
@interface TCCommonCell ()

@property (nonatomic, strong) UIImageView *rightArrow;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) TCBadgeView *badgeView;
@property (nonatomic, strong) UISwitch *rightSwitch;
@end

@implementation TCCommonCell

- (UIImageView *)rightArrow
{
    if (_rightArrow == nil) {
        _rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    }
    return _rightArrow;
}

- (UISwitch *)rightSwitch
{
    if (_rightSwitch == nil) {
        _rightSwitch = [[UISwitch alloc] init];
    }
    return _rightSwitch;
}

- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textColor = [UIColor lightGrayColor];
        _rightLabel.font = [UIFont systemFontOfSize:13];
    }
    return _rightLabel;
}
- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.size = CGSizeMake(80, 44);
        [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    return _rightButton;
}
- (TCBadgeView *)badgeView
{
    if (_badgeView == nil) {
        _badgeView = [[TCBadgeView alloc] init];
    }
    return _badgeView;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"common";
    TCCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TCCommonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置标题的字体
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:13];
        self.detailTextLabel.textColor = [UIColor grayColor];
        
        // 去除cell的默认背景色
        self.backgroundColor = [UIColor clearColor];
        
        // 设置背景view
        self.backgroundView = [[UIImageView alloc] init];
        self.selectedBackgroundView = [[UIImageView alloc] init];
    }
    return self;
}

#pragma mark - 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //    if ([self.item isKindOfClass:[HMCommonCenterItem class]]) {
    //        self.textLabel.centerX = self.width * 0.5;
    //        self.textLabel.centerY = self.height * 0.5;
    //    } else {
    //        self.textLabel.x = 10;
    // 调整子标题的y
    self.detailTextLabel.y = CGRectGetMaxY(self.textLabel.frame) + 5;
    //    }
}
#pragma mark - setter
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows
{
    // 1.取出背景view
    UIImageView *bgView = (UIImageView *)self.backgroundView;
    UIImageView *selectedBgView = (UIImageView *)self.selectedBackgroundView;
    
    // 2.设置背景图片
    if (rows == 1) {
        bgView.image = [UIImage resizedImage:@"common_card_background"];
        selectedBgView.image = [UIImage resizedImage:@"common_card_background_highlighted"];
    } else if (indexPath.row == 0) { // 首行
        bgView.image = [UIImage resizedImage:@"common_card_top_background"];
        selectedBgView.image = [UIImage resizedImage:@"common_card_top_background_highlighted"];
    } else if (indexPath.row == rows - 1) { // 末行
        bgView.image = [UIImage resizedImage:@"common_card_bottom_background"];
        selectedBgView.image = [UIImage resizedImage:@"common_card_bottom_background_highlighted"];
    } else { // 中间
        bgView.image = [UIImage resizedImage:@"common_card_middle_background"];
        selectedBgView.image = [UIImage resizedImage:@"common_card_middle_background_highlighted"];
    }
}

- (void)setItem:(TCCommonItem *)item
{
    _item = item;
    
    // 1.设置基本数据
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    // 2.设置右边的内容
    if (item.badgeValue) { //右边有提醒数字
        self.badgeView.badgeValue = item.badgeValue;
        self.accessoryView = self.badgeView;
    } else if ([item isKindOfClass:[TCCommonItemArrow class]]) {//箭头
        self.accessoryView = self.rightArrow;
    } else if ([item isKindOfClass:[TCCommonItemSwitch class]]) {//Switch
//        self.accessoryView = self.rightSwitch;
        self.accessoryView = [[UISwitch alloc]init];
    } else if ([item isKindOfClass:[TCCommonItemLabel class]]) {//文字
        TCCommonItemLabel *labelItem = (TCCommonItemLabel *)item;
        self.rightLabel.text = labelItem.text;
        self.rightLabel.size = [labelItem.text sizeWithFont:self.rightLabel.font];
        self.accessoryView = self.rightLabel;
    } else if ([item isKindOfClass:[TCCommonItemButton class]]) {//按钮
        TCCommonItemButton *buttonItem = (TCCommonItemButton *)item;
        [self.rightButton setTitle:buttonItem.text  forState:UIControlStateNormal];
        [self.rightButton setImage:[UIImage imageNamed:buttonItem.image] forState:UIControlStateNormal];
        self.accessoryView = self.rightButton;
    } else { // 取消右边的内容
        self.accessoryView = nil;
    }
}
@end
