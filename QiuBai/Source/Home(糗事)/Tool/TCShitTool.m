//
//  TCShitTool.m
//  QiuBai
//
//  Created by Mac OS on 15-4-9.
//  Copyright (c) 2015年 Lokavid. All rights reserved.
//

#import "TCShitTool.h"
#import "TCHttpTool.h"
#import "MJExtension.h"
#import "FMDB.h"
#import "TCShit.h"

@implementation TCShitTool

/** 数据库实例 */
static FMDatabase *_db;
static bool _isRefresh = NO;
+(void)initialize
{

    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [docPath stringByAppendingPathComponent:@"shit.sqlite"];
    

    _db = [FMDatabase databaseWithPath:filename];

    if ([_db open]) {
        // 创表
        BOOL result = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_list_shit (shitID text PRIMARY KEY, shit_dict blob NOT NULL);"];
        if (result) {
            NSLog(@"成功创表");
        } else {
            NSLog(@"创表失败");
        }
    }
}

/**
 *  通过请求参数去数据库中加载对应的糗事数据
 */
+ (NSArray *)cachedListShitsWithParam:(TCListParams *)param
{

    NSMutableArray *items = [NSMutableArray array];
    //取得离线数据中最后的30条数据:将表按照rowid添加顺序降序排列,取出前count数据
    FMResultSet *resultSet = [_db executeQuery:@"SELECT * FROM t_list_shit ORDER BY rowid DESC limit ?;", param.count];
    
    while (resultSet.next) {
        NSData *shitDictData = [resultSet objectForColumnName:@"shit_dict"];
        NSDictionary *shitDict = [NSKeyedUnarchiver unarchiveObjectWithData:shitDictData];
        
        TCShit *shit = [TCShit objectWithKeyValues:shitDict];
        [items addObject:shit];
    }
    
    return items;
}

/**
 *  缓存糗事字典数组到数据库中
 */
+ (void)saveListShitDictArray:(NSArray *)shitDictArray
{
    for (NSDictionary *shitDict in shitDictArray) {
        // 把字典对象序列化成NSData二进制数据
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:shitDict];
        [_db executeUpdate:@"INSERT OR REPLACE INTO t_list_shit (shitID, shit_dict) VALUES (?, ?);", shitDict[@"id"], data];
    }
}

+ (void)loadListShitsWithParam:(TCListParams *)param success:(void (^)(TCListResponseResult *))success failure:(void (^)(NSError *))failure
{
//    [self getWithURL:@"http://m2.qiushibaike.com/mainpage/list" withParam:param resultClass:[TCListResponseResult class] success:success failure:failure];
    
    NSArray *cachedListShits = [self cachedListShitsWithParam:param];
    if (cachedListShits.count == 0 || _isRefresh == YES) { // 没有缓存数据或者要求刷新
        NSDictionary *params = [param keyValues];
        [TCHttpTool get:@"http://m2.qiushibaike.com/mainpage/list" parameters:params success:^(id responseObj) {
            NSArray *shitDictArray = responseObj[@"items"];
            [self saveListShitDictArray:shitDictArray];
            
            if (success) {
                TCListResponseResult *result = [TCListResponseResult objectWithKeyValues:responseObj];
                success(result);
            }
        } failure:^(NSError *error) {
            if (error) {
                failure(error);
            }
        }];
    }
    else { // 加载缓存数据
        if (success) {
            _isRefresh = YES;
            TCListResponseResult *result = [[TCListResponseResult alloc] init];
            result.items = cachedListShits;
            result.refresh = TCCacheTag;
            success(result);
        }

    }
}


+ (void)loadSuggestShitsWithParam:(TCSuggestParams *)param success:(void (^)(TCSuggestResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/suggest" withParam:param resultClass:[TCSuggestResponseResult class] success:success failure:failure];
}


+ (void)loadVideoShitsWithParam:(TCVideoParams *)param success:(void (^)(TCVideoResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/video" withParam:param resultClass:[TCVideoResponseResult class] success:success failure:failure];
}


+(void)loadTextShitsWithParam:(TCTextParams *)param success:(void (^)(TCTextResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/text" withParam:param resultClass:[TCTextResponseResult class] success:success failure:failure];
}


+(void)loadImageRankShitsWithParam:(TCImageRankParams *)param success:(void (^)(TCImageRankResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/imgrank" withParam:param resultClass:[TCImageRankResponseResult class] success:success failure:failure];
}


+(void)loadDayShitsWithParam:(TCDayParams *)param success:(void (^)(TCDayResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/day" withParam:param resultClass:[TCDayResponseResult class] success:success failure:failure];
}


+(void)loadLatestShitsWithParam:(TCLatestParams *)param success:(void (^)(TCLatestResponseResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithURL:@"http://m2.qiushibaike.com/article/list/latest" withParam:param resultClass:[TCLatestResponseResult class] success:success failure:failure];
}


+ (void)loadCommentWithParam:(TCCommentParams *)param success:(void (^)(TCCommentResponseResult *))success failure:(void (^)(NSError *))failure
{   //curl http://m2.qiushibaike.com/article/105462424/comments?count=50&page=2
    NSString *urlString = [NSString stringWithFormat:@"http://m2.qiushibaike.com/article/%@/comments", param.shitID];
    [self getWithURL:urlString withParam:param resultClass:[TCCommentResponseResult class] success:success failure:failure];
}
@end
