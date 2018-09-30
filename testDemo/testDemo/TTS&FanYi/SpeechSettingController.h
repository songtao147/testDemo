//
//  SpeechSettingController.h
//  testDemo
//
//  Created by songtao on 2018/9/28.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpeechSettingController : UIViewController

- (void)setpvalue:(float)pvalue vvalue:(float)vvalue rvalue:(float)rvalue;
@property (nonatomic, copy) void(^saveSettingValueBlock)(float ,float, float);

@end

NS_ASSUME_NONNULL_END
