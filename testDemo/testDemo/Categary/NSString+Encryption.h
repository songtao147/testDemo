//
//  NSString+Encryption.h
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)

/**
 32位MD5,小写字符串
 */
- (NSString *)MD5;

/**
  *  URLEncode
  */
- (NSString *)URLEncode;

/**
  *  URLDecode
  */
- (NSString *)URLDecode;

@end

NS_ASSUME_NONNULL_END
