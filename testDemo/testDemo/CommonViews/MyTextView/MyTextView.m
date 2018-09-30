//
//  MyTextView.m
//  TextToSoundDemo
//
//  Created by songtao on 2018/9/26.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "MyTextView.h"

#define imgH 30

@interface MyTextView ()

@property (nonatomic) UIButton *clearBtn;

@end

@implementation MyTextView

- (void)setHaveClearBtn:(BOOL)haveClearBtn{
    _haveClearBtn = haveClearBtn;
    
    if (_haveClearBtn) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textchanged) name:UITextViewTextDidChangeNotification object:self];

        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clearBtn setImage:[UIImage imageNamed:@"dele"] forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
        [self.superview addSubview:_clearBtn];
        _clearBtn.hidden = YES;
        
        _clearBtn.frame = CGRectMake(CGRectGetMaxX(self.frame)-imgH, CGRectGetMidY(self.frame)-imgH/2, imgH, imgH);
        UIEdgeInsets insets = self.contentInset;
        insets.right += imgH;
        self.contentInset = insets;
    }
}

- (void)textchanged{
    if (_clearBtn.hidden == self.text.length>0) {
        _clearBtn.hidden = !(self.text.length>0);
    }
}

- (void)clearText{
    [self setText:@""];
}

- (void)setText:(NSString *)text{    
    [super setText:text];
    [self textchanged];
}

- (void)layoutSubviews{
    
}

- (void)dealloc{
    [_clearBtn removeFromSuperview];
    _clearBtn = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
