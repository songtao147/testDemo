//
//  SingleObject.m
//  testDemo
//
//  Created by songtao on 2018/11/2.
//  Copyright © 2018 ryan. All rights reserved.
//

//iOS单例的精心设计历程 (http://www.cocoachina.com/ios/20180105/21761.html)
//iOS 单例模式 (https://www.jianshu.com/p/a92c0283f243)
//https://www.jb51.net/article/106939.htm

#import "SingleObject.h"

@implementation SingleObject

static SingleObject *__onetimeClass;
+ (SingleObject *)sharedObject {
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        __onetimeClass = [[super allocWithZone:NULL]init];
    });
    return __onetimeClass;    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedObject];
}

//断言
//    NSCAssert(!__onetimeClass, @"OneTimeClass类只能初始化一次");
//NSException
//    if (__onetimeClass) {
//        NSException *exception = [NSException exceptionWithName:@"提示" reason:@"OneTimeClass类只能初始化一次" userInfo:nil];
//        [exception raise];
//    }

//initialize方法是在该类第一次调用该类时调用；
+ (void)initialize{
    printf("\n\nOneTimeClass initialize()\n\n");
    //[SingleObject sharedObject];
}

//load方法是在整个文件被加载到运行时，在main函数调用之前调用；
+ (void)load{
    printf("\n\nOneTimeClass load()\n\n");
}

@end
