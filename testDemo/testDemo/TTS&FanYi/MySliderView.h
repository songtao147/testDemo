//
//  MySliderView.h
//  testDemo
//
//  Created by songtao on 2018/9/29.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySliderView : UIView

+ (instancetype)shared;

- (void)setTitle:(NSString *)title currentValue:(float)currentValue minValue:(float)minValue maxValue:(float)maxValue;
@property (nonatomic, assign) float value;

@end

NS_ASSUME_NONNULL_END
