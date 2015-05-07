//
//  NSString+FileSize.m
//  QiuBai
//
//  Created by Mac OS on 15-4-29.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "NSString+FileSize.h"

@implementation NSString (FileSize)
- (long long)fileSize
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    //判断file是否存在
    BOOL isDirectory = NO;
    BOOL fileExists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    //文件或文件夹不存在
    if (fileExists == NO) return 0;
    
    //判断file是否为文件夹
    if (isDirectory) {//是文件夹
        NSArray *subpaths = [mgr contentsOfDirectoryAtPath:self error:nil];
        long long totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            totalSize += [fullSubpath fileSize];
        }
        return totalSize;
    } else {//不是文件夹,文件
        // 直接计算当前文件的尺寸
        NSDictionary *attr = [mgr attributesOfItemAtPath:self error:nil];
        return [attr[NSFileSize] longLongValue];
    }
}
@end
