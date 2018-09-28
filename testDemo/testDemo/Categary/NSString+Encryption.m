//
//  NSString+Encryption.m
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encryption)

// 字符串 转换 32 位 MD5 字符串
- (NSString *)stringWith32BitMD5 {
    // 1. 将字符串转化为c语言字符串
    const char *cString = [self UTF8String];
    CC_LONG length = (CC_LONG)strlen(cString);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    // 2. 将c的字符串转化为 MD5
    CC_MD5(cString, length, bytes);
    // 3. 将c的字符串转换成oc的
    NSMutableString *finalString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < 16; i++) {
        // 两位, 前面不足位, 用0补齐
        [finalString appendFormat:@"%02x", bytes[i]];
    }
    return finalString;
}

/**
 32位MD5,小写字符串
 */
- (NSString *)MD5 {
    return [[self stringWith32BitMD5] lowercaseString];
}

/**
  *  URLEncode
  */
- (NSString *)URLEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}

/**
  *  URLDecode
  */
- (NSString *)URLDecode {
    return [self stringByRemovingPercentEncoding];
}

@end
