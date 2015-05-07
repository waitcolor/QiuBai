//
//  TCListParams.h
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCBaseParams.h"

@interface TCListParams : TCBaseParams
/**
 *  请求类型:refresh/list
 */
@property (nonatomic, copy) NSString *type;
@end
