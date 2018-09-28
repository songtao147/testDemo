//
//  SuspensionDisplayView.m
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "SuspensionDisplayView.h"

#define kMargin 10
#define kHWidth [UIScreen mainScreen].bounds.size.width/2
#define kHHeight [UIScreen mainScreen].bounds.size.height/2
#define kBtnHeight 30

@interface SuspensionDisplayView ()


@property (nonatomic) UIView *bgview;
@property (nonatomic) UITextView *showView;
@property (nonatomic) UIButton *yesbtn;

@end

@implementation SuspensionDisplayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        [self addSubItems];
    }
    return self;
}

- (void)addSubItems{
    _bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kHWidth, kHHeight)];
    _bgview.center = self.center;
    _bgview.backgroundColor = UIColor.whiteColor;
    [self addSubview:_bgview];
    
    _showView = [[UITextView alloc] initWithFrame:CGRectMake(kMargin, kMargin, kHWidth-kMargin*2, kHHeight-kMargin*2-kBtnHeight)];
    _showView.font = [UIFont systemFontOfSize:14];
    _showView.editable = NO;
    [_bgview addSubview:_showView];
    
    _yesbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _yesbtn.backgroundColor = UIColor.grayColor;
    _yesbtn.frame = CGRectMake(0, kHHeight-kBtnHeight, kHWidth, kBtnHeight);
    [_yesbtn setTitle:@"退出" forState:UIControlStateNormal];
    _yesbtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_bgview addSubview:_yesbtn];
    [_yesbtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick{
    self.hidden = YES;
}

- (void)setContent:(NSString *)content{
    _content = content;
    _showView.text = _content;
}

@end
