//
//  MyNetWorkManage.h
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyNetWorkManage : NSObject

+ (void)requestWithUrlString:(NSString *)urlStr callBack:(void(^)(BOOL normalResult, id resultObj))callback;

@end

NS_ASSUME_NONNULL_END
