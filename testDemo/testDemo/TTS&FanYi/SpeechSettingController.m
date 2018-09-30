//
//  SpeechSettingController.m
//  testDemo
//
//  Created by songtao on 2018/9/28.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "SpeechSettingController.h"
#import "MySliderView.h"
#define kMargin 10
#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface SpeechSettingController () {
    float _pvalue;
    float _vvalue;
    float _rvalue;
}

@property (nonatomic) MySliderView *sliderView1;
@property (nonatomic) MySliderView *sliderView2;
@property (nonatomic) MySliderView *sliderView3;

@end

@implementation SpeechSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"语音设置";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveSettings)];
    
    [self addSubItems];
}

- (void)saveSettings{
    if (_saveSettingValueBlock) {
        _saveSettingValueBlock(_sliderView1.value, _sliderView2.value, _sliderView3.value);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSubItems{

    _sliderView1 = [self sliderWith:CGRectMake(0, 70, kScreenW, 80) title:@"音调调节" currentValue:_pvalue minValue:0.5 maxValue:2.0];
    
    _sliderView2 = [self sliderWith:CGRectMake(0, 150, kScreenW, 80) title:@"音量调节" currentValue:_vvalue minValue:0.0 maxValue:1.0];
    
    _sliderView3 = [self sliderWith:CGRectMake(0, 230, kScreenW, 80) title:@"语速调节" currentValue:_rvalue minValue:0.0 maxValue:1.0];
    
}

- (MySliderView *)sliderWith:(CGRect)frame title:(NSString *)title currentValue:(float)currentValue minValue:(float)minValue maxValue:(float)maxValue{
    MySliderView *slider = [MySliderView shared];
    slider.frame = frame;
    [slider setTitle:title currentValue:currentValue minValue:minValue maxValue:maxValue];
    [self.view addSubview:slider];
    return slider;
}

- (void)setpvalue:(float)pvalue vvalue:(float)vvalue rvalue:(float)rvalue{
    _pvalue = pvalue;_vvalue = vvalue; _rvalue = rvalue;
}

@end
