//
//  NSString+XHHExtension.h
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XHHExtension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGFloat)widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

@end

NS_ASSUME_NONNULL_END
