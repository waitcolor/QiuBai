//
//  NSString+FileSize.h
//  QiuBai
//
//  Created by Mac OS on 15-4-29.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FileSize)
/*
 * 根据所给字符串路径计算对应文件夹大小
 */
- (long long)fileSize;
@end
