//
//  TCCommentCell.h
//  QiuBai
//
//  Created by Mac OS on 15-4-25.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCCommentFrame;
@interface TCCommentCell : UITableViewCell

@property (nonatomic, strong) TCCommentFrame *commentFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
