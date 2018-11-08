//
//  ZLScrollLabelView.h
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLScrollLabelView;

typedef NS_ENUM(NSInteger, ScrollDirectionType) {
    FromLeftType = 0,
    FromRightType = 1
};

@protocol ZLScrollLabelViewDelegate <NSObject>

// 可选择的
@optional

- (void)barrageView:(ZLScrollLabelView *)barrageView animationDidStopFinished:(BOOL)finished;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZLScrollLabelView : UIView

// 代理协议
@property (nonatomic, weak) id <ZLScrollLabelViewDelegate> delegate;

// 速度
@property (nonatomic) CGFloat speed;

// 方向
@property (nonatomic) ScrollDirectionType barrageDirection;

// 容器
- (void)addContentView:(UIView *)view;

// 开始
- (void)startAnimation;

// 停止
- (void)stopAnimation;

// 暂停
- (void)pauseAnimation;

// 恢复
- (void)resumeAnimation;

@end

NS_ASSUME_NONNULL_END
