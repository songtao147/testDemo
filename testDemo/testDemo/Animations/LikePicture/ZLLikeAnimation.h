//
//  ZLLikeAnimation.h
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLLikeAnimation : UIView

@property (nonatomic, strong) UIImageView *imageView;

- (void)animatePictureInView:(UIView *)view Image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
