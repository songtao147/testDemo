//
//  LiveHeartViewController.m
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "LiveHeartViewController.h"
#import "ZLLiveHeartView.h"

@interface LiveHeartViewController ()

@end

@implementation LiveHeartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(showLiveHeartView) userInfo:nil repeats:YES];
}

- (void)showLiveHeartView {
    
    ZLLiveHeartView *heart = [[ZLLiveHeartView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(self.view.frame.size.width - 80, self.view.bounds.size.height - 30 / 2.0 - 10);
    heart.center = fountainSource;
    [heart liveHeartAnimateInView:self.view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
