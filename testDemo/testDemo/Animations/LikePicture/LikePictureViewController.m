//
//  LikePictureViewController.m
//  testDemo
//
//  Created by songtao on 2018/11/8.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "LikePictureViewController.h"

#import "ZLLikeAnimation.h"

@interface LikePictureViewController ()

@end

@implementation LikePictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(showLikePictureView) userInfo:nil repeats:YES];
}

- (void)showLikePictureView {
    
    ZLLikeAnimation *heart = [[ZLLikeAnimation alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(self.view.frame.size.width - 80, self.view.bounds.size.height - 30 / 2.0 - 10);
    heart.center = fountainSource;
    int count = round(random() % 12);
    [heart animatePictureInView:self.view Image:[UIImage imageNamed:[NSString stringWithFormat:@"resource.bundle/heart%d.png",count]]];
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
