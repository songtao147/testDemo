//
//  LoginTestViewController.m
//  testDemo
//
//  Created by songtao on 2018/10/30.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "LoginTestViewController.h"

#import "CaptchaView.h"

#import "PassWordView/PaySafePwdView.h"


@interface LoginTestViewController ()

@end

@implementation LoginTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录相关";
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self test];
}

- (void) test {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 88, [UIScreen mainScreen].bounds.size.width-40, 30)];
    label.text = @"请输入验证码(数字)";
    [self.view addSubview:label];
    CaptchaView *view = [[CaptchaView alloc] initWithCount:4 margin:20];
    view.frame = CGRectMake(20, 130, [UIScreen mainScreen].bounds.size.width-40, 50);
    [self.view addSubview:view];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width-40, 30)];
    label1.text = @"请输入安全支付密码";
    [self.view addSubview:label1];
    // 加密支付页面
    PaySafePwdView *pswView = [[PaySafePwdView alloc] initWithFrame:CGRectMake(20, 245, [UIScreen mainScreen].bounds.size.width-40, 45)];
    [self.view addSubview:pswView];
    //self.pswView = pswView;
    pswView.passwordDidChangeBlock = ^(NSString *password) {
        NSLog(@"---用户输入密码为: %@",password);
    };
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
