//
//  TestViewController.m
//  testDemo
//
//  Created by songtao on 2018/10/19.
//  Copyright © 2018 ryan. All rights reserved.
//

#import "TestViewController.h"
#import "Person.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"test-view";
    
    [self test];
}

- (void)test{
    //[self createTimer];
    
    Person *p1 = [self personWith:1001 name:@"abca"];
    Person *p2 = [self personWith:1002 name:@"abcb"];
    Person *p3 = [self personWith:1003 name:@"abcc"];
    
    NSLog(@"p1 = %@, p2 = %@, p3 = %@", p1, p2, p3);
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:p1, p2, p3, nil];
    
    NSLog(@"arr= %@", arr1);
    
    //NSMutableArray *arr2 = [NSMutableArray arrayWithArray:arr1];
    NSMutableArray *arr2 = [arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"pid = %@", @(1002)]].mutableCopy;
//    for (NSInteger i =0 ; i<arr1.count; i++) {
//        [arr2 addObject:arr1[i]];
//    }
    
    NSLog(@"arr= %@", arr2);
    
    Person *item = [arr2 objectAtIndex:0];
    
    NSLog(@"item = %@", item);
    
    item.name = @"abc2";
    
    NSLog(@"item.name = %@", p2.name);
}

- (void)printArrItemWith:(NSArray *)arr{
    for (NSInteger i = 0; i<arr.count; i++) {
        Person *item = [arr objectAtIndex:i];
        NSLog(@"arr= %@, index = %ld, item = %@", arr, (long)i, item);
    }
}

- (Person *)personWith:(NSInteger)pid name:(NSString *)name{
    Person *p = [Person new];
    p.pid = pid;
    p.name = name;
    return p;
}

#pragma mark - CreateTimer
- (void)createTimer{
    //NSInvocation *invocation = [[NSInvocation alloc] init];
    
    //1
    //NSTimer *timer1 = [NSTimer timerWithTimeInterval:1 invocation:invocation repeats:YES];
    //[[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    
    //2
    //[NSTimer scheduledTimerWithTimeInterval:1 invocation:invocation repeats:YES];
    
    //3
    //NSTimer *timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    //[[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    //4
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    
    //5   API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0))
    //[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //定时器需要执行的方法
    //}];
    
    //6   API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0))
    //[NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //定时器需要执行的方法
    //}];
    
    //NSDate *date = [NSDate date];
    //7   API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0))
    //NSTimer *timer7 = [[NSTimer alloc] initWithFireDate:date interval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //定时器需要执行的方法
    //}];
    //[timer7 fire];
    
    //8
    //NSTimer *timer8 = [[NSTimer alloc] initWithFireDate:date interval:1 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    
    //该方法表示定时器只会执行一次，无视repeats
    //[timer8 fire];
}

- (void)doSomething{
    NSLog(@"do something");
}


- (void)dealloc{
    
    
    
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
