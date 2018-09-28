//
//  BaiduFanYiTool.h
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaiduFanYiTool : NSObject

/**
 英译中
 */
+ (void)fanyiSrcStr:(NSString * _Nonnull)srcStr toResult:(void(^)(NSString *dstStr))result;

@end

NS_ASSUME_NONNULL_END
