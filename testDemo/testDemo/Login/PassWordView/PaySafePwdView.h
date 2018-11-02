//
//  PaySafePwdView.h
//  testDemo
//
//  Created by songtao on 2018/10/31.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaySafePwdView : UIView

/**
 *  清除密码
 */
- (void)clearUpPassword;

/**
 * 用户输入密码返回
 */
@property (nonatomic, copy) void(^passwordDidChangeBlock)(NSString *password);

@end

NS_ASSUME_NONNULL_END
