//
//  CaptchaView.m
//  testDemo
//
//  Created by songtao on 2018/10/30.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "CaptchaView.h"

@interface CaptchaView ()

@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, assign) NSInteger itemMargin;

@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UIControl *maskView;
@property (nonatomic) NSMutableArray *labels;
@property (nonatomic) NSMutableArray *lines;

@end

@implementation CaptchaView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - 初始化
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin {
    if (self = [super init]) {
        self.itemCount = count;
        self.itemMargin = margin;

        [self configTextField];
    }
    return self;
}

- (void)configTextField {
    self.backgroundColor = [UIColor whiteColor];

    self.labels = @[].mutableCopy;
    self.lines = @[].mutableCopy;
    
    UITextField *textField = [[UITextField alloc] init];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField addTarget:self action:@selector(tfEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];

    // 小技巧：这个属性为YES，可以强制使用系统的数字键盘，缺点是重新输入时，会清空之前的内容
    // clearsOnBeginEditing 属性并不适用于 secureTextEntry = YES 时
    // textField.secureTextEntry = YES;
    
    [self addSubview:textField];
    self.textField = textField;
    
    // 小技巧：通过textField上层覆盖一个maskView，可以去掉textField的长按事件
    UIButton *maskView = [UIButton new];
    maskView.backgroundColor = [UIColor whiteColor];
    [maskView addTarget:self action:@selector(clickMaskView) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:maskView];
    self.maskView = maskView;
    
    for (NSInteger i = 0; i < self.itemCount; i++) {
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor darkTextColor];
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:41.5];
        [self addSubview:label];
        [self.labels addObject:label];
    }
    
    for (NSInteger i = 0; i < self.itemCount; i++) {
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor purpleColor];
        [self addSubview:line];
        [self.lines addObject:line];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.labels.count != self.itemCount) return;
    
    CGFloat temp = self.bounds.size.width - (self.itemMargin * (self.itemCount - 1));
    CGFloat w = temp / self.itemCount;
    CGFloat x = 0;
    
    for (NSInteger i = 0; i < self.labels.count; i++) {
        x = i * (w + self.itemMargin);
        
        UILabel *label = self.labels[i];
        label.frame = CGRectMake(x, 0, w, self.bounds.size.height);
        
        UIView *line = self.lines[i];
        line.frame = CGRectMake(x, self.bounds.size.height - 1, w, 1);
    }
    
    self.textField.frame = self.bounds;
    self.maskView.frame = self.bounds;
}

#pragma mark - 编辑改变
- (void)tfEditingChanged:(UITextField *)textField {
    if (textField.text.length > self.itemCount) {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, self.itemCount)];
    }
    
    for (int i = 0; i < self.itemCount; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        
        if (i < textField.text.length) {
            label.text = [textField.text substringWithRange:NSMakeRange(i, 1)];
        } else {
            label.text = nil;
        }
    }
    
    // 输入完毕后，自动隐藏键盘
    if (textField.text.length >= self.itemCount) {
        [textField resignFirstResponder];
    }
}

- (void)clickMaskView {
    [self.textField becomeFirstResponder];
}

- (BOOL)endEditing:(BOOL)force {
    [self.textField endEditing:force];
    return [super endEditing:force];
}

- (NSString *)code {
    return self.textField.text;
}

@end
