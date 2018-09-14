//
//  ViewController.m
//  testDemo
//
//  Created by songtao on 2017/9/6.
//  Copyright © 2017年 ryan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    centerBtn.center = self.view.center;
    [self.view addSubview:centerBtn];
    [centerBtn addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)centerBtnClick{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
