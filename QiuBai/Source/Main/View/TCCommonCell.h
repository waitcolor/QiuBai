//
//  TCCommonCell.h
//  QiuBai
//
//  Created by Mac OS on 15-4-22.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCCommonItem;
@interface TCCommonCell : UITableViewCell
@property (nonatomic, strong) TCCommonItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows;

@end
