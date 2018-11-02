//
//  SingletonDefine.h
//  testDemo
//
//  Created by songtao on 2018/11/2.
//  Copyright © 2018 ryan. All rights reserved.
//

#ifndef SingletonDefine_h
#define SingletonDefine_h

//简单的单利宏//

#define singleton_h(_type_) \
+ (_type_ *)sharedInstance;\
+(instancetype) alloc __attribute__((unavailable("call sharedInstance instead")));\
+(instancetype) new __attribute__((unavailable("call sharedInstance instead")));\
-(instancetype) copy __attribute__((unavailable("call sharedInstance instead")));\
-(instancetype) mutableCopy __attribute__((unavailable("call sharedInstance instead")));

#define singleton_m(_type_) \
static _type_ *theSharedInstance = nil;\
+ (_type_ *)sharedInstance{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        theSharedInstance = [[self alloc] init];\
    });\
    return theSharedInstance;\
}

//完整的单利宏-begin（https://www.jianshu.com/p/4867dc92337e）//

#define SingletonH(name) +(instancetype)share##name;

//#if __has_feature(objc_arc)

#define SingletonM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+(instancetype)share##name {\
    return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone {\
    return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone {\
    return _instance;\
}

//#else
//
//#define SingletonM static id _instance;\
//+(instancetype)allocWithZone:(struct _NSZone *)zone {\
//    static dispatch_once_t onceToken;\
//    dispatch_once(&onceToken, ^{\
//        _instance = [super allocWithZone:zone];\
//    });\
//    return _instance;\
//}\
//\
//+(instancetype)shareTools {\
//    return [[self alloc]init];\
//}\
//\
//-(id)copyWithZone:(NSZone *)zone {\
//    return _instance;\
//}\
//\
//-(id)mutableCopyWithZone:(NSZone *)zone {\
//    return _instance;\
//}\
//\
//-(oneway void)release { }\
//\
//-(instancetype)retain {\
//    return _instance;\
//}\
//\
//-(NSUInteger)retainCount {\
//    return MAXFLOAT;\
//}
//
//#endif

//完整的单利宏-end//

#endif /* SingletonDefine_h */
