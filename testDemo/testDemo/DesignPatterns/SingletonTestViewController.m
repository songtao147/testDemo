//
//  SingletonTestViewController.m
//  testDemo
//
//  Created by songtao on 2018/11/2.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "SingletonTestViewController.h"

#import "SingleObject.h"

@interface SingletonTestViewController ()

@end

@implementation SingletonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"单例模式";
    self.view.backgroundColor = UIColor.whiteColor;
    
    NSLog(@"SingletonTestResult: %@, %@, %@", [SingleObject sharedObject], [[SingleObject alloc] init], [SingleObject new]);
    
    
    
    
    
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
