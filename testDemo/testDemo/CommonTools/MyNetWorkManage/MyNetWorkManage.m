//
//  MyNetWorkManage.m
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "MyNetWorkManage.h"

@implementation MyNetWorkManage
//同步：synchronous
/**
 NSURLRequestUseProtocolCachePolicy（基础策略）
 NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
 NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
 NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
 NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
 NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
 ---------------------
 本文来自 DOUBLE_ZERO_SEVEN 的CSDN 博客 ，全文地址请点击：https://blog.csdn.net/u010462316/article/details/78589076?utm_source=copy
 */
+ (void)requestWithUrlString:(NSString *)urlStr callBack:(void(^)(BOOL normalResult, id resultObj))callback{
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                callback(NO, error.description);
            }else{
                @try {
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    callback(YES, dic);
                } @catch (NSException *exception) {
                    callback(NO, @"返回数据解析出错");
                } @finally {
                    
                }
            }
        });
    }];
    [dataTask resume];
}

//异步：asynchronous
@end
