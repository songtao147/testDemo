//
//  MySliderView.m
//  testDemo
//
//  Created by songtao on 2018/9/29.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "MySliderView.h"

@interface MySliderView ()

@property (weak, nonatomic) IBOutlet UILabel *currentValue;
@property (weak, nonatomic) IBOutlet UILabel *minValue;
@property (weak, nonatomic) IBOutlet UILabel *maxValue;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic) NSString *title;

@end

@implementation MySliderView

+ (instancetype)shared {
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *objs = [bundle loadNibNamed:@"MySliderView" owner:nil options:nil];
    return [objs lastObject];    
}

- (IBAction)valueChanged:(id)sender {
    _value = [(UISlider *)sender value];
    NSLog(@"%lf", _value);
    self.currentValue.text = [NSString stringWithFormat:@"%@:%.1lf", _title, _value];
}

- (void)setTitle:(NSString *)title currentValue:(float)currentValue minValue:(float)minValue maxValue:(float)maxValue{
    
    _title = title;
    _value = currentValue;
    self.currentValue.text = [NSString stringWithFormat:@"%@:%.1lf", title, currentValue];
    
    self.minValue.text = [NSString stringWithFormat:@"%.1lf", minValue];
    self.maxValue.text = [NSString stringWithFormat:@"%.1lf", maxValue];
    
    self.slider.minimumValue = minValue;
    self.slider.maximumValue = maxValue;
    self.slider.value = _value;
}

@end
