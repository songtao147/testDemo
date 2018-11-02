//
//  SingleObject.h
//  testDemo
//
//  Created by songtao on 2018/11/2.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleObject : NSObject

+ (SingleObject *)sharedObject;

- (instancetype)copy __attribute__((unavailable("OneTimeClass类只能初始化一次")));
- (instancetype)mutableCopy __attribute__((unavailable("OneTimeClass类只能初始化一次")));

@property (nonatomic) NSMutableArray *arry;

@end

NS_ASSUME_NONNULL_END
