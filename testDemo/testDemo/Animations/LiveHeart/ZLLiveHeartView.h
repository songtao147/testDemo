//
//  ZLLiveHeartView.h
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

NS_ASSUME_NONNULL_BEGIN

@interface ZLLiveHeartView : UIView

- (void)liveHeartAnimateInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
