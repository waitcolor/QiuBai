//
//  TCBaseParams.h
//  QiuBai
//
//  Created by Mac OS on 15-4-10.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCBaseParams : NSObject
/**
 *  返回请求糗事数目
 */
@property (nonatomic, strong) NSNumber *count;
/**
 *  请求的页数
 */
@property (nonatomic, strong) NSNumber *page;
@end
