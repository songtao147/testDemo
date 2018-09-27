//
//  MyTextView.m
//  TextToSoundDemo
//
//  Created by songtao on 2018/9/26.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "MyTextView.h"

#define imgH 30

@implementation MyTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)addClearButtonWith:(UIImage *)deleImg{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textchanged) name:UITextViewTextDidChangeNotification object:nil];
    
    _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clearBtn setImage:[UIImage imageNamed:@"dele"] forState:UIControlStateNormal];
    [_clearBtn addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clearBtn];
    _clearBtn.hidden = YES;
    
    _clearBtn.frame = CGRectMake(self.bounds.size.width-imgH, self.bounds.size.height/2-imgH/2, imgH, imgH);
    UIEdgeInsets insets = self.contentInset;
    insets.right += imgH;
    self.contentInset = insets;
}

- (void)textchanged{
    NSLog(@"\ntext = %@", self.text);
    if (_clearBtn.hidden == self.text.length) {
        _clearBtn.hidden = !self.text.length;
    }
}

- (void)clearText{
    NSLog(@"clearBtn is click!!!");
    [self setText:@""];
}

- (void)setText:(NSString *)text{    
    [super setText:text];
    [self textchanged];
}

- (void)layoutSubviews{
    _clearBtn.frame = CGRectMake(self.bounds.size.width-imgH, self.bounds.size.height/2-imgH/2, imgH, imgH);
}

@end
