//
//  TCShitCell.h
//  QiuBai
//
//  Created by Mac OS on 15-4-13.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCShitFrame;

@interface TCShitCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) TCShitFrame *shitFrame;
@end
