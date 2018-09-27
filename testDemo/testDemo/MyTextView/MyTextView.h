//
//  MyTextView.h
//  TextToSoundDemo
//
//  Created by songtao on 2018/9/26.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTextView : UITextView

@property (nonatomic) UIButton *clearBtn;

- (void)addClearButtonWith:(UIImage *)deleImg;

@end

NS_ASSUME_NONNULL_END
